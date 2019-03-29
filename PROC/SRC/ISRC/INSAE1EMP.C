
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
           char  filnam[13];
};
static struct sqlcxp sqlfpn =
{
    12,
    "insae1emp.pc"
};


static unsigned int sqlctx = 304971;


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
   unsigned char  *sqhstv[2];
   unsigned long  sqhstl[2];
            int   sqhsts[2];
            short *sqindv[2];
            int   sqinds[2];
   unsigned long  sqharm[2];
   unsigned long  *sqharc[2];
   unsigned short  sqadto[2];
   unsigned short  sqtdso[2];
} sqlstm = {12,2};

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
5,0,0,1,0,0,32,81,0,0,0,0,0,1,0,
20,0,0,2,0,0,32,88,0,0,0,0,0,1,0,
35,0,0,3,0,0,32,95,0,0,0,0,0,1,0,
50,0,0,4,85,0,4,115,0,0,1,0,0,1,0,2,9,0,0,
69,0,0,5,22,0,2,152,0,0,0,0,0,1,0,
84,0,0,6,376,0,3,179,0,0,1,1,0,1,0,1,9,0,0,
103,0,0,7,471,0,5,1136,0,0,1,1,0,1,0,1,9,0,0,
122,0,0,8,759,0,5,1180,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
145,0,0,9,803,0,5,1232,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
168,0,0,10,411,0,5,1285,0,0,0,0,0,1,0,
183,0,0,11,263,0,5,1326,0,0,0,0,0,1,0,
198,0,0,12,261,0,5,1361,0,0,0,0,0,1,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : insae1emp.pc
     PROGRM-Decription : 육성일지 작성자, 경력계획서 결재자 추출 작업 
     USAGE             :
     SYSTEM-NAME       :
     SUBSYSTEM-NAME    :
     Programmer        : jissi
     Version           : 1.00
     Date              : 2009.03.26
   
     Update Contents
     Version      date(yy.mm.dd)     programmer      description            relevant doc.n
       1.00       2009.03.26         jissi          최초작성
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

     /* varchar v_orgnum     [ORGNUM + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_orgnum;

     char    v_empno      [05] = {0};    /* 사번 */
     char    v_deptcode   [06] = {0};    /* 부서코드 */
     char    v_updeptcode [06] = {0};    /* 부서코드 */
     int     cnt;
/* EXEC SQL END DECLARE SECTION; */ 



int PL_get_orgnum(void);
int PL_delete_pime1emp(void);
int PL_pimpmas2pime1emp(void);

void main(void)
{
     char FL_dir[255];
     char FL_Line[255];
     char FL_file[255];
   
     STRINIT(FL_file);
     STRINIT(FL_Line);
     strcpy(FL_file,"insae1emp");
   
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
     }
   
     hinsa_log_print(0,"육성일지작성자 정보 추출(insae1emp) 프로그램 시작...");
   
     
     hinsa_db_connect();
     
   
     if  (PL_get_orgnum() == FAILURE)
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
   
     if  (PL_delete_pime1emp() == FAILURE)
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


          hinsa_exit(0,"PL_delete_pime1emp 에러로 종료...");
          return;
     }
   
     if  (PL_pimpmas2pime1emp() == FAILURE)
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


          hinsa_exit(0,"PL_pimpmas2pime1emp 에러로 종료...");
          return;
     }
   
     hinsa_exit(0,"결재자 정보 추출(insae1emp) 프로그램 정상 처리...");
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
     SELECT SUBSTR(value1,1,3)  INTO :v_orgnum
       FROM pimvari
      WHERE gubun  = '00'
        AND sgubun = '0001'; */ 

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
   결재자 테이블(pime1emp)을 삭제한다.
