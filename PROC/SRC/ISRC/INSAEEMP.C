
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
    "insaeemp.pc"
};


static unsigned int sqlctx = 153163;


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
   unsigned char  *sqhstv[3];
   unsigned long  sqhstl[3];
            int   sqhsts[3];
            short *sqindv[3];
            int   sqinds[3];
   unsigned long  sqharm[3];
   unsigned long  *sqharc[3];
   unsigned short  sqadto[3];
   unsigned short  sqtdso[3];
} sqlstm = {12,3};

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

 static char *sq0017 = 
"select A.empno ,A.deptcode  from pimeemp A where ((A.orgnum=:b0 and A.deptc\
ode not  in ('Y0000','YKKK0')) and A.eempno is null )           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,0,0,32,88,0,0,0,0,0,1,0,
20,0,0,2,0,0,32,95,0,0,0,0,0,1,0,
35,0,0,3,0,0,32,102,0,0,0,0,0,1,0,
50,0,0,4,85,0,4,122,0,0,1,0,0,1,0,2,9,0,0,
69,0,0,5,21,0,2,156,0,0,0,0,0,1,0,
84,0,0,6,323,0,3,183,0,0,1,1,0,1,0,1,9,0,0,
103,0,0,7,291,0,5,228,0,0,0,0,0,1,0,
118,0,0,8,307,0,5,264,0,0,0,0,0,1,0,
133,0,0,9,712,0,5,299,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
156,0,0,10,449,0,5,349,0,0,1,1,0,1,0,1,9,0,0,
175,0,0,11,284,0,5,392,0,0,0,0,0,1,0,
190,0,0,12,782,0,5,427,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
213,0,0,13,802,0,5,478,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
236,0,0,14,825,0,5,531,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
259,0,0,15,410,0,5,585,0,0,0,0,0,1,0,
274,0,0,16,478,0,5,629,0,0,0,0,0,1,0,
289,0,0,17,139,0,9,668,0,0,1,1,0,1,0,1,9,0,0,
308,0,0,17,0,0,13,679,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
331,0,0,17,0,0,15,691,0,0,0,0,0,1,0,
346,0,0,18,73,0,4,697,0,0,3,2,0,1,0,2,97,0,0,1,9,0,0,1,97,0,0,
373,0,0,19,114,0,4,713,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,9,0,0,
400,0,0,20,73,0,4,733,0,0,3,2,0,1,0,2,97,0,0,1,97,0,0,1,9,0,0,
427,0,0,21,328,0,5,753,0,0,3,3,0,1,0,1,9,0,0,1,97,0,0,1,97,0,0,
454,0,0,17,0,0,15,795,0,0,0,0,0,1,0,
469,0,0,22,313,0,5,800,0,0,0,0,0,1,0,
484,0,0,23,437,0,3,820,0,0,1,1,0,1,0,1,9,0,0,
503,0,0,24,449,0,5,842,0,0,1,1,0,1,0,1,9,0,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : insaeemp.pc
     PROGRM-Decription : 결재정보 추출 작업 (인사발령이 변경될 경우 항상 이 작업을 수행해야 함)
     USAGE             :
     SYSTEM-NAME       :
     SUBSYSTEM-NAME    :
     Programmer        : 전철호?
     Version           : 1.00
     Date              : 2003.03.31
  
    Update Contents
     Version      date(yy.mm.dd)     programmer      description            relevant doc.n
       1.00       2003.03.31         전철호          최초작성
       1.01       2003.09.04         이민용          사장님이 결재권자이면 본인이 결재자로 지정
       1.02       2004.02.19         이민용          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.
       1.03       2004.10.21         이민용          신직급 개편으로 SM2급(11)를 부장(10)으로 수정함
       1.04       2005.01.28         김선연          노동조합원 하드코딩, 상위결재자 없는사람 최상위 결재자로 등록
       *) HR 인프라 고도화 Project(직위-> 직책, 직급 -> BAND(비공개))
==================================================================================================*/
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <sqlca.h>
#include <sqlda.h>
/*#include <sqlcpr.h>*/
#include "hinsa_common.h"
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"


#define   EMPNO        4
#define   KORNAME     12
#define   ORGNUM       3
#define   DEPTCODE     6
#define   PAYCL        3
#define   PAYRA        3
#define   PAYRAYN      1
#define   PSTATE       1
#define   JOBDEPT      6
#define   JOBPAYRA     3
#define   JOBPAYRAYN   1
#define   WRITETIME   15
#define   WRITEEMP     4

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     /* varchar v_orgnum [ORGNUM + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_orgnum;

     char    v_empno      [05] = {0};    /* 사번 */
     char    v_deptcode   [06] = {0};    /* 부서코드 */
     char    v_updeptcode [06] = {0};    /* 부서코드 */
     char    v_chkempno   [05] = {0};    /* 사번 */
     char    v_chkeempno  [05] = {0};    /* 사번 */
     int     cnt;
/* EXEC SQL END DECLARE SECTION; */ 



int PL_get_orgnum(void);
int PL_delete_pimeemp(void);
int PL_pimpmas2pimeemp(void);

