
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
    "pie2010g.pc"
};


static unsigned int sqlctx = 149747;


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
   unsigned char  *sqhstv[55];
   unsigned long  sqhstl[55];
            int   sqhsts[55];
            short *sqindv[55];
            int   sqinds[55];
   unsigned long  sqharm[55];
   unsigned long  *sqharc[55];
   unsigned short  sqadto[55];
   unsigned short  sqtdso[55];
} sqlstm = {12,55};

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

 static char *sq0008 = 
"select empno ,korname ,orgnum ,deptcode ,upper(jobgun) ,upper(paycl) ,pstat\
e ,upper(sex) ,upper(lschdeg) ,nvl(substr(retdate,1,6),'999999') ,usaage ,pay\
gr ,comduyy ,comdumm ,comdudd ,payclyy ,payclmm ,paycldd ,upper(nvl(substr(re\
tsayu1,1,2),'  ')) ,upper(nvl(substr(retsayu2,1,2),'  '))  from pimpmas where\
 ((substr(empdate,1,6)<=:b0 and pstate<'80') and nvl(pstateyn,' ') not  in ('\
N','n')) order by empno            ";

 static char *sq0009 = 
"select empno ,korname ,orgnum ,deptcode ,upper(jobgun) ,upper(paycl) ,pstat\
e ,upper(sex) ,upper(lschdeg) ,nvl(substr(retdate,1,6),'999999') ,usaage ,pay\
gr ,comduyy ,comdumm ,comdudd ,payclyy ,payclmm ,paycldd ,upper(nvl(substr(re\
tsayu1,1,2),'  ')) ,upper(nvl(substr(retsayu2,1,2),'  '))  from pihpmas where\
 ((workyymm=:b0 and pstate<'80') and nvl(pstateyn,' ') not  in ('N','n')) ord\
er by empno            ";

 static char *sq0013 = 
"select nvl(lickind,'   ') ,nvl(licgr,' ')  from pimlice where empno=:b0 ord\
er by licrank            ";

 static char *sq0014 = 
"select nvl(substr(schgr,1,2),'  ') ,nvl(substr(schcode,1,4),'    ') ,nvl(su\
bstr(majorcode,1,4),'    ')  from pimscho where (empno=:b0 and schgr in ('59'\
,'69','79')) order by schgr,schrank            ";

 static char *sq0016 = 
"select nvl(substr(ancode,1,3),'   ') ,nvl(substr(andetcode,1,2),'  ') ,orgn\
um ,deptcode ,upper(paycl) ,upper(jobgun) ,count(ancode)  from pihanno where \
((substr(anfrdate,1,6)=:b0 and anupdyn in ('Y','y')) and orgnum=:b1) group by\
 ancode,andetcode,orgnum,deptcode,upper(paycl),upper(jobgun)           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,130,0,4,181,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
28,0,0,2,145,0,4,195,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
55,0,0,3,63,0,1,351,0,0,0,0,0,1,0,
70,0,0,4,60,0,4,376,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
93,0,0,5,38,0,2,384,0,0,1,1,0,1,0,1,97,0,0,
112,0,0,6,60,0,4,391,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
135,0,0,7,38,0,2,399,0,0,1,1,0,1,0,1,97,0,0,
154,0,0,8,418,0,9,436,0,0,1,1,0,1,0,1,97,0,0,
173,0,0,8,0,0,13,443,0,0,20,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,97,0,0,
268,0,0,8,0,0,15,452,0,0,0,0,0,1,0,
283,0,0,8,0,0,15,457,0,0,0,0,0,1,0,
298,0,0,9,406,0,9,498,0,0,1,1,0,1,0,1,97,0,0,
317,0,0,9,0,0,13,505,0,0,20,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,97,0,0,
412,0,0,9,0,0,15,514,0,0,0,0,0,1,0,
427,0,0,9,0,0,15,519,0,0,0,0,0,1,0,
442,0,0,10,129,0,4,683,0,0,6,5,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
481,0,0,11,1224,0,5,693,0,0,52,52,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
704,0,0,12,766,0,3,750,0,0,55,55,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,97,0,0,1,97,0,0,
939,0,0,13,100,0,9,860,0,0,1,1,0,1,0,1,97,0,0,
958,0,0,13,0,0,13,867,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
981,0,0,13,0,0,15,872,0,0,0,0,0,1,0,
996,0,0,13,0,0,15,877,0,0,0,0,0,1,0,
1011,0,0,14,199,0,9,911,0,0,1,1,0,1,0,1,97,0,0,
1030,0,0,14,0,0,13,918,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
1057,0,0,14,0,0,15,925,0,0,0,0,0,1,0,
1072,0,0,14,0,0,15,930,0,0,0,0,0,1,0,
1087,0,0,15,64,0,4,959,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
1110,0,0,16,300,0,9,996,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1133,0,0,16,0,0,13,1003,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,4,0,0,
1176,0,0,16,0,0,15,1014,0,0,0,0,0,1,0,
1191,0,0,16,0,0,15,1019,0,0,0,0,0,1,0,
1206,0,0,17,347,0,4,1056,0,0,10,9,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1261,0,0,18,412,0,5,1072,0,0,14,14,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
1332,0,0,19,104,0,3,1093,0,0,17,17,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1415,0,0,20,131,0,4,1109,0,0,4,2,0,1,0,2,97,0,0,2,97,0,0,1,97,0,0,1,97,0,0,
1446,0,0,21,74,0,4,1135,0,0,3,2,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,
1473,0,0,22,57,0,4,1144,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
1496,0,0,23,78,0,5,1159,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1519,0,0,24,50,0,3,1185,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1560,0,0,25,0,0,29,1195,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/****************************************************************************
 *     PROGRAM-NAME   : (pie2010g) 인사통계생성
 *     SYSTEM-NAME    : 종합인사정보
 *     SUBSYSTEM-NAME : 인사
 *     Programmer     : 윤형식
 *     Version        : 1.03
 *     Date : 1996.06.15
 *     Update Contents
 *          1.00    96.06.15  김동철 처리명세서         신규프로그램개발
 *          1.01    98.04.15  김혜진 추가. 전산처리     세부통계중 용역회사
 *          1.02  2000.10.20  강기우 fieldcode(3자리)   조직개편으로인한
 *          1.03  2001.03.20  윤형식 전2001-02-13       월초에 전월 인사 통계자료 자동 생성 (cron)
 *          1.04  2004.01.27  이민용 자체개선           Oracle DB 8버전으로 Upgrade 관련
 *          1.05  2004.03.16  이민용 오종석과장님       정직은 휴직인원에서 제외
 *          1.06  2005.10.05  최경진                    Rexec대체 서비스를 위한 수정적업.       
 ****************************************************************************/
/*#include <string.h> 
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <sqlca.h>
#include <sqlda.h> 
#include "hinsa_common.h"
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
*/
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

#define   YYMMDD       8
#define   YYMMDDHH    16 
#define   FAIL        -2
/*----------------------------------------------*
 * Current data save & Condition save Variable  *
 *----------------------------------------------*/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char   jobempno[5];                    /* 작업자사번 */
     char   tongym[7];                      /* 작업년월 */
     char   orgnum[4];                      /* 조직차수 */
     char   deptcode[7];                    /* 부서코드 */
     char   jobgun[3];                      /* 직  군 */
     char   jobline[3];                     /* 직  렬 */
     char   paycl[4];                       /* 직  급 */
     char   fieldcode[4];                   /* 부  문 */
     char   boncode[7];                     /* 본부코드 */
     double minwon, finwon, inwon;          /* 재직인원 */
     double mpainwon, fpainwon, painwon;    /* 파견인원 */
     double medinwon, fedinwon, edinwon;    /* 교육인원 */
     double mhuinwon, fhuinwon, huinwon;    /* 휴직인원 */
     double mrtinwon, frtinwon, rtinwon;    /* 퇴사인원 */
     double magesum, fagesum, agesum;       /* 연  령 */
     double mpaygrsum, fpaygrsum, paygrsum; /* 호  봉 */
     double mdumonsum, fdumonsum, dumonsum; /* 근속월수 */
     double mclmonsum, fclmonsum, clmonsum; /* 재급월수 */
     double mdrinwon, fdrinwon, drinwon;    /* 박사인원 */
     double msrinwon, fsrinwon, srinwon;    /* 석사인원 */
     double mbainwon, fbainwon, bainwon;    /* 학사인원 */
     double mcoinwon, fcoinwon, coinwon;    /* 전문대인원 */
     double mhiinwon, fhiinwon, hiinwon;    /* 고졸인원 */
     double mmiinwon, fmiinwon, miinwon;    /* 중졸인원 */
     char   gubun1[3], gubun2[6], gubun3[6], gubun4[6]; /* 구분1,2,3,4 */
     char   writetime[16]; /* 작업일시 */
            
     char   pstate[3], sex[2], lschdeg[3], retyymm[7];
     double anno_count;
     char   empno[5], korname[13], retsayu1[3], retsayu2[3];
     double paygr, usaage;
     double comduyy, comdumm, comdudd;
     double payclyy, payclmm, paycldd;
     
     /*char   lickind[4], licgr[2]; dsa2000*/
     char   lickind[5], licgr[2];
     char   codeid[5], codeno[11], codemainon[2];
     char   schgr[3], schcode[5], majorcode[5];
     char   tcompany[3];
            
     char   ancode[4], andetcode[3];
     
     double tdel_count;                    /* 통계자료삭제건수 */
     double stdel_count;                   /* 세부통계자료삭제건수 */
     char   tongdate[9];                   /* 통계작업일자 */
     double exist_count;
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


