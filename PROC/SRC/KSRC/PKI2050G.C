
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
    "pki2050g.pc"
};


static unsigned int sqlctx = 151923;


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

 static char *sq0005 = 
"select EMPNO ,FAMINAME ,FAMIJUID  from PNMSCMAS where (((SCKIND=:b0 and SCE\
NDYYMM is null ) and UPPER(NVL(SCYN,' '))='Y') and (EMPNO in (select EMPNO  f\
rom PKMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y')) or EMPNO in (select EMP\
NO  from PKZMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y')))) order by EMPNO,\
FAMINAME            ";

 static char *sq0008 = 
"select EMPNO ,FAMINAME ,FAMIJUID ,SCKIND  from PNMSCMAS where (((SCKIND<>:b\
0 and UPPER(NVL(SCYN,' '))='Y') and SCYYMM=:b1) and (EMPNO in (select EMPNO  \
from PKMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y')) or EMPNO in (select EM\
PNO  from PKZMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y')))) order by EMPNO\
,FAMINAME            ";

 static char *sq0015 = 
"select EMPNO  from PNMSCMON  group by EMPNO           ";

 static char *sq0018 = 
"select EMPNO ,FAMINAME ,FAMIJUID ,SCSEQNO ,SCAMT ,SCSUM  from PNMSCMAS wher\
e (((SCKIND=:b0 and (SCENDYYMM is null  or SCENDYYMM>=:b1)) and UPPER(NVL(SCY\
N,' '))='Y') and (EMPNO in (select EMPNO  from PKMPMAS where (PSTATE<'80' and\
 UPPER(PAYYN)='Y')) or EMPNO in (select EMPNO  from PKZMPMAS where (PSTATE<'8\
0' and UPPER(PAYYN)='Y')))) order by EMPNO,FAMINAME            ";

 static char *sq0025 = 
"select EMPNO  from PNMSCMON where (SCKIND=:b0 and SCYYMM=:b1) group by EMPN\
O           ";

 static char *sq0029 = 
"select A.EMPNO ,A.KORNAME ,FAMINAME ,SCNAME ,PSTATE ,PAYYN  from PNMSCMAS A\
 ,PKMPMAS B ,PNCSCBAS C where ((((A.EMPNO=B.EMPNO and (A.SCKIND<>:b0 and A.SC\
KIND=C.SCKIND)) and UPPER(NVL(SCYN,' '))='Y') and SCYYMM=:b1) and (PSTATE<'80\
' and UPPER(PAYYN)='Y')) union select A.EMPNO ,A.KORNAME ,FAMINAME ,SCNAME ,P\
STATE ,PAYYN  from PNMSCMAS A ,PKZMPMAS B ,PNCSCBAS C where (((((A.EMPNO=B.EM\
PNO and (A.SCKIND<>:b0 and A.SCKIND=C.SCKIND)) and UPPER(NVL(SCYN,' '))='Y') \
and SCYYMM=:b1) and PSTATE<'80') and UPPER(PAYYN)='Y') order by EMPNO,FAMINAM\
E,SCNAME            ";

 static char *sq0030 = 
"select A.EMPNO ,A.KORNAME ,FAMINAME ,SCNAME ,PSTATE ,PAYYN  from PNMSCMAS A\
 ,PKMPMAS B ,PNCSCBAS C where ((((A.EMPNO=B.EMPNO and (A.SCKIND=:b0 and A.SCK\
IND=C.SCKIND)) and SCENDYYMM is null ) and UPPER(NVL(SCYN,' '))='Y') and (PST\
ATE<'80' and UPPER(PAYYN)='Y')) union select A.EMPNO ,A.KORNAME ,FAMINAME ,SC\
NAME ,PSTATE ,PAYYN  from PNMSCMAS A ,PKZMPMAS B ,PNCSCBAS C where ((((A.EMPN\
O=B.EMPNO and (A.SCKIND=:b0 and A.SCKIND=C.SCKIND)) and SCENDYYMM is null ) a\
nd UPPER(NVL(SCYN,' '))='Y') and (PSTATE<'80' and UPPER(PAYYN)='Y')) order by\
 EMPNO,FAMINAME,SCNAME            ";

 static char *sq0031 = 
"select A.SCKIND ,SCNAME ,count(*)  ,sum(A.SCAMT)  from PNHSCHIS A ,PNCSCBAS\
 B where (SCYYMM=:b0 and A.SCKIND=B.SCKIND) group by A.SCKIND,SCNAME order by\
 A.SCKIND            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,22,0,2,213,0,0,0,0,0,1,0,
20,0,0,2,143,0,3,223,0,0,0,0,0,1,0,
35,0,0,3,39,0,2,257,0,0,1,1,0,1,0,1,97,0,0,
54,0,0,4,22,0,2,276,0,0,0,0,0,1,0,
69,0,0,5,326,0,9,314,0,0,1,1,0,1,0,1,97,0,0,
88,0,0,5,0,0,15,320,0,0,0,0,0,1,0,
103,0,0,5,0,0,13,326,0,0,3,0,0,1,0,2,97,0,0,2,9,0,0,2,97,0,0,
130,0,0,5,0,0,15,330,0,0,0,0,0,1,0,
145,0,0,5,0,0,15,339,0,0,0,0,0,1,0,
160,0,0,6,151,0,4,348,0,0,7,5,0,1,0,2,4,0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,9,0,0,
1,97,0,0,1,97,0,0,
203,0,0,5,0,0,15,362,0,0,0,0,0,1,0,
218,0,0,7,113,0,5,366,0,0,6,6,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,9,0,0,
1,97,0,0,
257,0,0,5,0,0,15,380,0,0,0,0,0,1,0,
272,0,0,8,327,0,9,401,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
295,0,0,8,0,0,15,408,0,0,0,0,0,1,0,
310,0,0,8,0,0,13,414,0,0,4,0,0,1,0,2,97,0,0,2,9,0,0,2,97,0,0,2,97,0,0,
341,0,0,8,0,0,15,418,0,0,0,0,0,1,0,
356,0,0,8,0,0,15,426,0,0,0,0,0,1,0,
371,0,0,9,151,0,4,435,0,0,7,5,0,1,0,2,4,0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,9,0,0,
1,97,0,0,1,97,0,0,
414,0,0,8,0,0,15,449,0,0,0,0,0,1,0,
429,0,0,10,113,0,5,453,0,0,6,6,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,9,0,0,
1,97,0,0,
468,0,0,8,0,0,15,467,0,0,0,0,0,1,0,
483,0,0,11,296,0,5,502,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
506,0,0,12,479,0,3,538,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
541,0,0,13,276,0,4,565,0,0,3,2,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,
568,0,0,14,383,0,3,603,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
595,0,0,15,54,0,9,633,0,0,0,0,0,1,0,
610,0,0,15,0,0,15,640,0,0,0,0,0,1,0,
625,0,0,15,0,0,13,646,0,0,1,0,0,1,0,2,97,0,0,
644,0,0,15,0,0,15,650,0,0,0,0,0,1,0,
659,0,0,15,0,0,15,659,0,0,0,0,0,1,0,
674,0,0,16,154,0,5,663,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
705,0,0,15,0,0,15,680,0,0,0,0,0,1,0,
720,0,0,17,103,0,4,697,0,0,4,1,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
751,0,0,18,369,0,9,725,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
774,0,0,18,0,0,15,732,0,0,0,0,0,1,0,
789,0,0,18,0,0,13,740,0,0,6,0,0,1,0,2,97,0,0,2,9,0,0,2,97,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,
828,0,0,18,0,0,15,746,0,0,0,0,0,1,0,
843,0,0,19,100,0,5,761,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,9,0,0,1,97,0,0,
874,0,0,20,100,0,5,792,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,9,0,0,1,97,0,0,
905,0,0,21,144,0,5,822,0,0,9,9,0,1,0,1,4,0,0,1,97,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,97,0,0,1,97,0,0,1,9,0,0,1,97,0,0,
956,0,0,22,312,0,3,854,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,9,0,0,1,97,0,0,
999,0,0,23,198,0,5,884,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1022,0,0,24,171,0,3,903,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1053,0,0,25,87,0,9,926,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1076,0,0,25,0,0,15,933,0,0,0,0,0,1,0,
1091,0,0,25,0,0,13,939,0,0,1,0,0,1,0,2,97,0,0,
1110,0,0,25,0,0,15,943,0,0,0,0,0,1,0,
1125,0,0,26,154,0,5,947,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1156,0,0,25,0,0,15,964,0,0,0,0,0,1,0,
1171,0,0,27,59,0,4,985,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
1194,0,0,28,232,0,5,1081,0,0,0,0,0,1,0,
1209,0,0,29,557,0,9,1121,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1240,0,0,29,0,0,15,1128,0,0,0,0,0,1,0,
1255,0,0,29,0,0,13,1158,0,0,6,0,0,1,0,2,97,0,0,2,97,0,0,2,9,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,
1294,0,0,29,0,0,15,1163,0,0,0,0,0,1,0,
1309,0,0,29,0,0,15,1172,0,0,0,0,0,1,0,
1324,0,0,30,571,0,9,1215,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1347,0,0,30,0,0,15,1222,0,0,0,0,0,1,0,
1362,0,0,30,0,0,13,1228,0,0,6,0,0,1,0,2,97,0,0,2,97,0,0,2,9,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,
1401,0,0,30,0,0,15,1233,0,0,0,0,0,1,0,
1416,0,0,30,0,0,15,1242,0,0,0,0,0,1,0,
1431,0,0,31,173,0,9,1278,0,0,1,1,0,1,0,1,97,0,0,
1450,0,0,31,0,0,15,1285,0,0,0,0,0,1,0,
1465,0,0,31,0,0,13,1297,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,
1496,0,0,31,0,0,15,1301,0,0,0,0,0,1,0,
1511,0,0,31,0,0,15,1310,0,0,0,0,0,1,0,
1526,0,0,31,0,0,15,1318,0,0,0,0,0,1,0,
1541,0,0,32,50,0,3,1419,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1582,0,0,33,0,0,29,1429,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKI2050G(당월학자금 생성)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 지원금
 Programmer     : 김승회
 Version        : 1.00
 Date           : 1997.02.16

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   10.00       1997.02.16         김승회          최초개발본      설계명세서
   10.01       2004.02.24         강륜종          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.   
   10.02       2004.04.19.        강륜종          테이블변경 (R_PNMSCMON => PNMSCEXT )   
   11.00       2004.11.       강륜종(dsa2000)         Rexec대체 서비스를 위한 수정작업.       
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