void main(void)
{
     char FL_dir[255];
     char FL_Line[255];
     char FL_file[255];
   
     STRINIT(FL_file);
     STRINIT(FL_Line);
     strcpy(FL_file,"insaeemp");
   
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
     }
   
     hinsa_log_print(0,"결재자 정보 추출(insaeemp) 프로그램 시작...");
   
     
     hinsa_db_connect();
     
   
     if (PL_get_orgnum() == FAILURE)
     {
          /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 0;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )5;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"PL_get_orgnum Function 에러로 종료...");
          return;
     }
   
     if (PL_delete_pimeemp() == FAILURE)
     {
          /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 0;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )20;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"PL_delete_pimeemp 에러로 종료...");
          return;
     }
   
     if (PL_pimpmas2pimeemp() == FAILURE)
     {
          /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 0;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )35;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"PL_pimpmas2pimeemp 에러로 종료...");
          return;
     }
   
     hinsa_exit(0,"결재자 정보 추출(insaeemp) 프로그램 정상 처리...");
     return;
}

/*==================================================================================================
   현조직차수를 읽어온다...
==================================================================================================*/
int PL_get_orgnum(void)
{
     char FL_Line[255];
     
     STRINIT(FL_Line);
     STRINIT(&v_orgnum); /*shm 2007.03.13 */
   
     hinsa_log_print(0, "현조직차수를 읽어온다...");
     /* EXEC SQL 
     SELECT SUBSTR(value1,1,3)  INTO :v_orgnum  FROM pimvari  Where gubun  = '00'  AND sgubun = '0001'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select SUBSTR(value1,1,3) into :b0  from pimvari where \
(gubun='00' and sgubun='0001')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )50;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
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


                 
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     if  (sizeof(hinsa_trim((char *)v_orgnum.arr)) < 3)
     {
          hinsa_log_print(0, "현 조직차수 데이타가 없습니다.. 인사변수 테이블 확인 바람...");
          return (FAILURE);
     }
   
     STRINIT(FL_Line);
     sprintf(FL_Line, "현조직차수: %s", v_orgnum.arr);
     hinsa_log_print(0, FL_Line);
   
     return (SUCCESS);
}

/*==================================================================================================
   결재자 테이블(pimeemp)을 삭제한다.
==================================================================================================*/
int PL_delete_pimeemp(void)
{
     char FL_Line[255];
   
     STRINIT(FL_Line);
   
     hinsa_log_print(0, "pimeemp 테이블 삭제시작...");
     
     /* EXEC SQL DELETE  FROM pimeemp; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pimeemp ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )69;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     hinsa_log_print(0, "pimeemp 테이블 삭제완료...");
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     return (SUCCESS);
}

/*==================================================================================================
   인사마스터에서 피 결재자 레코드를 생성한다...
   직급 : SM2급(11)~ 특정직(93) 또는 직위 : 팀장(28) ~ 계약사원(E2) 까지의
 신직급 : 부장(10) ~ 특정직(93) 또는 직위 : 팀장(28) ~ 계약사원(E2) 까지의
HR BAND : L2(C11)  ~ P(D41)     또는 직책 : 팀원(D11)~ 계약사원(H11)까지의 사원은 피결재로 등록한다.
==================================================================================================*/
int PL_pimpmas2pimeemp(void)
{
     char FL_Line[255];
   
     STRINIT(FL_Line);
   
     hinsa_log_print(0, "피결재자 레코드 생성 시작...");
     /* EXEC SQL 
     INSERT INTO pimeemp
               ( empno,
                 korname,
                 paycl,
                 payra,
                 payrayn,
                 pstate,
                 orgnum,
                 deptcode,
                 jobdept,
                 jobpayra,
                 jobpayrayn,
                 writetime,
                 writeemp )
         (SELECT empno,
                 korname,
                 paycl,
                 payra,
                 payrayn,
                 pstate,
                 orgnum,
                 deptcode,
                 jobdept,
                 jobpayra,
                 jobpayrayn,
                 TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),
                 '0000'
            FROM pimpmas
           Where pstate < '80'
             AND orgnum = :v_orgnum
          ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pimeemp (empno,korname,paycl,payra,payrayn,\
pstate,orgnum,deptcode,jobdept,jobpayra,jobpayrayn,writetime,writeemp)(select\
 empno ,korname ,paycl ,payra ,payrayn ,pstate ,orgnum ,deptcode ,jobdept ,jo\
bpayra ,jobpayrayn ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD') ,'0000'  from pimpma\
s where (pstate<'80' and orgnum=:b0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )84;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
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


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     sprintf(FL_Line, "피결재자 생성된 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
   
   
     hinsa_log_print(0, "M사번(임원)은 본인을 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        set     (eempno,
                 ekorname,
                 epaycl,
                 epayra,
                 epayrayn,
                 eorgnum,
                 edeptcode,
                 ejobdept,
                 ejobpayra,
                 ejobpayrayn )
        =(SELECT empno,
                 korname,
                 paycl,
                 payra,
                 payrayn,
                 orgnum,
                 deptcode,
                 jobdept,
                 jobpayra,
                 jobpayrayn
            FROM pimpmas
           Where empno = a.empno
         )
      Where eempno IS null
        AND substr(empno,1,1) = 'M'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korna\
me ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  f\
rom pimpmas where empno=a.empno) where (eempno is null  and substr(empno,1,1)\
='M')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )103;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "근무직책이 CL을 제외한 PO이상은 본인을 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        set     (eempno,        
                 ekorname,      
                 epaycl,        
                 epayra,        
                 epayrayn,      
                 eorgnum,       
                 edeptcode,     
                 ejobdept,      
                 ejobpayra,     
                 ejobpayrayn )  
        =(SELECT empno,         
                 korname,       
                 paycl,         
                 payra,         
                 payrayn,       
                 orgnum,        
                 deptcode,      
                 jobdept,       
                 jobpayra,      
                 jobpayrayn     
            FROM pimpmas        
           Where empno = a.empno
          )
      Where eempno IS null
        AND jobpayra<>'C12' And jobpayra <= 'C20'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korna\
me ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  f\
rom pimpmas where empno=a.empno) where ((eempno is null  and jobpayra<>'C12')\
 and jobpayra<='C20')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )118;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  //2018.11     /*AND jobpayra < 'C51';*/
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     hinsa_log_print(0, "자기와 동일한 근무부서에 직무대행자를 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        SET     (eempno, 
                 ekorname,
                 epaycl, 
                 epayra,         
                 epayrayn,       
                 eorgnum,        
                 edeptcode,      
                 ejobdept,       
                 ejobpayra,      
                 ejobpayrayn )   
        =(SELECT distinct M.empno,        
                 M.korname,      
                 M.paycl,        
                 M.payra,        
                 M.payrayn,      
                 M.orgnum,       
                 M.deptcode,     
                 M.jobdept,      
                 M.jobpayra,     
                 M.jobpayrayn    
            FROM pimpmas M,       
                (SELECT A.empno, A.korname, A.orgnum, A.deptcode, A.addeptcode
                   FROM pihanno A
                  Where A.anupdyn    = 'Y'
                    AND A.ancode in ('243')
                    AND A.orgnum     = :v_orgnum
                    AND A.addeptcode is not null
                  MINUS                                 
                 SELECT B.empno, B.korname, B.orgnum, B.deptcode, B.addeptcode
                   FROM pihanno B
                  Where B.anupdyn    = 'Y'
                    AND B.ancode in ('248')
                    AND B.orgnum     = :v_orgnum
                    AND B.addeptcode is not null
                ) T               
           Where M.empno    = T.empno
             AND A.jobdept  = T.addeptcode              
             AND A.orgnum   = T.orgnum )
      Where eempno IS NULL ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select distinct M.e\
mpno ,M.korname ,M.paycl ,M.payra ,M.payrayn ,M.orgnum ,M.deptcode ,M.jobdept\
 ,M.jobpayra ,M.jobpayrayn  from pimpmas M ,(select A.empno ,A.korname ,A.org\
num ,A.deptcode ,A.addeptcode  from pihanno A where (((A.anupdyn='Y' and A.an\
code in ('243')) and A.orgnum=:b0) and A.addeptcode is  not null ) minus sele\
ct B.empno ,B.korname ,B.orgnum ,B.deptcode ,B.addeptcode  from pihanno B whe\
re (((B.anupdyn='Y' and B.ancode in ('248')) and B.orgnum=:b0) and B.addeptco\
de is  not null )) T where ((M.empno=T.empno and A.jobdept=T.addeptcode) and \
A.orgnum=T.orgnum)) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )133;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[1] = (unsigned long )6;
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

      
                      
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {                
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
    
     hinsa_log_print(0, "자기와 동일한 근무부서에 있는 보임자를 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        SET     (eempno,
                 ekorname,
                 epaycl,
                 epayra,
                 epayrayn,
                 eorgnum,
                 edeptcode,
                 ejobdept,
                 ejobpayra,
                 ejobpayrayn )
        =(SELECT empno,
                 korname,
                 paycl,
                 payra,
                 payrayn,
                 orgnum,
                 deptcode,
                 jobdept,
                 jobpayra,
                 jobpayrayn
            FROM pimpmas
           Where orgnum     = A.orgnum
             AND jobdept    = A.jobdept
             AND jobpayrayn = 'Y'
             AND pstate     < '80'
             AND 1          = ( SELECT COUNT(*) FROM pimpmas
                                 Where jobpayrayn = 'Y'
                                   AND pstate     < '80'
                                   AND orgnum     = :v_orgnum
                                   AND jobdept    = A.jobdept )
         )
      Where eempno IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korna\
me ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  f\
rom pimpmas where ((((orgnum=A.orgnum and jobdept=A.jobdept) and jobpayrayn='\
Y') and pstate<'80') and 1=(select count(*)   from pimpmas where (((jobpayray\
n='Y' and pstate<'80') and orgnum=:b0) and jobdept=A.jobdept)))) where eempno\
 is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )156;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
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


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "자기가 보임자면 자기 자신을 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        SET     (eempno,
                 ekorname,
                 epaycl,
                 epayra,
                 epayrayn,
                 eorgnum,
                 edeptcode,
                 ejobdept,
                 ejobpayra,
                 ejobpayrayn )
        =(SELECT empno,
                 korname,
                 paycl,
                 payra,
                 payrayn,
                 orgnum,
                 deptcode,
                 jobdept,
                 jobpayra,
                 jobpayrayn
            FROM pimeemp
           Where empno = A.empno)
      Where jobpayrayn = 'Y'
        AND eempno IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korna\
me ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  f\
rom pimeemp where empno=A.empno) where (jobpayrayn='Y' and eempno is null )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )175;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     //return (SUCCESS);
     hinsa_log_print(0, "동일 근무부서에 보임자가 없는 경우는 겸직자를 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        set     (eempno, 
                 ekorname,
                 epaycl, 
                 epayra,         
                 epayrayn,       
                 eorgnum,        
                 edeptcode,      
                 ejobdept,       
                 ejobpayra,      
                 ejobpayrayn )   
        =(SELECT distinct M.empno,        
                 M.korname,      
                 M.paycl,        
                 M.payra,        
                 M.payrayn,      
                 M.orgnum,       
                 M.deptcode,     
                 M.jobdept,      
                 M.jobpayra,     
                 M.jobpayrayn    
            FROM pimpmas M,       
                ( SELECT A.empno, A.korname, A.orgnum, A.deptcode, A.addeptcode /o, decode(a.ancode,'233','233','243')o/
                    FROM pihanno A
                   Where A.anupdyn    = 'Y'
                     AND A.ancode in ('233')
                     AND A.adpayra   <= 'C20'      --//dsa2000 2018.11 'C18'=>'C20'으로 변경  /o 1091(김경호) C11에서 C18로 수정 2013.12.05 o/
                     AND A.orgnum     = :v_orgnum
                     AND A.addeptcode is not null  and (A.addeptcode||Empno <>'BBFC0'||'M208')
                   MINUS                                 
                  SELECT B.empno, B.korname, B.orgnum, B.deptcode, B.addeptcode /o, decode(b.ancode,'238','233','243')o/
                    FROM pihanno B
                   Where B.anupdyn    = 'Y'
                     AND B.ancode in ('238')
                     AND B.orgnum     = :v_orgnum
                     AND B.addeptcode is not null
                ) T               
           Where M.empno   = T.empno
             AND A.jobdept = T.addeptcode
             AND A.orgnum  = T.orgnum )
      Where eempno IS NULL ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select distinct M.e\
