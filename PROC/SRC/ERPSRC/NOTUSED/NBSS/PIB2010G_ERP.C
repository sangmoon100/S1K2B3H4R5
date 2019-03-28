
/* Result Sets Interface */
#ifndef SQL_CRSR
#  define SQL_CRSR
  struct sql_cursor
  {
    unsigned int curocn;
    void *ptr1;
    void *ptr2;
    unsigned long magic;
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
  1,0,0,
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
           char  filnam[16];
};
static struct sqlcxp sqlfpn =
{
    15,
    "pib2010g_erp.pc"
};


static unsigned long sqlctx = 2387739;


static struct sqlexd {
   unsigned int   sqlvsn;
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
            void  **sqphsv;
   unsigned int   *sqphsl;
            int   *sqphss;
            void  **sqpind;
            int   *sqpins;
   unsigned int   *sqparm;
   unsigned int   **sqparc;
   unsigned short  *sqpadto;
   unsigned short  *sqptdso;
            void  *sqhstv[10];
   unsigned int   sqhstl[10];
            int   sqhsts[10];
            void  *sqindv[10];
            int   sqinds[10];
   unsigned int   sqharm[10];
   unsigned int   *sqharc[10];
   unsigned short  sqadto[10];
   unsigned short  sqtdso[10];
} sqlstm = {10,10};

/* SQLLIB Prototypes */
extern sqlcxt (/*_ void **, unsigned long *,
                   struct sqlexd *, struct sqlcxp * _*/);
extern sqlcx2t(/*_ void **, unsigned long *,
                   struct sqlexd *, struct sqlcxp * _*/);
extern sqlbuft(/*_ void **, char * _*/);
extern sqlgs2t(/*_ void **, char * _*/);
extern sqlorat(/*_ void **, unsigned long *, void * _*/);

/* Forms Interface */
static int IAPSUCC = 0;
static int IAPFAIL = 1403;
static int IAPFTL  = 535;
extern void sqliem(/*_ char *, int * _*/);

 static char *sq0008 = 
"select value1  from pimvari where (gubun='B2' and sgubun>'0000')           ";

 static char *sq0019 = 
"select orgnum ,deptcode  from pihorga_temp where (orgym=:b0 and gubun='0') \
          ";

 static char *sq0022 = 
"select empno ,orgnum ,addeptcode  from pihanno where ((((ancode='233' and o\
rgnum=:b0) and anupdyn in ('Y','y')) and nvl(substr(addeptcode,1,2),'  ')<>' \
 ') and nvl(substr(antodate,1,8),'99991231')>=:b1) order by empno,anfrdate   \
         ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{10,4242,0,0,0,
5,0,0,1,60,0,4,97,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,73,0,4,103,0,0,1,0,0,1,0,2,97,0,0,
43,0,0,3,48,0,1,167,0,0,0,0,0,1,0,
58,0,0,4,63,0,4,187,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
81,0,0,5,42,0,2,197,0,0,1,1,0,1,0,1,97,0,0,
100,0,0,6,318,0,3,205,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
131,0,0,7,79,0,4,222,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
154,0,0,8,75,0,9,236,0,0,0,0,0,1,0,
169,0,0,8,0,0,13,243,0,0,1,0,0,1,0,2,97,0,0,
188,0,0,8,0,0,15,248,0,0,0,0,0,1,0,
203,0,0,8,0,0,15,253,0,0,0,0,0,1,0,
218,0,0,9,103,0,5,257,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
245,0,0,8,0,0,15,265,0,0,0,0,0,1,0,
260,0,0,10,251,0,3,273,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
287,0,0,11,79,0,4,287,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
310,0,0,12,149,0,5,296,0,0,1,1,0,1,0,1,97,0,0,
329,0,0,13,149,0,5,306,0,0,1,1,0,1,0,1,97,0,0,
348,0,0,14,159,0,5,316,0,0,1,1,0,1,0,1,97,0,0,
367,0,0,15,157,0,5,324,0,0,1,1,0,1,0,1,97,0,0,
386,0,0,16,157,0,5,330,0,0,1,1,0,1,0,1,97,0,0,
405,0,0,17,155,0,5,338,0,0,1,1,0,1,0,1,97,0,0,
424,0,0,18,155,0,5,346,0,0,1,1,0,1,0,1,97,0,0,
443,0,0,19,85,0,9,361,0,0,1,1,0,1,0,1,97,0,0,
462,0,0,19,0,0,13,368,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
485,0,0,19,0,0,15,373,0,0,0,0,0,1,0,
500,0,0,19,0,0,15,378,0,0,0,0,0,1,0,
515,0,0,20,226,0,4,382,0,0,10,3,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
570,0,0,21,181,0,5,399,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
625,0,0,19,0,0,15,409,0,0,0,0,0,1,0,
640,0,0,19,0,0,15,415,0,0,0,0,0,1,0,
655,0,0,22,238,0,9,440,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
678,0,0,22,0,0,13,447,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
705,0,0,22,0,0,15,452,0,0,0,0,0,1,0,
720,0,0,22,0,0,15,457,0,0,0,0,0,1,0,
735,0,0,23,142,0,4,462,0,0,4,3,0,1,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
766,0,0,22,0,0,15,472,0,0,0,0,0,1,0,
781,0,0,24,179,0,4,481,0,0,9,2,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,1,97,0,0,1,97,0,0,
832,0,0,22,0,0,15,490,0,0,0,0,0,1,0,
847,0,0,25,222,0,5,495,0,0,10,10,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
902,0,0,22,0,0,15,505,0,0,0,0,0,1,0,
917,0,0,26,104,0,5,511,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
940,0,0,22,0,0,15,517,0,0,0,0,0,1,0,
955,0,0,27,67,0,5,524,0,0,1,1,0,1,0,1,97,0,0,
};


/********************************************************
 * 조직도temp생성 (pib2010g_temp)		        *
 * Date   : 1999/04/07                                  *
 * Author : Kim Kyoung Bin                              * 
 * ERP에 인사 데이타를 주기위한 조직도 Data 생성        * 
 * 1.01    2004.02.19   이민용 Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드. * 
 ********************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <sqlca.h>
#include <sqlda.h>
#include <sqlcpr.h>
#include "hinsa_common.h"
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"


/*----------------------------------------------*
 * Current data save & Condition save Variable  *
 *----------------------------------------------*/
