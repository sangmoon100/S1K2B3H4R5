
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
    "pkw1030g.pc"
};


static unsigned int sqlctx = 155315;


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

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,207,0,2,152,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,
44,0,0,2,447,0,3,170,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,
87,0,0,3,420,0,5,211,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,
130,0,0,4,324,0,5,254,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
169,0,0,5,405,0,5,276,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,
212,0,0,6,1022,0,5,304,0,0,8,8,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,
259,0,0,7,334,0,5,345,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
298,0,0,8,205,0,5,365,0,0,8,8,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,
345,0,0,9,438,0,5,382,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
384,0,0,10,325,0,5,409,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
427,0,0,11,325,0,5,433,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
470,0,0,12,41,0,4,457,0,0,1,0,0,1,0,2,4,0,0,
489,0,0,13,257,0,5,468,0,0,7,7,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,
532,0,0,14,230,0,5,490,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,
571,0,0,15,227,0,5,512,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,
610,0,0,16,378,0,5,533,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
653,0,0,17,564,0,5,566,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
696,0,0,18,377,0,5,596,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
739,0,0,19,379,0,5,629,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
782,0,0,20,48,0,4,666,0,0,1,0,0,1,0,2,4,0,0,
801,0,0,21,332,0,5,676,0,0,9,9,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
852,0,0,22,283,0,5,697,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,
895,0,0,23,0,0,32,726,0,0,0,0,0,1,0,
910,0,0,24,50,0,3,733,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
951,0,0,25,0,0,29,743,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKW1030G(단기계약직 급여 계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 단기계약직 급여
 Programmer     : 이랑교
 Version        : 1.00
 Date           : 1999.06.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1999.06.01         이랑교          최초개발본      설계명세서
  30.00       2000.04.20     유효성         -휴일수당,야간수당 및 
                                                  주휴,생휴,월차수당 적용에 따른 수정 

  30.10       2001.06.20     유효성         -국민건강보험, 고용보험 적용에 따른 수정
  30.20       2001.08.30         유효성         1.휴일근무시 식사시간 제외 추가   전(2001-3450)
                                        2.19:00~08:00 근무가 9시간이상일때는 1시간 제외        
  30.30       2002.03.18         유효성         소득세법 변경에 따른 수정 
                      (근로소득공제액 60000원으로 변경)
              2002.12.11         박수향(parksh)  소득세법 변경에 따른 수정 근로소득공제세율 10%-> 9%변경                                        
  30.40       2003.12.02         강륜종          소득세법 변경에 따른 수정 
                      (근로소득공제액 80000원으로 변경)
                      (근로소득세액공제 45% -> 50% 인상)
  31.00       2004.02.24         강륜종        Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.                      
  32.00       2004.12.03         dsa2000       근로소득세액공제 인상 : 테이블에서 읽어와 계산토록 수정.
  33.00       2004.12.28      강륜종(dsa2000)  Rexec 대체서비스를 위한 수정작업.     
  34.00       2005.04.21         dsa2000       주휴 8시간에서 12시간으로 변경.
============================================================================= */

#include  <stdio.h>
#include  <stdlib.h>          
/* Dsa2000  추가.. 2004.02.24.*/
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"
#include "hinsa_macro.h"

#define  FAIL        -2
/* Dsa2000  추가..End.......*/


/* ===========================================================================
  Function Prototype 정의 
   =========================================================================== */
void   calc_ilpay(void);
void   calc_iltax(void); /* 세액 계산*/
void   print_errmsg(int errcode, char *errmsg);

/* ===========================================================================
  Global Variable
   =========================================================================== */

/* EXEC SQL  BEGIN DECLARE SECTION; */ 

     char     paydate[8+1];      /* 급여지급일   */
     char     empno[4+1];        /* 사번     */
                                 
     char     frdate[8+1];       /* 급여계산기간From   */
     char     todate[8+1];       /* 급여계산기간To   */
     char     writeman[4+1];     /* 작업자사번   */
     char     batchpayyn[1+1];   /* 일괄급여계산여부  */
     char     frorgnum[3+1];
     char     toorgnum[3+1];
     char     frdeptcode[6+1];
     char     todeptcode[6+1];
              
     char     sqlstr[300+1];
     double   empldrate = 0;     /* 고용보험료율   */        
     double   taxdedbrate;       /*근로소득세액공제율.*/
/* EXEC SQL  END DECLARE SECTION; */ 

/* EXEC SQL  INCLUDE sqlca;
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


int  id;
/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0; 

void main(int argc, char *argv[])
{          
     char FL_file[255];
     
     if  (argc != 12) { /* /hper8/HINSA/proc/bin/Kbin/pkw1030g 20040210 20040101 20040131 H00 H99 A0000 ZZZZZ Y D006 pkw1030g 2004110100000 */
          printf("[Usage] : pkw1030g  1.급여지급일    2.급여계산기간From    3.급여계산기간To      \n");
          printf("[Usage] :         4.조직차수From  5.조직차수To   6.부서코드From  7.부서코드To \n");
          printf("[Usage] :         8.일괄급여계산여부    9.작업자 10.프로그램ID   11.시작시간  \n");
          exit(1);
     }  
     
     sprintf(paydate,"%s",argv[1]);
     sprintf(frdate,"%s",argv[2]);
     sprintf(todate,"%s",argv[3]);
     sprintf(frorgnum,"%s",argv[4]);
     sprintf(toorgnum,"%s",argv[5]);
     sprintf(frdeptcode,"%s",argv[6]);
     sprintf(todeptcode,"%s",argv[7]);
     sprintf(batchpayyn,"%s",argv[8]);
     sprintf(writeman,"%s",argv[9]);
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkw1030g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     /* Dsa2000  2004.02.24.  **********************************/  
     /*DB_connect(id,0); */
     hinsa_log_print(0,"단기계약직 급여 계산 시작...");
     hinsa_db_connect();  /*DB Connect 실시..*/
     /* Dsa2000  수정 End......................................*/
     
     /*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[9]);
     strcpy(log_progid,   argv[10]);
     strcpy(log_rundate,  argv[11]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     calc_iltax();
     
     printf("급여 계산 중...\n");
     calc_ilpay();
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] ====="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);                    /*dsa2000 Rexec 대체*/
          error_quit("[작업 실패]\n");
     }
     else
     {
          sprintf(log_buff, "OK ====== [단기계약직 급여계산 작업성공] =====\n"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);                  /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [단기계약직 급여계산 작업성공] =====\n");   
     }   
}