char   epoyn[2];                           /* 교육파견현원포함여부 */
char   jpoyn[2];                           /* 정직현원포함여부 */
char   hpoyn[2];                           /* 휴직현원포함여부 */
                                           
char   gubun[14];                          /* 작업구분 */
int    num;                                /* 일련번호 */
char   tmp_buf[120];                       
char   codeidname[16];                     /* Code ID명 : dsa2000  Add  2007.10 */
double cmp_comdumm, cmp_payclmm;

char start_date[16], end_date[16];
int  tcre_count, stcre_count, error_count;


/*=== ch.k.j 2005.10. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0; 

/******************************************
 *  MAIN PROCESSING START !!!!!!      *
 ******************************************/ 
main(argc,argv)
int argc;
char *argv[];
{
     char edf_count[8];

     char *FL_date;
     char FL_dir[255];
     char FL_Line[255];
     char FL_file[255];
     
     STRINIT(FL_file);
     strcpy(FL_file,"pie2010g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     hinsa_log_print(0,"계획/현원 인원 생성 프로그램 시작...");
     hinsa_db_connect();

     /******K.J  추가*******************/ 
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();            
     /*********************************/ 
 
     init_variable();

     /*** Param:pie2010g 9999 200808 Y N N 9999 pie2010g 20080819 */
     strcpy(jobempno, argv[1]);  /* 작업자사번    9999    */        
     
     if  (strcmp(jobempno, "cron") != 0) 
     {
          printf("Cron jobempno : %s\n", jobempno); 
          strcpy(jobempno, argv[1]);  /* 작업자사번    9999    */
          strcpy(tongym,   argv[2]);  /* 작업년월      200808  */
          strcpy(epoyn,    argv[3]);  /* 교육파견현원  Y       */
          strcpy(jpoyn,    argv[4]);  /* 정직현원      N       */
          strcpy(hpoyn,    argv[5]);  /* 휴직현원      N       */
          
          /*=== K.J Rexec대체 서비스를 위한 =============*/
          strcpy(log_writeman, argv[6]);
          strcpy(log_progid,   argv[7]);
          strcpy(log_rundate,  argv[8]);          
     }        
     
     /****************************************************************************
      *          1.03  2001.03.20  윤형식 전2001-02-13   월초에 전월 현원 통계자료 자동 재생성
      *                                                  cron으로 실행시 작업사번은 cron
      ****************************************************************************
      * 월초에 전월통계자료 자동 실행시(pie2010g cron)
      * 작업년월, 현원포함여부 재설정
      ****************************************************************************/
     
     if  (strcmp(jobempno, "cron") == 0) 
     {
          /* EXEC SQL
          SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM'), TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD')
            INTO :tongym, :tongdate
            FROM dual; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select TO_CHAR(ADD_MONTHS(SYSDATE,(-1)),'YYYYMM') \
,TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,(-1))),'YYYYMMDD') into :b0,:b1  from du\
al ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )5;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)tongym;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)tongdate;
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


                           
          printf("Cron start_date : %.6s, %s\n", tongym, tongdate); 
          if  (sqlca.sqlcode != 0)
          {
               STRINIT(FL_Line);
               sprintf(FL_Line, "%.4s년 %.2s월 : %d : SysDate Read Error... ERROR.(1)", tongym, tongym+4, sqlca.sqlcode);
               hinsa_log_print(0, FL_Line);
               return;
          }
     
          /* EXEC SQL
          SELECT NVL(UPPER(VALUE2),'N'), NVL(UPPER(VALUE3),'N'), NVL(UPPER(VALUE4),'N')
            INTO :epoyn, :jpoyn, :hpoyn
            FROM PIMVARI
           WHERE GUBUN = '50' AND SGUBUN = '0003'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select NVL(UPPER(VALUE2),'N') ,NVL(UPPER(VALUE3),'\
N') ,NVL(UPPER(VALUE4),'N') into :b0,:b1,:b2  from PIMVARI where (GUBUN='50' \
and SGUBUN='0003')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )28;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)epoyn;
          sqlstm.sqhstl[0] = (unsigned long )2;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)jpoyn;
          sqlstm.sqhstl[1] = (unsigned long )2;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)hpoyn;
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

   /*임원,파견,정직,휴직 현원 포함여부*/
      
          if  (sqlca.sqlcode != 0)
          {
               STRINIT(FL_Line);
               sprintf(FL_Line, "epoyn:%s  jpoyn:%s  hpoyn:%s - PIMVARI에서 읽기중... ERROR.(4)", epoyn, jpoyn, hpoyn);
               hinsa_log_print(0, FL_Line);
               return;
          }
     }
    
     FL_date = hinsa_sys_date(0);
     STRINIT(start_date);
     strcpy(start_date, FL_date);
     printf("start_date : %.6s, 통계작업년월 :%s\n", start_date,tongym);
     
     STRINIT(FL_Line);
     sprintf(FL_Line, "PIE2010G_%.4s", jobempno);
     hinsa_log_print(0, FL_Line);
    
     data_process();
     
     STRINIT(FL_Line);
     
     sprintf(FL_Line, "<*> 작  업  년  월 : %.4s년 %.2s월", tongym, tongym+4);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 통 계 생 성 건 수 : %7d 건", tcre_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 세부통계 생성건수 : %7d 건", stcre_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 통 계 삭 제 건 수 : %7d 건", tdel_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 세부통계 삭제건수 : %7d 건", stdel_count);
     hinsa_log_print(0, FL_Line);
     
     sprintf(FL_Line, "<*> 오   류   건   수 : %7d 건", error_count);
     hinsa_log_print(0, FL_Line);
            
     FL_date = hinsa_sys_date(0);
     STRINIT(end_date);
     strcpy(end_date, FL_date);
     sprintf(FL_Line, "<*> 작업시간 : %.4s/%.2s/%.2s %.2s.%.2s.%.2s - %.4s/%.2s/%.2s %.2s.%.2s.%.2s",
                      start_date,   start_date+4,  start_date+6,
                      start_date+8, start_date+10, start_date+12,
                      end_date,     end_date+4,    end_date+6,
                      end_date+8,   end_date+10,   end_date+12);
     hinsa_log_print(0, FL_Line);
     
     update_pimvari(); /* 통계작업년월 및 생성일을 경신 */
    
     sprintf(log_buff, "OK ====== [ 작업성공 ] =====");  
     Write_batlog(seqno++, log_buff);  
     hinsa_exit(0,"OK ====== [ 작업성공 ] =====\n"); 
}

/*----------------------------------------------*
 * Current data & Condition Variable Initialize *
 *----------------------------------------------*/
init_variable()
{ 
     memset(jobempno,   0x00, sizeof(jobempno));
     memset(tongym,     0x00,   sizeof(tongym)); 
     memset(tongdate,   0x00,   sizeof(tongdate));

     memset(orgnum,     0x00,   sizeof(orgnum));
     memset(deptcode,   0x00,   sizeof(deptcode));
     memset(jobgun,     0x00,   sizeof(jobgun));
     memset(jobline,    0x00,   sizeof(jobline));
     memset(paycl,      0x00,   sizeof(paycl));
     memset(fieldcode,  0x00,   sizeof(fieldcode));
     memset(boncode,    0x00,   sizeof(boncode));

     memset(pstate,     0x00,   sizeof(pstate));
     memset(sex,        0x00,   sizeof(sex));
     memset(lschdeg,    0x00,   sizeof(lschdeg));
     memset(retyymm,    0x00,   sizeof(retyymm));
     anno_count = 0;
     memset(empno,      0x00,   sizeof(empno));
     memset(korname,    0x00,   sizeof(korname));
     memset(retsayu1,   0x00,   sizeof(retsayu1));
     memset(retsayu2,   0x00,   sizeof(retsayu2));
     paygr = usaage = 0;
     comduyy = comdumm = comdudd = 0;
     payclyy = payclmm = paycldd = 0;

     memset(ancode,     0x00,   sizeof(ancode)); 
     memset(andetcode,  0x00,   sizeof(andetcode)); 

     memset(epoyn,      0x00,   sizeof(epoyn)); 
     memset(jpoyn,      0x00,   sizeof(jpoyn));
     memset(hpoyn,      0x00,   sizeof(hpoyn)); 
                        
     memset(gubun,      0x00,   sizeof(gubun));
     num = 0;
     memset(tmp_buf,    0x00,   sizeof(tmp_buf));

     memset(start_date, 0x00,   sizeof(start_date));
     memset(end_date,   0x00,   sizeof(end_date));
     tcre_count = stcre_count = error_count = 0;
     tdel_count = stdel_count = 0;
     
     init_subvariable();
}

