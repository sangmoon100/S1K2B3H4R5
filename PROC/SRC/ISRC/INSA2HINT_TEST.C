
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
           char  filnam[18];
};
static struct sqlcxp sqlfpn =
{
    17,
    "insa2hint_test.pc"
};


static unsigned int sqlctx = 9742987;


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
5,0,0,1,127,0,4,102,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
28,0,0,2,977,0,3,171,0,0,0,0,0,1,0,
43,0,0,3,1449,0,3,235,0,0,1,1,0,1,0,1,97,0,0,
62,0,0,4,2144,0,3,309,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
85,0,0,5,480,0,3,404,0,0,1,1,0,1,0,1,97,0,0,
104,0,0,6,670,0,3,459,0,0,1,1,0,1,0,1,97,0,0,
123,0,0,7,1045,0,3,514,0,0,1,1,0,1,0,1,97,0,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : 브로드넷 인사정보변경데이터 전송 insa2hint_eai.pc
     PROGRM-Decription : 인사테이블을 읽어서 Hint Interface  2회 cron 실행
                         EAI에서 hint_empinfo 테이블을 읽어감....
                         work1 : 새벽 05시 45분
                         work2 : 오전 11시 30분
     Programmer        : 강륜종
     Version           : 1.00
     Date              : 2008.02.01
       
    Update Contents
     Version  date(yy.mm.dd)  programmer    description  Comments
       1.00   2008.02.01      강륜종        최초작성     
       1.10   2008.08.14      jissi         HR 인프라 고도화 Project(직위-> 직책, 직급 -> BAND(비공개)) 
       1.20   2014.03.05.     강륜종dsa2000 도급인력 신규 생성으로 인하여 프로그램 수정.
       1.20   2015.01.15.     hjku 도급인력 전송 누락 부분 추가
==================================================================================================*/
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

#define   YYMMDD      8

/* EXEC SQL INCLUDE sqlca.h;
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
/*  */ 
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


/* EXEC SQL BEGIN DECLARE SECTION; */ 


     /* 인터페이스 콘트롤 테이블 변수들 */
     typedef struct HINSA_ctrl_inter {
             /* varchar  v_dt_create  [YYMMDD   + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } v_dt_create;
  /* 생성일자 */
             int      v_no_crt_srl;                 /* 생성 일련번호 */
             int      v_cnt_line;                   /* 라인 건수 */
     } ts_ctrl_inter;
 

     char  vWorkdate[8+1];
 
/* EXEC SQL END DECLARE SECTION; */ 


static ts_ctrl_inter     FG_inter_ctrl;
static ts_ctrl_inter     *FGP_inter_ctrl;

static int  FG_loopcnt;
char FL_Line[255];
char worktime[6] = "";

void main(argc,argv)
int argc;
char *argv[];
{
     char *FL_date;

     char FL_file[255];

       
     if  (argc != 2) {  /* /hper/insa/HINSA/proc/bin/ERPbin/insa2hint_eai_test work1 */
          printf("[Usage] : insa2hint_eai_test 1.cron \n");
          exit(1);
     }
     
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */  
     STRINIT(&FL_file);
     STRINIT(&FL_Line);
     strcpy(FL_file,"insa2hint_eai_test");
   
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
     }
     
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */
     memset(&FG_inter_ctrl, 0x00, sizeof(ts_ctrl_inter));
   
     FGP_inter_ctrl = &FG_inter_ctrl;
     FGP_inter_ctrl->v_cnt_line = 0;
   
     /* 생성일자.. */ 
     FL_date = hinsa_sys_date(1);     
     
     strcpy(worktime, argv[1]);
     
     STR2VCTRIM(FGP_inter_ctrl->v_dt_create, FL_date, YYMMDD);  
     
     hinsa_log_print(0,"HINT 인사정보 인터페이스(insa2hint_eai_test) 프로그램 시작...");
   
     hinsa_db_connect();  
   
     printf("FL_date : %s\n", FGP_inter_ctrl->v_dt_create.arr);
     printf("worktime : %s\n", worktime);       

     /* 현재시간 체크 */
     /* EXEC SQL     
     SELECT case when  :worktime ='work1' then TO_CHAR(SYSDATE -1,'YYYYMMDD')  
            else                               TO_CHAR(SYSDATE,'YYYYMMDD')   end
       INTO :vWorkdate
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select  case  when :b0='work1' then TO_CHAR((SYSDATE-1)\
,'YYYYMMDD') else TO_CHAR(SYSDATE,'YYYYMMDD')  end  into :b1  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)worktime;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)vWorkdate;
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

  
     printf("vWorkdate : %s\n", vWorkdate);
       
     /*===========================================================================================
      인사정보 와  HINT 조직도/주소록 동기화     
      2018.12.27. 아래 로직을 pic1065g.pc로 옮겨감(종합인사 고도화시 pic1065g.pc에서 예약발령이 이루어지므로 예약발령 전 백업하기 위하여)
     if  ( strcmp(worktime, "work1") == 0 )
     {  
          EXEC SQL  
          Delete From PIMPMAS_HINT 
           Where Workdate = :FGP_inter_ctrl->v_dt_create;
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
               STRINIT(&FL_Line);
               sprintf(FL_Line, "pimpmas_hint Delete Error!! : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
          }                 

          EXEC SQL  
          Insert Into PIMPMAS_HINT
          SELECT :FGP_inter_ctrl->v_dt_create, A.* 
            FROM PIMPMAS A;
          if  ((SQLCODE != SQL_OK))
          {
               STRINIT(&FL_Line);
               sprintf(FL_Line, "pimpmas_hint Insert Error!!~1 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
          }  
          
          EXEC SQL  
          Insert Into PIMPMAS_HINT
		             (WORKDATE, EMPNO, KORNAME, ORGNUM, DEPTCODE, JUMINID, RETCONT, Offitel, EMPDATE, RETDATE, SKEMAIL, PAYRA)  
          SELECT :FGP_inter_ctrl->v_dt_create, 
				          EMPNO, KNAME, ORGNUM, DEPTCODE, JUMINID, HANDP, OTEL, EMPDATE, RETDATE, SKEMAIL, PAYRA
            FROM PZSUBMAS
           Where Empno in (select distinct empno from poskmail where empno like 'U%');
          if  ((SQLCODE != SQL_OK))
          {
               STRINIT(&FL_Line);
               sprintf(FL_Line, "pimpmas_hint Insert Error!!~2 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
          }
     }  ===========================================================================================*/
 
     if (process_pimpmas()== FAILURE) {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "인사마스터 자료 처리 오류");
          hinsa_log_print(0, FL_Line);     
     }
 
     if(process_pzsubmas()== FAILURE) {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "도급인력 자료 처리 오류");
          hinsa_log_print(0, FL_Line);     
     }     
          
     hinsa_exit(0,"HINT 인터페이스(insa2hint_eai_test) 프로그램 정상 처리...");  
}  