/*#define  SUCCESS     -1*/
#define  FAIL        -2

typedef struct data_rec 
{
     char  sckind[2+1];
     char  scname[20+1];
     double  count;
     double  sum;
     struct data_rec* ptr;
}  record;
record* first = NULL;

/********* Function Prototype 정의 ************/

void   print_errmsg(int errcode, char *errmsg);
void   error_quit(char *msg);
void   free_link(void);

/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char     empno[5]      = "";      /* 사번     */
     /* VARCHAR  faminame[20]  = {0,""}; */ 
struct { unsigned short len; unsigned char arr[20]; } faminame
 = {0,""};
  /* 수혜자명   */
     char     famijuid[15]  = "";      /* 수혜자주민등록번호  */
     char     sckind[3]     = "";      /* 학자금구분   */
     char     scyymm[7]     = "";      /* 지급일자   */
     double   scamt         = 0;       /* 지급금액   */  
     double   scseqno       = 0;       /* 지급횟수(마스터)  */
     double   sccnt         = 0;       /* 지급횟수(이력)  */
     double   scsum         = 0;       /* 지급액누계   */
     
     double   sckiamt       = 0;
     double   scfrage       = 0;
     double   sctoage       = 0;
     
     char  workyymm[7]  = "";          /* 작업기준월   */
     char  writetime[16]    = "";      /* 최종작업일시   */
     char  writeman[5]      = "";      /* 최종작업자   */
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


char  msg[500+1]      = "";
int   s_count         = 0;
int   f_count         = 0;
int   skip_count      = 0;
char  check_six12[2]  = "";
char  jobkind[2]      = "";
char  fryymm[6+1]     = "";

int   id;
char  dir[80];

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