/*----------------------------------------------*
 * Current data & Condition Variable Initialize *
 *----------------------------------------------*/
init_subvariable()
{ 
     minwon = finwon = inwon = 0;
     mpainwon = fpainwon = painwon = 0;
     medinwon = fedinwon = edinwon = 0;
     mhuinwon = fhuinwon = huinwon = 0;
     mrtinwon = frtinwon = rtinwon = 0;
     magesum = fagesum = agesum = 0;
     mpaygrsum = fpaygrsum = paygrsum = 0;
     mdumonsum = fdumonsum = dumonsum = 0;
     mclmonsum = fclmonsum = clmonsum = 0;
     mdrinwon = fdrinwon = drinwon = 0;
     msrinwon = fsrinwon = srinwon = 0;
     mbainwon = fbainwon = bainwon = 0;
     mcoinwon = fcoinwon = coinwon = 0;
     mhiinwon = fhiinwon = hiinwon = 0;
     mmiinwon = fmiinwon = miinwon = 0;
     cmp_comdumm = cmp_payclmm = 0;
     memset(gubun1,    0x00,   sizeof(gubun1)); 
     memset(gubun2,    0x00,   sizeof(gubun2)); 
     memset(gubun3,    0x00,   sizeof(gubun3));
     memset(gubun4,    0x00,   sizeof(gubun4)); 
     memset(writetime, 0x00,   sizeof(writetime));
     exist_count = 0;

     memset(lickind,   0x00,   sizeof(lickind));
     memset(licgr,     0x00,   sizeof(licgr)); 
     memset(codeid,    0x00,   sizeof(codeid)); 
     memset(codeno,    0x00,   sizeof(codeno)); 
     memset(codemainon,0x00,   sizeof(codemainon)); 
     memset(schgr,     0x00,   sizeof(schgr)); 
     memset(schcode,   0x00,   sizeof(schcode)); 
     memset(majorcode, 0x00,   sizeof(majorcode)); 
     memset(tcompany,  0x00,   sizeof(tcompany)); 
}

/****************************************
 *   Data process  routine     *
 ****************************************/
data_process()
{
     /* EXEC SQL LOCK TABLE  pimpmas, pihtong, pihston
                IN EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE pimpmas , pihtong , pihston IN EXCLUSIVE MOD\
E NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"다른 작업자가 DB수정 작업중입니다.");

     tongdata_delete(); /* 인사통계, 세부통계 기존자료 삭제 */
 
     printf("작업자 %s != cron && 날짜비교 0 = %d 이면 pimpmas에서 생성 아니면 pihpmas에서 생성\n",jobempno,strncmp(start_date, tongym, 6)); 
     
     if  ((strcmp(jobempno, "cron") != 0)  && (strncmp(start_date, tongym, 6) == 0))
     {
         printf("tong_create_pimpmas() 처리중\n");  
         tong_create_pimpmas();    /* 인사통계 pimpmas에서 생성 */
     }
     else
     {
         printf("tong_create_pihpmas() 처리중\n");     
         tong_create_pihpmas();                /* 인사통계 pihpmas에서 생성 */
     }
     annotong_create(); /* 인사발령통계 생성 */
}

tongdata_delete()
{ 
     /* EXEC SQL 
     SELECT  count(tongym) /o 기존자료가 존재하는가 o/
       INTO  :tdel_count
       FROM  pihtong
      WHERE  tongym = :tongym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(tongym) into :b0  from pihtong where tongy\
m=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )70;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&tdel_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)tongym;
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


                 
     if  (tdel_count != 0)
     {     /* 기존자료가 있으면 지우자 */
          /* EXEC SQL 
          DELETE  FROM  pihtong
           WHERE  tongym = :tongym; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "delete  from pihtong  where tongym=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )93;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)tongym;
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


          if  (sqlca.sqlcode != 0)    /* Error is Error */
               hinsa_exit(0,"PIHTONG Delete Error !");
     }

     /* EXEC SQL 
     SELECT  count(tongym) /o 기존자료가 존재하는가 o/
       INTO  :stdel_count
       FROM  pihston
      WHERE  tongym = :tongym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(tongym) into :b0  from pihston where tongy\
m=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )112;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&stdel_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)tongym;
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


         
     if  (stdel_count != 0)
     {     /* 기존자료가 있으면 지우자 */
          /* EXEC SQL 
          DELETE  FROM  pihston
           WHERE  tongym = :tongym; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "delete  from pihston  where tongym=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )135;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)tongym;
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


          if  (sqlca.sqlcode != 0)    /* Error is Error */
               hinsa_exit(0,"PIHSTON Delete Error !");
     }
}

tong_create_pimpmas()
{
     /* EXEC SQL DECLARE c1 cursor for
               SELECT  empno
                     , korname
                     , orgnum
                     , deptcode
                     , upper(jobgun)
                     , upper(paycl)
                     , pstate, upper(sex), upper(lschdeg)
                     , nvl(substr(retdate, 1, 6), '999999')
                     , usaage
                     , paygr
                     , comduyy
                     , comdumm
                     , comdudd
                     , payclyy
                     , payclmm
                     , paycldd
                     , upper(nvl(substr(retsayu1, 1, 2), '  '))
                     , upper(nvl(substr(retsayu2, 1, 2), '  '))
                 FROM  pimpmas
                WHERE  (substr(empdate, 1, 6) <= :tongym)  /o FROM pihpmas WHERE workyymm=:tongym o/
                  and pstate < '80'
                  AND  (nvl(pstateyn, ' ') not in ('N', 'n')) //현원포함여부 변수로 처리 안되서 다시 풀어놈
                  /oAND  (nvl(pstateyn, ' ') not in ('N', 'n'))  ch.k.j. 막음   현원포함여부 변수로 처리
                  AND  ((pstate < '80')  OR   (pstate > '80' AND  nvl(substr(retdate, 1, 6), '999999') >= :tongym)) o/
                ORDER BY empno; */ 


     /* EXEC SQL  open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0008;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )154;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tongym;
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



     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"Cursor Open c1");

     for ( ; ; )
     {
          /* EXEC SQL FETCH c1 INTO
                  :empno,    :korname, :orgnum,  :deptcode, :jobgun, :paycl,
                  :pstate,   :sex,     :lschdeg, :retyymm,  :usaage, :paygr,
                  :comduyy,  :comdumm, :comdudd,
                  :payclyy,  :payclmm, :paycldd,
                  :retsayu1, :retsayu2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )173;
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
          sqlstm.sqhstv[2] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)jobgun;
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)paycl;
          sqlstm.sqhstl[5] = (unsigned long )4;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)pstate;
          sqlstm.sqhstl[6] = (unsigned long )3;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)sex;
          sqlstm.sqhstl[7] = (unsigned long )2;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)lschdeg;
          sqlstm.sqhstl[8] = (unsigned long )3;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)retyymm;
          sqlstm.sqhstl[9] = (unsigned long )7;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&usaage;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&paygr;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&comduyy;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&comdumm;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&comdudd;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&payclyy;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&payclmm;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&paycldd;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)retsayu1;
          sqlstm.sqhstl[18] = (unsigned long )3;
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)retsayu2;
          sqlstm.sqhstl[19] = (unsigned long )3;
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
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
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )268;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return; 
          }
          else if  (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )283;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Data Fetch c1");
          }
          init_subvariable();
          hinsa_trim(korname); hinsa_trim(deptcode);
          read_pycdept(0);     /* 부문, 본부코드를 찾자 */
          calc_tongdata();     /* 통계자료를 계산 */
          pihtong_write();     /* 통계자료를 저장 */
          calc_dettongdata();  /* 세부통계자료를 계산/저장 */
     }
}