/*인사마스터 자료*/ 
int process_pimpmas()
{
    /*신규입사자 : work1으로 구동시 신규입사자 반복하여 반영됨*/
    printf("인사마스터 신규입사자... \n");    
    /*2019.02.인터페이스 개선작업 dsa2000*/
    /* EXEC SQL
    Insert Into Hint_Empinfo_Test    
    Select To_Char(Sysdate,'YYYYMMDD') Wdate,
           M.Empno, M.Korname, M.Juminid, --A.Deptcode, A.Payra, 
           Nvl(A.AdDeptcode,A.Deptcode) Deptcode, --발령부서
           Nvl(A.AdPayra,A.payra) Payra,          --발령직책
           A.Anfrdate,
           'A' Flag,
           ''  Eai_date,
           'N' Eai_Flag,
           To_Char(Sysdate,'YYYYMMDDHH24MISS') WT,
           '0000'                              WE,
           M.Skemail,
           Func_Codename('I300',A.Ancode) Ancodename,--발령명
           Decode(Case When (Func_Tribegb(M.Orgnum,M.Deptcode)='2' And Func_Tribegb(M.Orgnum,M.Jobdept)='2') Or (M.Tjobduty='09') Then M.Jobdept Else M.Deptcode End, Nvl(A.AdDeptcode,A.Deptcode),'Y','N') Basicdeptyn,--기본부서여부
           ''          Olddept,
           ''          Oldpayra,
           ''          Olddeptname,
           Func_Fulldeptname(A.Orgnum,Nvl(A.AdDeptcode,A.Deptcode)) Newdeptname  --발령부서의 전체부서명
      From Pimpmas M, Pihanno A
     Where A.Ancode In ('111','121','131') --신규발령만.
       And A.Anupdyn  = 'Y'
       And A.Empno    = M.Empno
       And M.Pstate   < '80'
       And M.Juminid Is Not Null
       And A.Anupdtime  > To_Char(Sysdate-30,'YYYYMMDD')   --발령시 주민번호 미등록이므로 30일 발령 모두 체크
       And M.Empno Not In (Select Empno From Hint_Empinfo_Test Where Workdate > To_Char(Sysdate-30,'YYYYMMDD') And Flag='A')
       ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into Hint_Empinfo_Test  select To_Char(Sysdate,'Y\
YYYMMDD') Wdate ,M.Empno ,M.Korname ,M.Juminid ,Nvl(A.AdDeptcode,A.Deptcode) \
Deptcode ,Nvl(A.AdPayra,A.payra) Payra ,A.Anfrdate ,'A' Flag ,'' Eai_date ,'N\
' Eai_Flag ,To_Char(Sysdate,'YYYYMMDDHH24MISS') WT ,'0000' WE ,M.Skemail ,Fun\
c_Codename('I300',A.Ancode) Ancodename ,Decode( case  when ((Func_Tribegb(M.O\
rgnum,M.Deptcode)='2' and Func_Tribegb(M.Orgnum,M.Jobdept)='2') or M.Tjobduty\
='09') then M.Jobdept else M.Deptcode  end ,Nvl(A.AdDeptcode,A.Deptcode),'Y',\
'N') Basicdeptyn ,'' Olddept ,'' Oldpayra ,'' Olddeptname ,Func_Fulldeptname(\
A.Orgnum,Nvl(A.AdDeptcode,A.Deptcode)) Newdeptname  from Pimpmas M ,Pihanno A\
 where ((((((A.Ancode in ('111','121','131') and A.Anupdyn='Y') and A.Empno=M\
.Empno) and M.Pstate<'80') and M.Juminid is  not null ) and A.Anupdtime>To_Ch\
ar((Sysdate-30),'YYYYMMDD')) and M.Empno not  in (select Empno  from Hint_Emp\
info_Test where (Workdate>To_Char((Sysdate-30),'YYYYMMDD') and Flag='A')))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )28;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    /*Select To_Char(Sysdate,'YYYYMMDD'),            
           Empno, 
           Korname, 
           Juminid, 
           Case When (X.Tribegb='2' And Y.Tribegb='2') Or (Tjobduty='09') Then M.Jobdept Else M.Deptcode End Deptcode,  --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함--//2018.11.30 H23차부터 트라이브조직만 근무부서로 전송. dsa2000  --deptcode, 
           Case When (X.Tribegb='2' And Y.Tribegb='2') Or (Tjobduty='09') Then M.Jobpayra Else M.Payra End Payra,       --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함--//2018.11.30 Payra
           Lanfrdate, 
           'A',
           '',
           'N',             
           To_Char(Sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           Skemail
      From Pimpmas M,
          (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) X, --//2018.11.30
          (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) Y  --//2018.11.30
     Where M.Pstate < '80'
       And Empno Not In (Select Empno From Hint_Empinfo_Test Where Workdate <= :vWorkdate And Flag='A')
       And Juminid Is Not Null  And X.Deptcode = M.Deptcode  And Y.Deptcode = M.Jobdept;*/
    /*select to_char(sysdate,'YYYYMMDD'),            
           empno,            korname,            juminid,            deptcode,            //' ' paycl,            
           payra,            lanfrdate,            'A',           '',           'N',     to_char(sysdate,'YYYYMMDDHH24MISS'),   '0000',    skemail
      from pimpmas
     where pstate  < '80'  and empno not in (select empno from Hint_Empinfo_Test where workdate <= :vWorkdate and flag='A')--2015.02.09.변경
       and juminid is not null;*/
                          
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/Insert Into Hint_Empinfo_Test pimpmas 신규입사자 !! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);
    }                
               
    /*퇴사자*/
    printf("인사마스터 퇴사자... \n");
    /* EXEC SQL
    Insert Into Hint_Empinfo_Test
    Select To_Char(Sysdate,'YYYYMMDD') Workdate,
           Now.Empno, Now.Korname, Now.Juminid,
           A.Deptcode,
           A.Payra,
           A.Anfrdate,
           'D' Flag,
           ''  Eai_Date,
           'N' Eai_Flag,
           To_Char(Sysdate,'YYYYMMDDHH24MISS'),
           '0000' Writeemp,
           Now.Skemail, 
           Func_Codename('I300',A.Ancode) Ancodename,
           Decode(A.Deptcode,Now.Bagicdept,'Y','N') Basicyn,
           Old.Bagicdept    Olddept,
           Old.Bagicpayra   Oldpayra,
           Old.Fulldeptname Olddeptname,
           Now.Fulldeptname Newdeptname
      From Pihanno A,
          (Select Empno, Func_Fulldeptname(Orgnum,Deptcode) Fulldeptname,
                  Case When (Func_Tribegb(Orgnum,Deptcode)='2' And Func_Tribegb(Orgnum,Jobdept)='2') Or (Tjobduty='09') Then Jobdept Else Deptcode End Bagicdept,
                  Case When (Func_Tribegb(Orgnum,Deptcode)='2' And Func_Tribegb(Orgnum,Jobdept)='2') Or (Tjobduty='09') Then Jobpayra Else Payra   End Bagicpayra
             From Pimpmas_Hint
            Where Workdate=:vWorkdate) Old,
          (Select Empno, Korname, Juminid, Skemail, Payra, Func_Fulldeptname(Orgnum,Deptcode) Fulldeptname,
                  Case When (Func_Tribegb(Orgnum,Deptcode)='2' And Func_Tribegb(Orgnum,Jobdept)='2') Or (Tjobduty='09') Then Jobdept Else Deptcode End Bagicdept              
             From Pimpmas ) Now
     Where Anupdyn ='Y'
       And Ancode In ('619','629','809','819','829','839') --퇴직발령만. 
       And A.Empno = Now.Empno
       And A.Empno = Old.Empno
       And A.Anfrdate Between To_Char(Sysdate-100,'YYYYMMDD') And To_Char(Sysdate-1,'YYYYMMDD')    --당일 퇴사자 제외
       And (Now.Empno,Now.Korname) Not In (Select Empno,Korname From Hint_Empinfo_Test Where Flag ='D') --개명자가 퇴사할때 D로 넘어가도록 Korname까지 비교
       ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlbuft((void **)0,
      "insert into Hint_Empinfo_Test  select To_Char(Sysdate,'YYYYMMDD') Wor\
kdate ,Now.Empno ,Now.Korname ,Now.Juminid ,A.Deptcode ,A.Payra ,A.Anfrdate \
,'D' Flag ,'' Eai_Date ,'N' Eai_Flag ,To_Char(Sysdate,'YYYYMMDDHH24MISS') ,'\
0000' Writeemp ,Now.Skemail ,Func_Codename('I300',A.Ancode) Ancodename ,Deco\
de(A.Deptcode,Now.Bagicdept,'Y','N') Basicyn ,Old.Bagicdept Olddept ,Old.Bag\
icpayra Oldpayra ,Old.Fulldeptname Olddeptname ,Now.Fulldeptname Newdeptname\
  from Pihanno A ,(select Empno ,Func_Fulldeptname(Orgnum,Deptcode) Fulldept\
name , case  when ((Func_Tribegb(Orgnum,Deptcode)='2' and Func_Tribegb(Orgnu\
m,Jobdept)='2') or Tjobduty='09') then Jobdept else Deptcode  end  Bagicdept\
 , case  when ((Func_Tribegb(Orgnum,Deptcode)='2' and Func_Tribegb(Orgnum,Jo\
bdept)='2') or Tjobduty='09') then Jobpayra else Payra  end  Bagicpayra  fro\
m Pimpmas_Hint where Workdate=:b0) Old ,(select Empno ,Korname ,Juminid ,Ske\
mail ,Payra ,Func_Fulldeptname(Orgnum,Deptcode) Fulldeptname , case  when ((\
Func_Tribegb(Orgnum,Deptcode)='2' and Func_");
    sqlstm.stmt = "Tribegb(Orgnum,Jobdept)='2') or Tjobduty='09') then Jobd\
ept else Deptcode  end  Bagicdept  from Pimpmas ) Now where (((((Anupdyn='Y' \
and Ancode in ('619','629','809','819','829','839')) and A.Empno=Now.Empno) a\
nd A.Empno=Old.Empno) and A.Anfrdate between To_Char((Sysdate-100),'YYYYMMDD'\
) and To_Char((Sysdate-1),'YYYYMMDD')) and (Now.Empno,Now.Korname) not  in (s\
elect Empno ,Korname  from Hint_Empinfo_Test where Flag='D'))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )43;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkdate;
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


    /*select to_char(sysdate,'YYYYMMDD'),          
           empno, 
           korname, 
           juminid, 
           Case When (X.Tribegb='2' And Y.Tribegb='2') Or (Tjobduty='09') Then M.Jobdept Else M.Deptcode End Deptcode,  --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함--//2018.11.30 H23차부터 트라이브조직만 근무부서로 전송. dsa2000  --deptcode, 
           Case When (X.Tribegb='2' And Y.Tribegb='2') Or (Tjobduty='09') Then M.Jobpayra Else M.Payra End Payra,       --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함--//2018.11.30 Payra
           Lanfrdate, 
           'D',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           skemail
      From Pimpmas M,
          (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) X, --//2018.11.30
          (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) Y  --//2018.11.30
     where ( (      nvl(retdate,'99999999') < to_char(sysdate,'YYYYMMDD')   --2015.04.01.hjku..퇴직일 이후에 전송되도록 수정..nvl(retdate,'99999999') <= to_char(sysdate,'YYYYMMDD') 
                and nvl(retdate,'99999999') >= '20070503' )                 --FIRST HINT INTERFACE DATE
            or((pstate = '80') and (lanfrdate >= '20070503')))
       and (empno,korname) not in (select empno,korname from Hint_Empinfo_Test where flag ='D' ) --개명자가 퇴사할때 D로 넘어가도록
       And X.Deptcode = M.Deptcode
       And Y.Deptcode = M.Jobdept; */
      /*from pimpmas
     where ( (      nvl(retdate,'99999999') < to_char(sysdate,'YYYYMMDD')   2015.04.01.hjku..퇴직일 이후에 전송되도록 수정..nvl(retdate,'99999999') <= to_char(sysdate,'YYYYMMDD') 
                and nvl(retdate,'99999999') >= '20070503' )                 
            or((pstate = '80') and (lanfrdate >= '20070503')))
       and (empno,korname) not in (select empno,korname from Hint_Empinfo_Test where flag ='D' ); */
       
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/Insert Into Hint_Empinfo_Test pimpmas 퇴사자!! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    }
    
    
    /*변경자*/         
    printf("인사마스터 변경자... \n");
    /* EXEC SQL
    Insert Into Hint_Empinfo_Test
    Select To_Char(Sysdate,'YYYYMMDD') Workdate,
           Now.Empno, Now.Korname, Now.Juminid, Now.Bagicdept, Now.Payra,
           A.Anfrdate,
           'C' Flag,
           ''  Eai_Date,
           'N' Eai_Flag,
           To_Char(Sysdate,'YYYYMMDDHH24MISS') Writetime,
           '0000' Writeemp,
           Now.Skemail, 
           Func_Codename('I300',A.Ancode) Ancodename,
           Decode(Nvl(A.AdDeptcode,A.Deptcode),Now.BagicDept,'Y','N') BasicYN,
           Old.Bagicdept    Olddept,
           Old.Bagicpayra   Oldpayra,
           Old.Fulldeptname Olddeptname,
           Now.Fulldeptname Newdeptname
      From Pihanno A,
          (Select X.*, Func_Fulldeptname(Orgnum,Deptcode) Fulldeptname,
                  Case When (Func_Tribegb(Orgnum,Deptcode)='2' And Func_Tribegb(Orgnum,Jobdept)='2') Or (Tjobduty='09') Then Jobdept Else Deptcode End Bagicdept,
                  Case When (Func_Tribegb(Orgnum,Deptcode)='2' And Func_Tribegb(Orgnum,Jobdept)='2') Or (Tjobduty='09') Then Jobpayra Else Payra   End Bagicpayra
             From Pimpmas_Hint X
            Where Workdate=:vWorkdate) Old,
          (Select Y.*, Func_Fulldeptname(Orgnum,Deptcode) Fulldeptname,
                  Case When (Func_Tribegb(Orgnum,Deptcode)='2' And Func_Tribegb(Orgnum,Jobdept)='2') Or (Tjobduty='09') Then Jobdept Else Deptcode End Bagicdept
             From Pimpmas Y         ) Now
     Where Anupdyn ='Y'
       And Anupdtime >= :vWorkdate
       And Ancode Not In ('111','121','131', '619','629', '809','819','829','839') --신규/퇴직 제외. 
       And A.Empno = Now.Empno
       And A.Empno = Old.Empno
       And Now.Juminid Is Not Null
       And Exists (Select 1 From Hint_Empinfo_Test Where Workdate < To_Char(Sysdate,'YYYYMMDD') And A.Empno = Empno And Flag='A')         --신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가.
       And Not Exists (Select 1 From Hint_Empinfo_Test Where Workdate > To_Char(Sysdate-365,'YYYYMMDD') And A.Empno = Empno And Flag='D') --삭제가 발생한 대상자가 다시 전송되는 오류로 인해 추가.
       And A.Empno Not In (Select Empno From Hint_Empinfo_Test Where Workdate = To_Char(Sysdate,'YYYYMMDD') And Flag In ('A','D'))
       And (Trim(Now.Korname)     <> Trim(Old.Korname     ) Or
             Nvl(Now.Juminid ,' ')<>  Nvl(Old.Juminid ,' ') Or
             Nvl(Now.Orgnum  ,' ')<>  Nvl(Old.Orgnum  ,' ') Or
             Nvl(Now.Deptcode,' ')<>  Nvl(Old.Deptcode,' ') Or
             Nvl(Now.Jobdept ,' ')<>  Nvl(Old.Jobdept ,' ') Or
             Nvl(Now.Payra   ,' ')<>  Nvl(Old.Payra   ,' ') Or
             Nvl(Now.Jobpayra,' ')<>  Nvl(Old.Jobpayra,' ') Or
             Nvl(Now.Lancode ,' ')<>  Nvl(Old.Lancode ,' ') Or
             Nvl(Now.Skemail ,' ')<>  Nvl(Old.Skemail ,' ') )
     --Order By A.Empno, A.Annono
     ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlbuft((void **)0,
      "insert into Hint_Empinfo_Test  select To_Char(Sysdate,'YYYYMMDD') Wor\
kdate ,Now.Empno ,Now.Korname ,Now.Juminid ,Now.Bagicdept ,Now.Payra ,A.Anfr\
date ,'C' Flag ,'' Eai_Date ,'N' Eai_Flag ,To_Char(Sysdate,'YYYYMMDDHH24MISS\
') Writetime ,'0000' Writeemp ,Now.Skemail ,Func_Codename('I300',A.Ancode) A\
ncodename ,Decode(Nvl(A.AdDeptcode,A.Deptcode),Now.BagicDept,'Y','N') BasicY\
N ,Old.Bagicdept Olddept ,Old.Bagicpayra Oldpayra ,Old.Fulldeptname Olddeptn\
ame ,Now.Fulldeptname Newdeptname  from Pihanno A ,(select X.* ,Func_Fulldep\
tname(Orgnum,Deptcode) Fulldeptname , case  when ((Func_Tribegb(Orgnum,Deptc\
ode)='2' and Func_Tribegb(Orgnum,Jobdept)='2') or Tjobduty='09') then Jobdep\
t else Deptcode  end  Bagicdept , case  when ((Func_Tribegb(Orgnum,Deptcode)\
='2' and Func_Tribegb(Orgnum,Jobdept)='2') or Tjobduty='09') then Jobpayra e\
lse Payra  end  Bagicpayra  from Pimpmas_Hint X where Workdate=:b0) Old ,(se\
lect Y.* ,Func_Fulldeptname(Orgnum,Deptcode) Fulldeptname , case  when ((Fun\
c_Tribegb(Orgnum,Deptcode)='2' and Func_Tri");
    sqlbuft((void **)0,
      "begb(Orgnum,Jobdept)='2') or Tjobduty='09') then Jobdept else Deptcod\
e  end  Bagicdept  from Pimpmas Y ) Now where (((((((((Anupdyn='Y' and Anupd\
time>=:b0) and Ancode not  in ('111','121','131','619','629','809','819','82\
9','839')) and A.Empno=Now.Empno) and A.Empno=Old.Empno) and Now.Juminid is \
 not null ) and exists (select 1  from Hint_Empinfo_Test where ((Workdate<To\
_Char(Sysdate,'YYYYMMDD') and A.Empno=Empno) and Flag='A'))) and  not exists\
 (select 1  from Hint_Empinfo_Test where ((Workdate>To_Char((Sysdate-365),'Y\
YYYMMDD') and A.Empno=Empno) and Flag='D'))) and A.Empno not  in (select Emp\
no  from Hint_Empinfo_Test where (Workdate=To_Char(Sysdate,'YYYYMMDD') and F\
lag in ('A','D')))) and ((((((((trim(Now.Korname)<>trim(Old.Korname) or Nvl(\
Now.Juminid,' ')<>Nvl(Old.Juminid,' ')) or Nvl(Now.Orgnum,' ')<>Nvl(Old.Orgn\
um,' ')) or Nvl(Now.Deptcode,' ')<>Nvl(Old.Deptcode,' ')) or Nvl(Now.Jobdept\
,' ')<>Nvl(Old.Jobdept,' ')) or Nvl(Now.Payra,' ')<>Nvl(Old.Payra,' ')) or N\
vl(Now.Jobpayra,' ')<>Nvl(Old.Jobpayra,' ')");
    sqlstm.stmt = ") or Nvl(Now.Lancode,' ')<>Nvl(Old.Lancode,' ')) or Nvl(\
Now.Skemail,' ')<>Nvl(Old.Skemail,' ')))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )62;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkdate;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)vWorkdate;
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


    /*Select to_char(sysdate,'YYYYMMDD'),           
           M.empno, 
           M.korname, 
           M.juminid, 
           Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then M.Jobdept Else M.Deptcode End Deptcode,  --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함--//2018.11.30 H23차부터 트라이브조직만 근무부서로 전송. dsa2000  --deptcode, 
           Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then M.Jobpayra Else M.Payra End Payra,       --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함--//2018.11.30 Payra
           M.Lanfrdate, 
           'C',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           M.skemail
      From Pimpmas M, Pimpmas_hint B,
          (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) X, --//2018.11.30
          (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) Y  --//2018.11.30
     Where b.workdate =  :vWorkdate
       And M.empno    =  b.empno
       And M.juminid is not null       
       And exists(select 1 from Hint_Empinfo_Test where WORKDATE < TO_CHAR(SYSDATE,'YYYYMMDD') and M.empno = empno and flag='A')--2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가.       
       And not exists(select 1 from Hint_Empinfo_Test where flag='D' and M.empno = empno )                                      --2015.02.10. 삭제가 발생한 대상자가 다시 전송되는 오류로 인해 추가..
       And M.empno not in (select empno from Hint_Empinfo_Test where workdate = to_char(sysdate,'YYYYMMDD') and flag in ('A','D'))
       And (trim(M.korname)   <> trim(b.korname) or
            M.juminid         <> b.juminid       or
            M.orgnum          <> b.orgnum        or
            M.deptcode        <> b.deptcode      or
            M.JobDept         <> b.JobDept       or  --2018.11. Add 근무부서변경시에도 전송되도록
            M.payra           <> b.payra         or 
            M.jobpayra        <> b.jobpayra      or  --2018.11. Add 근무부서 직책변경시에도 전송되도록
            M.lancode         <> b.lancode       or
            nvl(M.skemail,' ')<> nvl(B.skemail,' ') )
       And X.Deptcode = M.Deptcode
       And Y.Deptcode = M.Jobdept;*/
    
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/Insert Into Hint_Empinfo_Test pimpmas 변경자!! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);
    } 
    return (SUCCESS);
}

