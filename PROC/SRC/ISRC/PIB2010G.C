
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
    "pib2010g.pc"
};


static unsigned int sqlctx = 148979;


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
   unsigned char  *sqhstv[10];
   unsigned long  sqhstl[10];
            int   sqhsts[10];
            short *sqindv[10];
            int   sqinds[10];
   unsigned long  sqharm[10];
   unsigned long  *sqharc[10];
   unsigned short  sqadto[10];
   unsigned short  sqtdso[10];
} sqlstm = {12,10};

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

 static char *sq0006 = 
"select value1  from pimvari where (gubun='B2' and sgubun>'0000')           ";

 static char *sq0017 = 
"select orgnum ,deptcode  from pihorga where (orgym=:b0 and gubun='0')      \
     ";

 static char *sq0020 = 
"select empno ,orgnum ,addeptcode ,anfrdate  from pihanno where (((((ancode \
in ('233','243') and orgnum=:b0) and anupdyn in ('Y','y')) and nvl(substr(add\
eptcode,1,2),'  ')<>'  ') and nvl(substr(antodate,1,8),'99991231')>=:b1) and \
addeptcode not  in (select deptcode  from pycdept where (orgnum=:b0 and nvl(s\
ubstr(closedate,1,8),'99991231')<:b1))) order by empno,anfrdate            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,43,0,1,178,0,0,0,0,0,1,0,
20,0,0,2,58,0,4,211,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
43,0,0,3,37,0,2,220,0,0,1,1,0,1,0,1,97,0,0,
62,0,0,4,328,0,3,236,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
93,0,0,5,74,0,4,276,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
116,0,0,6,75,0,9,292,0,0,0,0,0,1,0,
131,0,0,6,0,0,13,298,0,0,1,0,0,1,0,2,97,0,0,
150,0,0,6,0,0,15,302,0,0,0,0,0,1,0,
165,0,0,6,0,0,15,308,0,0,0,0,0,1,0,
180,0,0,7,98,0,5,313,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
207,0,0,6,0,0,15,327,0,0,0,0,0,1,0,
222,0,0,8,1334,0,3,344,0,0,9,9,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
273,0,0,9,83,0,4,428,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
296,0,0,10,153,0,5,439,0,0,1,1,0,1,0,1,97,0,0,
315,0,0,11,153,0,5,452,0,0,1,1,0,1,0,1,97,0,0,
334,0,0,12,161,0,5,464,0,0,1,1,0,1,0,1,97,0,0,
353,0,0,13,161,0,5,474,0,0,1,1,0,1,0,1,97,0,0,
372,0,0,14,160,0,5,483,0,0,1,1,0,1,0,1,97,0,0,
391,0,0,15,159,0,5,492,0,0,1,1,0,1,0,1,97,0,0,
410,0,0,16,159,0,5,501,0,0,1,1,0,1,0,1,97,0,0,
429,0,0,17,80,0,9,519,0,0,1,1,0,1,0,1,97,0,0,
448,0,0,17,0,0,13,525,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
471,0,0,17,0,0,15,530,0,0,0,0,0,1,0,
486,0,0,17,0,0,15,535,0,0,0,0,0,1,0,
501,0,0,18,230,0,4,544,0,0,10,3,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
556,0,0,19,176,0,5,577,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
611,0,0,17,0,0,15,594,0,0,0,0,0,1,0,
626,0,0,17,0,0,15,600,0,0,0,0,0,1,0,
641,0,0,20,381,0,9,629,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
672,0,0,20,0,0,13,635,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
703,0,0,20,0,0,15,643,0,0,0,0,0,1,0,
718,0,0,20,0,0,15,648,0,0,0,0,0,1,0,
733,0,0,21,287,0,4,654,0,0,6,5,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
772,0,0,20,0,0,15,674,0,0,0,0,0,1,0,
787,0,0,22,183,0,4,689,0,0,9,2,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,1,97,0,0,1,97,0,0,
838,0,0,20,0,0,15,712,0,0,0,0,0,1,0,
853,0,0,23,0,0,29,722,0,0,0,0,0,1,0,
868,0,0,24,190,0,5,724,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
923,0,0,20,0,0,15,744,0,0,0,0,0,1,0,
938,0,0,25,108,0,5,749,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
961,0,0,20,0,0,15,759,0,0,0,0,0,1,0,
976,0,0,26,392,0,5,767,0,0,1,1,0,1,0,1,97,0,0,
995,0,0,27,67,0,5,786,0,0,1,1,0,1,0,1,97,0,0,
1014,0,0,28,50,0,3,798,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
1055,0,0,29,0,0,29,812,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/******************************************************************************
    * 조직도생성 (pib2010g)  Select * From pihorga Where orgym=To_Char(Sysdate,'YYYYMM');*
    * Date   : 96/10/28                                                          *
    * Author : Kim.D.C                                                           * 
    *  UPDATE                                                                    *
    *  1.01   2000.10.20  강기우  코드변경. --조직개편.                          *
    *  1.02   2001.11.15  서혜미  겸직,겸직해제 여러번 발령시 발령일로 비교.     *
    *  1.03   2004.02.10  이민용  자체 개선   오라클 8버전 upgrade관련           *
    *  1.04   2004.09.10  이민용  자체 개선   크론에 매월 1일날 작업하도록 등록  *
    *  *) HR 인프라 고도화 Project(직위-> 직책, 직급 -> BAND(비공개))            *
 ******************************************************************************/
#include <string.h> 
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

#define  FAIL      -2