tong_create_pihpmas()
{
     /* EXEC SQL DECLARE c2 cursor for
               SELECT  empno
                     , korname
                     , orgnum
                     , deptcode
                     , upper(jobgun)
                     , upper(paycl)
                     , pstate, upper(sex), upper(lschdeg)
                     , nvl(substr(retdate, 1, 6), '999999')
                     , usaage
                     , paygr
                     , comduyy
                     , comdumm
                     , comdudd
                     , payclyy
                     , payclmm
                     , paycldd
                     , upper(nvl(substr(retsayu1, 1, 2), '  '))
                     , upper(nvl(substr(retsayu2, 1, 2), '  '))
                 FROM  pihpmas 
                WHERE  workyymm=:tongym 
                  and  pstate < '80'
                  AND  (nvl(pstateyn, ' ') not in ('N', 'n')) //현원포함여부 변수로 처리 안되서 다시 풀어놈
                  /oAND   (nvl(pstateyn, ' ') not in ('N', 'n'))  ch.k.j. 막음   현원포함여부 변수로 처리
                  AND  ((pstate < '80')  OR   (pstate > '80' AND  nvl(substr(retdate, 1, 6), '999999') >= :tongym)) o/
                ORDER BY empno; */ 


     /* EXEC SQL  open c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0009;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )298;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tongym;
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



     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"Cursor Open c2");

     for ( ; ; )
     {
          /* EXEC SQL FETCH c2 INTO
                   :empno,    :korname, :orgnum,  :deptcode, :jobgun, :paycl,
                   :pstate,   :sex,     :lschdeg, :retyymm,  :usaage, :paygr,
                   :comduyy,  :comdumm, :comdudd,
                   :payclyy,  :payclmm, :paycldd,
                   :retsayu1, :retsayu2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )317;
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
          sqlstm.sqhstv[2] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)jobgun;
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)paycl;
          sqlstm.sqhstl[5] = (unsigned long )4;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)pstate;
          sqlstm.sqhstl[6] = (unsigned long )3;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)sex;
          sqlstm.sqhstl[7] = (unsigned long )2;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)lschdeg;
          sqlstm.sqhstl[8] = (unsigned long )3;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)retyymm;
          sqlstm.sqhstl[9] = (unsigned long )7;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&usaage;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&paygr;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&comduyy;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&comdumm;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&comdudd;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&payclyy;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&payclmm;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&paycldd;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)retsayu1;
          sqlstm.sqhstl[18] = (unsigned long )3;
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)retsayu2;
          sqlstm.sqhstl[19] = (unsigned long )3;
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
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
             /* EXEC SQL close c2; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 20;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )412;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             return; 
          }
          else if (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
          {
             /* EXEC SQL close c2; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 20;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )427;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             hinsa_exit(0,"Data Fetch c2");
          }
          init_subvariable();
          hinsa_trim(korname);
          hinsa_trim(deptcode);
          read_pycdept(0);       /* 부문, 본부코드를 찾자 */
          calc_tongdata();       /* 통계자료를 계산 */
          pihtong_write();       /* 통계자료를 저장 */
          calc_dettongdata();    /* 세부통계자료를 계산/저장 */
     }
}

calc_tongdata()
{
     cmp_comdumm = (comduyy * 12) + comdumm;
     if  (comdudd >= 15)
          cmp_comdumm++;
     
     cmp_payclmm = (payclyy * 12) + payclmm;
     if  (paycldd >= 15)
          cmp_payclmm++;
     
     if  ((strncmp(pstate, "2", 1) == 0) &&
          (strcmp(pstate, "22") >= 0))          /* 사내파견제외 */
     {
          painwon++;
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fpainwon++;
          else
               mpainwon++;
          if  (strcmp(epoyn, "Y") == 0)         /* 파견현원포함 */
               calc_tonginwon();
     }
     else if  (strncmp(pstate, "3", 1) == 0)    /* 교  육 */
     {
          edinwon++;
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fedinwon++;
          else
               medinwon++;
          if  (strcmp(epoyn, "Y") == 0)         /* 교육현원포함 */
               calc_tonginwon();
     }
     else if (strncmp(pstate, "6", 1) == 0)     /* 정  직 */
     {
          /* 1.05  2004.03.16  이민용 오종석과장님        정직은 휴직인원에서 제외
          huinwon++;
          if  (strcmp(sex, "F") == 0) 
               fhuinwon++;
          else
               mhuinwon++;  
          */
           
          if  (strcmp(jpoyn, "Y") == 0)         /* 정직현원포함 */
               calc_tonginwon();
     }
     else if  (strncmp(pstate, "7", 1) == 0)    /* 휴  직 */
     {
          huinwon++;
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fhuinwon++;
          else
               mhuinwon++;
          if  (strcmp(hpoyn, "Y") == 0)         /* 휴직현원포함 */
               calc_tonginwon();
     }
     else if  ((strcmp(pstate, "80") >= 0) &&   /* 퇴  직 */
               (strcmp(retyymm, tongym) <= 0))
     {    /* 작업년월 이후 퇴직자는 재직자로 보자.. */
          rtinwon++;
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               frtinwon++;
          else
               mrtinwon++;
     }
     else                                       /* 재직자 */
          calc_tonginwon();
}

calc_tonginwon()
{
     inwon++;                                   /* 재직인원수 */
     agesum = agesum + usaage;                  /* 연  령 */
     paygrsum = paygrsum + paygr;               /* 호  봉 */
     dumonsum = dumonsum + cmp_comdumm;         /* 근속월수 */
     clmonsum = clmonsum + cmp_payclmm;         /* 재급월수 */
     if  (strcmp(sex, "F") == 0)                /* 여  자 */
     {
          finwon++;
          fagesum = fagesum + usaage;
          fpaygrsum = fpaygrsum + paygr;
          fdumonsum = fdumonsum + cmp_comdumm;
          fclmonsum = fclmonsum + cmp_payclmm;
     }
     else                                       /* 남  자 */
     {
          minwon++;
          magesum = magesum + usaage;
          mpaygrsum = mpaygrsum + paygr;
          mdumonsum = mdumonsum + cmp_comdumm;
          mclmonsum = mclmonsum + cmp_payclmm;
     }
     
     if  (strcmp(lschdeg, "79") == 0)           /* 박  사 */
     {                                          
         drinwon++;                             
         if  (strcmp(sex, "F") == 0)            /* 여  자 */
              fdrinwon++;                       
         else                                   
              mdrinwon++;                       
     }                                          
     else if  (strcmp(lschdeg, "69") == 0)      /* 석  사 */
     {                                          
          srinwon++;                            
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fsrinwon++;                      
          else                                  
               msrinwon++;                      
     }                                          
     else if  (strcmp(lschdeg, "59") == 0)      /* 학  사 */
     {                                          
          bainwon++;                            
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fbainwon++;                      
          else                                  
               mbainwon++;                      
     }                                          
     else if  (strcmp(lschdeg, "49") == 0)      /* 전문대 */
     {                                          
          coinwon++;                            
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fcoinwon++;                      
          else                                  
               mcoinwon++;                      
     }                                          
     else if  (strcmp(lschdeg, "39") == 0)      /* 고  졸 */
     {                                          
          hiinwon++;                            
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fhiinwon++;                      
          else                                  
               mhiinwon++;                      
     }                                          
     else                                       /* 중졸이하 */
     {                                          
          miinwon++;                            
          if  (strcmp(sex, "F") == 0)           /* 여  자 */
               fmiinwon++;
          else
               mmiinwon++;
     }
}