==================================================================================================*/
int PL_delete_pime1emp(void)
{
     char FL_Line[255];
   
     STRINIT(FL_Line);
   
     hinsa_log_print(0, "pime1emp 테이블 삭제시작...");
     
     /* EXEC SQL DELETE  FROM pime1emp; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pime1emp ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )69;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     hinsa_log_print(0, "pime1emp 테이블 삭제완료...");
   
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
int PL_pimpmas2pime1emp(void)
{
     char FL_Line[255];
   
     STRINIT(FL_Line);
   
     hinsa_log_print(0, "피결재자 레코드 생성 시작...");
     /* EXEC SQL 
     INSERT INTO pime1emp
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
        ( SELECT empno,
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
           WHERE pstate < '80'
             AND orgnum = :v_orgnum
             	/o2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정.. 안효상M
             	AND substr(empno,1,1) not in ('M','Q','J','P','Y')
             	o/
             AND FINDHIRE(EMPNO) not in ('M','Q','J','P','Y')
        ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pime1emp (empno,korname,paycl,payra,payrayn\
,pstate,orgnum,deptcode,jobdept,jobpayra,jobpayrayn,writetime,writeemp)(selec\
t empno ,korname ,paycl ,payra ,payrayn ,pstate ,orgnum ,deptcode ,jobdept ,j\
obpayra ,jobpayrayn ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD') ,'0000'  from pimpm\
as where ((pstate<'80' and orgnum=:b0) and FINDHIRE(EMPNO) not  in ('M','Q','\
J','P','Y')))";
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
/*
     hinsa_log_print(0, "미디어파견자 하드코딩(0085 권명규)...");
     EXEC SQL 
     UPDATE pime1emp A
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
           WHERE empno      = '0085'
          )
      WHERE eempno IS NULL
        and empno  in ('0422','1467');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "미디어파견자 하드코딩(0346 이병덕)...");
     EXEC SQL 
     UPDATE pime1emp A
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
           WHERE empno      = '0346'
          )
      WHERE eempno IS NULL
        and empno  in ('1352','1634');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "미디어파견자 하드코딩(0363 고석현)...");
     EXEC SQL 
     UPDATE pime1emp A
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
           WHERE empno      = '0363'
         )
      WHERE eempno IS NULL
        and empno  in ('1650','0788','2281','2153','2326');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     hinsa_log_print(0, "미디어파견자 하드코딩(0695 김윤호)...");
     EXEC SQL 
     UPDATE pime1emp A
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
           WHERE empno      = '0695'
          )
      WHERE eempno IS NULL
      and empno  in ('0086','0363');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     hinsa_log_print(0, "미디어파견자 하드코딩(1085 남영진)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '1085'
         )
      WHERE eempno IS NULL
        and empno  in ('0382','0993','2285','2247');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     hinsa_log_print(0, "미디어파견자 하드코딩(1396 장정익)...");
     EXEC SQL
     UPDATE pime1emp A         
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
           WHERE empno      = '1396'
          )
      WHERE eempno IS NULL
        and empno  in ('2106','1813','1844','2133','1815','2154','2320');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     hinsa_log_print(0, "미디어파견자 하드코딩(1746 김한수)...");
     EXEC SQL
     UPDATE pime1emp A         
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
           WHERE empno      = '1746'
          )
      WHERE eempno IS NULL
        and empno  in ('0085','0346','1085');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     hinsa_log_print(0, "미디어파견자 하드코딩(1934 신현승)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '1934'
          )
      WHERE eempno IS NULL
        and empno  in ('0185');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     hinsa_log_print(0, "미디어파견자 하드코딩(2346 김유식)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '2346'
          )
      WHERE eempno IS NULL
        and empno  in ('1118','1091','1570','2182','2142','2347','2348');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     hinsa_log_print(0, "미디어파견자 하드코딩(M128 이주식)...");
     EXEC SQL
     UPDATE pime1emp A         
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
           WHERE empno      = 'M128'
          )
      WHERE eempno IS NULL
        and empno  in ('0695','1746');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     hinsa_log_print(0, "미디어파견자 하드코딩(M131 임진채)...");
     EXEC SQL
     UPDATE pime1emp A         
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
           WHERE empno      = 'M131'
          )
      WHERE eempno IS NULL
        and empno  in ('1396','1404','1647','2121','2198','2216','2226','2346','2349','2227');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     hinsa_log_print(0, "미디어파견자 하드코딩(M133 최영찬)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = 'M133'
          )
      WHERE eempno IS NULL
        and empno  in ('0197');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     hinsa_log_print(0, "미디어파견자 하드코딩(M137 김태섭)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = 'M137'
          )
      WHERE eempno IS NULL
        and empno  in ('1471','2214');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "SKT로 파견자(0920 강인환) 결재자 하드코딩(0335 조경래)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '0335'
          )
      WHERE eempno IS NULL
        and empno  in ('0920');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "SKT로 파견자(1564 권주원) 결재자 하드코딩(0025 방범선)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '0025'
          )
      WHERE eempno IS NULL
        and empno  in ('1564');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "SKT로 파견자(1983 김경준) 결재자 하드코딩(1729 이우형)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '1729'
          )
      WHERE eempno IS NULL
        and empno  in ('1983');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "SKT로 파견자(1734 김상철,1441 신병기) 결재자 하드코딩(0338 김찬원)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '0338'
          )
      WHERE eempno IS NULL
        and empno  in ('1734','1441');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "SKT로 파견자(1229 김진만) 결재자 하드코딩(0330 한창희)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '0330'
          )
      WHERE eempno IS NULL
        and empno  in ('1229');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "SKT로 파견자(1097 배철헌) 결재자 하드코딩(2123 김수철)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '2123'
          )
      WHERE eempno IS NULL
        and empno  in ('1097');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     hinsa_log_print(0, "SKT로 파견자(1943 이덕진) 결재자 하드코딩(0099 양본석)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '0099'
          )
      WHERE eempno IS NULL
        and empno  in ('1943');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     hinsa_log_print(0, "0153외 35명은 각 소속부서 보임자를 결재자로 지정...");
     EXEC SQL 
     UPDATE pime1emp A
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
           WHERE orgnum     = A.orgnum
             AND jobdept    = A.deptcode
             AND empno     <> A.empno
             AND jobpayrayn = 'Y'
             AND pstate     < '80'
             AND 1          = ( SELECT COUNT(*) FROM pimpmas
                                 WHERE jobpayrayn = 'Y' 
                                   AND pstate     < '80'
                                   AND orgnum     = :v_orgnum
                                   AND jobdept    = A.deptcode )
          )
      WHERE eempno IS null 
        and empno  in ('0153','1462','0408','1685','1708','0891',                    --'1395','1700','2214','0628','1807',
                       '1142','1940','1868','0221','0711','2170','1735',
                       '1154','2087','1256','2286','1054','1407','0477',
                       '2068','2012','1641','0730','2127','1080','2219',
                       '1675','0745','1981','0462','0505','0887','2145');     
        
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     hinsa_log_print(0, "1700 결재자 하드코딩(M119)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = 'M119'
          )
      WHERE eempno IS NULL
        and empno  in ('1700');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     hinsa_log_print(0, "1593,0603,0774,2184,1807 결재자 하드코딩(M137)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = 'M137'
          )
      WHERE eempno IS NULL
        and empno  in ('1593','0603','0774','2184','1807');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }     


     hinsa_log_print(0, "1395 결재자 하드코딩(0124)...");
     EXEC SQL 
     UPDATE pime1emp A         
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
           WHERE empno      = '0124'
          )
      WHERE eempno IS NULL
        and empno  in ('1395','0628');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }     
     
     hinsa_log_print(0, " '0131','2105','0660','0597', '1289'는 '0250'을 결재자로 지정...");
     EXEC SQL 
     UPDATE pime1emp A
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
           WHERE empno     = '0250'
          )
      WHERE eempno IS null
        and empno  in  ('0131','2105','0660','0597', '1289');
   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
*/
     hinsa_log_print(0, "자기와 동일한 근무부서에 있는 보임자를 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pime1emp A
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
           WHERE orgnum     = A.orgnum
             AND jobdept    = A.jobdept
             AND empno     <> A.empno
             AND jobpayrayn = 'Y'
             AND pstate     < '80'
             AND 1          = ( SELECT COUNT(*) FROM pimpmas
                                 WHERE jobpayrayn = 'Y'
                                   AND pstate     < '80'
                                   AND orgnum     = :v_orgnum
                                   AND jobdept    = A.jobdept )
          )
      WHERE eempno IS null; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pime1emp A  set (eempno,ekorname,epaycl,epayra,e\
payrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korn\
ame ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  \
from pimpmas where (((((orgnum=A.orgnum and jobdept=A.jobdept) and empno<>A.e\
mpno) and jobpayrayn='Y') and pstate<'80') and 1=(select count(*)   from pimp\
mas where (((jobpayrayn='Y' and pstate<'80') and orgnum=:b0) and jobdept=A.jo\
bdept)))) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )103;
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
         
     hinsa_log_print(0, "동일 근무부서에 보임자가 없는 경우는 겸직자를 결재자로 지정...");
     /* EXEC SQL 
     UPDATE pime1emp A
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
                   WHERE A.anupdyn    = 'Y'
                     AND A.ancode in ('233')
                     AND A.adpayra   <= 'C11'
                     AND A.orgnum     = :v_orgnum
                     AND A.addeptcode is not null
                   MINUS                                 
                  SELECT B.empno, B.korname, B.orgnum, B.deptcode, B.addeptcode /o, decode(b.ancode,'238','233','243')o/
                    FROM pihanno B
                   WHERE B.anupdyn    = 'Y'
                     AND B.ancode in ('238')
                     AND B.orgnum     = :v_orgnum
                     AND B.addeptcode is not null
                ) T               
           WHERE M.empno   = T.empno
             AND A.jobdept = T.addeptcode
             AND A.orgnum  = T.orgnum 
             AND A.empno  <> T.empno )
      WHERE eempno IS null; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pime1emp A  set (eempno,ekorname,epaycl,epayra,e\
payrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select distinct M.\
empno ,M.korname ,M.paycl ,M.payra ,M.payrayn ,M.orgnum ,M.deptcode ,M.jobdep\
t ,M.jobpayra ,M.jobpayrayn  from pimpmas M ,(select A.empno ,A.korname ,A.or\
gnum ,A.deptcode ,A.addeptcode  from pihanno A where ((((A.anupdyn='Y' and A.\
ancode in ('233')) and A.adpayra<='C11') and A.orgnum=:b0) and A.addeptcode i\
s  not null ) minus select B.empno ,B.korname ,B.orgnum ,B.deptcode ,B.addept\
code  from pihanno B where (((B.anupdyn='Y' and B.ancode in ('238')) and B.or\
gnum=:b0) and B.addeptcode is  not null )) T where (((M.empno=T.empno and A.j\
obdept=T.addeptcode) and A.orgnum=T.orgnum) and A.empno<>T.empno)) where eemp\
no is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )122;
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
     UPDATE pime1emp A
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
                   WHERE A.anupdyn    = 'Y'
                     AND A.ancode in ('233')
                     AND A.orgnum     = :v_orgnum
                     AND A.addeptcode is not null
                   MINUS                         
                  SELECT B.empno, B.korname, B.orgnum, B.deptcode, B.addeptcode /o, decode(a.ancode,'238','233','243')o/
                    FROM pihanno B
                   WHERE B.anupdyn    = 'Y'
                     AND B.ancode in ('238')
                     AND B.orgnum     = :v_orgnum
                     AND B.addeptcode is not null
                ) T               
           WHERE M.empno   = T.empno
             AND (T.orgnum, T.addeptcode) IN (SELECT orgnum, extcode
                                                FROM pycdept
                                               WHERE A.orgnum   = orgnum
                                                 AND A.jobdept = deptcode)
             AND A.orgnum  = T.orgnum )
      WHERE eempno IS null; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pime1emp A  set (eempno,ekorname,epaycl,epayra,e\
payrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select distinct M.\
empno ,M.korname ,M.paycl ,M.payra ,M.payrayn ,M.orgnum ,M.deptcode ,M.jobdep\
t ,M.jobpayra ,M.jobpayrayn  from pimpmas M ,(select A.empno ,A.korname ,A.or\
gnum ,A.deptcode ,A.addeptcode  from pihanno A where (((A.anupdyn='Y' and A.a\
ncode in ('233')) and A.orgnum=:b0) and A.addeptcode is  not null ) minus sel\
ect B.empno ,B.korname ,B.orgnum ,B.deptcode ,B.addeptcode  from pihanno B wh\
ere (((B.anupdyn='Y' and B.ancode in ('238')) and B.orgnum=:b0) and B.addeptc\
ode is  not null )) T where ((M.empno=T.empno and (T.orgnum,T.addeptcode) in \
(select orgnum ,extcode  from pycdept where (A.orgnum=orgnum and A.jobdept=de\
ptcode))) and A.orgnum=T.orgnum)) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )145;
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
     UPDATE pime1emp A
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
           WHERE jobpayrayn = 'Y'
             AND pstate  < '80'
             AND (orgnum, deptcode) IN (SELECT orgnum, extcode
                                          FROM pycdept
                                         WHERE A.orgnum   = orgnum
                                           AND A.jobdept = deptcode)
             AND rownum = 1
          )
      WHERE eempno IS NULL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pime1emp A  set (eempno,ekorname,epaycl,epayra,e\
payrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korn\
ame ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  \
from pimpmas where (((jobpayrayn='Y' and pstate<'80') and (orgnum,deptcode) i\
n (select orgnum ,extcode  from pycdept where (A.orgnum=orgnum and A.jobdept=\
deptcode))) and rownum=1)) where eempno is null ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )168;
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
     
     hinsa_log_print(0, "노동조합원 지정자...");
     /* EXEC SQL 
     UPDATE pime1emp A
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
           WHERE empno = '1123'/o--노조위원장'0954'최준영 -> '1123'이성태. o/
          )
      WHERE (jobdept = 'YKKK0' ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pime1emp A  set (eempno,ekorname,epaycl,epayra,e\
payrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select empno ,korn\
ame ,paycl ,payra ,payrayn ,orgnum ,deptcode ,jobdept ,jobpayra ,jobpayrayn  \
from pimpmas where empno='1123') where jobdept='YKKK0'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )183;
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
     
     hinsa_log_print(0, "원장(A87)이상 직책자, 교육, 휴직자, 특정인8명  지정자無...");
     /* EXEC SQL 
     UPDATE pime1emp A
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
        =(SELECT null,
                 null,
                 null,
                 null,
                 null,
                 null,
                 null,
                 null,
                 null,
                 null
            FROM dual
         )
      WHERE  --(empno in  ('2360', '2406', '2380', '2412', '2430', '2450', '2416', '2438')) or 
            (Pstate >=   '60'     ) or 
            (Pstate in ( '25'  )  ) or 
            (Payra  <= ( 'A87' )  ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pime1emp A  set (eempno,ekorname,epaycl,epayra,e\
payrayn,eorgnum,edeptcode,ejobdept,ejobpayra,ejobpayrayn)=(select null  ,null\
  ,null  ,null  ,null  ,null  ,null  ,null  ,null  ,null   from dual ) where \
((Pstate>='60' or Pstate in ('25')) or Payra<='A87')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )198;
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
    /*  
     
     // 결재자가 null 인 사람만 조회 
    hinsa_log_print(0, "상위부서 결재권자 없는사람 최상위 결재권자로 수정...");
    EXEC SQL DECLARE cur_01 CURSOR FOR
              SELECT A.empno, A.deptcode
                FROM pime1emp A
               WHERE A.orgnum   = :v_orgnum
                 AND A.deptcode not in ('Y0000','YKKK0')
                 AND A.eempno   is null;
    EXEC SQL OPEN cur_01;
    
    if  (SQLCODE != SQL_OK)
    {
         sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);
    }
    
    while(TRUE)
    {
         EXEC SQL FETCH cur_01 INTO
                       :v_empno,
                       :v_deptcode;   

         if  (SQLCODE == SQL_NO_DATA) break;
      
         if  ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK))
         {
              sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
              hinsa_log_print(0, FL_Line);
              EXEC SQL CLOSE cur_01;
              return (FAILURE);
         }
         
         // hinsa_log_print(0, "상위부서 조회...");  
         EXEC SQL 
         select extcode into :v_updeptcode
           from pycdept 
          where orgnum   = :v_orgnum
            and deptcode = :v_deptcode;
               
         if  (SQLCODE != SQL_OK)
         {
              sprintf(FL_Line, "1.Oracle 에러 : %s", SQLERRM);
              hinsa_log_print(0, FL_Line);
              return (FAILURE);
         }   
      
         
         while(TRUE)
         {
              EXEC SQL 
              select count(*) into :cnt 
                from pimpmas 
               where deptcode   = :v_updeptcode
                 and jobpayrayn = 'Y'
                 and orgnum     = :v_orgnum
                 and pstate     < '80';
             
                    
              if  (SQLCODE != SQL_OK)
              {
                   sprintf(FL_Line, "2.Oracle 에러 : %s", SQLERRM);
                   hinsa_log_print(0, FL_Line);
                   return (FAILURE);
              }
              
              if  (cnt == 0)
              {
                   strcpy(v_deptcode,v_updeptcode);
             
                   EXEC SQL 
                   select extcode into :v_updeptcode
                     from pycdept 
                    where deptcode = :v_deptcode
                      and orgnum = :v_orgnum;
            
                   if  (SQLCODE != SQL_OK)
                   {
                        sprintf(FL_Line, "3.:Oracle 에러 : %s,%s", SQLERRM,v_deptcode);
                        hinsa_log_print(0, FL_Line);
                        return (FAILURE);
                   }
                     
                   if  (strcmp(v_updeptcode, "A0000")==0) break;
            
              }
              else if  (cnt == 1)
              {
                   EXEC SQL 
                   UPDATE pime1emp A
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
                         WHERE jobpayrayn = 'Y'
                           AND pstate  < '80'
                           AND orgnum  = :v_orgnum
                           AND jobdept = :v_updeptcode
                           AND rownum  = 1 )
                    WHERE A.empno = :v_empno;
               
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
   
    EXEC SQL CLOSE cur_01; 
   */  
     return (SUCCESS);
}