/*----------------------------------------------*
 * Current data save & Condition save Variable  *
 *----------------------------------------------*/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char   orgym[7];      /* 기준년월 */
     char   gubun[2];      /* 자료구분 0 - 조직(관리자 <= 보임자), 1 - 사원*/
     char   orgnum[4];     /* 조직차수 */
     char   deptcode[7];   /* 부서코드 */
     char   empno[5];      /* 사  번 */
     char   korname[13];   /* 성  명 */
     char   deptlevel[3];  /* 부서등급 */
     char   deptname[61];  /* 부서명 */
     char   deptabbr[31];  /* 부서요약명 */
     char   extcode[7];    /* 상위부서코드 */
     char   boncode[7];    /* 본부코드 */
     char   paycl[4];      /* BAND */
     char   payclnm[21];   /* BAND명 */
     char   payra[4];      /* 직  책 */
     char   payranm[21];   /* 직책명 */
     char   payrayn[2];    /* 보임여부 */
     char   adpayrayn[2];  /* 겸직여부 */
     char   pstate[3];     /* 인사상태 */
     char   lineyn[2];     /* LINE출력여부 */
     char   writetime[16]; /* 최종작업일시 */
     char   jobempno[5];   /* 작업자사번 */
     char   inorgym[7];    /* 작업년월 */
     char   inorgnum[4];   /* 현조직차수 */
     char   value1[21];
     char   anfrdate[8];
     
     double check_count;   /* 자료건수 COUNT */
     char   cur_date[9];   /* 현재일자 */
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


double create_count0, create_count1;
char   tmp_msg[100];

/******************************************
 *   MAIN PROCESSING START !!!!!!      *
 ******************************************/
char    log_rundate[15]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno               = 0;  
 