pihtong_write()
{
     char *FL_date;
     
     exist_count = 0;
     
     FL_date = hinsa_sys_date(0);
     STRINIT(writetime);
     strcpy(writetime, FL_date);
     
     /* EXEC SQL 
     SELECT  count(tongym) /o 기존자료가 있냐 ? o/
       INTO  :exist_count
       FROM  pihtong
      WHERE  tongym = :tongym
        AND  orgnum = :orgnum AND deptcode = :deptcode
        AND  jobgun = :jobgun AND paycl = :paycl; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(tongym) into :b0  from pihtong where ((((t\
ongym=:b1 and orgnum=:b2) and deptcode=:b3) and jobgun=:b4) and paycl=:b5)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )442;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&exist_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)tongym;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)orgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)deptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)jobgun;
     sqlstm.sqhstl[4] = (unsigned long )3;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)paycl;
     sqlstm.sqhstl[5] = (unsigned long )4;
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


     
     if  (exist_count != 0)
     {    /* 있으면 값을 더하자 */
          /* EXEC SQL 
          UPDATE  pihtong 
             set  minwon     = (minwon + :minwon),    /o 재직인원 o/
                  finwon     = (finwon + :finwon),
                  inwon      = (inwon + :inwon),
                  mpainwon   = (mpainwon + :mpainwon), /o 파견인원 o/
                  fpainwon   = (fpainwon + :fpainwon),
                  painwon    = (painwon + :painwon),
                  medinwon   = (medinwon + :medinwon), /o 교육인원 o/
                  fedinwon   = (fedinwon + :fedinwon),
                  edinwon    = (edinwon + :edinwon),
                  mhuinwon   = (mhuinwon + :mhuinwon), /o 휴직인원 o/
                  fhuinwon   = (fhuinwon + :fhuinwon),
                  huinwon    = (huinwon + :huinwon),
                  mrtinwon   = (mrtinwon + :mrtinwon), /o 퇴직인원 o/
                  frtinwon   = (frtinwon + :frtinwon),
                  rtinwon    = (rtinwon + :rtinwon),
                  magesum    = (magesum + :magesum), /o 연  령 o/
                  fagesum    = (fagesum + :fagesum), 
                  agesum     = (agesum + :agesum),
                  mpaygrsum  = (mpaygrsum + :mpaygrsum), /o 호  봉 o/
                  fpaygrsum  = (fpaygrsum + :fpaygrsum),
                  paygrsum   = (paygrsum + :paygrsum),
                  mdumonsum  = (mdumonsum + :mdumonsum), /o 근속월수 o/
                  fdumonsum  = (fdumonsum + :fdumonsum),
                  dumonsum   = (dumonsum + :dumonsum),
                  mclmonsum  = (mclmonsum + :mclmonsum), /o 재급월수 o/
                  fclmonsum  = (fclmonsum + :fclmonsum),
                  clmonsum   = (clmonsum + :clmonsum),
                  mdrinwon   = (mdrinwon + :mdrinwon), /o 박  사 o/
                  fdrinwon   = (fdrinwon + :fdrinwon),
                  drinwon    = (drinwon + :drinwon),
                  msrinwon   = (msrinwon + :msrinwon), /o 석  사 o/
                  fsrinwon   = (fsrinwon + :fsrinwon),
                  srinwon    = (srinwon + :srinwon),
                  mbainwon   = (mbainwon + :mbainwon), /o 학  사 o/
                  fbainwon   = (fbainwon + :fbainwon),
                  bainwon    = (bainwon + :bainwon),
                  mcoinwon   = (mcoinwon + :mcoinwon), /o 전문대 o/
                  fcoinwon   = (fcoinwon + :fcoinwon),
                  coinwon    = (coinwon + :coinwon),
                  mhiinwon   = (mhiinwon + :mhiinwon), /o 고  졸 o/
                  fhiinwon   = (fhiinwon + :fhiinwon),
                  hiinwon    = (hiinwon + :hiinwon),
                  mmiinwon   = (mmiinwon + :mmiinwon), /o 중  졸 o/
                  fmiinwon   = (fmiinwon + :fmiinwon),
                  miinwon    = (miinwon + :miinwon),
                  writetime  = :writetime, writeemp = :jobempno
           WHERE  tongym = :tongym 
             AND  orgnum = :orgnum AND deptcode = :deptcode 
             AND  jobgun = :jobgun AND paycl = :paycl; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 52;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlbuft((void **)0,
            "update pihtong  set minwon=(minwon+:b0),finwon=(finwon+:b1),inw\
on=(inwon+:b2),mpainwon=(mpainwon+:b3),fpainwon=(fpainwon+:b4),painwon=(pain\
won+:b5),medinwon=(medinwon+:b6),fedinwon=(fedinwon+:b7),edinwon=(edinwon+:b\
8),mhuinwon=(mhuinwon+:b9),fhuinwon=(fhuinwon+:b10),huinwon=(huinwon+:b11),m\
rtinwon=(mrtinwon+:b12),frtinwon=(frtinwon+:b13),rtinwon=(rtinwon+:b14),mage\
sum=(magesum+:b15),fagesum=(fagesum+:b16),agesum=(agesum+:b17),mpaygrsum=(mp\
aygrsum+:b18),fpaygrsum=(fpaygrsum+:b19),paygrsum=(paygrsum+:b20),mdumonsum=\
(mdumonsum+:b21),fdumonsum=(fdumonsum+:b22),dumonsum=(dumonsum+:b23),mclmons\
um=(mclmonsum+:b24),fclmonsum=(fclmonsum+:b25),clmonsum=(clmonsum+:b26),mdri\
nwon=(mdrinwon+:b27),fdrinwon=(fdrinwon+:b28),drinwon=(drinwon+:b29),msrinwo\
n=(msrinwon+:b30),fsrinwon=(fsrinwon+:b31),srinwon=(srinwon+:b32),mbainwon=(\
mbainwon+:b33),fbainwon=(fbainwon+:b34),bainwon=(bainwon+:b35),mcoinwon=(mco\
inwon+:b36),fcoinwon=(fcoinwon+:b37),coinwon=(coinwon+:b38),mhiinwon=(mhiinw\
on+:b39),fhiinwon=(fhiinwon+:b40),hiinwon=(hiinwo");
          sqlstm.stmt = "n+:b41),mmiinwon=(mmiinwon+:b42),fmiinwon=(fmiinwo\
n+:b43),miinwon=(miinwon+:b44),writetime=:b45,writeemp=:b46 where ((((tongym=\
:b47 and orgnum=:b48) and deptcode=:b49) and jobgun=:b50) and paycl=:b51)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )481;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&minwon;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&finwon;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&inwon;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&mpainwon;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&fpainwon;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&painwon;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&medinwon;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&fedinwon;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&edinwon;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&mhuinwon;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&fhuinwon;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&huinwon;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&mrtinwon;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&frtinwon;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&rtinwon;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&magesum;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&fagesum;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&agesum;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&mpaygrsum;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&fpaygrsum;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&paygrsum;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&mdumonsum;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&fdumonsum;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&dumonsum;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&mclmonsum;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&fclmonsum;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&clmonsum;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&mdrinwon;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&fdrinwon;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&drinwon;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&msrinwon;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&fsrinwon;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&srinwon;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&mbainwon;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&fbainwon;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&bainwon;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&mcoinwon;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&fcoinwon;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&coinwon;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&mhiinwon;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&fhiinwon;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&hiinwon;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&mmiinwon;
          sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[42] = (         int  )0;
          sqlstm.sqindv[42] = (         short *)0;
          sqlstm.sqinds[42] = (         int  )0;
          sqlstm.sqharm[42] = (unsigned long )0;
          sqlstm.sqadto[42] = (unsigned short )0;
          sqlstm.sqtdso[42] = (unsigned short )0;
          sqlstm.sqhstv[43] = (unsigned char  *)&fmiinwon;
          sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[43] = (         int  )0;
          sqlstm.sqindv[43] = (         short *)0;
          sqlstm.sqinds[43] = (         int  )0;
          sqlstm.sqharm[43] = (unsigned long )0;
          sqlstm.sqadto[43] = (unsigned short )0;
          sqlstm.sqtdso[43] = (unsigned short )0;
          sqlstm.sqhstv[44] = (unsigned char  *)&miinwon;
          sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)writetime;
          sqlstm.sqhstl[45] = (unsigned long )16;
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)jobempno;
          sqlstm.sqhstl[46] = (unsigned long )5;
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
          sqlstm.sqhstv[47] = (unsigned char  *)tongym;
          sqlstm.sqhstl[47] = (unsigned long )7;
          sqlstm.sqhsts[47] = (         int  )0;
          sqlstm.sqindv[47] = (         short *)0;
          sqlstm.sqinds[47] = (         int  )0;
          sqlstm.sqharm[47] = (unsigned long )0;
          sqlstm.sqadto[47] = (unsigned short )0;
          sqlstm.sqtdso[47] = (unsigned short )0;
          sqlstm.sqhstv[48] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[48] = (unsigned long )4;
          sqlstm.sqhsts[48] = (         int  )0;
          sqlstm.sqindv[48] = (         short *)0;
          sqlstm.sqinds[48] = (         int  )0;
          sqlstm.sqharm[48] = (unsigned long )0;
          sqlstm.sqadto[48] = (unsigned short )0;
          sqlstm.sqtdso[48] = (unsigned short )0;
          sqlstm.sqhstv[49] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[49] = (unsigned long )7;
          sqlstm.sqhsts[49] = (         int  )0;
          sqlstm.sqindv[49] = (         short *)0;
          sqlstm.sqinds[49] = (         int  )0;
          sqlstm.sqharm[49] = (unsigned long )0;
          sqlstm.sqadto[49] = (unsigned short )0;
          sqlstm.sqtdso[49] = (unsigned short )0;
          sqlstm.sqhstv[50] = (unsigned char  *)jobgun;
          sqlstm.sqhstl[50] = (unsigned long )3;
          sqlstm.sqhsts[50] = (         int  )0;
          sqlstm.sqindv[50] = (         short *)0;
          sqlstm.sqinds[50] = (         int  )0;
          sqlstm.sqharm[50] = (unsigned long )0;
          sqlstm.sqadto[50] = (unsigned short )0;
          sqlstm.sqtdso[50] = (unsigned short )0;
          sqlstm.sqhstv[51] = (unsigned char  *)paycl;
          sqlstm.sqhstl[51] = (unsigned long )4;
          sqlstm.sqhsts[51] = (         int  )0;
          sqlstm.sqindv[51] = (         short *)0;
          sqlstm.sqinds[51] = (         int  )0;
          sqlstm.sqharm[51] = (unsigned long )0;
          sqlstm.sqadto[51] = (unsigned short )0;
          sqlstm.sqtdso[51] = (unsigned short )0;
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



          if  (sqlca.sqlcode != 0)    /* Error is Error */
               hinsa_exit(0,"PIHTONG Update Error !");
     }
     else
     {
          /* EXEC SQL 
          INSERT  INTO  pihtong
                       (tongym,    orgnum,    deptcode,  jobgun,  jobline,
                        paycl,     fieldcode, boncode,
                        minwon,    finwon,    inwon,
                        mpainwon,  fpainwon,  painwon,
                        medinwon,  fedinwon,  edinwon,
                        mhuinwon,  fhuinwon,  huinwon,
                        mrtinwon,  frtinwon,  rtinwon,
                        magesum,   fagesum,   agesum,
                        mpaygrsum, fpaygrsum, paygrsum,
                        mdumonsum, fdumonsum, dumonsum,
                        mclmonsum, fclmonsum, clmonsum,
                        mdrinwon,  fdrinwon,  drinwon,
                        msrinwon,  fsrinwon,  srinwon,
                        mbainwon,  fbainwon,  bainwon,
                        mcoinwon,  fcoinwon,  coinwon,
                        mhiinwon,  fhiinwon,  hiinwon,
                        mmiinwon,  fmiinwon,  miinwon,
                        writetime, writeemp)
               VALUES  (:tongym,   :orgnum,   :deptcode,  :jobgun, :jobline,
                        :paycl,    :fieldcode,:boncode,
                        :minwon,   :finwon,   :inwon,
                        :mpainwon, :fpainwon, :painwon,
                        :medinwon, :fedinwon, :edinwon,
                        :mhuinwon, :fhuinwon, :huinwon,
                        :mrtinwon, :frtinwon, :rtinwon,
                        :magesum,  :fagesum,  :agesum,
                        :mpaygrsum,:fpaygrsum,:paygrsum,
                        :mdumonsum,:fdumonsum,:dumonsum,
                        :mclmonsum,:fclmonsum,:clmonsum,
                        :mdrinwon, :fdrinwon, :drinwon,
                        :msrinwon, :fsrinwon, :srinwon,
                        :mbainwon, :fbainwon, :bainwon,
                        :mcoinwon, :fcoinwon, :coinwon,
                        :mhiinwon, :fhiinwon, :hiinwon,
                        :mmiinwon, :fmiinwon, :miinwon,
                        :writetime,:jobempno); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 55;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "insert into pihtong (tongym,orgnum,deptcode,jobgun\
,jobline,paycl,fieldcode,boncode,minwon,finwon,inwon,mpainwon,fpainwon,painwo\
n,medinwon,fedinwon,edinwon,mhuinwon,fhuinwon,huinwon,mrtinwon,frtinwon,rtinw\
on,magesum,fagesum,agesum,mpaygrsum,fpaygrsum,paygrsum,mdumonsum,fdumonsum,du\
monsum,mclmonsum,fclmonsum,clmonsum,mdrinwon,fdrinwon,drinwon,msrinwon,fsrinw\
on,srinwon,mbainwon,fbainwon,bainwon,mcoinwon,fcoinwon,coinwon,mhiinwon,fhiin\
won,hiinwon,mmiinwon,fmiinwon,miinwon,writetime,writeemp) values (:b0,:b1,:b2\
,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18,:b1\
9,:b20,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:b30,:b31,:b32,:b33,:b34,\
:b35,:b36,:b37,:b38,:b39,:b40,:b41,:b42,:b43,:b44,:b45,:b46,:b47,:b48,:b49,:b\
50,:b51,:b52,:b53,:b54)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )704;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)tongym;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[1] = (unsigned long )4;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)jobgun;
          sqlstm.sqhstl[3] = (unsigned long )3;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)jobline;
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)paycl;
          sqlstm.sqhstl[5] = (unsigned long )4;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)fieldcode;
          sqlstm.sqhstl[6] = (unsigned long )4;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)boncode;
          sqlstm.sqhstl[7] = (unsigned long )7;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&minwon;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&finwon;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&inwon;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&mpainwon;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&fpainwon;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&painwon;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&medinwon;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&fedinwon;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&edinwon;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&mhuinwon;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&fhuinwon;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&huinwon;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&mrtinwon;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&frtinwon;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&rtinwon;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&magesum;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&fagesum;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&agesum;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&mpaygrsum;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&fpaygrsum;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&paygrsum;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&mdumonsum;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&fdumonsum;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&dumonsum;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&mclmonsum;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&fclmonsum;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&clmonsum;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&mdrinwon;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&fdrinwon;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&drinwon;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&msrinwon;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&fsrinwon;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&srinwon;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&mbainwon;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&fbainwon;
          sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[42] = (         int  )0;
          sqlstm.sqindv[42] = (         short *)0;
          sqlstm.sqinds[42] = (         int  )0;
          sqlstm.sqharm[42] = (unsigned long )0;
          sqlstm.sqadto[42] = (unsigned short )0;
          sqlstm.sqtdso[42] = (unsigned short )0;
          sqlstm.sqhstv[43] = (unsigned char  *)&bainwon;
          sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[43] = (         int  )0;
          sqlstm.sqindv[43] = (         short *)0;
          sqlstm.sqinds[43] = (         int  )0;
          sqlstm.sqharm[43] = (unsigned long )0;
          sqlstm.sqadto[43] = (unsigned short )0;
          sqlstm.sqtdso[43] = (unsigned short )0;
          sqlstm.sqhstv[44] = (unsigned char  *)&mcoinwon;
          sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)&fcoinwon;
          sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)&coinwon;
          sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
          sqlstm.sqhstv[47] = (unsigned char  *)&mhiinwon;
          sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[47] = (         int  )0;
          sqlstm.sqindv[47] = (         short *)0;
          sqlstm.sqinds[47] = (         int  )0;
          sqlstm.sqharm[47] = (unsigned long )0;
          sqlstm.sqadto[47] = (unsigned short )0;
          sqlstm.sqtdso[47] = (unsigned short )0;
          sqlstm.sqhstv[48] = (unsigned char  *)&fhiinwon;
          sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[48] = (         int  )0;
          sqlstm.sqindv[48] = (         short *)0;
          sqlstm.sqinds[48] = (         int  )0;
          sqlstm.sqharm[48] = (unsigned long )0;
          sqlstm.sqadto[48] = (unsigned short )0;
          sqlstm.sqtdso[48] = (unsigned short )0;
          sqlstm.sqhstv[49] = (unsigned char  *)&hiinwon;
          sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[49] = (         int  )0;
          sqlstm.sqindv[49] = (         short *)0;
          sqlstm.sqinds[49] = (         int  )0;
          sqlstm.sqharm[49] = (unsigned long )0;
          sqlstm.sqadto[49] = (unsigned short )0;
          sqlstm.sqtdso[49] = (unsigned short )0;
          sqlstm.sqhstv[50] = (unsigned char  *)&mmiinwon;
          sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[50] = (         int  )0;
          sqlstm.sqindv[50] = (         short *)0;
          sqlstm.sqinds[50] = (         int  )0;
          sqlstm.sqharm[50] = (unsigned long )0;
          sqlstm.sqadto[50] = (unsigned short )0;
          sqlstm.sqtdso[50] = (unsigned short )0;
          sqlstm.sqhstv[51] = (unsigned char  *)&fmiinwon;
          sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[51] = (         int  )0;
          sqlstm.sqindv[51] = (         short *)0;
          sqlstm.sqinds[51] = (         int  )0;
          sqlstm.sqharm[51] = (unsigned long )0;
          sqlstm.sqadto[51] = (unsigned short )0;
          sqlstm.sqtdso[51] = (unsigned short )0;
          sqlstm.sqhstv[52] = (unsigned char  *)&miinwon;
          sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[52] = (         int  )0;
          sqlstm.sqindv[52] = (         short *)0;
          sqlstm.sqinds[52] = (         int  )0;
          sqlstm.sqharm[52] = (unsigned long )0;
          sqlstm.sqadto[52] = (unsigned short )0;
          sqlstm.sqtdso[52] = (unsigned short )0;
          sqlstm.sqhstv[53] = (unsigned char  *)writetime;
          sqlstm.sqhstl[53] = (unsigned long )16;
          sqlstm.sqhsts[53] = (         int  )0;
          sqlstm.sqindv[53] = (         short *)0;
          sqlstm.sqinds[53] = (         int  )0;
          sqlstm.sqharm[53] = (unsigned long )0;
          sqlstm.sqadto[53] = (unsigned short )0;
          sqlstm.sqtdso[53] = (unsigned short )0;
          sqlstm.sqhstv[54] = (unsigned char  *)jobempno;
          sqlstm.sqhstl[54] = (unsigned long )5;
          sqlstm.sqhsts[54] = (         int  )0;
          sqlstm.sqindv[54] = (         short *)0;
          sqlstm.sqinds[54] = (         int  )0;
          sqlstm.sqharm[54] = (unsigned long )0;
          sqlstm.sqadto[54] = (unsigned short )0;
          sqlstm.sqtdso[54] = (unsigned short )0;
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


        
          if  (sqlca.sqlcode != 0)    /* Error is Error */
          {
               printf("sqlca.sqlcode %d, %s, %s, %s, %s, %s, %s\n", 
                       sqlca.sqlcode, tongym, orgnum, deptcode, jobgun, paycl, empno);
               hinsa_exit(0,"PIHTONG Insert Error !");
          }
     }
     tcre_count++;
}