mpno ,M.korname ,M.paycl ,M.payra ,M.payrayn ,M.orgnum ,M.deptcode ,M.jobdept\
 ,M.jobpayra ,M.jobpayrayn  from pimpmas M ,(select A.empno ,A.korname ,A.org\
num ,A.deptcode ,A.addeptcode  from pihanno A where (((((A.anupdyn='Y' and A.\
ancode in ('233')) and A.adpayra<='C20') and A.orgnum=:b0) and A.addeptcode i\
s  not null ) and (A.addeptcode||Empno)<>('BBFC0'||'M208')) minus select B.em\
pno ,B.korname ,B.orgnum ,B.deptcode ,B.addeptcode  from pihanno B where (((B\
.anupdyn='Y' and B.ancode in ('238')) and B.orgnum=:b0) and B.addeptcode is  \
not null )) T where ((M.empno=T.empno and A.jobdept=T.addeptcode) and A.orgnu\
m=T.orgnum)) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )190;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[1] = (unsigned long )6;
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

      
                      
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {                
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "동일 근무부서에 보임자가 없는 경우 상위부서 직무대행자를 결재자로 지정");
     /* EXEC SQL 
     UPDATE pimeemp A
        set     (eempno, 
                 ekorname,
                 epaycl, 
                 epayra,         
                 epayrayn,       
                 eorgnum,        
                 edeptcode,      
                 ejobdept,       
                 ejobpayra,      
                 ejobpayrayn )   
        =(SELECT distinct M.empno,        
                 M.korname,      
                 M.paycl,        
                 M.payra,        
                 M.payrayn,      
                 M.orgnum,       
                 M.deptcode,     
                 M.jobdept,      
                 M.jobpayra,     
                 M.jobpayrayn    
            FROM pimpmas M,       
               ( SELECT A.empno, A.korname, A.orgnum, A.deptcode, A.addeptcode/o, decode(a.ancode,'233','233','243')o/
                   FROM pihanno A
                  Where A.anupdyn    = 'Y'
                    AND A.ancode in ('243')
                    AND A.orgnum     = :v_orgnum
                    AND A.addeptcode is not null
                  MINUS                         
                 SELECT B.empno, B.korname, B.orgnum, B.deptcode, B.addeptcode/o, decode(a.ancode,'238','233','243')o/
                   FROM pihanno B
                  Where B.anupdyn    = 'Y'
                    AND B.ancode in ('248')
                    AND B.orgnum     = :v_orgnum
                    AND B.addeptcode is not null
               ) T               
          Where M.empno   = T.empno
            AND (T.orgnum, T.addeptcode) IN (SELECT orgnum, extcode
                                               FROM pycdept
                                              Where A.orgnum   = orgnum
                                                AND A.jobdept = deptcode)
            AND A.orgnum  = T.orgnum )
      Where eempno IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select distinct M.e\
mpno ,M.korname ,M.paycl ,M.payra ,M.payrayn ,M.orgnum ,M.deptcode ,M.jobdept\
 ,M.jobpayra ,M.jobpayrayn  from pimpmas M ,(select A.empno ,A.korname ,A.org\
num ,A.deptcode ,A.addeptcode  from pihanno A where (((A.anupdyn='Y' and A.an\
code in ('243')) and A.orgnum=:b0) and A.addeptcode is  not null ) minus sele\
ct B.empno ,B.korname ,B.orgnum ,B.deptcode ,B.addeptcode  from pihanno B whe\
re (((B.anupdyn='Y' and B.ancode in ('248')) and B.orgnum=:b0) and B.addeptco\
de is  not null )) T where ((M.empno=T.empno and (T.orgnum,T.addeptcode) in (\
select orgnum ,extcode  from pycdept where (A.orgnum=orgnum and A.jobdept=dep\
tcode))) and A.orgnum=T.orgnum)) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )213;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[1] = (unsigned long )6;
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

   
                      
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {                
           sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
           hinsa_log_print(0, FL_Line);
           return (FAILURE);
     }
     
     hinsa_log_print(0, "동일 근무부서에 보임자가 없는 경우 상위부서 겸직자를 결재자로 지정");
     /* EXEC SQL 
     UPDATE pimeemp A
        SET     (eempno, 
                 ekorname,
                 epaycl, 
                 epayra,         
                 epayrayn,       
                 eorgnum,        
                 edeptcode,      
                 ejobdept,       
                 ejobpayra,      
                 ejobpayrayn )   
        =(SELECT distinct M.empno,        
                 M.korname,      
                 M.paycl,        
                 M.payra,        
                 M.payrayn,      
                 M.orgnum,       
                 M.deptcode,     
                 M.jobdept,      
                 M.jobpayra,     
                 M.jobpayrayn    
            FROM pimpmas M,       
                ( SELECT A.empno, A.korname, A.orgnum, A.deptcode, A.addeptcode /o, decode(a.ancode,'233','233','243')o/
                    FROM pihanno A
                   Where A.anupdyn    = 'Y'
                     AND A.ancode in ('233')
                     AND A.adpayra   <= 'C20' /odsa2000 2018.11 'C18'=>'C20'으로 변경o/  /o 1091(김경호) C11에서 C18로 수정 2013.12.05 o/
                     AND A.orgnum     = :v_orgnum
                     AND A.addeptcode is not null
                   MINUS                         
                  SELECT B.empno, B.korname, B.orgnum, B.deptcode, B.addeptcode /o, decode(a.ancode,'238','233','243')o/
                    FROM pihanno B
                   Where B.anupdyn    = 'Y'
                     AND B.ancode in ('238')
                     AND B.orgnum     = :v_orgnum
                     AND B.addeptcode is not null
                ) T               
           Where M.empno   = T.empno
             AND (T.orgnum, T.addeptcode) IN (SELECT orgnum, extcode
                                                FROM pycdept
                                               Where A.orgnum   = orgnum
                                                 AND A.jobdept = deptcode)
             AND A.orgnum  = T.orgnum )
      Where eempno IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select distinct M.e\
mpno ,M.korname ,M.paycl ,M.payra ,M.payrayn ,M.orgnum ,M.deptcode ,M.jobdept\
 ,M.jobpayra ,M.jobpayrayn  from pimpmas M ,(select A.empno ,A.korname ,A.org\
num ,A.deptcode ,A.addeptcode  from pihanno A where ((((A.anupdyn='Y' and A.a\
ncode in ('233')) and A.adpayra<='C20') and A.orgnum=:b0) and A.addeptcode is\
  not null ) minus select B.empno ,B.korname ,B.orgnum ,B.deptcode ,B.addeptc\
ode  from pihanno B where (((B.anupdyn='Y' and B.ancode in ('238')) and B.org\
num=:b0) and B.addeptcode is  not null )) T where ((M.empno=T.empno and (T.or\
gnum,T.addeptcode) in (select orgnum ,extcode  from pycdept where (A.orgnum=o\
rgnum and A.jobdept=deptcode))) and A.orgnum=T.orgnum)) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )236;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[1] = (unsigned long )6;
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

   
                      
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {                
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "겸직자에도 없는 경우는 상위 부서의 보임자를 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        set     (eempno,
                 ekorname,
                 epaycl,
                 epayra,
                 epayrayn,
                 eorgnum,
                 edeptcode,
                 ejobdept,
                 ejobpayra,
                 ejobpayrayn )
        =(SELECT empno,
                 korname,
                 paycl,
                 payra,
                 payrayn,
                 orgnum,
                 deptcode,
                 jobdept,
                 jobpayra,
                 jobpayrayn
            FROM pimpmas
           Where jobpayrayn = 'Y'
             AND pstate  < '80'
             AND (orgnum, deptcode) IN (SELECT orgnum, extcode
                                          FROM pycdept
                                         Where A.orgnum   = orgnum
                                           AND A.jobdept = deptcode)
             AND rownum = 1
         )
      Where eempno IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korna\
me ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  f\
rom pimpmas where (((jobpayrayn='Y' and pstate<'80') and (orgnum,deptcode) in\
 (select orgnum ,extcode  from pycdept where (A.orgnum=orgnum and A.jobdept=d\
eptcode))) and rownum=1)) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )259;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     /* ============================================================================== */
     
     /* ==이 하드코딩 내역.=========================================================== */
            
     /* 2013.11.Add dsa2000 : pimeempfix 테이블 생성하여 관리토록 수정함. : pimeempfix 테이블에 하드코딩 부서를 추가하면 됩니다. */
     /* EXEC SQL      
     Update pimeemp A
        Set (       Eempno,   Ekorname,  Epaycl,  Epayra,  Epayrayn,  Eorgnum,   Edeptcode,  Ejobdept,   Ejobpayra,  Ejobpayrayn )
          = (Select F.Eempno, M.Korname, M.Paycl, M.Payra, M.Payrayn, F.Eorgnum, M.Deptcode, F.Ejobdept, M.Jobpayra, M.Jobpayrayn 
     	         From pimeempFix F, Pimpmas M
     		      Where F.Eorgnum  = A.Orgnum 
     		        And F.Ejobdept = A.Jobdept
     		        And F.Eempno   = M.Empno
     		        And nvl(F.useyn,'N') ='Y')  
      Where (Orgnum, Jobdept) In ( Select Eorgnum, Ejobdept From pimeempFix where nvl(useyn,'N') ='Y')
        And Jobpayrayn = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (Eempno,Ekorname,Epaycl,Epayra,Ep\
ayrayn,Eorgnum,Edeptcode,Ejobdept,Ejobpayra,Ejobpayrayn)=(select F.Eempno ,M.\
Korname ,M.Paycl ,M.Payra ,M.Payrayn ,F.Eorgnum ,M.Deptcode ,F.Ejobdept ,M.Jo\
bpayra ,M.Jobpayrayn  from pimeempFix F ,Pimpmas M where (((F.Eorgnum=A.Orgnu\
m and F.Ejobdept=A.Jobdept) and F.Eempno=M.Empno) and nvl(F.useyn,'N')='Y')) \
where ((Orgnum,Jobdept) in (select Eorgnum ,Ejobdept  from pimeempFix where n\
vl(useyn,'N')='Y') and Jobpayrayn='N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )274;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }        

     /*2015.10.30.hjku. 1775 이광조 매니저 결재 권한 HR팀장님으로 변경 요청.. 전지영M
     hinsa_log_print(0, " - 1775 이광조 매니저 결재 권한 HR팀장님으로 변경, <하드코딩>");     
     EXEC SQL           
     Update pimeemp A
        Set (        Eempno,  Ekorname,  Epaycl,  Epayra,  Epayrayn,  Eorgnum,  Edeptcode,  Ejobdept,  Ejobpayra,  Ejobpayrayn )
          = (Select M.empno, M.Korname, M.Paycl, M.Payra, M.Payrayn, M.orgnum, M.Deptcode, M.jobdept, M.Jobpayra, M.Jobpayrayn 
     	         From Pimpmas M
     		      Where Empno ='2545')  
      Where empno='1775';                                               
     hinsa_log_print(0, "PL_pimpmas2pimeemp, 1775 이광조 매니저 데이타 저장 완료...");  */
     
     /* ============================================================================== */
     /* 결재자가 null 인 사람만 조회 */
     hinsa_log_print(0, "상위부서 결재권자 없는사람 최상위 결재권자로 수정...");
     /* EXEC SQL DECLARE cur_01 CURSOR FOR
               SELECT A.empno, A.deptcode
                 FROM pimeemp A
                Where A.orgnum   = :v_orgnum
                  AND A.deptcode not in ('Y0000','YKKK0')
                  AND A.eempno   is null; */ 

     /* EXEC SQL OPEN cur_01; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0017;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )289;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
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


     
     if  (SQLCODE != SQL_OK)
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     while(TRUE)
     {
          /* EXEC SQL FETCH cur_01 INTO
                        :v_empno,
                        :v_deptcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 2;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )308;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)v_empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)v_deptcode;
          sqlstm.sqhstl[1] = (unsigned long )6;
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

   
        /*printf(":v_empno    ==> [%s]\n\n",v_empno);
          printf(":v_deptcode ==> [%s]\n",v_deptcode);
          printf(":v_orgnum   ==> [%s]\n",v_orgnum.arr);      */      
          if  (SQLCODE == SQL_NO_DATA)     break;
       
          if  ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK))
          {
               sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               /* EXEC SQL CLOSE cur_01; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 2;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )331;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return (FAILURE);
          }
       
          
          /* hinsa_log_print(0, "상위부서 조회...");  */
          /* EXEC SQL 
          Select extcode into :v_updeptcode
            from pycdept 
           Where orgnum   = :v_orgnum
             and deptcode = :v_deptcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 3;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select extcode into :b0  from pycdept where (orgnu\
m=:b1 and deptcode=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )346;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)v_updeptcode;
          sqlstm.sqhstl[0] = (unsigned long )6;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&v_orgnum;
          sqlstm.sqhstl[1] = (unsigned long )6;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)v_deptcode;
          sqlstm.sqhstl[2] = (unsigned long )6;
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


                
          if  (SQLCODE != SQL_OK)
          {
               sprintf(FL_Line, "1.Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               return (FAILURE);
          }   
       
          
          while(TRUE)
          {
               /* EXEC SQL 
               select count(*) into :cnt 
                 from pimpmas 
                Where deptcode = :v_updeptcode
                  and jobpayrayn = 'Y'
                  and orgnum = :v_orgnum
                  and pstate  < '80'; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 3;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select count(*)  into :b0  from pimpmas where\
 (((deptcode=:b1 and jobpayrayn='Y') and orgnum=:b2) and pstate<'80')";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )373;
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
               sqlstm.sqhstv[1] = (unsigned char  *)v_updeptcode;
               sqlstm.sqhstl[1] = (unsigned long )6;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&v_orgnum;
               sqlstm.sqhstl[2] = (unsigned long )6;
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


              
                     
               if  (SQLCODE != SQL_OK)
               {
                    sprintf(FL_Line, "2.Oracle 에러 : %s", SQLERRM);
                    hinsa_log_print(0, FL_Line);
                    return (FAILURE);
               }
               
               if  (cnt == 0)
               {
                    strcpy(v_deptcode,v_updeptcode);
              
                    /* EXEC SQL 
                    select extcode into :v_updeptcode
                      from pycdept 
                     Where deptcode = :v_deptcode
                       and orgnum   = :v_orgnum; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 3;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "select extcode into :b0  from pycdept wh\
ere (deptcode=:b1 and orgnum=:b2)";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )400;
                    sqlstm.selerr = (unsigned short)0;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)v_updeptcode;
                    sqlstm.sqhstl[0] = (unsigned long )6;
                    sqlstm.sqhsts[0] = (         int  )0;
                    sqlstm.sqindv[0] = (         short *)0;
                    sqlstm.sqinds[0] = (         int  )0;
                    sqlstm.sqharm[0] = (unsigned long )0;
                    sqlstm.sqadto[0] = (unsigned short )0;
                    sqlstm.sqtdso[0] = (unsigned short )0;
                    sqlstm.sqhstv[1] = (unsigned char  *)v_deptcode;
                    sqlstm.sqhstl[1] = (unsigned long )6;
                    sqlstm.sqhsts[1] = (         int  )0;
                    sqlstm.sqindv[1] = (         short *)0;
                    sqlstm.sqinds[1] = (         int  )0;
                    sqlstm.sqharm[1] = (unsigned long )0;
                    sqlstm.sqadto[1] = (unsigned short )0;
                    sqlstm.sqtdso[1] = (unsigned short )0;
                    sqlstm.sqhstv[2] = (unsigned char  *)&v_orgnum;
                    sqlstm.sqhstl[2] = (unsigned long )6;
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


             
                    
                    if  (SQLCODE != SQL_OK)
                    {
                         sprintf(FL_Line, "3.:Oracle 에러 : %s,%s", SQLERRM,v_deptcode);
                         hinsa_log_print(0, FL_Line);
                         return (FAILURE);
                    }
                      
                    if (strcmp(v_updeptcode, "A0000")==0) break;
             
             
               }
               else if (cnt == 1)
               {
                    /* EXEC SQL 
                    UPDATE pimeemp A
                       set     (eempno,
                                ekorname,
                                epaycl,
                                epayra,
                                epayrayn,
                                eorgnum,
                                edeptcode,
                                ejobdept,
                                ejobpayra,
                                ejobpayrayn )
                       =(SELECT empno,
                                korname,
                                paycl,
                                payra,
                                payrayn,
                                orgnum,
                                deptcode,
                                jobdept,
                                jobpayra,
                                jobpayrayn
                           FROM pimpmas
                          Where jobpayrayn = 'Y'
                            AND pstate  < '80'
                            AND orgnum  = :v_orgnum
                            AND jobdept = :v_updeptcode
                            AND rownum  = 1 )
                     Where A.empno = :v_empno; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 3;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,e\
paycl,epayra,epayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(sele\
ct empno ,korname ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra\
 ,jobpayrayn  from pimpmas where ((((jobpayrayn='Y' and pstate<'80') and orgn\
um=:b0) and jobdept=:b1) and rownum=1)) where A.empno=:b2";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )427;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
                    sqlstm.sqhstl[0] = (unsigned long )6;
                    sqlstm.sqhsts[0] = (         int  )0;
                    sqlstm.sqindv[0] = (         short *)0;
                    sqlstm.sqinds[0] = (         int  )0;
                    sqlstm.sqharm[0] = (unsigned long )0;
                    sqlstm.sqadto[0] = (unsigned short )0;
                    sqlstm.sqtdso[0] = (unsigned short )0;
                    sqlstm.sqhstv[1] = (unsigned char  *)v_updeptcode;
                    sqlstm.sqhstl[1] = (unsigned long )6;
                    sqlstm.sqhsts[1] = (         int  )0;
                    sqlstm.sqindv[1] = (         short *)0;
                    sqlstm.sqinds[1] = (         int  )0;
                    sqlstm.sqharm[1] = (unsigned long )0;
                    sqlstm.sqadto[1] = (unsigned short )0;
                    sqlstm.sqtdso[1] = (unsigned short )0;
                    sqlstm.sqhstv[2] = (unsigned char  *)v_empno;
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


                
                    if  (SQLCODE != SQL_OK)
                    {
                         sprintf(FL_Line, "4.Oracle 에러 : %s", SQLERRM);
                         hinsa_log_print(0, FL_Line);
                         return (FAILURE);
                    }
                        
                    break;
               }
           } 
       }
   
     /* EXEC SQL CLOSE cur_01; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )454;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
     /* ============================================================================== */
     
     /* ============================================================================== */
     hinsa_log_print(0, "사장님이 결재권자이면 본인이 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pimeemp A
        SET     (eempno, ekorname, epaycl, epayra, epayrayn, eorgnum, edeptcode, ejobdept, ejobpayra, ejobpayrayn )
        =(SELECT empno,  korname,   paycl,  payra,  payrayn,  orgnum,  deptcode,  jobdept,  jobpayra,  jobpayrayn
            FROM pimeemp
           Where empno=(select PRESEMPNO from pkcpbas)
          )
      Where empno=(select PRESEMPNO from pkcpbas); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korna\
me ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  f\
rom pimeemp where empno=(select PRESEMPNO  from pkcpbas )) where empno=(selec\
t PRESEMPNO  from pkcpbas )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )469;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     /* ============================================================================== */
     /* 실장이 겸직일경우 예외처리*/
     hinsa_log_print(0, "실장이 겸직일경우 예외처리."); 
   
     /* EXEC SQL 
     INSERT INTO pimeemp 
               ( empno, korname, paycl, payra, payrayn, pstate, orgnum, deptcode, jobdept, jobpayra, jobpayrayn, writetime, writeemp )    
        (SELECT  empno, korname, paycl, payra, payrayn, pstate, orgnum, deptcode, jobdept, jobpayra, jobpayrayn,
                 TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),
                 '0000'
            FROM pimpmas
           Where pstate < '80'
             AND orgnum = :v_orgnum
             and empno in (select distinct(eempno)
                             from pimeemp 
                            Where eempno not in (select distinct(empno) from pimeemp)) ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pimeemp (empno,korname,paycl,payra,payrayn,\
pstate,orgnum,deptcode,jobdept,jobpayra,jobpayrayn,writetime,writeemp)(select\
 empno ,korname ,paycl ,payra ,payrayn ,pstate ,orgnum ,deptcode ,jobdept ,jo\
bpayra ,jobpayrayn ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD') ,'0000'  from pimpma\
s where ((pstate<'80' and orgnum=:b0) and empno in (select distinct eempno  f\
rom pimeemp where eempno not  in (select distinct empno  from pimeemp ))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )484;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
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


     
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
        
     hinsa_log_print(0, "실장이 자기와 동일한 근무부서에 있는 보임자를 결재자로 지정...");
     
     /* EXEC SQL 
     UPDATE pimeemp A
        set      (eempno, ekorname, epaycl, epayra, epayrayn, eorgnum, edeptcode, ejobdept, ejobpayra, ejobpayrayn )
        = (SELECT empno,  korname,   paycl,  payra,  payrayn,  orgnum,  deptcode,  jobdept,  jobpayra,  jobpayrayn
             FROM pimpmas
            Where orgnum     = A.orgnum
              AND jobdept    = A.jobdept
              AND jobpayrayn = 'Y'
              AND pstate     < '80'
              AND 1          = (SELECT COUNT(*) FROM pimpmas
                                 Where jobpayrayn = 'Y'
                                   AND pstate     < '80'
                                   AND orgnum     = :v_orgnum
                                   AND jobdept    = A.jobdept )
          )
      Where eempno IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimeemp A  set (eempno,ekorname,epaycl,epayra,ep\
ayrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korna\
me ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  f\
rom pimpmas where ((((orgnum=A.orgnum and jobdept=A.jobdept) and jobpayrayn='\
Y') and pstate<'80') and 1=(select count(*)   from pimpmas where (((jobpayray\
n='Y' and pstate<'80') and orgnum=:b0) and jobdept=A.jobdept)))) where eempno\
 is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )503;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
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


      
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     /* ============================================================================== */
      
     return (SUCCESS);
}