/*도급인력 자료*/
int process_pzsubmas()
{
    /*신규입사자*/
    printf("도급인력 신규입사자... \n");    
    /* EXEC SQL
    Insert Into Hint_Empinfo_Test    
    Select To_Char(Sysdate,'YYYYMMDD'),            
           Empno, 
           Kname, 
           Juminid, 
           Deptcode, 
           Payra, 
           To_Char(Sysdate,'YYYYMMDD') Lanfrdate, /o2015.01.13.hjku..PZN2000A과 맞춤 o/
           'A',
           '',
           'N',             
           To_Char(Sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           Skemail, 
           '계약',
           'Y',
           '','','',
           Func_Fulldeptname(Orgnum,Deptcode) Newdeptname
      From Pzsubmas
     Where Nvl(Retdate,'99999999')  > To_Char(Sysdate,'YYYYMMDD')
       And Empno Not In (Select Empno From Hint_Empinfo_Test
                          Where Workdate <= :vWorkdate And Flag='A'--/o2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..where workdate <= :vWorkDateo/
                         ) 
       And Juminid Is Not Null; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into Hint_Empinfo_Test  select To_Char(Sysdate,'Y\
YYYMMDD') ,Empno ,Kname ,Juminid ,Deptcode ,Payra ,To_Char(Sysdate,'YYYYMMDD'\
) Lanfrdate ,'A' ,'' ,'N' ,To_Char(Sysdate,'YYYYMMDDHH24MISS') ,'0000' ,Skema\
il ,'계약' ,'Y' ,'' ,'' ,'' ,Func_Fulldeptname(Orgnum,Deptcode) Newdeptname  \
from Pzsubmas where ((Nvl(Retdate,'99999999')>To_Char(Sysdate,'YYYYMMDD') and\
 Empno not  in (select Empno  from Hint_Empinfo_Test where (Workdate<=:b0 and\
 Flag='A'))) and Juminid is  not null )";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )85;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkdate;
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


    /*select to_char(sysdate,'YYYYMMDD'),            
           empno, 
           KNAME, 
           juminid, 
           deptcode, 
           payra, 
           to_char(sysdate,'YYYYMMDD') lanfrdate,
           'A',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           skemail
      from pzsubmas
     where nvl(retdate,'99999999')  > to_char(sysdate,'YYYYMMDD')
       and empno not in (select empno from Hint_Empinfo_Test
                          where workdate <= :vWorkdate and flag='A'--2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..where workdate <= :vWorkdate
                        ) 
       and juminid is not null;*/
                          
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/Insert Into Hint_Empinfo_Test pzsubmas 신규입사자 !! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    }                
               
    /*퇴사자*/
    printf("도급인력 퇴사자... \n");
    /* EXEC SQL
    Insert Into Hint_Empinfo_Test        
    Select To_Char(Sysdate,'YYYYMMDD'),          
           M.Empno, 
           Kname, 
           Juminid, 
           M.Deptcode,  
           M.Payra, 
           To_Char(Sysdate,'YYYYMMDD')  Lanfrdate, 
           'D',
           '',
           'N',             
           To_Char(Sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           Skemail, 
           '계약해지',
           'Y',
           X.Deptcode Olddept,
           X.Payra    Oldpayra,
           Func_Fulldeptname(X.Orgnum,X.Deptcode) Olddeptname,
           Func_Fulldeptname(M.Orgnum,M.Deptcode) Newdeptname
      From Pzsubmas M, 
          (Select Empno, Orgnum, Deptcode, Payra From Pimpmas_Hint Where Workdate=:vWorkdate And Empno like 'U%') X
     Where Nvl(Retdate,'99999999') < To_Char(Sysdate,'YYYYMMDD')                                /o퇴직일 이후에 전송되도록 o/
       And (M.Empno,Kname) Not In (Select Empno,Korname From Hint_Empinfo_Test Where Flag ='D') /o개명자가 퇴사할때 D로 넘어가도록o/
       And M.Empno = X.Empno
       ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into Hint_Empinfo_Test  select To_Char(Sysdate,'Y\
YYYMMDD') ,M.Empno ,Kname ,Juminid ,M.Deptcode ,M.Payra ,To_Char(Sysdate,'YYY\
YMMDD') Lanfrdate ,'D' ,'' ,'N' ,To_Char(Sysdate,'YYYYMMDDHH24MISS') ,'0000' \
,Skemail ,'계약해지' ,'Y' ,X.Deptcode Olddept ,X.Payra Oldpayra ,Func_Fulldep\
tname(X.Orgnum,X.Deptcode) Olddeptname ,Func_Fulldeptname(M.Orgnum,M.Deptcode\
) Newdeptname  from Pzsubmas M ,(select Empno ,Orgnum ,Deptcode ,Payra  from \
Pimpmas_Hint where (Workdate=:b0 and Empno like 'U%')) X where ((Nvl(Retdate,\
'99999999')<To_Char(Sysdate,'YYYYMMDD') and (M.Empno,Kname) not  in (select E\
mpno ,Korname  from Hint_Empinfo_Test where Flag='D')) and M.Empno=X.Empno)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )104;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkdate;
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


    /*select to_char(sysdate,'YYYYMMDD'),          
           empno, 
           KNAME, 
           juminid, 
           deptcode,  
           payra, 
           to_char(sysdate,'YYYYMMDD')  lanfrdate, 
           'D',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           skemail
      from pzsubmas
     where nvl(retdate,'99999999') < to_char(sysdate,'YYYYMMDD')
       and (empno,KNAME) not in (select empno,korname from Hint_Empinfo_Test where flag ='D'); */
       
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/Insert Into Hint_Empinfo_Test pzsubmas 퇴사자!! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    }
    
    
    /*변경자*/         
    printf("도급인력 변경자... \n");
    /* EXEC SQL
    Insert Into Hint_Empinfo_Test    
    Select To_Char(Sysdate,'YYYYMMDD'),
           M.Empno, 
           M.Kname, 
           M.Juminid, 
           M.Deptcode,
           M.Payra, 
           To_Char(Sysdate,'YYYYMMDD')  Lanfrdate, 
           'C',
           '',
           'N',             
           To_Char(Sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           M.Skemail, 
           '전보',
           'Y',
           X.Deptcode Olddept,
           X.Payra    Oldpayra,
           Func_Fulldeptname(X.Orgnum,X.Deptcode) Olddeptname,
           Func_Fulldeptname(M.Orgnum,M.Deptcode) Newdeptname
      From Pzsubmas M, 
          (Select * From Pimpmas_Hint Where Workdate=:vWorkdate And Empno like 'U%') X
     Where M.Empno             =  X.Empno
       And M.Juminid           Is Not Null       
       And Exists (Select 1 From Hint_Empinfo_Test Where Workdate < To_Char(Sysdate,'YYYYMMDD') And M.Empno = Empno And Flag='A')--/o2015.02.신규가 발생하기 전에 변경이 발생하는 오류로 추가..o/       
       And Not Exists (Select 1 From Hint_Empinfo_Test Where Flag='D' And M.Empno = Empno )                                      --/o2015.02.삭제가 발생한 대상자가 다시 전송되는 오류로 추가..o/
       And M.Empno Not In (Select Empno From Hint_Empinfo_Test Where Workdate = To_Char(Sysdate,'YYYYMMDD') And Flag In ('A','D'))
       And (Nvl(M.Skemail,' ')<> Nvl(X.Skemail,' ')
        Or  Trim(M.Kname)     <> Trim(X.Korname)
        Or  M.Payra           <> X.Payra        
        Or  M.Juminid         <> X.Juminid      
        Or  M.Orgnum          <> X.Orgnum       
        Or  M.Deptcode        <> X.Deptcode     )
      ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlbuft((void **)0,
      "insert into Hint_Empinfo_Test  select To_Char(Sysdate,'YYYYMMDD') ,M.\
Empno ,M.Kname ,M.Juminid ,M.Deptcode ,M.Payra ,To_Char(Sysdate,'YYYYMMDD') \
Lanfrdate ,'C' ,'' ,'N' ,To_Char(Sysdate,'YYYYMMDDHH24MISS') ,'0000' ,M.Skem\
ail ,'전보' ,'Y' ,X.Deptcode Olddept ,X.Payra Oldpayra ,Func_Fulldeptname(X.\
Orgnum,X.Deptcode) Olddeptname ,Func_Fulldeptname(M.Orgnum,M.Deptcode) Newde\
ptname  from Pzsubmas M ,(select *  from Pimpmas_Hint where (Workdate=:b0 an\
d Empno like 'U%')) X where (((((M.Empno=X.Empno and M.Juminid is  not null \
) and exists (select 1  from Hint_Empinfo_Test where ((Workdate<To_Char(Sysd\
ate,'YYYYMMDD') and M.Empno=Empno) and Flag='A'))) and  not exists (select 1\
  from Hint_Empinfo_Test where (Flag='D' and M.Empno=Empno))) and M.Empno no\
t  in (select Empno  from Hint_Empinfo_Test where (Workdate=To_Char(Sysdate,\
'YYYYMMDD') and Flag in ('A','D')))) and (((((Nvl(M.Skemail,' ')<>Nvl(X.Skem\
ail,' ') or trim(M.Kname)<>trim(X.Korname)) or M.Payra<>X.Payra) or M.Jumini\
d<>X.Juminid) or M.Orgnum<>X.Orgnum) or M.D");
    sqlstm.stmt = "eptcode<>X.Deptcode))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )123;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkdate;
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


    /*select to_char(sysdate,'YYYYMMDD'),
           a.empno, 
           a.KNAME, 
           a.juminid, 
           a.deptcode,
           a.payra, 
           to_char(sysdate,'YYYYMMDD')  lanfrdate, 
           'C',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           A.skemail
      from pzsubmas a, pimpmas_hint b
     where b.workdate          =  :vWorkdate 
       and a.empno             =  b.empno
       and a.juminid           is not null       
       and exists(select 1 from Hint_Empinfo_Test where WORKDATE < TO_CHAR(SYSDATE,'YYYYMMDD') and a.empno = empno and flag='A')--2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..
       and not exists(select 1 from Hint_Empinfo_Test where flag='D' and a.empno = empno )--2015.02.10. 삭제가 발생한 대상자가 다시 전송되는 오류로 인해 추가.
       and (trim(a.KNAME)      <> trim(b.korname) or
            a.payra            <> b.payra         or 
            a.juminid          <> b.juminid       or 
            a.orgnum           <> b.orgnum        or
            a.deptcode         <> b.deptcode      or 
            nvl(A.skemail,' ') <> nvl(B.skemail,' ') )
       and a.empno not in (select empno from Hint_Empinfo_Test where workdate = to_char(sysdate,  'YYYYMMDD') and flag in ('A','D'));*/

    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/Insert Into Hint_Empinfo_Test pzsubmas 변경자!! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    } 
    return (SUCCESS);
}