calc_dettongdata()
{
     char buf_gubun[6];
     
     if  (((strncmp(pstate, "2", 1) == 0) && 
           (strcmp(pstate, "22") >= 0)) ||            /* 사내파견제외 */
           (strncmp(pstate, "3", 1) == 0))            /* 교    육 */
     {                                                
          if  (strcmp(epoyn, "Y") != 0)               /* 파견교육현원포함 */
          return;                                     
     }                                                
     else if  (strncmp(pstate, "6", 1) == 0)          /* 정  직 */
     {                                                
          if  (strcmp(jpoyn, "Y") != 0)               /* 정직현원포함 */
               return;                                
     }                                                
     else if  (strncmp(pstate, "7", 1) == 0)          /* 휴  직 */
     {                                                
          if  (strcmp(hpoyn, "Y") != 0)               /* 휴직현원포함 */
               return;                                
     }                                                
     else if  ((strcmp(pstate, "80") >= 0) &&         /* 퇴  직 */
               (strcmp(retyymm, tongym) <= 0))
     {    /* 작업년월 이후 퇴직자는 재직자로 보자..*/
          inwon = rtinwon;
          minwon = mrtinwon;    finwon = frtinwon;
          pihston_write("45", retsayu1, retsayu2, "00000");
          return;
     }
     
     sprintf(buf_gubun, "%05.0f", cmp_comdumm);       /* 근속월수 */
     pihston_write("10", buf_gubun, "00000", "00000");
     sprintf(buf_gubun, "%05.0f", cmp_payclmm);       /* 재급월수 */
     pihston_write("15", buf_gubun, "00000", "00000");
     /*30.00 호봉삭제로 계산하지 않음.
     sprintf(buf_gubun, "%05.0f", paygr);              * 호  봉 *
     pihston_write("20", buf_gubun, "00000", "00000");
     */
     sprintf(buf_gubun, "%05.0f", usaage);            /* 연  령 */
     pihston_write("25", buf_gubun, "00000", "00000");
     
     licetong_write();                                /* 자격증 통계생성 */
     schotong_write();                                /* 대학교/전공 통계생성 */
     company_write();                                 /* 용역회사통계생성 */
}