void main(int argc,char *argv[])
{
     char FL_file[255];
     
     /*dsa2000 Rexec 대체 파라미터 추가...*/
     if  (argc != 7) {  /*/hper8/HINSA/proc/bin/Kbin/pki2050g 200410 1 200410 D006 pki2050g 2004110100000*/
          printf("[Usage] : pki2050g 1.공제년월 2.작업종류(1자리)==>1:모든종류의학자금, 1이외의값:유치원학자금제외 \n");
          printf("       3.유치원학자금 생성대상 시작월 4.작업자사번 5.프로그램ID 6.시작시간  \n");
          exit(1);
     }  
      
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pki2050g");

     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
      
     sprintf(workyymm,"%s",argv[1]);
     sprintf(jobkind,"%s",argv[2]);
     sprintf(fryymm,"%s",argv[3]);
     sprintf(writeman,"%s",argv[4]);
     /*sprintf(check_six12,"%s",argv[4]);*/
     /*memset(dir,0x00,sizeof(dir));
     
        Dsa2000  2004.02.24.  **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"당월 학자금 생성 시작..."); 
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     if  (restore_master() == FAIL) 
     {
          sprintf(log_buff, "= 작업실패1 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...1");
     }
     
     if  (delete_his_records() == FAIL) 
     {
          sprintf(log_buff, "= 작업실패2 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...2");
     }
     
     if  (delete_ded_records() == FAIL) 
     {
          sprintf(log_buff, "= 작업실패3 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...3");
     }
     
     if  (update_master1() == FAIL) 
     {
          sprintf(log_buff, "= 작업실패4 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...4");
     }
     
     if  (insert_his_records1() == FAIL) 
     {
          sprintf(log_buff, "= 작업실패5 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...5");
     }
     
     if  (insert_ded_records1() == FAIL) 
     {
          sprintf(log_buff, "= 작업실패6 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업실패...6");
     }
     
     if  (jobkind[0] == '1') 
     {
          if  (update_master2() == FAIL) 
          {
               sprintf(log_buff, "= 작업실패7 ="); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...7");
          }
          
          if  (insert_ded_records2() == FAIL) 
          {
               sprintf(log_buff, "= 작업실패8 ="); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업실패...8");
          }
          else
          {
               printf("유치원학자금생성에 성공한 인원 : (%d) 명. \n",s_count);
               sprintf(log_buff, "유치원학자금생성에 성공한 인원 : (%d) 명. \n",s_count); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
                     
               printf("유치원학자금생성에 실패한 인원 : (%d) 명. \n",f_count);
               sprintf(log_buff, "유치원학자금생성에 실패한 인원 : (%d) 명. \n",f_count); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
                     
               printf("연령문제로 유치원학자금에서 제외된 인원 (%d) 명. \n", skip_count);
               sprintf(log_buff, "연령문제로 유치원학자금에서 제외된 인원 (%d) 명. \n", skip_count); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
          }
     }
     printf("당월학자금생성 작업완료...\n");
  
/*******************************************************
  2002-09-16  유효성 
  급여 추출을위해 자녀학자금을 임시테이블에 insert한다. 
********************************************************/  
     /* EXEC SQL 
     DELETE FROM PNMSCEXT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PNMSCEXT ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  /* DSA2000 테이블변경 (R_PNMSCMON => PNMSCEXT ) */
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          sprintf(log_buff, "자녀학자금 임시테이블 삭제 실패.."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("자녀학자금 임시테이블 삭제 실패..");  
     }  
     
     /* EXEC SQL 
     INSERT  INTO PNMSCEXT  /o DSA2000 테이블변경 (R_PNMSCMON => PNMSCEXT ) o/
     SELECT  EMPNO, KORNAME, 13 SCKIND, SUM(SCAMT ) SCAMT
       FROM  PNMSCMON
      WHERE  SCKIND NOT IN ('11','25')
      GROUP  BY EMPNO,KORNAME; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PNMSCEXT  select EMPNO ,KORNAME ,13 SCKIND \
,sum(SCAMT) SCAMT  from PNMSCMON where SCKIND not  in ('11','25') group by EM\
PNO,KORNAME";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


           
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          sprintf(log_buff, "자녀학자금 임시테이블 insert 실패.."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("자녀학자금 임시테이블 insert 실패..");  
     } 
     
     if  (read_result() == FAIL) 
     {
          sprintf(log_buff, "작업결과 상세내역 작성실패..."); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          error_quit("작업결과 상세내역 작성실패...");
     }   
     else
     {
          sprintf(log_buff, "OK 작업이 성공적으로 완료되었습니다.\n"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          hinsa_exit(0,"OK 작업이 성공적으로 완료되었습니다.\n");
     }
   
}

/*****************************************************************************
  학자금지급이력을 삭제하는 함수.
 *****************************************************************************/
delete_his_records()
{
     /* EXEC SQL 
     DELETE  FROM PNHSCHIS
      WHERE  SCYYMM = :workyymm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PNHSCHIS  where SCYYMM=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )35;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          sprintf(msg,"학자금지급이력 삭제오류...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/*****************************************************************************
  당월학자금을 삭제하는 함수.
 *****************************************************************************/
delete_ded_records()
{
     /* EXEC SQL 
     DELETE  FROM PNMSCMON; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PNMSCMON ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )54;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          sprintf(msg,"당월학자금 삭제오류...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/*****************************************************************************
  학자금마스터를 복원하는 함수.  
 *****************************************************************************/
restore_master()
{
     if (get_sckind("유치원",sckind) == FAIL)     
         return(FAIL);
        
      
     if  (jobkind[0] == '1')  
     { /* 유치원 학자금의 경우 */
          /* EXEC SQL DECLARE c1 CURSOR FOR
          SELECT  EMPNO, FAMINAME, FAMIJUID
            FROM  PNMSCMAS 
           WHERE  SCKIND = :sckind    
             AND  (SCENDYYMM IS NULL)   
             AND  UPPER(NVL(SCYN,' ')) = 'Y'   
             AND ((EMPNO IN (SELECT EMPNO
                               FROM PKMPMAS
                              WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')) or
			            (EMPNO IN (SELECT EMPNO
                               FROM PKZMPMAS
                              WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')))		
           ORDER  BY EMPNO, FAMINAME; */ 

          
          /* EXEC SQL OPEN c1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 1;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = sq0005;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )69;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqcmod = (unsigned int )0;
          sqlstm.sqhstv[0] = (unsigned char  *)sckind;
          sqlstm.sqhstl[0] = (unsigned long )3;
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


          if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405)) 
          {
               sprintf(msg,"학자금마스터 읽기오류1...");
               print_errmsg(sqlca.sqlcode,msg);   
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/  
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 1;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )88;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
          
          while(1) 
          {
               /* EXEC SQL FETCH   c1
               INTO   :empno, :faminame, :famijuid; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 3;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )103;
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
               sqlstm.sqhstv[1] = (unsigned char  *)&faminame;
               sqlstm.sqhstl[1] = (unsigned long )22;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)famijuid;
               sqlstm.sqhstl[2] = (unsigned long )15;
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

 
               if (sqlca.sqlcode == 1403) 
               {
                /* EXEC SQL CLOSE c1; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 3;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )130;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                break;
               }
                              
               if  (sqlca.sqlcode != 0) 
               {
                    sprintf(msg,"Cursor c1 Data Fetch Error...");
                    print_errmsg(sqlca.sqlcode,msg);  
                    Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/     
                    /* EXEC SQL CLOSE c1; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 3;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )145;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    return(FAIL);
               }
               
               hinsa_trim(famijuid);
               /*
               hinsa_trim(faminame);
               */
               
               /* EXEC SQL
               SELECT  NVL(SUM(SCAMT),0), COUNT(*)
                 INTO  :scsum, :scseqno  
                 FROM  PNHSCHIS
                WHERE  EMPNO   = :empno 
                  AND  SCKIND  = :sckind
                  AND  FAMINAME= :faminame 
                  AND  FAMIJUID= :famijuid  
                  AND  SCYYMM < :workyymm; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select NVL(sum(SCAMT),0) ,count(*)  into :b0,\
:b1  from PNHSCHIS where ((((EMPNO=:b2 and SCKIND=:b3) and FAMINAME=:b4) and \
FAMIJUID=:b5) and SCYYMM<:b6)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )160;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&scsum;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&scseqno;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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
               sqlstm.sqhstv[3] = (unsigned char  *)sckind;
               sqlstm.sqhstl[3] = (unsigned long )3;
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&faminame;
               sqlstm.sqhstl[4] = (unsigned long )22;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)famijuid;
               sqlstm.sqhstl[5] = (unsigned long )15;
               sqlstm.sqhsts[5] = (         int  )0;
               sqlstm.sqindv[5] = (         short *)0;
               sqlstm.sqinds[5] = (         int  )0;
               sqlstm.sqharm[5] = (unsigned long )0;
               sqlstm.sqadto[5] = (unsigned short )0;
               sqlstm.sqtdso[5] = (unsigned short )0;
               sqlstm.sqhstv[6] = (unsigned char  *)workyymm;
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


               if  (sqlca.sqlcode != 0) 
               {
                    sprintf(msg,"학자금지급이력 읽기오류1...");
                    print_errmsg(sqlca.sqlcode,msg);   
                    Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/   
                    /* EXEC SQL CLOSE c1; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 7;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )203;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    return(FAIL);
               }
               
               /* EXEC SQL
               UPDATE  PNMSCMAS
                  SET  
                       SCSUM = :scsum,
                       SCSEQNO = :scseqno
               WHERE  EMPNO   = :empno 
                 AND  SCKIND  = :sckind
                 AND  FAMINAME= :faminame 
                 AND  FAMIJUID= :famijuid; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PNMSCMAS  set SCSUM=:b0,SCSEQNO=:b1 wh\
ere (((EMPNO=:b2 and SCKIND=:b3) and FAMINAME=:b4) and FAMIJUID=:b5)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )218;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&scsum;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&scseqno;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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
               sqlstm.sqhstv[3] = (unsigned char  *)sckind;
               sqlstm.sqhstl[3] = (unsigned long )3;
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&faminame;
               sqlstm.sqhstl[4] = (unsigned long )22;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)famijuid;
               sqlstm.sqhstl[5] = (unsigned long )15;
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
                    sprintf(msg,"학자금마스터 복원오류...");
                    print_errmsg(sqlca.sqlcode,msg);      
                    Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
                    /* EXEC SQL CLOSE c1; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 7;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )257;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    return(FAIL);
               }
          }
     }
     
     
     /* EXEC SQL DECLARE c6 CURSOR FOR
     SELECT  EMPNO, FAMINAME, FAMIJUID, SCKIND
       FROM  PNMSCMAS 
      WHERE  SCKIND <> :sckind    
        AND  UPPER(NVL(SCYN,' ')) = 'Y'   
        AND  SCYYMM = :workyymm   
        AND ((EMPNO IN (SELECT EMPNO
                          FROM PKMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')) or
			       (EMPNO IN (SELECT EMPNO
                          FROM PKZMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')))		        
      ORDER  BY EMPNO, FAMINAME; */ 

     
     /* EXEC SQL OPEN c6; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0008;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )272;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sckind;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
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
          sprintf(msg,"Cursor C6 Open Error...");
          print_errmsg(sqlca.sqlcode,msg);   
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c6; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )295;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     while(1) 
     {
          /* EXEC SQL FETCH   c6
          INTO   :empno, :faminame, :famijuid, :sckind; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )310;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&faminame;
          sqlstm.sqhstl[1] = (unsigned long )22;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)famijuid;
          sqlstm.sqhstl[2] = (unsigned long )15;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)sckind;
          sqlstm.sqhstl[3] = (unsigned long )3;
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
               /* EXEC SQL CLOSE c6; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )341;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
     
          if  (sqlca.sqlcode != 0) 
          {
               sprintf(msg,"Cursor c6 Data Fetch Error...");
               print_errmsg(sqlca.sqlcode,msg);     
               /* EXEC SQL CLOSE c6; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )356;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
     
          hinsa_trim(famijuid);
          /*
          hinsa_trim(faminame);
          */
          
          /* EXEC SQL
          SELECT  NVL(SUM(SCAMT),0), COUNT(*)
            INTO  :scsum, :scseqno  
            FROM  PNHSCHIS
           WHERE  EMPNO   = :empno 
             AND  SCKIND  = :sckind
             AND  FAMINAME= :faminame 
             AND  FAMIJUID= :famijuid
             AND  SCYYMM < :workyymm; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select NVL(sum(SCAMT),0) ,count(*)  into :b0,:b1  \
from PNHSCHIS where ((((EMPNO=:b2 and SCKIND=:b3) and FAMINAME=:b4) and FAMIJ\
UID=:b5) and SCYYMM<:b6)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )371;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&scsum;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&scseqno;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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
          sqlstm.sqhstv[3] = (unsigned char  *)sckind;
          sqlstm.sqhstl[3] = (unsigned long )3;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&faminame;
          sqlstm.sqhstl[4] = (unsigned long )22;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)famijuid;
          sqlstm.sqhstl[5] = (unsigned long )15;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)workyymm;
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


          if  (sqlca.sqlcode != 0) 
          {
               sprintf(msg,"학자금지급이력 읽기오류1...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c6; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )414;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
               return(FAIL);
          }
          
          /* EXEC SQL
          UPDATE  PNMSCMAS
             SET  
                  SCSUM       = :scsum,
                  SCSEQNO     = :scseqno
           WHERE  EMPNO    = :empno 
             AND  SCKIND   = :sckind
             AND  FAMINAME = :faminame 
             AND  FAMIJUID = :famijuid; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PNMSCMAS  set SCSUM=:b0,SCSEQNO=:b1 where (\
((EMPNO=:b2 and SCKIND=:b3) and FAMINAME=:b4) and FAMIJUID=:b5)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )429;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&scsum;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&scseqno;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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
          sqlstm.sqhstv[3] = (unsigned char  *)sckind;
          sqlstm.sqhstl[3] = (unsigned long )3;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&faminame;
          sqlstm.sqhstl[4] = (unsigned long )22;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)famijuid;
          sqlstm.sqhstl[5] = (unsigned long )15;
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
               sprintf(msg,"학자금마스터 복원오류...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c6; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )468;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

     
               return(FAIL);
          }
     }
   
   /*
     EXEC SQL
     UPDATE  PNMSCMAS
     SET  
      SCSEQNO = 0,
      SCSUM  = 0
     WHERE  SCKIND <> :sckind AND (SCFYYMM = :workyymm AND
      UPPER(NVL(SCYN,' ')) = 'Y') AND EMPNO IN (
      SELECT   EMPNO 
      FROM  PKMPMAS
      WHERE  PSTATE < '80'); 
   
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
      sprintf(msg,"학자금마스터 쓰기오류1...");
      print_errmsg(sqlca.sqlcode,msg);
      return(FAIL);
     }
   */
     return(SUCCESS);
}

/*****************************************************************************
  학자금마스터를 갱신하는 함수1.  
 *****************************************************************************/
update_master1()
{
     if  (get_sckind("유치원",sckind) == FAIL)
          return(FAIL);
      
     /* EXEC   SQL 
     UPDATE  PNMSCMAS
        SET  
             SCSEQNO = (SCSEQNO + 1),
             SCSUM  = (SCAMT + SCSUM) 
      WHERE  SCKIND <> :sckind    
        AND  SCYYMM = :workyymm    
        AND  UPPER(NVL(SCYN,' ')) = 'Y'   
        AND ((EMPNO IN (SELECT EMPNO
                          FROM PKMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')) or
			       (EMPNO IN (SELECT EMPNO
                          FROM PKZMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y'))); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PNMSCMAS  set SCSEQNO=(SCSEQNO+1),SCSUM=(SCAMT+S\
CSUM) where (((SCKIND<>:b0 and SCYYMM=:b1) and UPPER(NVL(SCYN,' '))='Y') and \
(EMPNO in (select EMPNO  from PKMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y'\
)) or EMPNO in (select EMPNO  from PKZMPMAS where (PSTATE<'80' and UPPER(PAYY\
N)='Y'))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )483;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sckind;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
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

 
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          sprintf(msg,"학자금마스터 쓰기오류2...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/*****************************************************************************
  당월학자금지급이력을 생성하는 함수1.
 *****************************************************************************/
insert_his_records1()
{
     if  (get_sckind("유치원",sckind) == FAIL)
          return(FAIL);
      
     DPsys_date(writetime,0);
     
     /* EXEC SQL 
     INSERT   INTO   PNHSCHIS
      ( SCYYMM, EMPNO, KORNAME, ORGNUM, DEPTCODE, FAMINAME, 
        FAMIJUID, SCKIND, SCCNT, SCAMT, WRITETIME, WRITEMAN,SCETC            /okth 20091215 SCETC 비고 추가o/
      )
     (
     SELECT  :workyymm, EMPNO, KORNAME, ORGNUM, DEPTCODE, FAMINAME,
             FAMIJUID, SCKIND, SCSEQNO, SCAMT, :writetime, :writeman,SCETC  /okth 20091215 SCETC 비고 추가o/
       FROM  PNMSCMAS
      WHERE  SCKIND <> :sckind    
        AND  SCYYMM = :workyymm    
        AND  UPPER(NVL(SCYN,' ')) = 'Y'   
        AND ((EMPNO IN (SELECT EMPNO
                          FROM PKMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')) or
			       (EMPNO IN (SELECT EMPNO
                          FROM PKZMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')))		        
     ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PNHSCHIS (SCYYMM,EMPNO,KORNAME,ORGNUM,DEPTC\
ODE,FAMINAME,FAMIJUID,SCKIND,SCCNT,SCAMT,WRITETIME,WRITEMAN,SCETC)(select :b0\
 ,EMPNO ,KORNAME ,ORGNUM ,DEPTCODE ,FAMINAME ,FAMIJUID ,SCKIND ,SCSEQNO ,SCAM\
T ,:b1 ,:b2 ,SCETC  from PNMSCMAS where (((SCKIND<>:b3 and SCYYMM=:b0) and UP\
PER(NVL(SCYN,' '))='Y') and (EMPNO in (select EMPNO  from PKMPMAS where (PSTA\
TE<'80' and UPPER(PAYYN)='Y')) or EMPNO in (select EMPNO  from PKZMPMAS where\
 (PSTATE<'80' and UPPER(PAYYN)='Y')))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )506;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)writetime;
     sqlstm.sqhstl[1] = (unsigned long )16;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)writeman;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)sckind;
     sqlstm.sqhstl[3] = (unsigned long )3;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)workyymm;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"학자금지급이력 생성오류1...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
     /* EXEC  SQL
     SELECT  COUNT(*)
       INTO  :scseqno
       FROM  PNMSCMAS
      WHERE  SCKIND <> :sckind    
        AND  SCYYMM = :workyymm    
        AND  UPPER(NVL(SCYN,' ')) = 'Y'    
        AND ((EMPNO IN (SELECT EMPNO
                          FROM PKMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')) or
			       (EMPNO IN (SELECT EMPNO
                          FROM PKZMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y'))); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PNMSCMAS where (((SCKIN\
D<>:b1 and SCYYMM=:b2) and UPPER(NVL(SCYN,' '))='Y') and (EMPNO in (select EM\
PNO  from PKMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y')) or EMPNO in (sele\
ct EMPNO  from PKZMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y'))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )541;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&scseqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)sckind;
     sqlstm.sqhstl[1] = (unsigned long )3;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)workyymm;
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


     
     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"학자금마스터 읽기오류...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
     {
          printf("유치원 학자금을 제외한 학자금 생성건수 : [%.0f] 건\n", scseqno);
          sprintf(log_buff,"유치원 학자금을 제외한 학자금 생성건수 : [%.0f] 건\n", scseqno); 
          Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
          return(SUCCESS);
     }
}

/*****************************************************************************
  당월학자금을 생성하는 함수1.
 *****************************************************************************/
insert_ded_records1()
{
     if  (get_sckind("유치원",sckind) == FAIL)
          return(FAIL);
      
     /* EXEC SQL 
     INSERT   INTO   PNMSCMON
            ( SCYYMM, EMPNO, KORNAME, SCKIND, SCAMT )
     SELECT  :workyymm, EMPNO, KORNAME, SCKIND, SUM(SCAMT)
       FROM  PNMSCMAS
      WHERE  SCKIND <> :sckind    
        AND  SCYYMM = :workyymm    
        AND  UPPER(NVL(SCYN,' ')) = 'Y'     
        AND ((EMPNO IN (SELECT EMPNO
                          FROM PKMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')) or
			       (EMPNO IN (SELECT EMPNO
                          FROM PKZMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')))		
      GROUP  BY EMPNO, KORNAME, SCKIND; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PNMSCMON (SCYYMM,EMPNO,KORNAME,SCKIND,SCAMT\
)select :b0 ,EMPNO ,KORNAME ,SCKIND ,sum(SCAMT)  from PNMSCMAS where (((SCKIN\
D<>:b1 and SCYYMM=:b0) and UPPER(NVL(SCYN,' '))='Y') and (EMPNO in (select EM\
PNO  from PKMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y')) or EMPNO in (sele\
ct EMPNO  from PKZMPMAS where (PSTATE<'80' and UPPER(PAYYN)='Y')))) group by \
EMPNO,KORNAME,SCKIND";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )568;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)sckind;
     sqlstm.sqhstl[1] = (unsigned long )3;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)workyymm;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"당월학자금 생성오류1...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
     DPsys_date(writetime,0);
     
     /* EXEC SQL DECLARE c3 CURSOR FOR
     SELECT  EMPNO
       FROM  PNMSCMON
      GROUP  BY EMPNO; */ 

     
     /* EXEC SQL OPEN c3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0015;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )595;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405)) 
     {
          sprintf(msg,"당월학자금 읽기오류1...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )610;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     while(1)
     {
          /* EXEC SQL FETCH   c3 INTO :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )625;
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


          
          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )644;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }
          
          if  (sqlca.sqlcode != 0) 
          {
               sprintf(msg,"Cursor c3 Data Fetch Error...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
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


               return(FAIL);
          }
          
          /* EXEC SQL
          UPDATE  PNMSCMON
             SET
                  (KORNAME, DEPTCODE, ORGNUM)  = 
                  (
                    SELECT  KORNAME, DEPTCODE, ORGNUM
                    FROM  PKMPMAS 
                    WHERE  EMPNO = :empno
                  ),
                   WRITETIME = :writetime,
                   WRITEMAN  = :writeman
           WHERE  EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PNMSCMON  set (KORNAME,DEPTCODE,ORGNUM)=(se\
lect KORNAME ,DEPTCODE ,ORGNUM  from PKMPMAS where EMPNO=:b0),WRITETIME=:b1,W\
RITEMAN=:b2 where EMPNO=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )674;
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
          sqlstm.sqhstv[1] = (unsigned char  *)writetime;
          sqlstm.sqhstl[1] = (unsigned long )16;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)writeman;
          sqlstm.sqhstl[2] = (unsigned long )5;
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

  
          if  (sqlca.sqlcode != 0)
          {
               sprintf(msg,"당월학자금 쓰기오류1...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )705;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
                   
     }
}

/*****************************************************************************
  학자금마스터를 갱신하는 함수2.  
 *****************************************************************************/
update_master2()
{
     int index;
   
     if  (get_sckind("유치원",sckind) == FAIL)
          return(FAIL);
   
     /* EXEC SQL
     SELECT   CEIL(SCKIAMT * SCRATE / 100), SCFRAGE, SCTOAGE 
       INTO  :sckiamt, :scfrage, :sctoage
       FROM   PNCSCBAS 
      WHERE   SCKIND = :sckind; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select CEIL(((SCKIAMT* SCRATE)/100)) ,SCFRAGE ,SCTOAGE \
into :b0,:b1,:b2  from PNCSCBAS where SCKIND=:b3";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )720;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&sckiamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&scfrage;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&sctoage;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)sckind;
     sqlstm.sqhstl[3] = (unsigned long )3;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"학자금지급기준 읽기오류1...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
   
     /* EXEC SQL DECLARE c2 CURSOR FOR
     SELECT  EMPNO, FAMINAME, FAMIJUID, SCSEQNO, SCAMT, SCSUM 
       FROM  PNMSCMAS
      WHERE  SCKIND = :sckind    
        AND  ((SCENDYYMM IS NULL) OR (SCENDYYMM >= :fryymm))  /o 2008.03.17 지급기한이 유요한 사람도 조회가능하도록 o/
        AND  UPPER(NVL(SCYN,' ')) = 'Y'  
   /oSCENDYYMM IS NULL   AND   o/
        AND ((EMPNO IN (SELECT EMPNO
                          FROM PKMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')) or
			       (EMPNO IN (SELECT EMPNO
                          FROM PKZMPMAS
                         WHERE PSTATE < '80' AND UPPER(PAYYN) = 'Y')))		        
      ORDER  BY EMPNO, FAMINAME; */ 

   
     /* EXEC SQL OPEN c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0018;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )751;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sckind;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)fryymm;
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
          sprintf(msg,"학자금마스터 읽기오류2...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )774;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     s_count = f_count  = skip_count = 0;
   
     while(1)
     {
          /* EXEC SQL FETCH c2
          INTO :empno, :faminame, :famijuid, :scseqno, 
             :scamt, :scsum; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 7;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )789;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&faminame;
          sqlstm.sqhstl[1] = (unsigned long )22;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)famijuid;
          sqlstm.sqhstl[2] = (unsigned long )15;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&scseqno;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&scamt;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&scsum;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
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


          
          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )828;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }
          
          hinsa_trim(famijuid);
          /*
          hinsa_trim(faminame);
          */
          
          if  (scseqno == 12) 
          {
               printf(" 유치원학자금 지급횟수 초과.\n");
               printf(" EMPNO : %.4s , FAMINAME : %12s \n", empno,faminame.arr);
               sprintf(log_buff," EMPNO : %.4s , FAMINAME : %12s \n", empno,faminame.arr);
               Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL 
               UPDATE  PNMSCMAS
                  SET  
                       SCYN = 'N'
                WHERE  EMPNO    = :empno 
                  AND  SCKIND   = :sckind
                  AND  FAMINAME = :faminame 
                  AND  FAMIJUID = :famijuid; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 7;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PNMSCMAS  set SCYN='N' where (((EMPNO=\
:b0 and SCKIND=:b1) and FAMINAME=:b2) and FAMIJUID=:b3)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )843;
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
               sqlstm.sqhstv[1] = (unsigned char  *)sckind;
               sqlstm.sqhstl[1] = (unsigned long )3;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&faminame;
               sqlstm.sqhstl[2] = (unsigned long )22;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)famijuid;
               sqlstm.sqhstl[3] = (unsigned long )15;
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


               if  (sqlca.sqlcode != 0)
               {
                    sprintf(msg,"학자금마스터 지급해지1...");
                    print_errmsg(sqlca.sqlcode,msg);
                    Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
                    return(FAIL);
               }
               skip_count++;
           }
          else if ((index = check_age(famijuid)) != 0)    
          {
               if  (index == 2)
               {    
                    if ((update_master()     ==  SUCCESS) &&  
                        (insert_his_records2() == SUCCESS))   
                         s_count++;
                    else 
                    {
                         printf(" EMPNO : %.4s , FAMINAME : %12s \n", empno,faminame.arr);
                         sprintf(" EMPNO : %.4s , FAMINAME : %12s \n", empno,faminame.arr);
                         Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
                         
                         f_count++;
                         /* EXEC SQL 
                         UPDATE  PNMSCMAS
                            SET  
                                 SCYN = 'N'
                          WHERE  EMPNO   = :empno 
                            AND  SCKIND  = :sckind
                            AND  FAMINAME= :faminame 
                            AND  FAMIJUID= :famijuid; */ 

{
                         struct sqlexd sqlstm;
                         sqlstm.sqlvsn = 12;
                         sqlstm.arrsiz = 7;
                         sqlstm.sqladtp = &sqladt;
                         sqlstm.sqltdsp = &sqltds;
                         sqlstm.stmt = "update PNMSCMAS  set SCYN='N' where\
 (((EMPNO=:b0 and SCKIND=:b1) and FAMINAME=:b2) and FAMIJUID=:b3)";
                         sqlstm.iters = (unsigned int  )1;
                         sqlstm.offset = (unsigned int  )874;
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
                         sqlstm.sqhstv[1] = (unsigned char  *)sckind;
                         sqlstm.sqhstl[1] = (unsigned long )3;
                         sqlstm.sqhsts[1] = (         int  )0;
                         sqlstm.sqindv[1] = (         short *)0;
                         sqlstm.sqinds[1] = (         int  )0;
                         sqlstm.sqharm[1] = (unsigned long )0;
                         sqlstm.sqadto[1] = (unsigned short )0;
                         sqlstm.sqtdso[1] = (unsigned short )0;
                         sqlstm.sqhstv[2] = (unsigned char  *)&faminame;
                         sqlstm.sqhstl[2] = (unsigned long )22;
                         sqlstm.sqhsts[2] = (         int  )0;
                         sqlstm.sqindv[2] = (         short *)0;
                         sqlstm.sqinds[2] = (         int  )0;
                         sqlstm.sqharm[2] = (unsigned long )0;
                         sqlstm.sqadto[2] = (unsigned short )0;
                         sqlstm.sqtdso[2] = (unsigned short )0;
                         sqlstm.sqhstv[3] = (unsigned char  *)famijuid;
                         sqlstm.sqhstl[3] = (unsigned long )15;
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


                         if  (sqlca.sqlcode != 0)
                         {
                             sprintf(msg,"학자금마스터 지급해지2...");
                             print_errmsg(sqlca.sqlcode,msg);
                             Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
                             return(FAIL);
                         }
                    }
               }
            else
                 skip_count++;
          }
          else
               f_count++;  
     }
}

/*****************************************************************************
  학자금마스터을 갱신하는 함수.
 *****************************************************************************/
update_master()
{
     /* EXEC SQL 
     UPDATE  PNMSCMAS
        SET  
             SCSEQNO = :scseqno + 1,
             SCYYMM  = :workyymm,
             SCAMT   = :scamt,
             SCSUM   = :scsum + :scamt
      WHERE  EMPNO    = :empno 
        AND  SCKIND   = :sckind
        AND  FAMINAME = :faminame 
        AND  FAMIJUID = :famijuid; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PNMSCMAS  set SCSEQNO=(:b0+1),SCYYMM=:b1,SCAMT=:\
b2,SCSUM=(:b3+:b2) where (((EMPNO=:b5 and SCKIND=:b6) and FAMINAME=:b7) and F\
AMIJUID=:b8)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )905;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&scseqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&scamt;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&scsum;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&scamt;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)empno;
     sqlstm.sqhstl[5] = (unsigned long )5;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)sckind;
     sqlstm.sqhstl[6] = (unsigned long )3;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&faminame;
     sqlstm.sqhstl[7] = (unsigned long )22;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)famijuid;
     sqlstm.sqhstl[8] = (unsigned long )15;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"학자금마스터 쓰기오류5...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/*****************************************************************************
  당월학자금지급이력을 생성하는 함수2.
 *****************************************************************************/
insert_his_records2()
{
     if  (get_sckind("유치원",sckind) == FAIL)
          return(FAIL);
      
     DPsys_date(writetime,0);
     
     /* EXEC SQL 
     INSERT  INTO   PNHSCHIS
            (SCYYMM, EMPNO, KORNAME, ORGNUM, DEPTCODE, FAMINAME, 
             FAMIJUID, SCKIND, SCCNT, SCAMT, WRITETIME, WRITEMAN,SCETC  /okth 20091215 SCETC 비고 추가o/
            )
     SELECT  :workyymm, EMPNO, KORNAME, ORGNUM, DEPTCODE, FAMINAME,
             FAMIJUID, SCKIND, SCSEQNO, SCAMT, :writetime, :writeman,SCETC /okth 20091215 SCETC 비고 추가o/
       FROM  PNMSCMAS
      WHERE  EMPNO    = :empno 
        AND  SCKIND   = :sckind
        AND  FAMINAME = :faminame 
        AND  FAMIJUID = :famijuid; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PNHSCHIS (SCYYMM,EMPNO,KORNAME,ORGNUM,DEPTC\
ODE,FAMINAME,FAMIJUID,SCKIND,SCCNT,SCAMT,WRITETIME,WRITEMAN,SCETC)select :b0 \
,EMPNO ,KORNAME ,ORGNUM ,DEPTCODE ,FAMINAME ,FAMIJUID ,SCKIND ,SCSEQNO ,SCAMT\
 ,:b1 ,:b2 ,SCETC  from PNMSCMAS where (((EMPNO=:b3 and SCKIND=:b4) and FAMIN\
AME=:b5) and FAMIJUID=:b6)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )956;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)writetime;
     sqlstm.sqhstl[1] = (unsigned long )16;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)writeman;
     sqlstm.sqhstl[2] = (unsigned long )5;
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
     sqlstm.sqhstv[4] = (unsigned char  *)sckind;
     sqlstm.sqhstl[4] = (unsigned long )3;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&faminame;
     sqlstm.sqhstl[5] = (unsigned long )22;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)famijuid;
     sqlstm.sqhstl[6] = (unsigned long )15;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"학자금지급이력 생성오류2...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);
                                             
}

/*****************************************************************************
  당월학자금을 생성하는 함수2.
 *****************************************************************************/
insert_ded_records2()
{
     /*2011.06.28 KTH 유치원 학자금 휴직자 0원 처리  델파이에서 처러  */
     /* EXEC SQL
     UPDATE PNHSCHIS SET SCAMT = 0
      WHERE SCYYMM = :workyymm
        AND SCKIND = '11'
		      AND EMPNO IN (
                      SELECT EMPNO FROM PIHANNO
                       WHERE :workyymm||'15' BETWEEN ANFRDATE AND ANTODATE
                         AND ANCODE LIKE '5%' 
                         AND ANCODE <> '514' 
                      ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PNHSCHIS  set SCAMT=0 where ((SCYYMM=:b0 and SCK\
IND='11') and EMPNO in (select EMPNO  from PIHANNO where (((:b0||'15') betwee\
n ANFRDATE and ANTODATE and ANCODE like '5%') and ANCODE<>'514')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )999;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
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

  
     if  ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
     {
          sprintf(msg,"유치원 학자금 휴직자 처리 오류 ...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체 */          
          return(FAIL);
     }
     
        
     /* EXEC SQL 
     INSERT  INTO   PNMSCMON
             (SCYYMM, EMPNO, KORNAME, SCKIND, SCAMT)
     SELECT  :workyymm, EMPNO, KORNAME, :sckind, SUM(SCAMT)
       FROM  PNHSCHIS
      WHERE  SCKIND = :sckind AND SCYYMM = :workyymm 
      GROUP  BY EMPNO, KORNAME; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PNMSCMON (SCYYMM,EMPNO,KORNAME,SCKIND,SCAMT\
)select :b0 ,EMPNO ,KORNAME ,:b1 ,sum(SCAMT)  from PNHSCHIS where (SCKIND=:b1\
 and SCYYMM=:b0) group by EMPNO,KORNAME";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1022;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)sckind;
     sqlstm.sqhstl[1] = (unsigned long )3;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)sckind;
     sqlstm.sqhstl[2] = (unsigned long )3;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workyymm;
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


     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"당월학자금 생성오류2...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
     DPsys_date(writetime,0);
     
     /* EXEC SQL DECLARE c4 CURSOR FOR
     SELECT  EMPNO
       FROM  PNMSCMON
      WHERE  SCKIND = :sckind AND SCYYMM = :workyymm
      GROUP  BY EMPNO; */ 

     
     /* EXEC SQL OPEN c4; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0025;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1053;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)sckind;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
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
          sprintf(msg,"당월학자금 읽기오류4...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c4; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1076;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     while(1)
     {
          /* EXEC SQL FETCH   c4 INTO :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1091;
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


          
          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1110;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }
          
          /* EXEC SQL
          UPDATE PNMSCMON
             SET
                   (KORNAME, DEPTCODE, ORGNUM)  = 
                   (
                    SELECT  KORNAME, DEPTCODE, ORGNUM
                    FROM  PKMPMAS 
                    WHERE  EMPNO = :empno
                   ),
                 WRITETIME = :writetime,
                 WRITEMAN  = :writeman
          WHERE  EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PNMSCMON  set (KORNAME,DEPTCODE,ORGNUM)=(se\
lect KORNAME ,DEPTCODE ,ORGNUM  from PKMPMAS where EMPNO=:b0),WRITETIME=:b1,W\
RITEMAN=:b2 where EMPNO=:b0";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1125;
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
          sqlstm.sqhstv[1] = (unsigned char  *)writetime;
          sqlstm.sqhstl[1] = (unsigned long )16;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)writeman;
          sqlstm.sqhstl[2] = (unsigned long )5;
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


          if  (sqlca.sqlcode != 0)
          {
               sprintf(msg,"당월학자금 쓰기오류1...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1156;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
     }
}

/*****************************************************************************
  학자금구분코드를 구하는 함수.
 *****************************************************************************/
get_sckind(char *scname, char *result)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t_scname[21]   = "";
          char  t_code[3]  = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     int  i;
     
     i = sprintf(t_scname,"%s",scname);
     t_scname[i] = 37; /* % Character */
     
     /* EXEC SQL
     SELECT  SCKIND
       INTO  :t_code
       fROM  PNCSCBAS
      WHERE  SCNAME LIKE :t_scname; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select SCKIND into :b0  from PNCSCBAS where SCNAME like\
 :b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1171;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t_code;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t_scname;
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

  
     if  (sqlca.sqlcode != 0)
     {
          sprintf(msg,"학자금구분코드 읽기 오류1...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
     sprintf(result,t_code);
     return(SUCCESS);
}

/*****************************************************************************
  연령제한을 Check하는 함수.  
 *****************************************************************************/
check_age(char *age)
{
     char  yy[5]  = "";  
     char  mm[3]   = "";
     int  i  = 0;
     double  month1, month2, month;
     
     if  (strlen(age) != 8)
     {
          printf("생년월일이 유효하지 않습니다   ==>   ");
          printf(" EMPNO : (%.4s) , 수혜자주민번호 : (%.8s) \n", empno,famijuid);
          sprintf(log_buff, " 생년월일 Error => EMPNO : (%.4s) , 수혜자주민번호 : (%.8s) \n", empno,famijuid);
          Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
          return(0);
     }
     
     
     strncpy(yy,age,4);
     strncpy(mm,age+4,2);
     month1 = (atoi(yy) + scfrage) * 12 + atoi(mm);   
     month2 = (atoi(yy) + sctoage + 1) * 12 + atoi(mm);   
     
     strncpy(yy,workyymm,4);
     strncpy(mm,workyymm+4,2);
     month = atoi(yy) * 12 + atoi(mm);
     
     if  (month < month1)    
     {
          printf(" 유치원학자금 연령기준 미달   ==>   ");
          printf(" EMPNO : %.4s , 수혜자주민번호 : %.8s \n", empno,famijuid);
          sprintf(log_buff, " 유치원학자금 연령기준 미달Error => EMPNO : %.4s , 수혜자주민번호 : %.8s \n", empno,famijuid);
          Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
          return(1);   
     }
     else if (month >= month2)  
     {
          printf(" 유치원학자금 연령기준 초과   ==>   ");
          printf(" EMPNO : %.4s , 수혜자주민번호 : %.8s \n",empno,famijuid);
          sprintf(log_buff, " 유치원학자금 연령기준 초과Error => EMPNO : %.4s , 수혜자주민번호 : %.8s \n", empno,famijuid);
          Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
          return(1);    
     }
     
     if  (strncmp(age,fryymm,6) < 0)
          return(1);   
     
     return(2);

}

/***************************************************************************
  read_result  Function.
****************************************************************************/
read_result()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t_sckind[2+1]    = "";
          char  t_scname[20+1]   = "";
          
          char  t_empno[4+1]   = "";
          char  t_korname[12+1]   = "";
          /* VARCHAR  t_faminame[12+1]   = {0,""}; */ 
struct { unsigned short len; unsigned char arr[13]; } t_faminame
 = {0,""};

          char  t_pstate[2+1]   = "";
          char  t_payyn[1+1]   = "";
          
          double  t_count;
          double  t_sum;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     record *p,*q;
     int  i,j;
     int  flag;
     
     double  pay_count, pay_sum;
     
     
     /* EXEC SQL
     UPDATE  PNMSCMAS A  
        SET (SCYYMM, SCSUM, SCSEQNO) =
            (SELECT  MAX(B.SCYYMM), SUM(B.SCAMT), MAX(B.SCCNT)
               FROM  PNHSCHIS B 
              WHERE  A.EMPNO  = B.EMPNO   
                AND  A.SCKIND = B.SCKIND  
                AND  A.FAMINAME = B.FAMINAME
             )
     WHERE  SCKIND = '11' 
       AND  SCYYMM IS NOT NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PNMSCMAS A  set (SCYYMM,SCSUM,SCSEQNO)=(select m\
ax(B.SCYYMM) ,sum(B.SCAMT) ,max(B.SCCNT)  from PNHSCHIS B where ((A.EMPNO=B.E\
MPNO and A.SCKIND=B.SCKIND) and A.FAMINAME=B.FAMINAME)) where (SCKIND='11' an\
d SCYYMM is  not null )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1194;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0) 
     {
          sprintf(msg,"학자금마스터 작업결과 Setting Error...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     
     if  (get_sckind("유치원",t_sckind) == FAIL)
          return(FAIL);
     
     /* EXEC SQL DECLARE c8 CURSOR FOR
     SELECT  A.EMPNO, A.KORNAME, FAMINAME, SCNAME, PSTATE, PAYYN
       FROM  PNMSCMAS A,PKMPMAS B,PNCSCBAS C
      WHERE (A.EMPNO  =  B.EMPNO)
	      AND (A.SCKIND <> :t_sckind AND A.SCKIND = C.SCKIND)  
        AND  UPPER(NVL(SCYN,' ')) = 'Y'      
        AND  SCYYMM = :workyymm      
        AND (PSTATE < '80' AND UPPER(PAYYN) = 'Y')
     union		
     SELECT  A.EMPNO, A.KORNAME, FAMINAME, SCNAME, PSTATE, PAYYN
       FROM  PNMSCMAS A,PKZMPMAS B,PNCSCBAS C
      WHERE (A.EMPNO  =  B.EMPNO)
	      AND (A.SCKIND <> :t_sckind AND A.SCKIND = C.SCKIND)  
        AND  UPPER(NVL(SCYN,' ')) = 'Y'      
        AND  SCYYMM = :workyymm      
        AND  PSTATE < '80' AND UPPER(PAYYN) = 'Y'		
      ORDER  BY EMPNO, FAMINAME, SCNAME; */ 

     
     /* EXEC SQL OPEN c8; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0029;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1209;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t_sckind;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workyymm;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)t_sckind;
     sqlstm.sqhstl[2] = (unsigned long )3;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workyymm;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405))
     {
          sprintf(msg,"Cursor c8 Open Error...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c8; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1240;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     printf("\n ========= < 학자금생성제외자 > ========= \n");
     sprintf(log_buff, "\n ========= < 학자금생성제외자 > ========= \n");
     Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
     
     j = 0;
     for (i = 0; i < 74; i++) j += sprintf(msg+j,"=");
     printf("%s\n",msg);
     Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
     j = 0;
     j += sprintf(msg+j,"  사 번");   /* 7 Bytes  */
     j += sprintf(msg+j,"    성    명");  /* 12 Bytes  */
     j += sprintf(msg+j,"    수혜자명");  /* 12 Bytes  */
     j += sprintf(msg+j,"    학자금 구분");  /* 15 Bytes  */
     j += sprintf(msg+j,"    인사상태");  /* 12 Bytes  */
     j += sprintf(msg+j,"    급여지급여부");  /* 16 Bytes  */
     printf("%s\n",msg);
     Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
     
     j   = 0;
     for (i = 0; i < 74; i++) j += sprintf(msg+j,"=");
     printf("%s\n",msg);
     Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
     
     flag   = 0;
     while(1)
     {
          /* EXEC SQL FETCH   c8
          INTO   :t_empno, :t_korname, :t_faminame, t_scname,
            :t_pstate, :t_payyn; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1255;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)t_empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)t_korname;
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&t_faminame;
          sqlstm.sqhstl[2] = (unsigned long )15;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)t_scname;
          sqlstm.sqhstl[3] = (unsigned long )21;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)t_pstate;
          sqlstm.sqhstl[4] = (unsigned long )3;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)t_payyn;
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


          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE c8; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1294;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          if  (sqlca.sqlcode != 0)
          {
               sprintf(msg,"Cursor c8 Data Fetch Error...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c8; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1309;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
          
          hinsa_trim(t_korname);
          /*
          hinsa_trim(t_faminame);
          */
          hinsa_trim(t_scname);
          flag++;
          j = 0;
          j += sprintf(msg+j,"%7s",t_empno);
          j += sprintf(msg+j,"%12s",t_korname);
          j += sprintf(msg+j,"%12s",t_faminame.arr);
          j += sprintf(msg+j,"%15s",t_scname);
          j += sprintf(msg+j,"%12s",t_pstate);
          j += sprintf(msg+j,"%16s",t_payyn);
          printf("%s\n",msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
     }
     
     
     if  (jobkind[0] == '1')   /* 유치원 학자금의 경우 */
     {
     
          /* EXEC SQL DECLARE c7 CURSOR FOR
          SELECT  A.EMPNO, A.KORNAME, FAMINAME, SCNAME, PSTATE, PAYYN
            FROM  PNMSCMAS A, PKMPMAS B, PNCSCBAS C
           WHERE  (A.EMPNO = B.EMPNO)      
             AND  (A.SCKIND = :t_sckind AND A.SCKIND = C.SCKIND)  
             AND  SCENDYYMM IS NULL      
             AND  UPPER(NVL(SCYN,' ')) = 'Y'      
             AND  (PSTATE < '80' AND UPPER(PAYYN) = 'Y')
          union	
		      SELECT  A.EMPNO, A.KORNAME, FAMINAME, SCNAME, PSTATE, PAYYN
            FROM  PNMSCMAS A, PKZMPMAS B, PNCSCBAS C
           WHERE  (A.EMPNO = B.EMPNO)      
             AND  (A.SCKIND = :t_sckind AND A.SCKIND = C.SCKIND)  
             AND  SCENDYYMM IS NULL      
             AND  UPPER(NVL(SCYN,' ')) = 'Y'      
             AND  (PSTATE < '80' AND UPPER(PAYYN) = 'Y')		 
           ORDER  BY EMPNO, FAMINAME, SCNAME; */ 

          
          /* EXEC SQL OPEN c7; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = sq0030;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1324;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqcmod = (unsigned int )0;
          sqlstm.sqhstv[0] = (unsigned char  *)t_sckind;
          sqlstm.sqhstl[0] = (unsigned long )3;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)t_sckind;
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


          if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
              (sqlca.sqlcode != -1405)) 
          {
               sprintf(msg,"Cursor c7 Open Error...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c7; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1347;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
          
          while(1)
          {
               /* EXEC SQL FETCH   c7
               INTO   :t_empno, :t_korname, :t_faminame, t_scname,
                 :t_pstate, :t_payyn; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1362;
               sqlstm.selerr = (unsigned short)1;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqfoff = (         int )0;
               sqlstm.sqfmod = (unsigned int )2;
               sqlstm.sqhstv[0] = (unsigned char  *)t_empno;
               sqlstm.sqhstl[0] = (unsigned long )5;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)t_korname;
               sqlstm.sqhstl[1] = (unsigned long )13;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&t_faminame;
               sqlstm.sqhstl[2] = (unsigned long )15;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)t_scname;
               sqlstm.sqhstl[3] = (unsigned long )21;
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)t_pstate;
               sqlstm.sqhstl[4] = (unsigned long )3;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)t_payyn;
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

 
               if  (sqlca.sqlcode == 1403) 
               {
                    /* EXEC SQL CLOSE c7; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 9;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )1401;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    break;
               }
               
               if  (sqlca.sqlcode != 0) 
               {
                    sprintf(msg,"Cursor c7 Data Fetch Error...");
                    print_errmsg(sqlca.sqlcode,msg);
                    Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
                    /* EXEC SQL CLOSE c7; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 9;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )1416;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    return(FAIL);
               }
               hinsa_trim(t_korname);
               /*
               hinsa_trim(t_faminame);
               */
               hinsa_trim(t_scname);
               flag++;
               j = 0;
               j = 0;
               j += sprintf(msg+j,"%7s",t_empno);
               j += sprintf(msg+j,"%12s",t_korname);
               j += sprintf(msg+j,"%12s",t_faminame.arr);
               j += sprintf(msg+j,"%15s",t_scname);
               j += sprintf(msg+j,"%12s",t_pstate);
               j += sprintf(msg+j,"%16s",t_payyn);
               printf("%s\n",msg);
          }
     
     }
     
     if  (flag == 0) 
     {
          printf("   ========= 해당자 없슴!!! ========= \n\n\n");
          sprintf(log_buff, "   ========= 해당자 없슴!!! ========= \n\n\n");
          Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
     }   
     
     /* EXEC SQL DECLARE c5 CURSOR FOR
     SELECT  A.SCKIND, SCNAME, COUNT(*), SUM(A.SCAMT)
       FROM  PNHSCHIS A, PNCSCBAS B 
      WHERE  SCYYMM = :workyymm AND A.SCKIND = B.SCKIND
      GROUP  BY A.SCKIND, SCNAME
      ORDER  BY A.SCKIND; */ 

     
     /* EXEC SQL OPEN c5; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0031;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1431;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyymm;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405)) 
     {
          sprintf(msg,"Cursor c5 Open Error...");
          print_errmsg(sqlca.sqlcode,msg);
          Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
          /* EXEC SQL CLOSE c5; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1450;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     
     p = q = NULL;
     i = 0;
     while(1)
     {
          memset(t_sckind,0x00,sizeof(t_sckind));
          memset(t_scname,0x00,sizeof(t_scname));
          
          /* EXEC SQL FETCH   c5
          INTO :t_sckind, :t_scname, :t_count, t_sum; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1465;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)t_sckind;
          sqlstm.sqhstl[0] = (unsigned long )3;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)t_scname;
          sqlstm.sqhstl[1] = (unsigned long )21;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&t_count;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&t_sum;
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

 
          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE c5; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1496;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          if  (sqlca.sqlcode != 0) 
          {
               sprintf(msg,"Cursor c5 Data Fetch Error...");
               print_errmsg(sqlca.sqlcode,msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               /* EXEC SQL CLOSE c5; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1511;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(FAIL);
          }
          
          q = p;
          p = (record*) malloc(sizeof(record)); 
          if  (p == NULL) 
          { 
               /* EXEC SQL CLOSE c5; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1526;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               j  = sprintf(msg,"메모리가 부족합니다.");
               sprintf(msg+j," 프로그램을 종료합니다.\n"); 
               printf("%s",msg);
               Write_batlog(seqno++, msg);  /*dsa2000 Rexec 대체*/
               return(FAIL);
          }
          
          if  (i == 0)
               first   = p;  
          
          sprintf(p->sckind,"%s",t_sckind);
          sprintf(p->scname,"%s",t_scname);
          p->count = t_count;
          p->sum   = t_sum;
          if (i != 0)
            q->ptr    = p;
          i++;
     }
     p->ptr = NULL;
     
     j = 0;
     for (i = 0; i < 80; i++) j += sprintf(msg+j,"=");
     printf("\n%s\n",msg);
     
     j = 0;
     for (i = 0; i < 26; i++) j += sprintf(msg+j,"=");
     j += sprintf(msg+j,"   < 작업결과 상세내역 >   "); 
     for (i = 0; i < 27; i++) j += sprintf(msg+j,"=");
     printf("%s\n",msg);
     
     j = 0;
     for (i = 0; i < 80; i++) j += sprintf(msg+j,"=");
     printf("%s\n\n",msg);
     
     pay_count = pay_sum = 0;
     while(first != NULL) 
     {
           printf("# 학자금구분 # : %s \n",first->scname); 
           sprintf(log_buff, "# 학자금구분 # : %s \n",first->scname); 
           Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
           
           printf("     [1]. 총지급인원 : %10.0f 명 \n",first->count); 
           sprintf(log_buff,"     [1]. 총지급인원 : %10.0f 명 \n",first->count); 
           Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
           
           printf("     [2]. 총지급금액 : %10.0f 원 \n\n",first->sum);
           sprintf(log_buff,"     [2]. 총지급금액 : %10.0f 원 \n\n",first->sum);
           Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
           
           if ((strcmp(first->sckind,"11") == 0) || /* 유치원학자금  */
               (strcmp(first->sckind,"18") == 0) || /* 유학 (중/고교)  */
               (strcmp(first->sckind,"19") == 0) || /* 유학 (대학교)  */
               (strcmp(first->sckind,"25") == 0))   /* 본인대학교  */
           {
                pay_count += first->count;
                pay_sum   += first->sum;   
           }
           first = first->ptr;
     }
     
     printf("### 회사지원학자금 ###  \n"); 
     sprintf(log_buff, "### 회사지원학자금 ###  \n"); 
     Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
     
     printf("     [1]. 총지급인원 : %10.0f 명 \n",pay_count); 
     sprintf(log_buff, "     [1]. 총지급인원 : %10.0f 명 \n",pay_count); 
     Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/  
     
     printf("     [2]. 총지급금액 : %10.0f 원 \n\n",pay_sum);
     sprintf(log_buff, "     [2]. 총지급금액 : %10.0f 원 \n\n",pay_sum);
     Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
     
     free_link();
     return(SUCCESS);
}
/***************************************************************************
  free_link  Function.
****************************************************************************/
void free_link()
{
     record *p,*q;
     p = first;
     while(p != NULL) 
     {
          q = p->ptr;
          free(p);
          p = q;
     }
}
/***************************************************************************
  print_errmsg  Function.
****************************************************************************/
void print_errmsg(int errcode, char *errmsg)
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
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1541;
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
     sqlstm.offset = (unsigned int  )1582;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