void calc_ilpay(void)
{
     /* 1. 기존자료 삭제 */
     /* EXEC SQL
     delete  from pkmilpay a
      where  paydate = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists 
                     (select  b.empno
                        from  pkhilhis b
                       where  a.empno = b.empno
                         and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pkmilpay a  where (((paydate=:b0 and orgnu\
m between :b1 and :b2) and deptcode between :b3 and :b4) and exists (select b\
.empno  from pkhilhis b where (a.empno=b.empno and upper(batchpayyn)=:b5)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"1. 기존자료 삭제 에서 오류...");
          sprintf(log_buff, "1. 기존자료 삭제 에서 오류..."); 
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     } 
     
     /* EXEC SQL
     INSERT INTO PKMILPAY (
            PAYDATE, EMPNO,  ORGNUM, DEPTCODE, ACNTCODE, FINCODE, 
            CORPCODE ,ACTIVITY ,SERVICE  ,METHOD   ,CUSTOMER ,TELE,   
            PAYBANK, PAYACNT, 
            WRITEMAN, WRITETIME)
     select :paydate, empno, orgnum, deptcode, acntcode, fincode, 
            CORPCODE ,ACTIVITY ,SERVICE  ,METHOD   ,CUSTOMER ,TELE,     
            paybank, payacnt,    
            :writeman, to_char(sysdate,'yyyymmddhh24miss')
       from pkhilhis a
      where upper(batchpayyn) = :batchpayyn
        and orgnum between :frorgnum and :toorgnum
        and deptcode between :frdeptcode and :todeptcode
        and payyn = 'Y'
     /oand     timekind = '0'o/
     /oand  exists (o/
    
     /o 20180831 csi  김기철, 김선일매니저 요청사항   o/
     /o 급여지급여부만 가지고 대상 추출               o/
     /o 근태 무시                                     o/
     /o   
        and  a.empno in (  
                           select b.empno
                            from  pkhilduty b
                           where  b.dufrdate between :frdate and :todate
                             and  upper(b.conyn) = 'Y'
                             and  a.empno = b.empno);
     o/
     ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKMILPAY (PAYDATE,EMPNO,ORGNUM,DEPTCODE,ACN\
TCODE,FINCODE,CORPCODE,ACTIVITY,SERVICE,METHOD,CUSTOMER,TELE,PAYBANK,PAYACNT,\
WRITEMAN,WRITETIME)select :b0 ,empno ,orgnum ,deptcode ,acntcode ,fincode ,CO\
RPCODE ,ACTIVITY ,SERVICE ,METHOD ,CUSTOMER ,TELE ,paybank ,payacnt ,:b1 ,to_\
char(sysdate,'yyyymmddhh24miss')  from pkhilhis a where (((upper(batchpayyn)=\
:b2 and orgnum between :b3 and :b4) and deptcode between :b5 and :b6) and pay\
yn='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )44;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)writeman;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[2] = (unsigned long )2;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[4] = (unsigned long )4;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)todeptcode;
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


      
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"2. 대상자료생성 에서 오류...");
          sprintf(log_buff, "2. 대상자료생성 에서 오류..."); 
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업실패...");
     }
     
     /*===================2000-04-20 주휴,월차,생휴수당 추가 =============*/
     /*월차*/
     /* EXEC SQL  
     UPDATE  PKMILPAY A
        SET  MONTHAMT = ( SELECT DECODE(NVL(FULLYN,'N'),'Y', (NVL(BASEAMT,0) * LEAST(NVL(CONHH,0),8)),   0) 
                           FROM PKHILDUSUM D, PKHILHIS H
                          WHERE D.EMPNO = H.EMPNO
                            AND D.DUYYMM = SUBSTR(:frdate, 1, 6)
                            AND A.EMPNO = D.EMPNO)
      WHERE  A.PAYDATE = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                    (select b.empno
                      from  pkhilhis b
                     where  a.empno = b.empno
                       and  upper(batchpayyn) = :batchpayyn
                       and  timekind ='0' ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMILPAY A  set MONTHAMT=(select DECODE(NVL(FULL\
YN,'N'),'Y',(NVL(BASEAMT,0)* LEAST(NVL(CONHH,0),8)),0)  from PKHILDUSUM D ,PK\
HILHIS H where ((D.EMPNO=H.EMPNO and D.DUYYMM=SUBSTR(:b0,1,6)) and A.EMPNO=D.\
EMPNO)) where (((A.PAYDATE=:b1 and orgnum between :b2 and :b3) and deptcode b\
etween :b4 and :b5) and exists (select b.empno  from pkhilhis b where ((a.emp\
no=b.empno and upper(batchpayyn)=:b6) and timekind='0')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )87;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)paydate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode," 월차수당 계산 에서 오류...");
          error_quit("작업실패...");
     }
     
           /*생휴  2008.06.13 삭제 인력팀 김미진씨 통해서
           EXEC SQL
     UPDATE PKMILPAY A
     SET HEALTHAMT = ( SELECT DECODE( NVL(HEALTH ,0), '0',(NVL(BASEAMT,0) * LEAST(NVL(CONHH,0),8) ),0)
                   FROM PKHILDUSUM D, PKHILHIS H
              WHERE D.EMPNO = H.EMPNO
              AND D.DUYYMM = SUBSTR(:frdate, 1, 6)
              AND A.EMPNO = D.EMPNO)
     WHERE  A.PAYDATE = :paydate
     and  orgnum between :frorgnum and :toorgnum
     and  deptcode between :frdeptcode and :todeptcode
     AND     A.EMPNO IN (SELECT EMPNO FROM PKHILHIS WHERE SUBSTR(JUMINID, 8,1) IN ('2','4'))
     and  exists
      (select    b.empno
       from  pkhilhis b
       where  a.empno = b.empno
       and  upper(batchpayyn) = :batchpayyn
       AND TIMEKIND = '0' ) ;
     */
     
     /* EXEC SQL
     UPDATE  PKMILPAY A
        SET  HEALTHAMT = 0
      WHERE  A.PAYDATE = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        AND  A.EMPNO IN (SELECT EMPNO FROM PKHILHIS WHERE SUBSTR(JUMINID, 8,1) IN ('2','4'))
        and  exists
                     (select  b.empno
                        from  pkhilhis b
                       where  a.empno = b.empno
                         and  upper(batchpayyn) = :batchpayyn
                         AND  TIMEKIND = '0' ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMILPAY A  set HEALTHAMT=0 where ((((A.PAYDATE=\
:b0 and orgnum between :b1 and :b2) and deptcode between :b3 and :b4) and A.E\
MPNO in (select EMPNO  from PKHILHIS where SUBSTR(JUMINID,8,1) in ('2','4')))\
 and exists (select b.empno  from pkhilhis b where ((a.empno=b.empno and uppe\
r(batchpayyn)=:b5) and TIMEKIND='0')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )130;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
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


       
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"  생휴 수당 계산 에서 오류...");
          error_quit("작업실패...");
     }
           
           /*주휴   8시간에서 12시간으로 변경 dsa2000 반영(2005.04.21). */
           /*주휴   12시간에서 8시간으로 변경 dsa2000 반영(2012.04.04).김현순 매니져 요청 수정 */
     /* EXEC SQL
     UPDATE  PKMILPAY A
      /oSET  WEEKAMT = ( SELECT  NVL(WEEKCNT,0) * NVL(BASEAMT,0) * LEAST(NVL(CONHH, 0), 8) 8시간에서 12시간으로 변경o/
        SET  WEEKAMT = ( SELECT  NVL(WEEKCNT,0) * NVL(BASEAMT,0) * decode(CONHH,0,0,8)
                           FROM  PKHILDUSUM D, PKHILHIS H
                          WHERE  D.EMPNO = H.EMPNO
                            AND  D.DUYYMM = SUBSTR(:frdate, 1, 6)
                            AND  A.EMPNO = D.EMPNO)
      WHERE  A.PAYDATE = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode  
        and  exists
                    (select  b.empno
                       from  pkhilhis b
                      where  a.empno = b.empno
                        and  upper(batchpayyn) = :batchpayyn
                        AND  TIMEKIND = '0') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 7;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMILPAY A  set WEEKAMT=(select ((NVL(WEEKCNT,0)\
* NVL(BASEAMT,0))* decode(CONHH,0,0,8))  from PKHILDUSUM D ,PKHILHIS H where \
((D.EMPNO=H.EMPNO and D.DUYYMM=SUBSTR(:b0,1,6)) and A.EMPNO=D.EMPNO)) where (\
((A.PAYDATE=:b1 and orgnum between :b2 and :b3) and deptcode between :b4 and \
:b5) and exists (select b.empno  from pkhilhis b where ((a.empno=b.empno and \
upper(batchpayyn)=:b6) and TIMEKIND='0')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )169;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)paydate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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


           
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode," 주휴 수당 계산 에서 오류...");
          error_quit("작업실패...");
     }
           
  
/*================*/  
  
     /* 3.1  총 근무 시간/수당 계산 */
     /* EXEC SQL
     UPDATE  PKMILPAY A
        SET  (BASEHH, EXTHH, BASEAMT,EXTAMT,
              NIGHTHH,  HOLIHH,  HOLIEXTHH,
              NIGHTAMT, HOLIAMT, HOLIEXTAMT,
              TOTMM,RESTMM,
              LABINAMT ,INDED,TAXINAMT,
              CALCTAX  ,LABTAXDED,
              INTAX,JUTAX,
              MEALHH, MEALAMT,
              EXCEPHH, EXCEPAMT  ) =
             (SELECT NVL(SUM(B.BASEHH ),0),NVL(SUM(B.EXTHH ),0),
                     NVL(SUM(B.BASEAMT),0),NVL(SUM(B.EXTAMT),0),
                     NVL(SUM(B.NIGHTHH),0),NVL(SUM(B.HOLIHH),0),NVL(SUM(B.HOLIEXTHH),0),
                     NVL(SUM(B.NIGHTAMT),0),NVL(SUM(B.HOLIAMT),0), NVL(SUM(B.HOLIEXTAMT),0),
                     NVL(SUM(B.TOTMM ) ,0),NVL(SUM(B.RESTMM),0),
                     NVL(SUM(B.LABINAMT),0),nvl(SUM(B.INDED),0),
                     NVL(SUM(B.TAXINAMT),0),
                     NVL(SUM(B.CALCTAX) ,0),nvl(SUM(B.LABTAXDED),0),
                     NVL(SUM(B.INTAX),0), NVL(SUM(B.JUTAX ),0),
                     SUM(NVL(B.MEALHH,0)), SUM(NVL(B.MEALAMT ,0)),
                     SUM(NVL(B.EXCEPHH,0)), SUM(NVL(B.EXCEPAMT ,0))
               FROM  PKHILDUTY B
              WHERE  B.DUFRDATE BETWEEN :frdate AND :todate
                AND  UPPER(B.CONYN) = 'Y'
                AND  A.EMPNO = B.EMPNO)
      WHERE  PAYDATE = :paydate
        and  orgnum   between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                    (select  c.empno
                       from  pkhilhis c
                      where  a.empno = c.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMILPAY A  set (BASEHH,EXTHH,BASEAMT,EXTAMT,NIG\
HTHH,HOLIHH,HOLIEXTHH,NIGHTAMT,HOLIAMT,HOLIEXTAMT,TOTMM,RESTMM,LABINAMT,INDED\
,TAXINAMT,CALCTAX,LABTAXDED,INTAX,JUTAX,MEALHH,MEALAMT,EXCEPHH,EXCEPAMT)=(sel\
ect NVL(sum(B.BASEHH),0) ,NVL(sum(B.EXTHH),0) ,NVL(sum(B.BASEAMT),0) ,NVL(sum\
(B.EXTAMT),0) ,NVL(sum(B.NIGHTHH),0) ,NVL(sum(B.HOLIHH),0) ,NVL(sum(B.HOLIEXT\
HH),0) ,NVL(sum(B.NIGHTAMT),0) ,NVL(sum(B.HOLIAMT),0) ,NVL(sum(B.HOLIEXTAMT),\
0) ,NVL(sum(B.TOTMM),0) ,NVL(sum(B.RESTMM),0) ,NVL(sum(B.LABINAMT),0) ,nvl(su\
m(B.INDED),0) ,NVL(sum(B.TAXINAMT),0) ,NVL(sum(B.CALCTAX),0) ,nvl(sum(B.LABTA\
XDED),0) ,NVL(sum(B.INTAX),0) ,NVL(sum(B.JUTAX),0) ,sum(NVL(B.MEALHH,0)) ,sum\
(NVL(B.MEALAMT,0)) ,sum(NVL(B.EXCEPHH,0)) ,sum(NVL(B.EXCEPAMT,0))  from PKHIL\
DUTY B where ((B.DUFRDATE between :b0 and :b1 and UPPER(B.CONYN)='Y') and A.E\
MPNO=B.EMPNO)) where (((PAYDATE=:b2 and orgnum between :b3 and :b4) and deptc\
ode between :b5 and :b6) and exists (select c.empno  from pkhilhis c where (a\
.empno=c.empno and upper(batchpayyn)=:b7)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )212;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)todate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)paydate;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[4] = (unsigned long )4;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[6] = (unsigned long )7;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[7] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.1  총 근무 시간/수당 계산 에서 오류...");
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     UPDATE  PKMILPAY A
        SET  DUTYAMT = NVL(BASEAMT,0) + NVL(EXTAMT,0) +
             NVL(NIGHTAMT,0) + NVL(HOLIAMT,0) + NVL(HOLIEXTAMT,0) -
             NVL(MEALAMT,0) - NVL(EXCEPAMT,0) 
      WHERE  PAYDATE = :paydate
        and  orgnum   between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                    (select    c.empno
                       from  pkhilhis c
                      where  a.empno = c.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMILPAY A  set DUTYAMT=((((((NVL(BASEAMT,0)+NVL\
(EXTAMT,0))+NVL(NIGHTAMT,0))+NVL(HOLIAMT,0))+NVL(HOLIEXTAMT,0))-NVL(MEALAMT,0\
))-NVL(EXCEPAMT,0)) where (((PAYDATE=:b0 and orgnum between :b1 and :b2) and \
deptcode between :b3 and :b4) and exists (select c.empno  from pkhilhis c whe\
re (a.empno=c.empno and upper(batchpayyn)=:b5)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )259;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"  DUTYAMT 계산 에서 오류...");
          error_quit("작업실패...");
     }
     
     /* EXEC SQL
     UPDATE  PKHILDUTY B
        SET  PAYDATE  = :paydate 
      WHERE  B.DUFRDATE BETWEEN :frdate AND :todate
        AND  EMPNO IN (SELECT  EMPNO
                         FROM  PKMILPAY A
                        WHERE  ORGNUM   BETWEEN :frorgnum AND :toorgnum
                          AND  DEPTCODE BETWEEN :frdeptcode AND :todeptcode
                          AND  PAYDATE= :paydate ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHILDUTY B  set PAYDATE=:b0 where (B.DUFRDATE b\
etween :b1 and :b2 and EMPNO in (select EMPNO  from PKMILPAY A where ((ORGNUM\
 between :b3 and :b4 and DEPTCODE between :b5 and :b6) and PAYDATE=:b0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )298;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frdate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)todate;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[4] = (unsigned long )4;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[6] = (unsigned long )7;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)paydate;
     sqlstm.sqhstl[7] = (unsigned long )9;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.1.2   근태table에 급여지급확정 error ");
          error_quit("작업실패...");
     }
     
     /* 3.2  지급총액계산 */
     /* EXEC SQL
     update  pkmilpay a
        set  taxpaysum    =  nvl(DUTYAMT,0) + nvl(taxpay,0) + nvl(WEEKAMT,0) 
                          +  nvl(MONTHAMT,0) + nvl(HEALTHAMT,0),
             notaxpaysum  =  nvl(notaxpay,0),
             paysum       =  nvl(DUTYAMT,0) + nvl(taxpay,0) + nvl(WEEKAMT,0) + nvl(MONTHAMT,0) 
                          +  nvl(HEALTHAMT,0) + nvl(notaxpay,0)
      where  paydate = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                    (select  b.empno
                       from  pkhilhis b
                      where  a.empno = b.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmilpay a  set taxpaysum=((((nvl(DUTYAMT,0)+nvl\
(taxpay,0))+nvl(WEEKAMT,0))+nvl(MONTHAMT,0))+nvl(HEALTHAMT,0)),notaxpaysum=nv\
l(notaxpay,0),paysum=(((((nvl(DUTYAMT,0)+nvl(taxpay,0))+nvl(WEEKAMT,0))+nvl(M\
ONTHAMT,0))+nvl(HEALTHAMT,0))+nvl(notaxpay,0)) where (((paydate=:b0 and orgnu\
m between :b1 and :b2) and deptcode between :b3 and :b4) and exists (select b\
.empno  from pkhilhis b where (a.empno=b.empno and upper(batchpayyn)=:b5)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )345;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.2  지급총액계산 에서 오류...");
          error_quit("작업실패...");
     }
     
/* =================================================================================
  30.10       2001.06.20     유효성         -국민건강보험, 고용보험 적용에 따른 수정                                               
  주휴,생휴,월차수당 적용에 따른 수정                                                   
==================================================================================== */
/**국민건강보험계산**/
    /* EXEC SQL
    update  pkmilpay a
       set  meddamt = (select nvl(b.medamt ,0)
                         from pkhilhis b
                        where a.empno = b.empno)  
     where  paydate = :paydate
       and  orgnum between :frorgnum and :toorgnum
       and  deptcode between :frdeptcode and :todeptcode
       and  exists
                   (select  b.empno
                      from  pkhilhis b
                     where  a.empno = b.empno
                       and  upper(batchpayyn) = :batchpayyn
                       and  b.confrdate <=concat(substr(:paydate,1,6),'01')
                   ); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 8;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update pkmilpay a  set meddamt=(select nvl(b.medamt,0)  \
from pkhilhis b where a.empno=b.empno) where (((paydate=:b0 and orgnum betwee\
n :b1 and :b2) and deptcode between :b3 and :b4) and exists (select b.empno  \
from pkhilhis b where ((a.empno=b.empno and upper(batchpayyn)=:b5) and b.conf\
rdate<=concat(substr(:b0,1,6),'01'))))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )384;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)paydate;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
    sqlstm.sqhstl[1] = (unsigned long )4;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
    sqlstm.sqhstl[2] = (unsigned long )4;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
    sqlstm.sqhstl[3] = (unsigned long )7;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
    sqlstm.sqhstl[4] = (unsigned long )7;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
    sqlstm.sqhstl[5] = (unsigned long )2;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)paydate;
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


    
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode," 의료보험계산 에서 오류...");
          error_quit("작업실패...");
     }
     
     
     /**국민연금 계산**/
     /* EXEC SQL
     update  pkmilpay a
        set  dedamt1 = (select nvl(b.dedamt ,0)
                          from pkhilhis b
                         where a.empno = b.empno)  
      where  paydate = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                     (select  b.empno
                        from  pkhilhis b
                       where  a.empno = b.empno
                         and  upper(batchpayyn) = :batchpayyn
                         and  b.confrdate <=concat(substr(:paydate,1,6),'01')
                     ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmilpay a  set dedamt1=(select nvl(b.dedamt,0) \
 from pkhilhis b where a.empno=b.empno) where (((paydate=:b0 and orgnum betwe\
en :b1 and :b2) and deptcode between :b3 and :b4) and exists (select b.empno \
 from pkhilhis b where ((a.empno=b.empno and upper(batchpayyn)=:b5) and b.con\
frdate<=concat(substr(:b0,1,6),'01'))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )427;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[5] = (unsigned long )2;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)paydate;
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


      
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode," 국민연금계산 에서 오류...");
          error_quit("작업실패...");
     }
     
     
     /**고용보험 계산**/
     /* EXEC SQL
     select empldrate
       into :empldrate
       from pkcemtbl ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select empldrate into :b0  from pkcemtbl ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )470;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&empldrate;
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


     if  (sqlca.sqlcode != 0) 
     {
          print_errmsg(sqlca.sqlcode,"고용보험료 계산기준 읽기오류...");
          error_quit("작업실패...");
     }
     
     
     /* EXEC SQL
     update  pkmilpay a
        set  empldamt = trunc(nvl(FLOOR(taxpaysum * :empldrate),0),-1)
      where  paydate = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                    (select  b.empno
                       from  pkhilhis b
                      where  a.empno = b.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmilpay a  set empldamt=trunc(nvl(FLOOR((taxpay\
sum* :b0)),0),(-1)) where (((paydate=:b1 and orgnum between :b2 and :b3) and \
deptcode between :b4 and :b5) and exists (select b.empno  from pkhilhis b whe\
re (a.empno=b.empno and upper(batchpayyn)=:b6)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )489;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&empldrate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)paydate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode," 고용보험계산 에서 오류...");
          error_quit("작업실패...");
     }
     
/*================국민건강보험, 고용보험료 계산 끝=======*/   
  

     /* 3.2  소액 부징수 (소득세) */
     /* EXEC SQL
     update  pkmilpay a
        set  intax   = 0
      where  paydate = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                   (select  b.empno
                      from  pkhilhis b
                     where  a.empno = b.empno
                       and  upper(batchpayyn) = :batchpayyn)
                       and  intax < 1000 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmilpay a  set intax=0 where ((((paydate=:b0 an\
d orgnum between :b1 and :b2) and deptcode between :b3 and :b4) and exists (s\
elect b.empno  from pkhilhis b where (a.empno=b.empno and upper(batchpayyn)=:\
b5))) and intax<1000)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )532;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
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


     
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.2.2  소액 부징수 (소득세) 에서 오류...");
          error_quit("작업실패...");
     }
     
     
     /* 3.2.3  소액 부징수 (주민세) */
     /* EXEC SQL
     update  pkmilpay a
        set  jutax   = 0
      where  paydate = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                     (select  b.empno
                        from  pkhilhis b
                       where  a.empno = b.empno
                         and  upper(batchpayyn) = :batchpayyn)
                         and  intax = 0 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmilpay a  set jutax=0 where ((((paydate=:b0 an\
d orgnum between :b1 and :b2) and deptcode between :b3 and :b4) and exists (s\
elect b.empno  from pkhilhis b where (a.empno=b.empno and upper(batchpayyn)=:\
b5))) and intax=0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )571;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)paydate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)batchpayyn;
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


     
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.2.2  소액 부징수 (주민세) 에서 오류...");
          error_quit("작업실패...");
     }
     
     /* 3.4 실지급액 계산*/
     /* EXEC SQL
     update  pkmilpay a
     /o국민건강보험료, 고용보험료 추가o/
     /oset  dedsum     = dedamt1 + intax + jutax,o/
        set  dedsum    = dedamt1 + intax + jutax + meddamt + empldamt ,
             realpay   = paysum-(dedamt1 + intax + jutax + meddamt + empldamt),
             writeman  = :writeman,
             writetime = to_char(sysdate,'yyyymmddhh24miss')
      where  paydate = :paydate
        and  orgnum between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  exists
                    (select  b.empno
                       from  pkhilhis b
                      where  a.empno = b.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkmilpay a  set dedsum=((((dedamt1+intax)+jutax)\
+meddamt)+empldamt),realpay=(paysum-((((dedamt1+intax)+jutax)+meddamt)+emplda\
mt)),writeman=:b0,writetime=to_char(sysdate,'yyyymmddhh24miss') where (((payd\
ate=:b1 and orgnum between :b2 and :b3) and deptcode between :b4 and :b5) and\
 exists (select b.empno  from pkhilhis b where (a.empno=b.empno and upper(bat\
chpayyn)=:b6)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )610;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)writeman;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)paydate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.4 실지급액 계산 에서 오류...");
          error_quit("작업실패...");
     }
}


/* ********************************************************************** *
   세금계산 
* ********************************************************************** */

void calc_iltax(void)
{
/*=2000.7.11. 추가 시작. 급여계산하는 시점의 단기계약직이력(PKHILHIS) 기본급으로 각종 수당 재계산...========*/  
     printf(" 세금계산 중...\n"); 
     /* EXEC SQL
     UPDATE  PKHILDUTY A  
        SET  (BASEAMT, EXTAMT, HOLIAMT, HOLIEXTAMT, NIGHTAMT, MEALAMT, EXCEPAMT ) 
         =   (SELECT  A.BASEHH    * B.BASEAMT,        
                      A.EXTHH     * B.BASEAMT * 1.5, 
                      A.HOLIHH    * B.BASEAMT * 1.5,  
                      A.HOLIEXTHH * B.BASEAMT * 2.0, 
                      A.NIGHTHH   * B.BASEAMT * 0.5,
                      A.MEALHH    * B.BASEAMT * 1.5,  
                      A.EXCEPHH   * B.BASEAMT * 1.5
                FROM  PKHILHIS B
               WHERE  A.EMPNO = B.EMPNO)                    
      WHERE  ORGNUM   BETWEEN :frorgnum AND :toorgnum
        AND  DEPTCODE BETWEEN :frdeptcode AND :todeptcode
        AND  DUFRDATE BETWEEN :frdate AND :todate
        AND  UPPER(CONYN) = 'Y'
        AND  EXISTS (SELECT  C.EMPNO
                       FROM  PKHILHIS C
                      WHERE  A.EMPNO = C.EMPNO
                        AND  UPPER(C.BATCHPAYYN) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHILDUTY A  set (BASEAMT,EXTAMT,HOLIAMT,HOLIEXT\
AMT,NIGHTAMT,MEALAMT,EXCEPAMT)=(select (A.BASEHH* B.BASEAMT) ,((A.EXTHH* B.BA\
SEAMT)* 1.5) ,((A.HOLIHH* B.BASEAMT)* 1.5) ,((A.HOLIEXTHH* B.BASEAMT)* 2.0) ,\
((A.NIGHTHH* B.BASEAMT)* 0.5) ,((A.MEALHH* B.BASEAMT)* 1.5) ,((A.EXCEPHH* B.B\
ASEAMT)* 1.5)  from PKHILHIS B where A.EMPNO=B.EMPNO) where ((((ORGNUM betwee\
n :b0 and :b1 and DEPTCODE between :b2 and :b3) and DUFRDATE between :b4 and \
:b5) and UPPER(CONYN)='Y') and exists (select C.EMPNO  from PKHILHIS C where \
(A.EMPNO=C.EMPNO and UPPER(C.BATCHPAYYN)=:b6)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )653;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdate;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todate;
     sqlstm.sqhstl[5] = (unsigned long )9;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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

      
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"일별 수당 계산에서 오류...");
          error_quit("작업실패...");
     }
     
/*========================2000.7.11. 추가 끝================================*/
  
     /* 3.3 세금계산1  */
     /* EXEC SQL
     update  PKHILDUTY a
     /o 2000-04-24 야근수당,휴일근무수당 추가
     set  taxpaysum   = nvl(baseamt,0)+nvl(extamt,0)o/
        set  taxpaysum   = nvl(baseamt,0)+nvl(extamt,0)+nvl(nightamt,0)+nvl(holiamt,0)
                          +nvl(holiextamt,0)-nvl(mealamt,0)-nvl(excepamt,0)
      where  orgnum   between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  dufrdate between :frdate and :todate
        and  upper(conyn) = 'Y'
        and  exists  (select  b.empno
                        from  pkhilhis b
                       where  a.empno = b.empno
                         and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHILDUTY a  set taxpaysum=((((((nvl(baseamt,0)+\
nvl(extamt,0))+nvl(nightamt,0))+nvl(holiamt,0))+nvl(holiextamt,0))-nvl(mealam\
t,0))-nvl(excepamt,0)) where ((((orgnum between :b0 and :b1 and deptcode betw\
een :b2 and :b3) and dufrdate between :b4 and :b5) and upper(conyn)='Y') and \
exists (select b.empno  from pkhilhis b where (a.empno=b.empno and upper(batc\
hpayyn)=:b6)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )696;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdate;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todate;
     sqlstm.sqhstl[5] = (unsigned long )9;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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

 
      
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.3 세금계산1 에서 오류...");
          error_quit("작업실패...");
     }
     
     /*===========================================================================
     30.40       2003.12.02         강륜종        근로소득공제액  80000원으로 변경
     ============================================================================= */    
     /***  EXEC SQL
       update  PKHILDUTY a
       set  labinamt   = nvl(taxpaysum,0),              
        inded          = 60000,
        taxinamt  = greatest((taxpaysum-60000),0), 
        calctax          = floor(greatest((taxpaysum-60000),0) * 0.09)  2002년에 근로소득공제변경  0.1->0.09 수정 parksh20021211
     ***/

     /* 2018.12.26 eyha 근로소득공제 100000 -> 150000 박윤진M */
     /* EXEC SQL
     update  PKHILDUTY a
        set  labinamt   = nvl(taxpaysum,0),               /o 과세표준 o/
             inded          = 150000,
             taxinamt  = greatest((taxpaysum-150000),0),  /o 근로소득공제 o/ 
             /o   calctax          = floor(greatest((taxpaysum-80000),0) * 0.09) o/
             calctax          = floor(greatest((taxpaysum-150000),0) * 0.06) /o dsa2000 2005.10.04 세율 인하 2011.01.10 6% 변경 2010년 잘못 적용o/
      where  orgnum   between :frorgnum and :toorgnum
       and   deptcode between :frdeptcode and :todeptcode
       and   dufrdate between :frdate and :todate
       and   upper(conyn) = 'Y'
       and   exists
                    (select   b.empno
                       from  pkhilhis b
                      where  a.empno = b.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHILDUTY a  set labinamt=nvl(taxpaysum,0),inded\
=150000,taxinamt=greatest((taxpaysum-150000),0),calctax=floor((greatest((taxp\
aysum-150000),0)* 0.06)) where ((((orgnum between :b0 and :b1 and deptcode be\
tween :b2 and :b3) and dufrdate between :b4 and :b5) and upper(conyn)='Y') an\
d exists (select b.empno  from pkhilhis b where (a.empno=b.empno and upper(ba\
tchpayyn)=:b6)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )739;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdate;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todate;
     sqlstm.sqhstl[5] = (unsigned long )9;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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

         
     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.3 세금계산1 에서 오류...");
          error_quit("작업실패...");
     }

/*===========================================================================
30.40   2003.12.02  강륜종   근로소득세액공제  0.45=>0.50 로 변경
31.00   2004.12.03  강륜종   근로소득세액공제  하드코딩 안하고 기준테이블에서 읽어 오도록 수정.(taxdedbrate)
============================================================================= */
/*  EXEC SQL
  update  pkhilduty a
  set  labtaxded= ceil(calctax * 0.45),
   intax    = floor((calctax - ceil(calctax * 0.45))/10) * 10
  EXEC SQL
  update  pkhilduty a
  set  labtaxded= ceil(calctax * 0.50),
   intax    = floor((calctax - ceil(calctax * 0.50))/10) * 10   
*/
  /* 3.3 세금계산2   근로소득세액공제  DSA2000  추가..*/
     /* EXEC SQL 
     select  taxdedbrate/100 
       into  :taxdedbrate
       from  pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (taxdedbrate/100) into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )782;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&taxdedbrate;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.3 세금계산2 근로소득세액공제율 읽기오류....");
          error_quit("작업실패...");
     }
      
     /* EXEC SQL
     update  pkhilduty a
        set  labtaxded= ceil(calctax * :taxdedbrate),
             intax    = floor((calctax - ceil(calctax * :taxdedbrate))/10) * 10
      where  orgnum   between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  dufrdate between :frdate and :todate
        and  upper(conyn) = 'Y'
        and  exists
                     (select  b.empno
                       from  pkhilhis b
                      where  a.empno = b.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkhilduty a  set labtaxded=ceil((calctax* :b0)),\
intax=(floor(((calctax-ceil((calctax* :b0)))/10))* 10) where ((((orgnum betwe\
en :b2 and :b3 and deptcode between :b4 and :b5) and dufrdate between :b6 and\
 :b7) and upper(conyn)='Y') and exists (select b.empno  from pkhilhis b where\
 (a.empno=b.empno and upper(batchpayyn)=:b8)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )801;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&taxdedbrate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&taxdedbrate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)frdate;
     sqlstm.sqhstl[6] = (unsigned long )9;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)todate;
     sqlstm.sqhstl[7] = (unsigned long )9;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[8] = (unsigned long )2;
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


     
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.3 세금계산2 에서 오류...");
          error_quit("작업실패...");
     }
     
     /* 3.3 세금계산3  */
     /* EXEC SQL
     update  pkhilduty a
        set  jutax  = floor((intax * 0.1 )/10) * 10
      where  orgnum   between :frorgnum and :toorgnum
        and  deptcode between :frdeptcode and :todeptcode
        and  dufrdate between :frdate and :todate
        and  upper(conyn) = 'Y'
        and  exists
                    (select  b.empno
                       from  pkhilhis b
                      where  a.empno = b.empno
                        and  upper(batchpayyn) = :batchpayyn); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkhilduty a  set jutax=(floor(((intax* 0.1)/10))\
* 10) where ((((orgnum between :b0 and :b1 and deptcode between :b2 and :b3) \
and dufrdate between :b4 and :b5) and upper(conyn)='Y') and exists (select b.\
empno  from pkhilhis b where (a.empno=b.empno and upper(batchpayyn)=:b6)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )852;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frorgnum;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toorgnum;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frdeptcode;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)todeptcode;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frdate;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)todate;
     sqlstm.sqhstl[5] = (unsigned long )9;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)batchpayyn;
     sqlstm.sqhstl[6] = (unsigned long )2;
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


                    
     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          print_errmsg(sqlca.sqlcode,"3.3 세금계산3 에서 오류...");
          error_quit("작업실패...");
     }  
}
/*************************************************************************/

/***************************************************************************
  print_errmsg  Function.
 ***************************************************************************/
void print_errmsg(int errcode, char *errmsg)
{
     printf(" [ERR_CODE] : (%d)\n", errcode);
     printf(" [ERR_POSITION] : (%s)\n",errmsg);
     
     /* EXEC SQL
     ROLLBACK WORK RELEASE; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )895;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}  

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =====================================*/
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
     sqlstm.offset = (unsigned int  )910;
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
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )951;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