licetong_write()
{
     int lice_count;
     char buf_gubun2[6], buf_gubun3[6];
     lice_count = 0;
     
     /* EXEC SQL DECLARE  k1 cursor for
     /oSELECT nvl(substr(lickind, 1, 3), '   '),  
              nvl(substr(licgr,1,1),' ')           dsa2000 2013.08.o/
     SELECT nvl(lickind,'   '),
            nvl(licgr  ,' ')
       FROM pimlice
      WHERE empno = :empno
      ORDER BY  licrank; */ 

     
     /* EXEC SQL  open k1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0013;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )939;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
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


     
     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"Cursor Open k1");
     
     for ( ; ; )
     {
          /* EXEC SQL FETCH k1 INTO
                   :lickind, :licgr; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 55;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )958;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)lickind;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)licgr;
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


     
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close k1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 55;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )981;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          else if  (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
          {
               /* EXEC SQL close k1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 55;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )996;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Data Fetch k1");
          }
          lice_count++;
          
          if   (lice_count == 1) /* 우선순위가 제일작은 자료가 대표 */
               strcpy(buf_gubun2, "Y");
          else strcpy(buf_gubun2, "N");
          	
          strcpy(codeid, "I231");  
          strcpy(codeno, lickind);
          read_pyccode();
          
          /*sprintf(buf_gubun3, "%.3s%.1s", lickind, licgr); dsa2000 2013.08.*/
          sprintf(buf_gubun3, "%s%s", lickind, licgr);
          pihston_write("30", buf_gubun2, buf_gubun3, codemainon);
     }
}

schotong_write()
{
     char old_schgr[3], tmp_schgr[6];
     memset(old_schgr, 0x00, sizeof(old_schgr));
     memset(tmp_schgr, 0x00, sizeof(tmp_schgr));
    
     /* EXEC SQL DECLARE  k2 cursor for
               SELECT  nvl(substr(schgr, 1, 2), '  '),
                       nvl(substr(schcode, 1, 4), '    '),
                       nvl(substr(majorcode, 1, 4), '    ')
                 FROM  pimscho
                WHERE  empno = :empno
                  AND  schgr in ('59', '69', '79')
                ORDER  BY  schgr, schrank; */ 

    
     /* EXEC SQL  open k2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0014;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1011;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
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


    
     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"Cursor Open k2");
    
     for ( ; ; )
     {
          /* EXEC SQL FETCH k2 INTO
                   :schgr, 
                   :schcode, 
                   :majorcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 55;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1030;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)schgr;
          sqlstm.sqhstl[0] = (unsigned long )3;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)schcode;
          sqlstm.sqhstl[1] = (unsigned long )5;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)majorcode;
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


    
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close k2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 55;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1057;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          else if (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
          {
               /* EXEC SQL close k2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 55;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1072;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Data Fetch k2");
          }
          /* 동일학력구분은 한자료만 처리 */
          if  (strcmp(old_schgr, schgr) != 0)
          {
               sprintf(tmp_schgr, "%.2s000", schgr);
               strcpy(codeid, "I223");  strcpy(codeno, schcode);
               read_pyccode();
               pihston_write("50", codemainon, schcode, tmp_schgr);
         
          /*if  (strcmp(schcode,"0141") == 0) 2001.11.19 shm
          {    
               printf("\n codemainon[%s]",codemainon);           
               printf("\n schcode[%s]",schcode);           
               printf("\n tmp_schgr[%s]",tmp_schgr);           } */
         
          strcpy(codeid, "I225");  strcpy(codeno, majorcode);
          read_pyccode();
          pihston_write("55", codemainon, majorcode, tmp_schgr);
          }
          strcpy(old_schgr, schgr);
     }
}

company_write()
{
     char   tmp_schgr[6];
     memset(tmp_schgr, 0x00, sizeof(tmp_schgr));
     /* EXEC SQL 
     SELECT  nvl(tcompany,'ZZ')
       INTO  :tcompany
       FROM  pimpmas
      WHERE  empno = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(tcompany,'ZZ') into :b0  from pimpmas where \
empno=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1087;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tcompany;
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


    
     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"용역회사 추출 에러");
    
     hinsa_trim(tcompany);
    
     if  ((sqlca.sqlcode == 1403) || (strcmp(tcompany,"ZZ") == 0))
          return;
    
     strcpy(tmp_schgr,"00000");
     strcpy(codeid, "I902");  strcpy(codeno, tcompany);
     read_pyccode();
     pihston_write("60", codemainon, tcompany, tmp_schgr);
}


annotong_create()
{
     /* EXEC SQL DECLARE h1 cursor for
               SELECT  nvl(substr(ancode, 1, 3), '   '),
                       nvl(substr(andetcode, 1, 2), '  '),
                       orgnum, 
                       deptcode,
                       upper(paycl), 
                       upper(jobgun), 
                       count(ancode)
                 FROM  pihanno
                WHERE  substr(anfrdate, 1, 6) = :tongym
                  AND  anupdyn in ('Y', 'y') 
                  AND  orgnum = :orgnum
                GROUP  BY  ancode, andetcode, orgnum, deptcode, upper(paycl), upper(jobgun); */ 

    
     /* EXEC SQL  open h1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0016;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1110;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tongym;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)orgnum;
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


    
     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"Cursor Open h1");
    
     for ( ; ; )
     {
          /* EXEC SQL FETCH h1 INTO
                   :ancode, 
                   :andetcode, 
                   :orgnum, 
                   :deptcode,
                   :paycl, 
                   :jobgun, 
                   :anno_count; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 55;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1133;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)ancode;
          sqlstm.sqhstl[0] = (unsigned long )4;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)andetcode;
          sqlstm.sqhstl[1] = (unsigned long )3;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)paycl;
          sqlstm.sqhstl[4] = (unsigned long )4;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)jobgun;
          sqlstm.sqhstl[5] = (unsigned long )3;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&anno_count;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
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
               /* EXEC SQL close h1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 55;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1176;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          else if  (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
          {
               /* EXEC SQL close h1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 55;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1191;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Data Fetch h1");
          }
          init_subvariable();
          hinsa_trim(deptcode);
          read_pycdept(1); /* 부문, 본부코드를 찾자 */
          minwon = finwon = 0;
          inwon  = anno_count;
          pihston_write("40", ancode, andetcode, "00000");
     }
}