main(argc,argv)
int argc; 
char *argv[];
{ 
     char c_count0[8], c_count1[8];
   
     char *FL_date;
     char FL_dir[255];
     char FL_Line[255];
     char FL_file[255];
     
     STRINIT(FL_file);
     strcpy(FL_file,"pib2010g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     hinsa_log_print(0,"조직도 생성 프로그램 시작...");
     
     hinsa_db_connect();
   
     init_variable();
   
     /*sprintf(command, "/hper/insa/HINSA/proc/bin/Ibin/pib2010g 'D006' '201812' 'H23' '20181218000000' );*/

     strcpy(jobempno,     argv[1]);  /* 작업자사번*/
     strcpy(inorgym,      argv[2]);  /* 작업년월  */
     strcpy(inorgnum,     argv[3]);  /* 현조직차수*/
     strcpy(log_rundate,  argv[4]);  /* 작업일시  */
     strcpy(log_writeman, argv[1]);
     strcpy(log_progid,   argv[0]);
     
     printf("jobempno     => [%s]\n", jobempno    );
     printf("inorgym      => [%s]\n", inorgym     );
     printf("inorgnum     => [%s]\n", inorgnum    );
     printf("argv4        => [%s]\n", argv[4]    );
     printf("log_rundate  => [%s]\n", log_rundate );
     printf("log_writeman => [%s]\n", log_writeman);
     printf("log_progid   => [%s]\n", log_progid  );
     
     /* EXEC SQL DECLARE log_db DATABASE; */ 
 
     hinsa_log_db_connect();           
   
     data_process();    /* 작업을 처리한다 */
   
     update_pimvari();  /* 작업년월을 경신 */
     
     sprintf(tmp_msg, "OK 작업완료 ==> 조직[%6.0f], 인사[%6.0f]",create_count0, create_count1);      
           
     Write_batlog(seqno++, tmp_msg);
     
     hinsa_exit(0,tmp_msg);
}

/*----------------------------------------------*
 * Current data & Condition Variable Initialize *
 *----------------------------------------------*/
init_variable()
{ 
     memset(orgym,     0x00,  sizeof(orgym)); 
     memset(gubun,     0x00,  sizeof(gubun)); 
     memset(orgnum,    0x00,  sizeof(orgnum));
     memset(deptcode,  0x00,  sizeof(deptcode));
     memset(empno,     0x00,  sizeof(empno));
     memset(korname,   0x00,  sizeof(korname));
     memset(deptlevel, 0x00,  sizeof(deptlevel));
     memset(deptname,  0x00,  sizeof(deptname));
     memset(deptabbr,  0x00,  sizeof(deptabbr));
     memset(extcode,   0x00,  sizeof(extcode));
     memset(boncode,   0x00,  sizeof(boncode));
     memset(paycl,     0x00,  sizeof(paycl));
     memset(payclnm,   0x00,  sizeof(payclnm));
     memset(payra,     0x00,  sizeof(payra));
     memset(payranm,   0x00,  sizeof(payranm));
     memset(payrayn,   0x00,  sizeof(payrayn));
     memset(adpayrayn, 0x00,  sizeof(adpayrayn));
     memset(pstate,    0x00,  sizeof(pstate));
     memset(lineyn,    0x00,  sizeof(lineyn));
     
     memset(writetime, 0x00,  sizeof(writetime));
     memset(jobempno,  0x00,  sizeof(jobempno));
     memset(inorgym,   0x00,  sizeof(inorgym));
     memset(inorgnum,  0x00,  sizeof(inorgnum));
     memset(value1,    0x00,  sizeof(value1));
     memset(anfrdate,  0x00,  sizeof(anfrdate));
     check_count = 0;
     create_count0 = create_count1 = 0;
     memset(tmp_msg,   0x00,  sizeof(tmp_msg));
   
     memset(cur_date,  0x00,  sizeof(cur_date));
}

/****************************************
 *    Data process  routine     *
 ****************************************/
data_process()
{
     char *FL_date;
     
     /* EXEC SQL LOCK TABLE  pihorga
                      IN  EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE pihorga IN EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"다른 작업자가 DB수정 작업중입니다.");
   
     FL_date = hinsa_sys_date(1);
     STRINIT(cur_date);
     strcpy(cur_date, FL_date);
     
     delete_pihorga();     /* 기존재자료 DELETE */
                           
     insert_pihorga0();    /* 조직자료 INSERT */
                           
     update_lineyn();      /* LINE출력여부를 수정 */
                           
     insert_pihorga1();    /* 인사자료 INSERT */
                           
     update_payclnm();     /* BAND명을 수정 */
                           
     update_payranm();     /* 직위명을 수정 */
                           
     update_dept();        /* 부서등급, 부서명, 요약명등을 수정 */
                           
     update_payrayn();     /* 조직의 보임자를 수정 */
                           
     process_adpayrayn();  /* 겸직자를 처리 */
     
     process_deptdiffer(); /* 2018.12.27. Add 소속부서와 근무부서의 성격이 다르면 Y로 업데이트 : MyHR 요청 dsa2000*/
}

delete_pihorga()
{
     check_count = 0;
     /* EXEC SQL 
     SELECT count(orgym)  INTO  :check_count
       FROM  pihorga
      WHERE  orgym = :inorgym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(orgym) into :b0  from pihorga where orgym=\
:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&check_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)inorgym;
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



     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Select Error(Delete) !");
   
     if  (check_count == 0)       return; /* 지울자료가 없으니까 */
   
     /* EXEC SQL 
     DELETE FROM  pihorga  WHERE  orgym = :inorgym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pihorga  where orgym=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )43;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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


     
     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Delete Error !");
}

insert_pihorga0()
{
     char *FL_date;
   
     hinsa_trim(deptname);
     
     FL_date = hinsa_sys_date(0);
     STRINIT(writetime);
     strcpy(writetime, FL_date);
     
     /* EXEC SQL 
     INSERT  INTO  pihorga
                 ( orgym, 
                   gubun, 
                   orgnum, 
                   deptcode, 
                   deptlevel,
                   deptname, 
                   deptabbr, 
                   extcode, 
                   boncode,
                   payrayn, 
                   adpayrayn, 
                   lineyn,
                   writetime, 
                   writeemp,
                   deptdiffer)  /o2018.12.26 소속부서와 근무부서의 부서성격이 다르면 Y : MyHR통계 위해 생성o/
           SELECT  :inorgym,
                   '0',
                   orgnum, 
                   deptcode, 
                   deptlevel,
                   deptname, 
                   deptna3, 
                   extcode, 
                   boncode, /o deptabbr -> deptna3 shm 2002.01.31o/
                   'N', 
                   'N', 
                   'Y',
                   :writetime, 
                   :jobempno,
                   'N'
             FROM  pycdept
            WHERE  (orgnum = :inorgnum)
              AND  (existon = '1')  
              AND  (chanmode != '3'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pihorga (orgym,gubun,orgnum,deptcode,deptle\
vel,deptname,deptabbr,extcode,boncode,payrayn,adpayrayn,lineyn,writetime,writ\
eemp,deptdiffer)select :b0 ,'0' ,orgnum ,deptcode ,deptlevel ,deptname ,deptn\
a3 ,extcode ,boncode ,'N' ,'N' ,'Y' ,:b1 ,:b2 ,'N'  from pycdept where ((orgn\
um=:b3 and existon='1') and chanmode<>'3')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )62;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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
     sqlstm.sqhstv[2] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)inorgnum;
     sqlstm.sqhstl[3] = (unsigned long )4;
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



     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Insert Error(0) !");

     create_count0 = 0;  /* 조직 저장건수를 계산 */
     /* EXEC SQL 
     SELECT count(orgym)  INTO  :create_count0
       FROM pihorga
      WHERE orgym = :inorgym 
        AND gubun = '0'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(orgym) into :b0  from pihorga where (orgym\
=:b1 and gubun='0')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )93;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&create_count0;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)inorgym;
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


        
     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Count Error(0) !"); 
}

update_lineyn()    /* LINE출력여부를 수정 */
{
     /* EXEC SQL DECLARE c1 cursor for
               SELECT  value1
                 FROM   pimvari
                WHERE  gubun = 'B2' AND sgubun > '0000'; */ 


     /* EXEC SQL  open c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0006;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )116;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0)
            hinsa_exit(0,"Cursor Open c1"); 
     for( ; ; )
     {
          /* EXEC SQL FETCH c1 INTO
                  :value1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )131;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)value1;
          sqlstm.sqhstl[0] = (unsigned long )21;
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
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )150;
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
               printf("=====[%d]\n",sqlca.sqlcode);                   
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )165;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Data Fetch c1");
          }
          hinsa_trim(value1);

          /* EXEC SQL 
          UPDATE pihorga
             SET lineyn   = 'N'
           WHERE orgym    = :inorgym
             AND gubun    = '0'  
             AND orgnum   = :inorgnum
             AND deptcode = :value1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pihorga  set lineyn='N' where (((orgym=:b0 \
and gubun='0') and orgnum=:b1) and deptcode=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )180;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)inorgnum;
          sqlstm.sqhstl[1] = (unsigned long )4;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)value1;
          sqlstm.sqhstl[2] = (unsigned long )21;
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



          printf("=inorgym =>[%s]\n",inorgym);                   
          printf("=inorgnum=>[%s]\n",inorgnum);                   
          printf("=value1  =>[%s]\n",value1);
          
          if  (sqlca.sqlcode != 0)
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )207;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Update Pihorga Error(Line) !");
          }
     }
}

insert_pihorga1()  /* 인사자료를 Insert */
{
     char *FL_date; 
        
     FL_date = hinsa_sys_date(0);
     STRINIT(writetime);
     strcpy(writetime, FL_date);

     hinsa_trim(korname);
     hinsa_trim(payra);

     /* EXEC SQL 
     INSERT INTO  pihorga
                ( orgym, 
                  gubun, 
                  orgnum, 
                  deptcode, 
                  empno, 
                  korname,
                  paycl, 
                  payra, 
                  payrayn, 
                  adpayrayn, 
                  pstate,
                  writetime, 
                  writeemp)
     /o2018.12.17  겸직/겸무/파견 부서코드도 조직도 생성토록 수정 dsa2000o/
     /oSELECT :inorgym, '1', orgnum, deptcode, empno, korname, paycl, payra, payrayn, 'N', pstate,:writetime, :jobempno FROM pimpmas WHERE (pstate < '80'); o/
           Select :inorgym,
                  '1' Gubun,  --인사마스터 소속기준
                  Orgnum, 
                  Deptcode,
                  Empno, 
                  Korname,
                  Paycl, 
                  Payra, 
                  Payrayn, 
                  'N', 
                  Pstate,
                  :writetime, 
                  :jobempno
             From Pimpmas
            Where Pstate < '80'
           Union
           Select :inorgym,
                  '1' Gubun,  --인사마스터 근무기준
                  Orgnum, 
                  Jobdept, 
                  Empno, 
                  Korname,
                  Paycl, 
                  Case when Payra in ('D51','H11','K11') then Payra Else JobPayra End, 
                  Decode(Deptcode,Jobdept,Payrayn,Jobpayrayn) Payrayn,
                  'N',
                  Pstate,
                  :writetime, 
                  :jobempno
             From Pimpmas
            Where Pstate < '80'
           Union
           Select :inorgym,
                  '2' Gubun,  --발령 겸직겸무
                  Orgnum, 
                  Addeptcode, 
                  Empno, 
                  Korname,
                  Paycl, 
                  Adpayra, 
                  Case When (Adpayra<>'C12' And Adpayra<='C20') Then 'Y' Else 'N' End Payrayn,
                  'N',
                  '10' Pstate,
                  :writetime, 
                  :jobempno                        
             From Pihanno M
            Where Anupdyn  = 'Y'                    
              And Orgnum = (Select Value1 From Pimvari Where Gubun ='00' And Sgubun = '0001')         
              And Anfrdate   >= '20181101'  
              And Nvl(Antodate, '99999999') >= To_Char(Sysdate, 'YYYYMMDD')               
              And Ancode In ('233', '234')
              And Nvl(Addeptcode,' ') > '     '
              And Not Exists(Select 1 From Pihanno B Where M.Empno = B.Empno 
                                                       And B.Anupdyn = 'Y'
                                                       And B.Orgnum = (Select Value1 From Pimvari Where Gubun ='00' And Sgubun = '0001')         
                                                       And B.Anfrdate >= '20181101'      
                                                       And M.Anfrdate < B.Anfrdate 
                                                       And B.Ancode =Decode(M.Ancode,'233','238','234', '235','')  
                                                       And Nvl(M.Addeptcode,' ')= Nvl(B.Addeptcode,' ')
                                                       And Nvl(M.Adpayra,' ')   = Nvl(B.Adpayra,' ')); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into pihorga (orgym,gubun,orgnum,deptcode,empno,korname,paycl\
,payra,payrayn,adpayrayn,pstate,writetime,writeemp)select :b0 ,'1' Gubun ,Or\
gnum ,Deptcode ,Empno ,Korname ,Paycl ,Payra ,Payrayn ,'N' ,Pstate ,:b1 ,:b2\
  from Pimpmas where Pstate<'80' union select :b0 ,'1' Gubun ,Orgnum ,Jobdep\
t ,Empno ,Korname ,Paycl , case  when Payra in ('D51','H11','K11') then Payr\
a else JobPayra  end  ,Decode(Deptcode,Jobdept,Payrayn,Jobpayrayn) Payrayn ,\
'N' ,Pstate ,:b1 ,:b2  from Pimpmas where Pstate<'80' union select :b0 ,'2' \
Gubun ,Orgnum ,Addeptcode ,Empno ,Korname ,Paycl ,Adpayra , case  when (Adpa\
yra<>'C12' and Adpayra<='C20') then 'Y' else 'N'  end  Payrayn ,'N' ,'10' Ps\
tate ,:b1 ,:b2  from Pihanno M where ((((((Anupdyn='Y' and Orgnum=(select Va\
lue1  from Pimvari where (Gubun='00' and Sgubun='0001'))) and Anfrdate>='201\
81101') and Nvl(Antodate,'99999999')>=To_Char(Sysdate,'YYYYMMDD')) and Ancod\
e in ('233','234')) and Nvl(Addeptcode,' ')>'     ') and  not exists (select\
 1  from Pihanno B where (((((((M.Empno=B.Em");
     sqlstm.stmt = "pno and B.Anupdyn='Y') and B.Orgnum=(select Value1  fro\
m Pimvari where (Gubun='00' and Sgubun='0001'))) and B.Anfrdate>='20181101') \
and M.Anfrdate<B.Anfrdate) and B.Ancode=Decode(M.Ancode,'233','238','234','23\
5','')) and Nvl(M.Addeptcode,' ')=Nvl(B.Addeptcode,' ')) and Nvl(M.Adpayra,' \
')=Nvl(B.Adpayra,' '))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )222;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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
     sqlstm.sqhstv[2] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)inorgym;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)writetime;
     sqlstm.sqhstl[4] = (unsigned long )16;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[5] = (unsigned long )5;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)inorgym;
     sqlstm.sqhstl[6] = (unsigned long )7;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)writetime;
     sqlstm.sqhstl[7] = (unsigned long )16;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[8] = (unsigned long )5;
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


     /*2018.12.17 end.....................................*/
     
     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Insert Error(11) !");
     /**********************************************************************/
     
     create_count1 = 0;  /* 인사저장건수를 계산 */

     /* EXEC SQL 
     SELECT count(orgym)  INTO  :create_count1
       FROM pihorga
      WHERE orgym = :inorgym AND gubun in ('1','2'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(orgym) into :b0  from pihorga where (orgym\
=:b1 and gubun in ('1','2'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )273;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&create_count1;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)inorgym;
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

 /*AND gubun = '1';*/
      
     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Count Error(1) !"); 
}

update_payclnm()  /* BAND명을 수정 */
{
     hinsa_trim(payclnm);
     /* EXEC SQL 
     UPDATE pihorga h 
        set payclnm = (SELECT codename FROM pyccode c
                        WHERE c.codeid = 'I112' 
                          AND c.codeno = h.paycl)
      WHERE h.orgym = :inorgym AND h.gubun in ('1','2'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihorga h  set payclnm=(select codename  from py\
ccode c where (c.codeid='I112' and c.codeno=h.paycl)) where (h.orgym=:b0 and \
h.gubun in ('1','2'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )296;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

 /*AND h.gubun = '1';*/
      
     if  (sqlca.sqlcode != 0)      hinsa_exit(0,"Pihorga Update Error(payclnm) !"); 
}

update_payranm()  /* 직책명을 수정 */
{
     hinsa_trim(payranm);
     /* EXEC SQL 
     UPDATE pihorga h 
        set payranm = (SELECT codename FROM pyccode c
                        WHERE c.codeid = 'I113' 
                          AND c.codeno = h.payra)
      WHERE h.orgym = :inorgym AND h.gubun in ('1','2'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihorga h  set payranm=(select codename  from py\
ccode c where (c.codeid='I113' and c.codeno=h.payra)) where (h.orgym=:b0 and \
h.gubun in ('1','2'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )315;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

 /*AND h.gubun = '1';*/
      
      if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Update Error(payranm) !"); 
}

update_dept()    /* 부서등급, 부서명, 요약명등을 수정 */
{
     /* EXEC SQL 
     UPDATE pihorga h
        SET deptlevel = (SELECT deptlevel FROM pycdept c  /o 부서등급 o/
                          WHERE c.orgnum   = h.orgnum 
                            AND c.deptcode = h.deptcode)
      WHERE h.orgym = :inorgym  AND gubun in ('1','2'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihorga h  set deptlevel=(select deptlevel  from\
 pycdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgy\
m=:b0 and gubun in ('1','2'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )334;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

   /*AND h.gubun = '1';*/
        
      if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Update Error(deptlevel) !");

      hinsa_trim(deptname);
      /* EXEC SQL 
      UPDATE pihorga h 
         SET deptname = (SELECT deptname FROM pycdept c  /o 부서명 o/
                          WHERE c.orgnum   = h.orgnum 
                            AND c.deptcode = h.deptcode) 
       WHERE h.orgym = :inorgym AND h.gubun in ('1','2'); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 9;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update pihorga h  set deptname=(select deptname  from \
pycdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym\
=:b0 and h.gubun in ('1','2'))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )353;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

  /*AND h.gubun = '1';*/
       
      if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Update Error(deptname) !");

      /* EXEC SQL 
      UPDATE pihorga h 
         SET deptabbr = (SELECT deptna3 FROM pycdept c /o 부서요약명 o//o deptabbr -> deptna3 shm 2002.01.31o/
                          WHERE c.orgnum   = h.orgnum 
                            AND c.deptcode = h.deptcode)
       WHERE h.orgym = :inorgym AND h.gubun in ('1','2'); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 9;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update pihorga h  set deptabbr=(select deptna3  from p\
ycdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym=\
:b0 and h.gubun in ('1','2'))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )372;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

  /*AND h.gubun = '1';*/
       
      if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Update Error(deptabbr) !");

      /* EXEC SQL 
      UPDATE pihorga h 
         SET extcode = (SELECT extcode FROM pycdept c /o 상위부서코드 o/
                         WHERE c.orgnum   = h.orgnum 
                           AND c.deptcode = h.deptcode)
       WHERE h.orgym = :inorgym AND h.gubun in ('1','2'); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 9;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update pihorga h  set extcode=(select extcode  from py\
cdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym=:\
b0 and h.gubun in ('1','2'))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )391;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

  /*AND h.gubun = '1';*/

      if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Update Error(extcode) !");

      /* EXEC SQL 
      UPDATE pihorga h 
         SET boncode = (SELECT boncode FROM pycdept c /o 본부코드 o/
                         WHERE c.orgnum   = h.orgnum 
                           AND c.deptcode = h.deptcode)
       WHERE h.orgym = :inorgym AND h.gubun in ('1','2'); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 9;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update pihorga h  set boncode=(select boncode  from py\
cdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym=:\
b0 and h.gubun in ('1','2'))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )410;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

  /*AND h.gubun = '1';*/
      
      if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Pihorga Update Error(boncode) !");
}

update_payrayn()  /* 조직의 보임자를 수정 */
{
     /* EXEC SQL DECLARE c2 cursor for
               SELECT orgnum, deptcode
                 FROM pihorga
                WHERE orgym = :inorgym 
                  AND gubun = '0'; */ 


     /* EXEC SQL open c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0017;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )429;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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



     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Cursor Open c2"); 

     for( ; ; )
     {
          /* EXEC SQL FETCH c2 INTO
                   :orgnum, :deptcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )448;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[0] = (unsigned long )4;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)deptcode;
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
               /* EXEC SQL close c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )471;
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
               /* EXEC SQL close c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )486;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Data Fetch c2");
          }
          hinsa_trim(deptcode);
          hinsa_trim(korname);
          hinsa_trim(payclnm);
          hinsa_trim(payra);
          hinsa_trim(payranm);

          /* EXEC SQL 
          SELECT  empno, 
                  korname, 
                  paycl, 
                  payclnm, 
                  payra, 
                  payranm, 
                  pstate
            INTO  :empno, 
                  :korname, 
                  :paycl, 
                  :payclnm, 
                  :payra, 
                  :payranm, 
                  :pstate
            FROM  pihorga
           WHERE  orgym    = :inorgym 
             AND  gubun in ('1','2')  /oAND gubun = '1'o/
             AND  pstate   < '60' 
             AND  orgnum   = :orgnum 
             AND  deptcode = :deptcode
             AND  payrayn in ('Y', 'y'); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select empno ,korname ,paycl ,payclnm ,payra ,payr\
anm ,pstate into :b0,:b1,:b2,:b3,:b4,:b5,:b6  from pihorga where (((((orgym=:\
b7 and gubun in ('1','2')) and pstate<'60') and orgnum=:b8) and deptcode=:b9)\
 and payrayn in ('Y','y'))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )501;
          sqlstm.selerr = (unsigned short)0;
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
          sqlstm.sqhstv[1] = (unsigned char  *)korname;
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)paycl;
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)payclnm;
          sqlstm.sqhstl[3] = (unsigned long )21;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)payra;
          sqlstm.sqhstl[4] = (unsigned long )4;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)payranm;
          sqlstm.sqhstl[5] = (unsigned long )21;
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
          sqlstm.sqhstv[7] = (unsigned char  *)inorgym;
          sqlstm.sqhstl[7] = (unsigned long )7;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)orgnum;
          sqlstm.sqhstl[8] = (unsigned long )4;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[9] = (unsigned long )7;
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


/*
             AND  (paycl = '00' OR payrayn in ('Y', 'y'));
*/

          if  (sqlca.sqlcode == 1403)     hinsa_trim(deptcode);     /* 자료가 없을때 *//* 심심하니까 그냥 */
          else if (sqlca.sqlcode == 0)  /* 자료가 1건 */
          {
               hinsa_trim(korname);
               hinsa_trim(payclnm);
               hinsa_trim(payra);
               hinsa_trim(payranm);
               /* EXEC SQL 
               UPDATE  pihorga
                  SET  empno    = :empno, 
                       korname  = :korname,
                       paycl    = :paycl, 
                       payclnm  = :payclnm,
                       payra    = :payra, 
                       payranm  = :payranm,
                       pstate   = :pstate, 
                       payrayn  = 'Y'
                WHERE  orgym    = :inorgym 
                  AND  gubun    = '0' 
                  AND  orgnum   = :orgnum 
                  AND  deptcode = :deptcode; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 10;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update pihorga  set empno=:b0,korname=:b1,pay\
cl=:b2,payclnm=:b3,payra=:b4,payranm=:b5,pstate=:b6,payrayn='Y' where (((orgy\
m=:b7 and gubun='0') and orgnum=:b8) and deptcode=:b9)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )556;
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
               sqlstm.sqhstv[1] = (unsigned char  *)korname;
               sqlstm.sqhstl[1] = (unsigned long )13;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)paycl;
               sqlstm.sqhstl[2] = (unsigned long )4;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)payclnm;
               sqlstm.sqhstl[3] = (unsigned long )21;
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)payra;
               sqlstm.sqhstl[4] = (unsigned long )4;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)payranm;
               sqlstm.sqhstl[5] = (unsigned long )21;
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
               sqlstm.sqhstv[7] = (unsigned char  *)inorgym;
               sqlstm.sqhstl[7] = (unsigned long )7;
               sqlstm.sqhsts[7] = (         int  )0;
               sqlstm.sqindv[7] = (         short *)0;
               sqlstm.sqinds[7] = (         int  )0;
               sqlstm.sqharm[7] = (unsigned long )0;
               sqlstm.sqadto[7] = (unsigned short )0;
               sqlstm.sqtdso[7] = (unsigned short )0;
               sqlstm.sqhstv[8] = (unsigned char  *)orgnum;
               sqlstm.sqhstl[8] = (unsigned long )4;
               sqlstm.sqhsts[8] = (         int  )0;
               sqlstm.sqindv[8] = (         short *)0;
               sqlstm.sqinds[8] = (         int  )0;
               sqlstm.sqharm[8] = (unsigned long )0;
               sqlstm.sqadto[8] = (unsigned short )0;
               sqlstm.sqtdso[8] = (unsigned short )0;
               sqlstm.sqhstv[9] = (unsigned char  *)deptcode;
               sqlstm.sqhstl[9] = (unsigned long )7;
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


                  
               if  (sqlca.sqlcode != 0)
               {
                    /* EXEC SQL close c2; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 10;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )611;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    hinsa_exit(0,"Update Pihorga Error(payrayn) !");
               }
          }
          else    /* 그외의 모든경우는 에러 */
          {
               /* EXEC SQL close c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 10;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )626;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               sprintf(tmp_msg, "보임자오류 ==> [%s][%s]",orgnum, deptcode);
               Write_batlog(seqno++, tmp_msg);
               hinsa_exit(0,tmp_msg);
          }
     }
}

process_adpayrayn()  /* 겸직자를 처리 */
{
/*   char tmp_date[9];
     sprintf(anfrdate, "%08.0f", atof(tmp_date) - 10000);*/

     /* EXEC SQL DECLARE  c3 cursor for    /o 겸직발령자료를 찾는다 o/
               SELECT  empno, 
                       orgnum, 
                       addeptcode, 
                       anfrdate /oanfrdate 추가 2001.11.15 shmo/
                 FROM  pihanno
                WHERE  ancode in ('233','243')     /o AND anfrdate >= :anfrdate o/
                  AND  orgnum = :inorgnum 
                  AND  anupdyn in ('Y', 'y')
                  AND  nvl(substr(addeptcode, 1, 2), '  ')     != '  '
                  AND  nvl(substr(antodate, 1, 8), '99991231') >= :cur_date
                  and  addeptcode not in (select deptcode from pycdept 
                                           where orgnum = :inorgnum 
                                             and nvl(substr(closedate, 1, 8), '99991231') < :cur_date)
                ORDER  BY  empno, anfrdate; */ 


     /* EXEC SQL  open c3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0020;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )641;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgnum;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)cur_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)inorgnum;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)cur_date;
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



     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Cursor Open c3"); 

     for( ; ; )
     {
          /* EXEC SQL FETCH c3 INTO
               :empno, 
               :orgnum, 
               :deptcode, 
               :anfrdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )672;
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
          sqlstm.sqhstv[3] = (unsigned char  *)anfrdate;
          sqlstm.sqhstl[3] = (unsigned long )8;
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

 /*anfrdate 추가 2001.11.15 shm */

          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 10;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )703;
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
               /* EXEC SQL close c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 10;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )718;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"Data Fetch c3");
          }
          hinsa_trim(deptcode);
          check_count = 0;
          
          /* EXEC SQL 
          SELECT  sum(empno)  /o 겸직해제 관련자료를 찾자 o/
            INTO  :check_count
            FROM (SELECT count(empno) empno
                    FROM pihanno
                   WHERE empno      = :empno  
                     AND ancode in ('238', '248') 
                     AND orgnum     = :inorgnum     /o 현조직차수 겸직발령만 o/
                     AND anfrdate   >= :anfrdate /o 같은부서 여러번 겸직,겸직해제시 발령일로 비교 2001.11.15 shm o/
                     AND anupdyn in ('Y', 'y')
                     AND addeptcode = :deptcode
                  UNION
                  SELECT count(empno) empno 
                    FROM pimpmas 
                   WHERE pstate     >= '60'
                     AND empno      = :empno
                 ); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select sum(empno) into :b0  from (select count(emp\
no) empno  from pihanno where (((((empno=:b1 and ancode in ('238','248')) and\
 orgnum=:b2) and anfrdate>=:b3) and anupdyn in ('Y','y')) and addeptcode=:b4)\
 union select count(empno) empno  from pimpmas where (pstate>='60' and empno=\
:b1)) ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )733;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&check_count;
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
          sqlstm.sqhstv[2] = (unsigned char  *)inorgnum;
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)anfrdate;
          sqlstm.sqhstl[3] = (unsigned long )8;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)deptcode;
          sqlstm.sqhstl[4] = (unsigned long )7;
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
          sqlstm.sqphsv = sqlstm.sqhstv;
          sqlstm.sqphsl = sqlstm.sqhstl;
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
               /* EXEC SQL close c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 10;
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


               hinsa_exit(0,"Pihanno Select Error !");
          }
          if  (check_count == 0)  /* 겸직해제 발령이 없으면 */
               update_adpayrayn();      
     }
}

update_adpayrayn()  /* 겸직자를 수정 */
{
     hinsa_trim(korname);
     hinsa_trim(payclnm);
     hinsa_trim(payra);
     hinsa_trim(payranm);
     
     /* EXEC SQL /o 겸직자 사항을 읽어온다 o/
     SELECT  empno, 
             korname,   
             paycl, 
             payclnm, 
             payra, 
             payranm, 
             pstate
        INTO :empno, 
             :korname, 
             :paycl, 
             :payclnm, 
             :payra, 
             :payranm, 
             :pstate
        FROM pihorga
       WHERE orgym  = :inorgym 
         AND gubun in ('1','2')   /oAND gubun = '1';o/
         AND pstate < '60' 
         AND empno  = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select empno ,korname ,paycl ,payclnm ,payra ,payranm ,\
pstate into :b0,:b1,:b2,:b3,:b4,:b5,:b6  from pihorga where (((orgym=:b7 and \
gubun in ('1','2')) and pstate<'60') and empno=:b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )787;
     sqlstm.selerr = (unsigned short)0;
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
     sqlstm.sqhstv[1] = (unsigned char  *)korname;
     sqlstm.sqhstl[1] = (unsigned long )13;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)paycl;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)payclnm;
     sqlstm.sqhstl[3] = (unsigned long )21;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)payra;
     sqlstm.sqhstl[4] = (unsigned long )4;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)payranm;
     sqlstm.sqhstl[5] = (unsigned long )21;
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
     sqlstm.sqhstv[7] = (unsigned char  *)inorgym;
     sqlstm.sqhstl[7] = (unsigned long )7;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)empno;
     sqlstm.sqhstl[8] = (unsigned long )5;
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
          /* EXEC SQL close c3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )838;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          printf("\n 겸직자인사사항오류");
          sprintf(tmp_msg, "겸직자인사사항오류 ==> [%4s]", empno);
          hinsa_exit(0,tmp_msg);
     }

     hinsa_trim(korname);
     hinsa_trim(payclnm);
     hinsa_trim(payra);
     hinsa_trim(payranm);
     /* exec sql commit; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )853;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* EXEC SQL 
     UPDATE pihorga  /o 겸직자 사항을 수정 o/
        SET empno     = :empno, 
            korname   = :korname,
            paycl     = :paycl, 
            payclnm   = :payclnm,
            payra     = :payra, 
            payranm   = :payranm,
            pstate    = :pstate, 
            payrayn   = 'Y', 
            adpayrayn = 'Y'
      WHERE orgym     = :inorgym 
        AND gubun     = '0' 
        AND orgnum    = :orgnum 
        AND deptcode  = :deptcode; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihorga  set empno=:b0,korname=:b1,paycl=:b2,pay\
clnm=:b3,payra=:b4,payranm=:b5,pstate=:b6,payrayn='Y',adpayrayn='Y' where (((\
orgym=:b7 and gubun='0') and orgnum=:b8) and deptcode=:b9)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )868;
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
     sqlstm.sqhstv[1] = (unsigned char  *)korname;
     sqlstm.sqhstl[1] = (unsigned long )13;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)paycl;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)payclnm;
     sqlstm.sqhstl[3] = (unsigned long )21;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)payra;
     sqlstm.sqhstl[4] = (unsigned long )4;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)payranm;
     sqlstm.sqhstl[5] = (unsigned long )21;
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
     sqlstm.sqhstv[7] = (unsigned char  *)inorgym;
     sqlstm.sqhstl[7] = (unsigned long )7;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)orgnum;
     sqlstm.sqhstl[8] = (unsigned long )4;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)deptcode;
     sqlstm.sqhstl[9] = (unsigned long )7;
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


     /* AND  payrayn in ('N', 'n') ;*/
        
        
     if  (sqlca.sqlcode != 0)
     {
          /* EXEC SQL close c3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )923;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          sprintf(tmp_msg, "겸직자인사사항수정 ==> [%s][%s][%s][%s]",empno, inorgym, orgnum, deptcode);
          hinsa_exit(0,tmp_msg);
     }

     /* EXEC SQL 
     UPDATE pihorga
        SET adpayrayn = 'Y'
      WHERE orgym     = :inorgym 
        AND gubun in ('1','2')   /oAND gubun = '1';o/
        AND pstate    < '60' 
        AND empno     = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihorga  set adpayrayn='Y' where (((orgym=:b0 an\
d gubun in ('1','2')) and pstate<'60') and empno=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )938;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
     sqlstm.sqhstl[0] = (unsigned long )7;
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
     {
          /* EXEC SQL close c3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )961;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          sprintf(tmp_msg, "겸직여부수정오류 ==> [%s]", empno);
          hinsa_exit(0,tmp_msg);
     }
}

process_deptdiffer() /* 2018.12.27. Add 소속부서와 근무부서의 성격이 다르면 Y로 업데이트 : MyHR 요청 dsa2000*/
{
     /* EXEC SQL 
     Update Pihorga
        Set Deptdiffer = 'Y'
      Where Orgym = :inorgym 
        And Gubun = '1'   //조직 & 겸직 제외
        And Empno In (Select Empno From Pimpmas M,
                            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) X,
                            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) Y
                       Where M.Pstate <'80'
                         And X.Deptcode = M.Deptcode
                         And Y.Deptcode = M.Jobdept
                         And X.Tribegb <> Y.Tribegb); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Pihorga  set Deptdiffer='Y' where ((Orgym=:b0 an\
d Gubun='1') and Empno in (select Empno  from Pimpmas M ,(select Deptcode ,Su\
bstr(Tribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) X ,(select \
Deptcode ,Substr(Tribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum)\
 Y where (((M.Pstate<'80' and X.Deptcode=M.Deptcode) and Y.Deptcode=M.Jobdept\
) and X.Tribegb<>Y.Tribegb)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )976;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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

 

     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Update Deptdiffer Error"); 
}


update_pimvari()
{
     /* EXEC SQL 
     UPDATE pimvari
        set value1 = :inorgym
      WHERE gubun  = 'B2' 
        AND sgubun = '0000'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimvari  set value1=:b0 where (gubun='B2' and sg\
ubun='0000')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )995;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)inorgym;
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



     if  (sqlca.sqlcode != 0)     hinsa_exit(0,"Update Pimvari Error"); 
}

/*=== ckj 2005.10. Rexec대체 서비스를 위한 ====================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, 
             :log_progid, 
             :seqno, 
             :log_writeman, 
             :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1014;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)log_rundate;
     sqlstm.sqhstl[0] = (unsigned long )15;
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



     if  (sqlca.sqlcode != 0)  /*if  ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0)) */
     {  
          printf("ERROR_CODE : %d, pybatlog Insert Error. \n", sqlca.sqlcode);    
          return(FAIL);
     }                        
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1055;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}
/**********<< PROGRAM END >>********************************/