/* EXEC   SQL BEGIN DECLARE SECTION; */ 

  char orgym[7];	/* 기준년월 */
  char gubun[2];	/* 자료구분 */
  char orgnum[4];	/* 조직차수 */
  char deptcode[7];	/* 부서코드 */
  char empno[5];	/* 사  번 */
  char korname[13];	/* 성  명 */
  char deptlevel[3];	/* 부서등급 */
  char deptname[61];	/* 부서명 */
  char deptabbr[31];	/* 부서요약명 */
  char extcode[7];	/* 상위부서코드 */
  char boncode[7];	/* 본부코드 */
  char paycl[3];	/* 직  급 */
  char payclnm[21];	/* 직급명 */
  char payra[4];	/* 직  위 */
  char payranm[21];	/* 직위명 */
  char payrayn[2];	/* 보임여부 */
  char adpayrayn[2];	/* 겸직여부 */
  char pstate[3];	/* 인사상태 */
  char lineyn[2];	/* LINE출력여부 */

  char writetime[16];	/* 최종작업일시 */
  char jobempno[5];	/* 작업자사번 */
  char inorgym[7];	/* 작업년월 */
  char inorgnum[4];	/* 현조직차수 */

  char value1[21];
  char anfrdate[9];

  double check_count;	/* 자료건수 COUNT */
  char cur_date[9];	/* 현재일자 */
  char currdate[7];     /* 현 회계월 */ 
  char orgnumber[4];    /*현 조직 차수 */
  
/* EXEC   SQL END DECLARE SECTION; */ 

/* EXEC   SQL INCLUDE SQLCA;
 */ 
/*
 * $Header: sqlca.h,v 1.3 1994/12/12 19:27:27 jbasu Exp $ sqlca.h 
 */

/* Copyright (c) 1985,1986, 1998 by Oracle Corporation. */
 
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
double atof();
char tmp_msg[100];

/******************************************
 * 	MAIN PROCESSING START !!!!!!      *
 ******************************************/
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
        strcpy(FL_file,"pib2010g_erp");
        
        hinsa_get_filename(1, FL_file);
        if (hinsa_log_open(FL_file) == FAILURE)
        {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
        }
        
        hinsa_log_print(0,"조직도temp생성 프로그램 시작...");
        
        hinsa_db_connect();
	init_variable();

        strcpy(jobempno, argv[1]);	/* 작업자사번 */
        /* EXEC SQL select to_char(sysdate,'YYYYMM') dateyy 
                        into  :currdate
                        from dual; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 1;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select to_char(sysdate,'YYYYMM') dateyy into :b0  fr\
om dual ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )5;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)currdate;
        sqlstm.sqhstl[0] = (unsigned int  )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
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


        sprintf(inorgym,"%s", currdate); 
        printf("inorgym = %s\n  ",inorgym);                  
/*        strcpy(inorgym,  argv[2]);	 작업년월 */
        /* EXEC SQL  select  value1
                    into   :orgnumber  
                    from  pimvari
                   where  gubun = '00'
                     and      sgubun = '0001'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 1;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select value1 into :b0  from pimvari where (gubun='0\
0' and sgubun='0001')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )24;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)orgnumber;
        sqlstm.sqhstl[0] = (unsigned int  )4;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
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


        sprintf(inorgnum,"%s", orgnumber);                   
        printf("inorgnum = %s  \n",inorgnum);                  
        
/*       strcpy(inorgnum, argv[3]);	 현조직차수 */

	data_process();		/* 작업을 처리한다 */
/*	update_pimvari();	   작업년월을 경신 */

	km_edf(create_count0, c_count0, 7, 0);
	km_edf(create_count1, c_count1, 7, 0);
	sprintf(tmp_msg, "작업완료 ==> 조직[%s], 인사[%s]", 
					c_count0, c_count1);
	process_exit(tmp_msg);
}
/*----------------------------------------------*
 * Current data & Condition Variable Initialize *
 *----------------------------------------------*/
init_variable()
{ 
        memset(orgym, 		0x00,   sizeof(orgym)); 
        memset(gubun, 		0x00,   sizeof(gubun)); 
	memset(orgnum,		0x00,	sizeof(orgnum));
	memset(deptcode,	0x00,	sizeof(deptcode));
	memset(empno,		0x00,	sizeof(empno));
	memset(korname,		0x00,	sizeof(korname));
	memset(deptlevel,	0x00,	sizeof(deptlevel));
	memset(deptname,	0x00,	sizeof(deptname));
	memset(deptabbr,	0x00,	sizeof(deptabbr));
	memset(extcode,		0x00,	sizeof(extcode));
	memset(boncode,		0x00,	sizeof(boncode));
	memset(paycl,		0x00,	sizeof(paycl));
	memset(payclnm,		0x00,	sizeof(payclnm));
	memset(payra,		0x00,	sizeof(payra));
	memset(payranm,		0x00,	sizeof(payranm));
	memset(payrayn,		0x00,	sizeof(payrayn));
	memset(adpayrayn,	0x00,	sizeof(adpayrayn));
	memset(pstate,		0x00,	sizeof(pstate));
	memset(lineyn,		0x00,	sizeof(lineyn));

	memset(writetime,	0x00,	sizeof(writetime));
	memset(jobempno,	0x00,	sizeof(jobempno));
	memset(inorgym,		0x00,	sizeof(inorgym));
	memset(inorgnum,	0x00,	sizeof(inorgnum));
	memset(value1,		0x00,	sizeof(value1));
	memset(anfrdate,	0x00,	sizeof(anfrdate));
	check_count = 0;
	create_count0 = create_count1 = 0;
	memset(tmp_msg,		0x00,	sizeof(tmp_msg));

	memset(cur_date,	0x00,	sizeof(cur_date));
	memset(currdate,	NULL,	sizeof(currdate));
	memset(orgnumber,       NULL,	sizeof(orgnumber));
	
}
/****************************************
 *  	Data process  routine 		*
 ****************************************/