pihston_write(t_gubun1, t_gubun2, t_gubun3, t_gubun4)
char t_gubun1[3], t_gubun2[6], t_gubun3[6], t_gubun4[6];
{
     char *FL_date;
     exist_count = 0;
    
     FL_date = hinsa_sys_date(0);
     STRINIT(writetime);
     strcpy(writetime, FL_date);
    
     memset(gubun1,    0x00,   sizeof(gubun1));
     memset(gubun2,    0x00,   sizeof(gubun2));
     memset(gubun3,    0x00,   sizeof(gubun3));
     memset(gubun4,    0x00,   sizeof(gubun4));
    
     strcpy(gubun1, t_gubun1);  
     strcpy(gubun2, t_gubun2);
     strcpy(gubun3, t_gubun3);  
     strcpy(gubun4, t_gubun4);
    
     hinsa_trim(gubun1); 
     hinsa_trim(gubun2);
     hinsa_trim(gubun3); 
     hinsa_trim(gubun4);

     /* EXEC SQL 
     SELECT  count(tongym) /o 기존자료가 있냐 ? o/
       INTO  :exist_count
       FROM  pihston
      WHERE  tongym   = :tongym
        AND  orgnum   = :orgnum 
        AND  deptcode = :deptcode
        AND  jobgun   = :jobgun 
        AND  paycl    = :paycl
        AND  gubun1   = :gubun1
        AND  nvl(substr(gubun2, 1, 5), '     ') = nvl(substr(:gubun2, 1, 5), '     ')
        AND  nvl(substr(gubun3, 1, 5), '     ') = nvl(substr(:gubun3, 1, 5), '     ')
        AND  nvl(substr(gubun4, 1, 5), '     ') = nvl(substr(:gubun4, 1, 5), '     '); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(tongym) into :b0  from pihston where (((((\
(((tongym=:b1 and orgnum=:b2) and deptcode=:b3) and jobgun=:b4) and paycl=:b5\
) and gubun1=:b6) and nvl(substr(gubun2,1,5),'     ')=nvl(substr(:b7,1,5),'  \
   ')) and nvl(substr(gubun3,1,5),'     ')=nvl(substr(:b8,1,5),'     ')) and \
nvl(substr(gubun4,1,5),'     ')=nvl(substr(:b9,1,5),'     '))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1206;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&exist_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)tongym;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)orgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)deptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)jobgun;
     sqlstm.sqhstl[4] = (unsigned long )3;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)paycl;
     sqlstm.sqhstl[5] = (unsigned long )4;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)gubun1;
     sqlstm.sqhstl[6] = (unsigned long )3;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)gubun2;
     sqlstm.sqhstl[7] = (unsigned long )6;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)gubun3;
     sqlstm.sqhstl[8] = (unsigned long )6;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)gubun4;
     sqlstm.sqhstl[9] = (unsigned long )6;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
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



     if  (exist_count != 0)
     {    /* 있으면 값을 더하자 */
          /* EXEC SQL 
          UPDATE  pihston 
             set  minwon    = (minwon + :minwon),    /o 재직인원 o/
                  finwon    = (finwon + :finwon),
                  inwon     = (inwon + :inwon),
                  writetime = :writetime,
                  writeemp  = :jobempno
           WHERE  tongym    = :tongym 
             AND  orgnum    = :orgnum \
             AND  deptcode  = :deptcode 
             AND  jobgun    = :jobgun 
             AND  paycl     = :paycl
             AND  gubun1    = :gubun1 
             AND  nvl(substr(gubun2, 1, 5), '     ') = nvl(substr(:gubun2, 1, 5), '     ')
             AND  nvl(substr(gubun3, 1, 5), '     ') = nvl(substr(:gubun3, 1, 5), '     ')
             AND  nvl(substr(gubun4, 1, 5), '     ') = nvl(substr(:gubun4, 1, 5), '     '); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 55;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pihston  set minwon=(minwon+:b0),finwon=(fi\
nwon+:b1),inwon=(inwon+:b2),writetime=:b3,writeemp=:b4 where ((((((((tongym=:\
b5 and orgnum=:b6) and deptcode=:b7) and jobgun=:b8) and paycl=:b9) and gubun\
1=:b10) and nvl(substr(gubun2,1,5),'     ')=nvl(substr(:b11,1,5),'     ')) an\
d nvl(substr(gubun3,1,5),'     ')=nvl(substr(:b12,1,5),'     ')) and nvl(subs\
tr(gubun4,1,5),'     ')=nvl(substr(:b13,1,5),'     '))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1261;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&minwon;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&finwon;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&inwon;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)writetime;
          sqlstm.sqhstl[3] = (unsigned long )16;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)jobempno;
          sqlstm.sqhstl[4] = (unsigned long )5;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)tongym;
          sqlstm.sqhstl[5] = (unsigned long )7;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[6] = (unsigned long )4;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[7] = (unsigned long )7;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)jobgun;
          sqlstm.sqhstl[8] = (unsigned long )3;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)paycl;
          sqlstm.sqhstl[9] = (unsigned long )4;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)gubun1;
          sqlstm.sqhstl[10] = (unsigned long )3;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)gubun2;
          sqlstm.sqhstl[11] = (unsigned long )6;
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)gubun3;
          sqlstm.sqhstl[12] = (unsigned long )6;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)gubun4;
          sqlstm.sqhstl[13] = (unsigned long )6;
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


          if  (sqlca.sqlcode != 0)    /* Error is Error */
               hinsa_exit(0,"PIHSTON Update Error !");
     }
     else
     {
          /* EXEC SQL 
          INSERT  INTO  pihston
                VALUES (:tongym,    :orgnum, :deptcode, :jobgun, :jobline,:paycl,
                        :gubun1,    :gubun2, :gubun3,   :gubun4, 
                        :fieldcode, :boncode,
                        :minwon,    :finwon, :inwon,
                        :writetime, :jobempno); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 55;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "insert into pihston  values (:b0,:b1,:b2,:b3,:b4,:\
b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1332;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)tongym;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[1] = (unsigned long )4;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)jobgun;
          sqlstm.sqhstl[3] = (unsigned long )3;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)jobline;
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)paycl;
          sqlstm.sqhstl[5] = (unsigned long )4;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)gubun1;
          sqlstm.sqhstl[6] = (unsigned long )3;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)gubun2;
          sqlstm.sqhstl[7] = (unsigned long )6;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)gubun3;
          sqlstm.sqhstl[8] = (unsigned long )6;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)gubun4;
          sqlstm.sqhstl[9] = (unsigned long )6;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)fieldcode;
          sqlstm.sqhstl[10] = (unsigned long )4;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)boncode;
          sqlstm.sqhstl[11] = (unsigned long )7;
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&minwon;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&finwon;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&inwon;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)writetime;
          sqlstm.sqhstl[15] = (unsigned long )16;
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)jobempno;
          sqlstm.sqhstl[16] = (unsigned long )5;
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
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


          if  (sqlca.sqlcode != 0)    /* Error is Error */
               hinsa_exit(0,"PIHSTON Insert Error !");
     }
     stcre_count++;
}

read_pycdept(i)
int i;
{
     /* EXEC SQL 
     SELECT  nvl(fieldcode, 'ZZZ'), nvl(boncode, 'ZZZZZZ')
       INTO  :fieldcode, :boncode
       FROM  pycdept
      WHERE  orgnum   = :orgnum 
        AND  deptcode = :deptcode
        AND  existon  = '1'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(fieldcode,'ZZZ') ,nvl(boncode,'ZZZZZZ') into\
 :b0,:b1  from pycdept where ((orgnum=:b2 and deptcode=:b3) and existon='1')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1415;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)fieldcode;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)boncode;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)orgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)deptcode;
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

 /* 실제조직 */

     if  (sqlca.sqlcode != 0)
     {   
          if  (i == 0)
               sprintf(tmp_buf, "사번[%s] 성명[%s] 차수[%s] 부서[%s] ==> 부서코드 미존재 OR 오류 !",
                                empno, korname, orgnum, deptcode);
          else
               sprintf(tmp_buf, "차수[%s]부서[%s] ==> 부서코드 미존재 OR 오류 !", orgnum, deptcode);
          hinsa_log_print(0,tmp_buf);
          strcpy(fieldcode, "ZZZ"); 
          strcpy(boncode, deptcode); 
     }
     hinsa_trim(fieldcode);  
     hinsa_trim(boncode);
}

read_pyccode()
{
     hinsa_trim(codeno);
     /* EXEC SQL 
     SELECT  codemainon
       INTO  :codemainon
       FROM  pyccode
      WHERE  codeid = :codeid 
        AND  codeno = :codeno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select codemainon into :b0  from pyccode where (codeid=\
:b1 and codeno=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1446;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)codemainon;
     sqlstm.sqhstl[0] = (unsigned long )2;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)codeid;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)codeno;
     sqlstm.sqhstl[2] = (unsigned long )11;
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
          /* EXEC SQL 
          SELECT  codeidname     /odsa2000  Add  2007.10.o/
            INTO  :codeidname
            FROM  pyccoid
           WHERE  codeid = :codeid; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 55;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select codeidname into :b0  from pyccoid where cod\
eid=:b1";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1473;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)codeidname;
          sqlstm.sqhstl[0] = (unsigned long )16;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)codeid;
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


                 
          sprintf(tmp_buf, "사번[%s] 성명[%s] 코드ID[%s] 코드[%s] 코드명[%s] ==> 코드 미존재 OR 오류!",
                            empno, korname, codeid, codeno, codeidname);
          hinsa_log_print(0, tmp_buf);
          strcpy(codemainon, "1"); /* 오류자료는 일단 비주요 */
     }
}

update_pimvari()
{
     /* EXEC SQL 
     UPDATE  pimvari
        SET  value1 = :tongym,
             value2 = :start_date
      WHERE  gubun  = '70' AND sgubun = '0001'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimvari  set value1=:b0,value2=:b1 where (gubun=\
'70' and sgubun='0001')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1496;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)tongym;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)start_date;
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



     if  (sqlca.sqlcode != 0)
          hinsa_exit(0,"Update Pimvari Error");
}

/*--------------------------------------*
 * Log message routine    *
 *--------------------------------------*/
/*
log_message(msg)
char *msg;
{
     error_count++;
     log_msg(1, gubun, num++, msg);
     return;
}
*/

/*=== K.J 2005.10. Rexec대체 서비스를 위한 ====================*/
int Write_batlog(int seqno, char *message)
{ 
     /* EXEC SQL AT  log_db 
     INSERT INTO  PYBATLOG
          VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1519;
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



     if  ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0)) 
     { 
          printf("ERROR_CODE : %d, pybatlog Insert Error. \n", sqlca.sqlcode);    
          return(FAIL);
     }                        
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 55;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1560;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
}
/**********<< PROGRAM END >>********************************/