data_process()
{
        /* EXEC SQL LOCK TABLE  pihorga_temp
                 IN   EXCLUSIVE  MODE  NOWAIT; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 1;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "lock TABLE pihorga_temp IN EXCLUSIVE MODE NOWAIT";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )43;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



        if (sqlca.sqlcode != 0)
		perror_quit("다른 작업자가 DB수정 작업중입니다.");

	DPsys_date(cur_date, 1);
	delete_pihorga();	/* 기존재자료 DELETE */
	insert_pihorga0();	/* 조직자료 INSERT */
	update_lineyn();	/* LINE출력여부를 수정 */
	insert_pihorga1();	/* 인사자료 INSERT */
	update_payclnm();	/* 직급명을 수정 */
	update_payranm();	/* 직위명을 수정 */
	update_dept();		/* 부서등급, 부서명, 요약명등을 수정 */
	update_payrayn();	/* 조직의 보임자를 수정 */
	process_adpayrayn();	/* 겸직자를 처리 */
}
delete_pihorga()
{
	check_count = 0;
        /* EXEC SQL SELECT count(orgym)
		 INTO	:check_count
		 FROM	pihorga_temp
	WHERE	orgym = :inorgym; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 2;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select count(orgym) into :b0  from pihorga_temp wher\
e orgym=:b1";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )58;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)&check_count;
        sqlstm.sqhstl[0] = (unsigned int  )sizeof(double);
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)inorgym;
        sqlstm.sqhstl[1] = (unsigned int  )7;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Select Error(Delete) !");

	if (check_count == 0)	/* 지울자료가 없으니까 */
		return;

        /* EXEC SQL DELETE FROM	pihorga_temp
		WHERE	orgym = :inorgym; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 2;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "delete  from pihorga_temp  where orgym=:b0";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )81;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)inorgym;
        sqlstm.sqhstl[0] = (unsigned int  )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
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
	    	perror_quit("Pihorga_temp Delete Error !");
}
insert_pihorga0()
{
        DPsys_date(writetime, 0);
       	/* EXEC SQL INSERT INTO  	pihorga_temp
			(orgym, gubun, orgnum, deptcode, deptlevel,
			 deptname, deptabbr, extcode, boncode,
			 payrayn, adpayrayn, lineyn,
			 writetime, writeemp)
       		SELECT  :inorgym, '0', orgnum, deptcode, deptlevel,
			deptname, deptabbr, extcode, boncode,
			'N', 'N', 'Y',
			:writetime, :jobempno
		FROM	pycdept
                WHERE  	(orgnum = :inorgnum)
                  AND  	(existon = '1')  AND  (chanmode != '3'); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 4;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into pihorga_temp (orgym,gubun,orgnum,deptcod\
e,deptlevel,deptname,deptabbr,extcode,boncode,payrayn,adpayrayn,lineyn,writet\
ime,writeemp)select :b0 ,'0' ,orgnum ,deptcode ,deptlevel ,deptname ,deptabbr\
 ,extcode ,boncode ,'N' ,'N' ,'Y' ,:b1 ,:b2  from pycdept where ((orgnum=:b3 \
and existon='1') and chanmode<>'3')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )100;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)inorgym;
        sqlstm.sqhstl[0] = (unsigned int  )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)writetime;
        sqlstm.sqhstl[1] = (unsigned int  )16;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (         void  *)jobempno;
        sqlstm.sqhstl[2] = (unsigned int  )5;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         void  *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned int  )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (         void  *)inorgnum;
        sqlstm.sqhstl[3] = (unsigned int  )4;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         void  *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned int  )0;
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
 		perror_quit("Pihorga_temp Insert Error(0) !");

	create_count0 = 0;	/* 조직저장건수를 계산 */
        /* EXEC SQL SELECT count(orgym)
		 INTO	:create_count0
		 FROM	pihorga_temp
	WHERE	orgym = :inorgym AND gubun = '0'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 4;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select count(orgym) into :b0  from pihorga_temp wher\
e (orgym=:b1 and gubun='0')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )131;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)&create_count0;
        sqlstm.sqhstl[0] = (unsigned int  )sizeof(double);
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)inorgym;
        sqlstm.sqhstl[1] = (unsigned int  )7;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Count Error(0) !"); 
}
update_lineyn()		/* LINE출력여부를 수정 */
{
	/* EXEC SQL DECLARE c1 cursor for
                 SELECT  value1
                 FROM   pimvari
		 WHERE  gubun = 'B2' AND sgubun > '0000'; */ 


        /* EXEC SQL  open c1; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 4;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = sq0008;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )154;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



        if (sqlca.sqlcode != 0)
             	perror_quit("Cursor Open c1"); 

        for( ; ; )
        {
             	/* EXEC SQL FETCH c1 INTO
                   	 :value1; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 10;
              sqlstm.arrsiz = 4;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )169;
              sqlstm.selerr = (unsigned short)1;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)256;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (         void  *)value1;
              sqlstm.sqhstl[0] = (unsigned int  )21;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         void  *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned int  )0;
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
                	/* EXEC SQL close c1; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 4;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )188;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                	return; 
             	}
             	else if (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
             	{
                	/* EXEC SQL close c1; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 4;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )203;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


			perror_quit("Data Fetch c1");
             	}
		trail_space(value1);
        	/* EXEC SQL UPDATE pihorga_temp
                 	SET    	lineyn = 'N'
			WHERE	orgym = :inorgym
			  AND	gubun = '0'  AND  orgnum = :inorgnum
			  AND	deptcode = :value1; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 10;
         sqlstm.arrsiz = 4;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "update pihorga_temp  set lineyn='N' where (((orgym=\
:b0 and gubun='0') and orgnum=:b1) and deptcode=:b2)";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )218;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)256;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (         void  *)inorgym;
         sqlstm.sqhstl[0] = (unsigned int  )7;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         void  *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned int  )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (         void  *)inorgnum;
         sqlstm.sqhstl[1] = (unsigned int  )4;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         void  *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned int  )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (         void  *)value1;
         sqlstm.sqhstl[2] = (unsigned int  )21;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         void  *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned int  )0;
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



        	if (sqlca.sqlcode != 0)
             	{
                	/* EXEC SQL close c1; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 4;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )245;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             		perror_quit("Update Pihorga_temp Error(Line) !");
		}
	}
}
insert_pihorga1()	/* 인사자료를 Insert */
{
        DPsys_date(writetime, 0);
       	/* EXEC SQL INSERT INTO  	pihorga_temp
			(orgym, gubun, orgnum, deptcode, empno, korname,
			 paycl, payra, payrayn, adpayrayn, pstate,
			 writetime, writeemp)
       		SELECT  :inorgym, '1', orgnum, deptcode, empno, korname,
			paycl, payra, payrayn, 'N', pstate,
			:writetime, :jobempno
		FROM	pimpmas
                WHERE  	(pstate < '80'); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 4;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into pihorga_temp (orgym,gubun,orgnum,deptcod\
e,empno,korname,paycl,payra,payrayn,adpayrayn,pstate,writetime,writeemp)selec\
t :b0 ,'1' ,orgnum ,deptcode ,empno ,korname ,paycl ,payra ,payrayn ,'N' ,pst\
ate ,:b1 ,:b2  from pimpmas where pstate<'80'";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )260;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)inorgym;
        sqlstm.sqhstl[0] = (unsigned int  )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)writetime;
        sqlstm.sqhstl[1] = (unsigned int  )16;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (         void  *)jobempno;
        sqlstm.sqhstl[2] = (unsigned int  )5;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         void  *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned int  )0;
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



       	if (sqlca.sqlcode != 0)
 		perror_quit("Pihorga_temp Insert Error(1) !");

	create_count1 = 0;	/* 인사저장건수를 계산 */
        /* EXEC SQL SELECT count(orgym)
		 INTO	:create_count1
		 FROM	pihorga_temp
	WHERE	orgym = :inorgym AND gubun = '1'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 4;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select count(orgym) into :b0  from pihorga_temp wher\
e (orgym=:b1 and gubun='1')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )287;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)&create_count1;
        sqlstm.sqhstl[0] = (unsigned int  )sizeof(double);
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)inorgym;
        sqlstm.sqhstl[1] = (unsigned int  )7;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Count Error(1) !"); 
}
update_payclnm()	/* 직급명을 수정 */
{
	/* EXEC SQL UPDATE pihorga_temp h SET
		payclnm = 
		(SELECT codename FROM pyccode c
			WHERE c.codeid = 'I112' AND c.codeno = h.paycl)
		WHERE	h.orgym = :inorgym AND h.gubun = '1'; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "update pihorga_temp h  set payclnm=(select codename  from p\
yccode c where (c.codeid='I112' and c.codeno=h.paycl)) where (h.orgym=:b0 and\
 h.gubun='1')";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )310;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)inorgym;
 sqlstm.sqhstl[0] = (unsigned int  )7;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Update Error(payclnm) !"); 
}
update_payranm()	/* 직위명을 수정 */
{
	/* EXEC SQL UPDATE pihorga_temp h SET
		payranm = 
		(SELECT codename FROM pyccode c
			WHERE c.codeid = 'I113' AND c.codeno = h.payra)
		WHERE	h.orgym = :inorgym AND h.gubun = '1'; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "update pihorga_temp h  set payranm=(select codename  from p\
yccode c where (c.codeid='I113' and c.codeno=h.payra)) where (h.orgym=:b0 and\
 h.gubun='1')";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )329;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)inorgym;
 sqlstm.sqhstl[0] = (unsigned int  )7;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Update Error(payranm) !"); 
}
update_dept()		/* 부서등급, 부서명, 요약명등을 수정 */
{
	/* EXEC SQL UPDATE pihorga_temp h SET	/o 부서등급 o/
		deptlevel = 
		(SELECT deptlevel FROM pycdept c
			WHERE c.orgnum = h.orgnum AND c.deptcode = h.deptcode)
		WHERE	h.orgym = :inorgym AND h.gubun = '1'; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "update pihorga_temp h  set deptlevel=(select deptlevel  fro\
m pycdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.org\
ym=:b0 and h.gubun='1')";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )348;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)inorgym;
 sqlstm.sqhstl[0] = (unsigned int  )7;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Update Error(deptlevel) !");

	/* EXEC SQL UPDATE pihorga_temp h SET	/o 부서명 o/
		deptname = 
		(SELECT deptname FROM pycdept c WHERE c.orgnum = h.orgnum AND c.deptcode = h.deptcode) WHERE	h.orgym = :inorgym AND h.gubun = '1'; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "update pihorga_temp h  set deptname=(select deptname  from \
pycdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym\
=:b0 and h.gubun='1')";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )367;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)inorgym;
 sqlstm.sqhstl[0] = (unsigned int  )7;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Update Error(deptname) !");

	/* EXEC SQL UPDATE pihorga_temp h SET	/o 부서요약명 o/
		deptabbr = 
		(SELECT deptabbr FROM pycdept c
			WHERE c.orgnum = h.orgnum AND c.deptcode = h.deptcode)
		WHERE	h.orgym = :inorgym AND h.gubun = '1'; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "update pihorga_temp h  set deptabbr=(select deptabbr  from \
pycdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym\
=:b0 and h.gubun='1')";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )386;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)inorgym;
 sqlstm.sqhstl[0] = (unsigned int  )7;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Update Error(deptabbr) !");

	/* EXEC SQL UPDATE pihorga_temp h SET	/o 상위부서코드 o/
		extcode = 
		(SELECT extcode FROM pycdept c
			WHERE c.orgnum = h.orgnum AND c.deptcode = h.deptcode)
		WHERE	h.orgym = :inorgym AND h.gubun = '1'; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "update pihorga_temp h  set extcode=(select extcode  from py\
cdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym=:\
b0 and h.gubun='1')";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )405;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)inorgym;
 sqlstm.sqhstl[0] = (unsigned int  )7;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Update Error(extcode) !");

	/* EXEC SQL UPDATE pihorga_temp h SET	/o 본부코드 o/
		boncode = 
		(SELECT boncode FROM pycdept c
			WHERE c.orgnum = h.orgnum AND c.deptcode = h.deptcode)
		WHERE	h.orgym = :inorgym AND h.gubun = '1'; */ 

{
 struct sqlexd sqlstm;
 sqlstm.sqlvsn = 10;
 sqlstm.arrsiz = 4;
 sqlstm.sqladtp = &sqladt;
 sqlstm.sqltdsp = &sqltds;
 sqlstm.stmt = "update pihorga_temp h  set boncode=(select boncode  from py\
cdept c where (c.orgnum=h.orgnum and c.deptcode=h.deptcode)) where (h.orgym=:\
b0 and h.gubun='1')";
 sqlstm.iters = (unsigned int  )1;
 sqlstm.offset = (unsigned int  )424;
 sqlstm.cud = sqlcud0;
 sqlstm.sqlest = (unsigned char  *)&sqlca;
 sqlstm.sqlety = (unsigned short)256;
 sqlstm.occurs = (unsigned int  )0;
 sqlstm.sqhstv[0] = (         void  *)inorgym;
 sqlstm.sqhstl[0] = (unsigned int  )7;
 sqlstm.sqhsts[0] = (         int  )0;
 sqlstm.sqindv[0] = (         void  *)0;
 sqlstm.sqinds[0] = (         int  )0;
 sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Pihorga_temp Update Error(boncode) !");
}
update_payrayn()	/* 조직의 보임자를 수정 */
{
	/* EXEC SQL DECLARE c2 cursor for
                 SELECT  orgnum, deptcode
                 FROM   pihorga_temp
		 WHERE	orgym = :inorgym AND gubun = '0'; */ 


        /* EXEC SQL  open c2; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 4;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = sq0019;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )443;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)inorgym;
        sqlstm.sqhstl[0] = (unsigned int  )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Cursor Open c2"); 

        for( ; ; )
        {
             	/* EXEC SQL FETCH c2 INTO
                   	 :orgnum, :deptcode; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 10;
              sqlstm.arrsiz = 4;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )462;
              sqlstm.selerr = (unsigned short)1;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)256;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (         void  *)orgnum;
              sqlstm.sqhstl[0] = (unsigned int  )4;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         void  *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned int  )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (         void  *)deptcode;
              sqlstm.sqhstl[1] = (unsigned int  )7;
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         void  *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned int  )0;
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
                	/* EXEC SQL close c2; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 4;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )485;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
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
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 4;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )500;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


			perror_quit("Data Fetch c2");
             	}
		trail_space(deptcode);
        	/* EXEC SQL SELECT empno, korname, 
				paycl, payclnm, payra, payranm, pstate
		 	INTO	:empno, :korname, 
				:paycl, :payclnm, :payra, :payranm, :pstate
		 	FROM	pihorga_temp
			WHERE	orgym = :inorgym AND gubun = '1' 
			  AND 	pstate < '60' 
		  	  AND 	orgnum = :orgnum AND deptcode = :deptcode
		  	  AND	payrayn in ('Y', 'y'); */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 10;
         sqlstm.arrsiz = 10;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select empno ,korname ,paycl ,payclnm ,payra ,payra\
nm ,pstate into :b0,:b1,:b2,:b3,:b4,:b5,:b6  from pihorga_temp where (((((org\
ym=:b7 and gubun='1') and pstate<'60') and orgnum=:b8) and deptcode=:b9) and \
payrayn in ('Y','y'))";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )515;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)256;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (         void  *)empno;
         sqlstm.sqhstl[0] = (unsigned int  )5;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         void  *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned int  )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (         void  *)korname;
         sqlstm.sqhstl[1] = (unsigned int  )13;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         void  *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned int  )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (         void  *)paycl;
         sqlstm.sqhstl[2] = (unsigned int  )3;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         void  *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned int  )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (         void  *)payclnm;
         sqlstm.sqhstl[3] = (unsigned int  )21;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         void  *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned int  )0;
         sqlstm.sqadto[3] = (unsigned short )0;
         sqlstm.sqtdso[3] = (unsigned short )0;
         sqlstm.sqhstv[4] = (         void  *)payra;
         sqlstm.sqhstl[4] = (unsigned int  )4;
         sqlstm.sqhsts[4] = (         int  )0;
         sqlstm.sqindv[4] = (         void  *)0;
         sqlstm.sqinds[4] = (         int  )0;
         sqlstm.sqharm[4] = (unsigned int  )0;
         sqlstm.sqadto[4] = (unsigned short )0;
         sqlstm.sqtdso[4] = (unsigned short )0;
         sqlstm.sqhstv[5] = (         void  *)payranm;
         sqlstm.sqhstl[5] = (unsigned int  )21;
         sqlstm.sqhsts[5] = (         int  )0;
         sqlstm.sqindv[5] = (         void  *)0;
         sqlstm.sqinds[5] = (         int  )0;
         sqlstm.sqharm[5] = (unsigned int  )0;
         sqlstm.sqadto[5] = (unsigned short )0;
         sqlstm.sqtdso[5] = (unsigned short )0;
         sqlstm.sqhstv[6] = (         void  *)pstate;
         sqlstm.sqhstl[6] = (unsigned int  )3;
         sqlstm.sqhsts[6] = (         int  )0;
         sqlstm.sqindv[6] = (         void  *)0;
         sqlstm.sqinds[6] = (         int  )0;
         sqlstm.sqharm[6] = (unsigned int  )0;
         sqlstm.sqadto[6] = (unsigned short )0;
         sqlstm.sqtdso[6] = (unsigned short )0;
         sqlstm.sqhstv[7] = (         void  *)inorgym;
         sqlstm.sqhstl[7] = (unsigned int  )7;
         sqlstm.sqhsts[7] = (         int  )0;
         sqlstm.sqindv[7] = (         void  *)0;
         sqlstm.sqinds[7] = (         int  )0;
         sqlstm.sqharm[7] = (unsigned int  )0;
         sqlstm.sqadto[7] = (unsigned short )0;
         sqlstm.sqtdso[7] = (unsigned short )0;
         sqlstm.sqhstv[8] = (         void  *)orgnum;
         sqlstm.sqhstl[8] = (unsigned int  )4;
         sqlstm.sqhsts[8] = (         int  )0;
         sqlstm.sqindv[8] = (         void  *)0;
         sqlstm.sqinds[8] = (         int  )0;
         sqlstm.sqharm[8] = (unsigned int  )0;
         sqlstm.sqadto[8] = (unsigned short )0;
         sqlstm.sqtdso[8] = (unsigned short )0;
         sqlstm.sqhstv[9] = (         void  *)deptcode;
         sqlstm.sqhstl[9] = (unsigned int  )7;
         sqlstm.sqhsts[9] = (         int  )0;
         sqlstm.sqindv[9] = (         void  *)0;
         sqlstm.sqinds[9] = (         int  )0;
         sqlstm.sqharm[9] = (unsigned int  )0;
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
		  	  AND	(paycl = '00' OR payrayn in ('Y', 'y'));
*/

        	if (sqlca.sqlcode == 1403)	/* 자료가 없을때 */
			trail_space(deptcode);		/* 심심하니까 그냥 */
        	else if (sqlca.sqlcode == 0)	/* 자료가 1건 */
		{
        		/* EXEC SQL UPDATE pihorga_temp
                 		SET    	empno = :empno, korname = :korname,
					paycl = :paycl, payclnm = :payclnm,
					payra = :payra, payranm = :payranm,
					pstate = :pstate, payrayn = 'Y'
				WHERE	orgym = :inorgym AND gubun = '0' 
		  	  	  AND 	orgnum = :orgnum 
				  AND 	deptcode = :deptcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 10;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update pihorga_temp  set empno=:b0,korname=:b1,pay\
cl=:b2,payclnm=:b3,payra=:b4,payranm=:b5,pstate=:b6,payrayn='Y' where (((orgy\
m=:b7 and gubun='0') and orgnum=:b8) and deptcode=:b9)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )570;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)256;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (         void  *)empno;
          sqlstm.sqhstl[0] = (unsigned int  )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         void  *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned int  )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (         void  *)korname;
          sqlstm.sqhstl[1] = (unsigned int  )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         void  *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned int  )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (         void  *)paycl;
          sqlstm.sqhstl[2] = (unsigned int  )3;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         void  *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned int  )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (         void  *)payclnm;
          sqlstm.sqhstl[3] = (unsigned int  )21;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         void  *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned int  )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (         void  *)payra;
          sqlstm.sqhstl[4] = (unsigned int  )4;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         void  *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned int  )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (         void  *)payranm;
          sqlstm.sqhstl[5] = (unsigned int  )21;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         void  *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned int  )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (         void  *)pstate;
          sqlstm.sqhstl[6] = (unsigned int  )3;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         void  *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned int  )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (         void  *)inorgym;
          sqlstm.sqhstl[7] = (unsigned int  )7;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         void  *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned int  )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (         void  *)orgnum;
          sqlstm.sqhstl[8] = (unsigned int  )4;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         void  *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned int  )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (         void  *)deptcode;
          sqlstm.sqhstl[9] = (unsigned int  )7;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         void  *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned int  )0;
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


        		if (sqlca.sqlcode != 0)
             		{
                		/* EXEC SQL close c2; */ 

{
                  struct sqlexd sqlstm;
                  sqlstm.sqlvsn = 10;
                  sqlstm.arrsiz = 10;
                  sqlstm.sqladtp = &sqladt;
                  sqlstm.sqltdsp = &sqltds;
                  sqlstm.iters = (unsigned int  )1;
                  sqlstm.offset = (unsigned int  )625;
                  sqlstm.cud = sqlcud0;
                  sqlstm.sqlest = (unsigned char  *)&sqlca;
                  sqlstm.sqlety = (unsigned short)256;
                  sqlstm.occurs = (unsigned int  )0;
                  sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             			perror_quit("Update Pihorga_temp Error(payrayn) !");
			}
		}
		else		/* 그외의 모든경우는 에러 */
             	{
                	/* EXEC SQL close c2; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 10;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )640;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


			sprintf(tmp_msg, "보임자오류 ==> [%s][%s]",
							orgnum, deptcode);
             		perror_quit(tmp_msg);
		}
	}
}
process_adpayrayn()	/* 겸직자를 처리 */
{
/*
	char tmp_date[9];
	sprintf(anfrdate, "%08.0f", atof(tmp_date) - 10000);
*/

	/* EXEC SQL DECLARE c3 cursor for		/o 겸직발령자료를 찾는다 o/
                 SELECT  empno, orgnum, addeptcode
                 FROM   pihanno
		 WHERE 	ancode = '233' 		/o AND anfrdate >= :anfrdate o/
		   AND  orgnum = :inorgnum 
/o:inorgnum	 현조직차수 겸직발령만 o/
		   AND	anupdyn in ('Y', 'y')
		   AND  nvl(substr(addeptcode, 1, 2), '  ') != '  '
		   AND  nvl(substr(antodate, 1, 8), '99991231') >= :cur_date
                 ORDER	BY	empno, anfrdate; */ 


        /* EXEC SQL  open c3; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 10;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = sq0022;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )655;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)inorgnum;
        sqlstm.sqhstl[0] = (unsigned int  )4;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)cur_date;
        sqlstm.sqhstl[1] = (unsigned int  )9;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
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
             	perror_quit("Cursor Open c3"); 

        for( ; ; )
        {
             	/* EXEC SQL FETCH c3 INTO
                   	 :empno, :orgnum, :deptcode; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 10;
              sqlstm.arrsiz = 10;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )678;
              sqlstm.selerr = (unsigned short)1;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)256;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (         void  *)empno;
              sqlstm.sqhstl[0] = (unsigned int  )5;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         void  *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned int  )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (         void  *)orgnum;
              sqlstm.sqhstl[1] = (unsigned int  )4;
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         void  *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned int  )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (         void  *)deptcode;
              sqlstm.sqhstl[2] = (unsigned int  )7;
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         void  *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned int  )0;
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
                	/* EXEC SQL close c3; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 10;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )705;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                	return; 
             	}
             	else if (sqlca.sqlcode != -1405 && sqlca.sqlcode != 0)
             	{
                	/* EXEC SQL close c3; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 10;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )720;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


			perror_quit("Data Fetch c3");
             	}
		trail_space(deptcode);
		check_count = 0;
        	/* EXEC SQL SELECT count(empno)	/o 겸직해제 관련자료를 찾자 o/
		 	INTO	:check_count
		 	FROM	pihanno
		 	WHERE 	empno = :empno AND ancode = '238' 
		   	  AND   orgnum = :inorgnum   /o 현조직차수 겸직발령만 o/
		 /o AND 	anfrdate >= :anfrdate o/ 
			  AND 	anupdyn in ('Y', 'y')
		   	  AND   addeptcode = :deptcode; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 10;
         sqlstm.arrsiz = 10;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select count(empno) into :b0  from pihanno where ((\
((empno=:b1 and ancode='238') and orgnum=:b2) and anupdyn in ('Y','y')) and a\
ddeptcode=:b3)";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )735;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)256;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (         void  *)&check_count;
         sqlstm.sqhstl[0] = (unsigned int  )sizeof(double);
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         void  *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned int  )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (         void  *)empno;
         sqlstm.sqhstl[1] = (unsigned int  )5;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         void  *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned int  )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (         void  *)inorgnum;
         sqlstm.sqhstl[2] = (unsigned int  )4;
         sqlstm.sqhsts[2] = (         int  )0;
         sqlstm.sqindv[2] = (         void  *)0;
         sqlstm.sqinds[2] = (         int  )0;
         sqlstm.sqharm[2] = (unsigned int  )0;
         sqlstm.sqadto[2] = (unsigned short )0;
         sqlstm.sqtdso[2] = (unsigned short )0;
         sqlstm.sqhstv[3] = (         void  *)deptcode;
         sqlstm.sqhstl[3] = (unsigned int  )7;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         void  *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned int  )0;
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
                	/* EXEC SQL close c3; */ 

{
                 struct sqlexd sqlstm;
                 sqlstm.sqlvsn = 10;
                 sqlstm.arrsiz = 10;
                 sqlstm.sqladtp = &sqladt;
                 sqlstm.sqltdsp = &sqltds;
                 sqlstm.iters = (unsigned int  )1;
                 sqlstm.offset = (unsigned int  )766;
                 sqlstm.cud = sqlcud0;
                 sqlstm.sqlest = (unsigned char  *)&sqlca;
                 sqlstm.sqlety = (unsigned short)256;
                 sqlstm.occurs = (unsigned int  )0;
                 sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             		perror_quit("Pihanno Select Error !");
		}
		if (check_count == 0)	/* 겸직해제 발령이 없으면 */
			update_adpayrayn();
	}
}
update_adpayrayn()	/* 겸직자를 수정 */
{
        /* EXEC SQL SELECT empno, korname, 	/o 겸직자 사항을 읽어온다 o/
			paycl, payclnm, payra, payranm, pstate
	 	INTO	:empno, :korname, 
			:paycl, :payclnm, :payra, :payranm, :pstate
	 	FROM	pihorga_temp
		WHERE	orgym = :inorgym AND gubun = '1' 
		  AND 	pstate < '60' AND empno = :empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 10;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select empno ,korname ,paycl ,payclnm ,payra ,payran\
m ,pstate into :b0,:b1,:b2,:b3,:b4,:b5,:b6  from pihorga_temp where (((orgym=\
:b7 and gubun='1') and pstate<'60') and empno=:b0)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )781;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)empno;
        sqlstm.sqhstl[0] = (unsigned int  )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)korname;
        sqlstm.sqhstl[1] = (unsigned int  )13;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (         void  *)paycl;
        sqlstm.sqhstl[2] = (unsigned int  )3;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         void  *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned int  )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (         void  *)payclnm;
        sqlstm.sqhstl[3] = (unsigned int  )21;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         void  *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned int  )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (         void  *)payra;
        sqlstm.sqhstl[4] = (unsigned int  )4;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         void  *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned int  )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (         void  *)payranm;
        sqlstm.sqhstl[5] = (unsigned int  )21;
        sqlstm.sqhsts[5] = (         int  )0;
        sqlstm.sqindv[5] = (         void  *)0;
        sqlstm.sqinds[5] = (         int  )0;
        sqlstm.sqharm[5] = (unsigned int  )0;
        sqlstm.sqadto[5] = (unsigned short )0;
        sqlstm.sqtdso[5] = (unsigned short )0;
        sqlstm.sqhstv[6] = (         void  *)pstate;
        sqlstm.sqhstl[6] = (unsigned int  )3;
        sqlstm.sqhsts[6] = (         int  )0;
        sqlstm.sqindv[6] = (         void  *)0;
        sqlstm.sqinds[6] = (         int  )0;
        sqlstm.sqharm[6] = (unsigned int  )0;
        sqlstm.sqadto[6] = (unsigned short )0;
        sqlstm.sqtdso[6] = (unsigned short )0;
        sqlstm.sqhstv[7] = (         void  *)inorgym;
        sqlstm.sqhstl[7] = (unsigned int  )7;
        sqlstm.sqhsts[7] = (         int  )0;
        sqlstm.sqindv[7] = (         void  *)0;
        sqlstm.sqinds[7] = (         int  )0;
        sqlstm.sqharm[7] = (unsigned int  )0;
        sqlstm.sqadto[7] = (unsigned short )0;
        sqlstm.sqtdso[7] = (unsigned short )0;
        sqlstm.sqhstv[8] = (         void  *)empno;
        sqlstm.sqhstl[8] = (unsigned int  )5;
        sqlstm.sqhsts[8] = (         int  )0;
        sqlstm.sqindv[8] = (         void  *)0;
        sqlstm.sqinds[8] = (         int  )0;
        sqlstm.sqharm[8] = (unsigned int  )0;
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


       	if (sqlca.sqlcode != 0)
        {
               	/* EXEC SQL close c3; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 10;
                sqlstm.arrsiz = 10;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )832;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)256;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


		sprintf(tmp_msg, "겸직자인사사항오류 ==> [%4s]", empno);
          	perror_quit(tmp_msg);
	}

        /* EXEC SQL UPDATE pihorga_temp	/o 겸직자 사항을 수정 o/
        	SET    	empno = :empno, korname = :korname,
			paycl = :paycl, payclnm = :payclnm,
			payra = :payra, payranm = :payranm,
			pstate = :pstate, payrayn = 'Y', adpayrayn = 'Y'
		WHERE	orgym = :inorgym AND gubun = '0' 
	   	  AND 	orgnum = :inorgnum AND deptcode = :deptcode
		  AND	payrayn in ('N', 'n'); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 10;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update pihorga_temp  set empno=:b0,korname=:b1,paycl\
=:b2,payclnm=:b3,payra=:b4,payranm=:b5,pstate=:b6,payrayn='Y',adpayrayn='Y' w\
here ((((orgym=:b7 and gubun='0') and orgnum=:b8) and deptcode=:b9) and payra\
yn in ('N','n'))";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )847;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)empno;
        sqlstm.sqhstl[0] = (unsigned int  )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)korname;
        sqlstm.sqhstl[1] = (unsigned int  )13;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (         void  *)paycl;
        sqlstm.sqhstl[2] = (unsigned int  )3;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         void  *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned int  )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (         void  *)payclnm;
        sqlstm.sqhstl[3] = (unsigned int  )21;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         void  *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned int  )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (         void  *)payra;
        sqlstm.sqhstl[4] = (unsigned int  )4;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         void  *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned int  )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (         void  *)payranm;
        sqlstm.sqhstl[5] = (unsigned int  )21;
        sqlstm.sqhsts[5] = (         int  )0;
        sqlstm.sqindv[5] = (         void  *)0;
        sqlstm.sqinds[5] = (         int  )0;
        sqlstm.sqharm[5] = (unsigned int  )0;
        sqlstm.sqadto[5] = (unsigned short )0;
        sqlstm.sqtdso[5] = (unsigned short )0;
        sqlstm.sqhstv[6] = (         void  *)pstate;
        sqlstm.sqhstl[6] = (unsigned int  )3;
        sqlstm.sqhsts[6] = (         int  )0;
        sqlstm.sqindv[6] = (         void  *)0;
        sqlstm.sqinds[6] = (         int  )0;
        sqlstm.sqharm[6] = (unsigned int  )0;
        sqlstm.sqadto[6] = (unsigned short )0;
        sqlstm.sqtdso[6] = (unsigned short )0;
        sqlstm.sqhstv[7] = (         void  *)inorgym;
        sqlstm.sqhstl[7] = (unsigned int  )7;
        sqlstm.sqhsts[7] = (         int  )0;
        sqlstm.sqindv[7] = (         void  *)0;
        sqlstm.sqinds[7] = (         int  )0;
        sqlstm.sqharm[7] = (unsigned int  )0;
        sqlstm.sqadto[7] = (unsigned short )0;
        sqlstm.sqtdso[7] = (unsigned short )0;
        sqlstm.sqhstv[8] = (         void  *)inorgnum;
        sqlstm.sqhstl[8] = (unsigned int  )4;
        sqlstm.sqhsts[8] = (         int  )0;
        sqlstm.sqindv[8] = (         void  *)0;
        sqlstm.sqinds[8] = (         int  )0;
        sqlstm.sqharm[8] = (unsigned int  )0;
        sqlstm.sqadto[8] = (unsigned short )0;
        sqlstm.sqtdso[8] = (unsigned short )0;
        sqlstm.sqhstv[9] = (         void  *)deptcode;
        sqlstm.sqhstl[9] = (unsigned int  )7;
        sqlstm.sqhsts[9] = (         int  )0;
        sqlstm.sqindv[9] = (         void  *)0;
        sqlstm.sqinds[9] = (         int  )0;
        sqlstm.sqharm[9] = (unsigned int  )0;
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


       	if (sqlca.sqlcode != 0)
       	{
       		/* EXEC SQL close c3; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 10;
         sqlstm.arrsiz = 10;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )902;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)256;
         sqlstm.occurs = (unsigned int  )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


		sprintf(tmp_msg, "겸직자인사사항수정오류 ==> [%s][%s]",
			 				orgnum, deptcode);
          	perror_quit(tmp_msg);
	}

        /* EXEC SQL UPDATE pihorga_temp
        	SET    	adpayrayn = 'Y'
		WHERE	orgym = :inorgym AND gubun = '1' 
		  AND 	pstate < '60' AND empno = :empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 10;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update pihorga_temp  set adpayrayn='Y' where (((orgy\
m=:b0 and gubun='1') and pstate<'60') and empno=:b1)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )917;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)inorgym;
        sqlstm.sqhstl[0] = (unsigned int  )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (         void  *)empno;
        sqlstm.sqhstl[1] = (unsigned int  )5;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         void  *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned int  )0;
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
               	/* EXEC SQL close c3; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 10;
                sqlstm.arrsiz = 10;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )940;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)256;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


		sprintf(tmp_msg, "겸직여부수정오류 ==> [%s]", empno);
          	perror_quit(tmp_msg);
	}
}
update_pimvari()
{
        /* EXEC SQL UPDATE pimvari
                 SET    value1 = :inorgym
		 WHERE  gubun = 'B2' AND sgubun = '0000'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 10;
        sqlstm.arrsiz = 10;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update pimvari  set value1=:b0 where (gubun='B2' and\
 sgubun='0000')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )955;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)256;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (         void  *)inorgym;
        sqlstm.sqhstl[0] = (unsigned int  )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         void  *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned int  )0;
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
             	perror_quit("Update Pimvari Error"); 
}
/**********<< PROGRAM END >>********************************/
