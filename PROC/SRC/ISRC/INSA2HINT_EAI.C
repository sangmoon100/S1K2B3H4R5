
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
           char  filnam[17];
};
static struct sqlcxp sqlfpn =
{
    16,
    "insa2hint_eai.pc"
};


static unsigned int sqlctx = 4870739;


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
28,0,0,2,769,0,3,170,0,0,1,1,0,1,0,1,97,0,0,
47,0,0,3,865,0,3,223,0,0,0,0,0,1,0,
62,0,0,4,1325,0,3,264,0,0,1,1,0,1,0,1,97,0,0,
81,0,0,5,397,0,3,315,0,0,1,1,0,1,0,1,97,0,0,
100,0,0,6,366,0,3,347,0,0,0,0,0,1,0,
115,0,0,7,833,0,3,377,0,0,1,1,0,1,0,1,97,0,0,
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
 

     char  vWorkDate[8+1];
 
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

       
     if  (argc != 2) {  /* /hper/insa/HINSA/proc/bin/ERPbin/insa2hint_eai work1 */
          printf("[Usage] : insa2hint_eai 1.cron \n");
          exit(1);
     }
     
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */  
     STRINIT(&FL_file);
     STRINIT(&FL_Line);
     strcpy(FL_file,"insa2hint_eai");
   
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
     
     hinsa_log_print(0,"HINT 인사정보 인터페이스(insa2hint_eai) 프로그램 시작...");
   
     hinsa_db_connect();  
   
     printf("FL_date : %s\n", FGP_inter_ctrl->v_dt_create.arr);
     printf("worktime : %s\n", worktime);       

     /* 현재시간 체크 */
     /* EXEC SQL     
     SELECT case when  :worktime ='work1' then TO_CHAR(SYSDATE -1,'YYYYMMDD')  
            else                               TO_CHAR(SYSDATE,'YYYYMMDD')   end
       INTO :vWorkDate
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
     sqlstm.sqhstv[1] = (unsigned char  *)vWorkDate;
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

  
     printf("vWorkDate : %s\n", vWorkDate);
       
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
          INSERT INTO PIMPMAS_HINT
          SELECT :FGP_inter_ctrl->v_dt_create, A.* 
            FROM PIMPMAS A;
          if  ((SQLCODE != SQL_OK))
          {
               STRINIT(&FL_Line);
               sprintf(FL_Line, "pimpmas_hint Insert Error!!~1 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
          }  
          
          EXEC SQL  
          INSERT INTO PIMPMAS_HINT
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
          
     hinsa_exit(0,"HINT 인터페이스(insa2hint_eai) 프로그램 정상 처리...");  
}  

/*인사마스터 자료*/ 
int process_pimpmas()
{
    /*신규입사자 : work1으로 구동시 신규입사자 반복하여 반영됨*/
    printf("인사마스터 신규입사자... \n");    
    /* EXEC SQL
    Insert Into Hint_Empinfo    
    Select To_Char(Sysdate,'YYYYMMDD'),            
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
       And Empno Not In (Select Empno From Hint_Empinfo Where Workdate <= :vWorkDate And Flag='A')
       And Juminid Is Not Null
       And X.Deptcode = M.Deptcode
       And Y.Deptcode = M.Jobdept; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into Hint_Empinfo  select To_Char(Sysdate,'YYYYMM\
DD') ,Empno ,Korname ,Juminid , case  when ((X.Tribegb='2' and Y.Tribegb='2')\
 or Tjobduty='09') then M.Jobdept else M.Deptcode  end  Deptcode , case  when\
 ((X.Tribegb='2' and Y.Tribegb='2') or Tjobduty='09') then M.Jobpayra else M.\
Payra  end  Payra ,Lanfrdate ,'A' ,'' ,'N' ,To_Char(Sysdate,'YYYYMMDDHH24MISS\
') ,'0000' ,Skemail  from Pimpmas M ,(select Deptcode ,Substr(Tribegb,1,1) Tr\
ibegb  from Pycdept where Orgnum=Func_Orgnum) X ,(select Deptcode ,Substr(Tri\
begb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) Y where ((((M.Pstat\
e<'80' and Empno not  in (select Empno  from Hint_Empinfo where (Workdate<=:b\
0 and Flag='A'))) and Juminid is  not null ) and X.Deptcode=M.Deptcode) and Y\
.Deptcode=M.Jobdept)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )28;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkDate;
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
           deptcode, 
           //' ' paycl, 
           payra, 
           lanfrdate, 
           'A',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           skemail
      from pimpmas
     where pstate  < '80'
       and empno not in (select empno from hint_empinfo 
                            where workdate <= :vWorkDate and flag='A')--2015.02.09.변경
       and juminid is not null;*/
                          
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/insert into hint_empinfo pimpmas 신규입사자 !! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);
    }                
               
    /*퇴사자*/
    printf("인사마스터 퇴사자... \n");
    /* EXEC SQL
    insert into hint_empinfo    
    select to_char(sysdate,'YYYYMMDD'),          
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
     where ( (      nvl(retdate,'99999999') < to_char(sysdate,'YYYYMMDD')   /o2015.04.01.hjku..퇴직일 이후에 전송되도록 수정..nvl(retdate,'99999999') <= to_char(sysdate,'YYYYMMDD') o/
                and nvl(retdate,'99999999') >= '20070503' )                  /oFIRST HINT INTERFACE DATEo/
            or((pstate = '80') and (lanfrdate >= '20070503')))
       and (empno,korname) not in (select empno,korname from hint_empinfo where flag ='D' ) /o개명자가 퇴사할때 D로 넘어가도록o/
       And X.Deptcode = M.Deptcode
       And Y.Deptcode = M.Jobdept; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into hint_empinfo  select to_char(sysdate,'YYYYMM\
DD') ,empno ,korname ,juminid , case  when ((X.Tribegb='2' and Y.Tribegb='2')\
 or Tjobduty='09') then M.Jobdept else M.Deptcode  end  Deptcode , case  when\
 ((X.Tribegb='2' and Y.Tribegb='2') or Tjobduty='09') then M.Jobpayra else M.\
Payra  end  Payra ,Lanfrdate ,'D' ,'' ,'N' ,to_char(sysdate,'YYYYMMDDHH24MISS\
') ,'0000' ,skemail  from Pimpmas M ,(select Deptcode ,Substr(Tribegb,1,1) Tr\
ibegb  from Pycdept where Orgnum=Func_Orgnum) X ,(select Deptcode ,Substr(Tri\
begb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) Y where (((((nvl(re\
tdate,'99999999')<to_char(sysdate,'YYYYMMDD') and nvl(retdate,'99999999')>='2\
0070503') or (pstate='80' and lanfrdate>='20070503')) and (empno,korname) not\
  in (select empno ,korname  from hint_empinfo where flag='D')) and X.Deptcod\
e=M.Deptcode) and Y.Deptcode=M.Jobdept)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )47;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
      /*from pimpmas
     where ( (      nvl(retdate,'99999999') < to_char(sysdate,'YYYYMMDD')   2015.04.01.hjku..퇴직일 이후에 전송되도록 수정..nvl(retdate,'99999999') <= to_char(sysdate,'YYYYMMDD') 
                and nvl(retdate,'99999999') >= '20070503' )                 
            or((pstate = '80') and (lanfrdate >= '20070503')))
       and (empno,korname) not in (select empno,korname from hint_empinfo where flag ='D' ); */
       
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/insert into hint_empinfo pimpmas 퇴사자!! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    }
    
    
    /*변경자*/         
    printf("인사마스터 변경자... \n");
    /* EXEC SQL
    insert into hint_empinfo    
    Select to_char(sysdate,'YYYYMMDD'),           
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
     Where b.workdate =  :vWorkDate /o2015.01.13. hjku..to_char(sysdate-1,'YYYYMMDD') in work1o/
       And M.empno    =  b.empno
       And M.juminid is not null       
       And exists(select 1 from hint_empinfo where WORKDATE < TO_CHAR(SYSDATE,'YYYYMMDD') and M.empno = empno and flag='A')--/o2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..o/       
       And not exists(select 1 from hint_empinfo where flag='D' and M.empno = empno )                                      --/o2015.02.10. 삭제가 발생한 대상자가 다시 전송되는 오류로 인해 추가..o/
       And M.empno not in (select empno from hint_empinfo where workdate = to_char(sysdate,'YYYYMMDD') and flag in ('A','D'))
       And (trim(M.korname)   <> trim(b.korname) or   /oM.paycl            <> b.paycl         or o/
            M.juminid         <> b.juminid       or
            M.orgnum          <> b.orgnum        or
            M.deptcode        <> b.deptcode      or
            M.JobDept         <> b.JobDept       or  /o2018.11. Add 근무부서변경시에도 전송되도록o/
            M.payra           <> b.payra         or 
            M.jobpayra        <> b.jobpayra      or  /o2018.11. Add 근무부서 직책변경시에도 전송되도록o/
            M.lancode         <> b.lancode       or
            nvl(M.skemail,' ')<> nvl(B.skemail,' ') )
       And X.Deptcode = M.Deptcode
       And Y.Deptcode = M.Jobdept; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlbuft((void **)0,
      "insert into hint_empinfo  select to_char(sysdate,'YYYYMMDD') ,M.empno\
 ,M.korname ,M.juminid , case  when ((X.Tribegb='2' and Y.Tribegb='2') or M.\
Tjobduty='09') then M.Jobdept else M.Deptcode  end  Deptcode , case  when ((\
X.Tribegb='2' and Y.Tribegb='2') or M.Tjobduty='09') then M.Jobpayra else M.\
Payra  end  Payra ,M.Lanfrdate ,'C' ,'' ,'N' ,to_char(sysdate,'YYYYMMDDHH24M\
ISS') ,'0000' ,M.skemail  from Pimpmas M ,Pimpmas_hint B ,(select Deptcode ,\
Substr(Tribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) X ,(sele\
ct Deptcode ,Substr(Tribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Org\
num) Y where ((((((((b.workdate=:b0 and M.empno=b.empno) and M.juminid is  n\
ot null ) and exists (select 1  from hint_empinfo where ((WORKDATE<TO_CHAR(S\
YSDATE,'YYYYMMDD') and M.empno=empno) and flag='A'))) and  not exists (selec\
t 1  from hint_empinfo where (flag='D' and M.empno=empno))) and M.empno not \
 in (select empno  from hint_empinfo where (workdate=to_char(sysdate,'YYYYMM\
DD') and flag in ('A','D')))) and ((((((((t");
    sqlstm.stmt = "rim(M.korname)<>trim(b.korname) or M.juminid<>b.juminid)\
 or M.orgnum<>b.orgnum) or M.deptcode<>b.deptcode) or M.JobDept<>b.JobDept) o\
r M.payra<>b.payra) or M.jobpayra<>b.jobpayra) or M.lancode<>b.lancode) or nv\
l(M.skemail,' ')<>nvl(B.skemail,' '))) and X.Deptcode=M.Deptcode) and Y.Deptc\
ode=M.Jobdept)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )62;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkDate;
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


    
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/insert into hint_empinfo pimpmas 변경자!! : %s", SQLERRM);
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
    insert into hint_empinfo    
    select to_char(sysdate,'YYYYMMDD'),            
           empno, 
           KNAME, 
           juminid, 
           deptcode, 
           payra, 
           to_char(sysdate,'YYYYMMDD') lanfrdate, /o2015.01.13.hjku..PZN2000A과 맞춤 o/
           'A',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           skemail
      from pzsubmas
     where nvl(retdate,'99999999')  > to_char(sysdate,'YYYYMMDD')
       and empno not in (select empno from hint_empinfo
                          where workdate <= :vWorkDate and flag='A'--/o2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..where workdate <= :vWorkDateo/
                        ) 
       and juminid is not null; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into hint_empinfo  select to_char(sysdate,'YYYYMM\
DD') ,empno ,KNAME ,juminid ,deptcode ,payra ,to_char(sysdate,'YYYYMMDD') lan\
frdate ,'A' ,'' ,'N' ,to_char(sysdate,'YYYYMMDDHH24MISS') ,'0000' ,skemail  f\
rom pzsubmas where ((nvl(retdate,'99999999')>to_char(sysdate,'YYYYMMDD') and \
empno not  in (select empno  from hint_empinfo where (workdate<=:b0 and flag=\
'A'))) and juminid is  not null )";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )81;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkDate;
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

/*2012.01.04 추가*/
                          
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/insert into hint_empinfo pzsubmas 신규입사자 !! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    }                
               
    /*퇴사자*/
    printf("도급인력 퇴사자... \n");
    /* EXEC SQL
    insert into hint_empinfo        
    select to_char(sysdate,'YYYYMMDD'),          
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
     where nvl(retdate,'99999999') < to_char(sysdate,'YYYYMMDD') /o2015.04.01.hjku..퇴직일 이후에 전송되도록 수정..nvl(retdate,'99999999') <= to_char(sysdate,'YYYYMMDD') o/
       and (empno,KNAME) not in (select empno,korname from hint_empinfo where flag ='D'); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into hint_empinfo  select to_char(sysdate,'YYYYMM\
DD') ,empno ,KNAME ,juminid ,deptcode ,payra ,to_char(sysdate,'YYYYMMDD') lan\
frdate ,'D' ,'' ,'N' ,to_char(sysdate,'YYYYMMDDHH24MISS') ,'0000' ,skemail  f\
rom pzsubmas where (nvl(retdate,'99999999')<to_char(sysdate,'YYYYMMDD') and (\
empno,KNAME) not  in (select empno ,korname  from hint_empinfo where flag='D'\
))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )100;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 /*개명자가 퇴사할때 D로 넘어가도록*/
       
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/insert into hint_empinfo pzsubmas 퇴사자!! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    }
    
    
    /*변경자*/         
    printf("도급인력 변경자... \n");
    /* EXEC SQL
    insert into hint_empinfo    
    select to_char(sysdate,'YYYYMMDD'),
           a.empno, 
           a.KNAME, 
           a.juminid, 
           a.deptcode, /o ' ' paycl, o/
           a.payra, 
           to_char(sysdate,'YYYYMMDD')  lanfrdate, 
           'C',
           '',
           'N',             
           to_char(sysdate,'YYYYMMDDHH24MISS'),
           '0000',
           A.skemail
      from pzsubmas a, pimpmas_hint b
     where b.workdate          =  :vWorkDate /o2015.01.13. hjku..to_char(sysdate-1,'YYYYMMDD')o/
       and a.empno             =  b.empno
       and a.juminid           is not null       
       and exists(select 1 from hint_empinfo where WORKDATE < TO_CHAR(SYSDATE,'YYYYMMDD') and a.empno = empno and flag='A')--/o2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..o/       
       and not exists(select 1 from hint_empinfo where flag='D' and a.empno = empno )--/o2015.02.10. 삭제가 발생한 대상자가 다시 전송되는 오류로 인해 추가..o/
       and (trim(a.KNAME)      <> trim(b.korname) or
            a.payra            <> b.payra         or 
            a.juminid          <> b.juminid       or 
            a.orgnum           <> b.orgnum        or
            a.deptcode         <> b.deptcode      or 
            nvl(A.skemail,' ') <> nvl(B.skemail,' ') )
       and a.empno not in (select empno from hint_empinfo
                            where workdate = to_char(sysdate,  'YYYYMMDD')
                              and flag in ('A','D')); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into hint_empinfo  select to_char(sysdate,'YYYYMM\
DD') ,a.empno ,a.KNAME ,a.juminid ,a.deptcode ,a.payra ,to_char(sysdate,'YYYY\
MMDD') lanfrdate ,'C' ,'' ,'N' ,to_char(sysdate,'YYYYMMDDHH24MISS') ,'0000' ,\
A.skemail  from pzsubmas a ,pimpmas_hint b where ((((((b.workdate=:b0 and a.e\
mpno=b.empno) and a.juminid is  not null ) and exists (select 1  from hint_em\
pinfo where ((WORKDATE<TO_CHAR(SYSDATE,'YYYYMMDD') and a.empno=empno) and fla\
g='A'))) and  not exists (select 1  from hint_empinfo where (flag='D' and a.e\
mpno=empno))) and (((((trim(a.KNAME)<>trim(b.korname) or a.payra<>b.payra) or\
 a.juminid<>b.juminid) or a.orgnum<>b.orgnum) or a.deptcode<>b.deptcode) or n\
vl(A.skemail,' ')<>nvl(B.skemail,' '))) and a.empno not  in (select empno  fr\
om hint_empinfo where (workdate=to_char(sysdate,'YYYYMMDD') and flag in ('A',\
'D'))))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )115;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)vWorkDate;
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



    
    if  ((SQLCODE != SQL_OK))
    {
         STRINIT(&FL_Line);
         sprintf(FL_Line, "Oracle 에러/insert into hint_empinfo pzsubmas 변경자!! : %s", SQLERRM);
         hinsa_log_print(0, FL_Line);
         return (FAILURE);         
    } 
    return (SUCCESS);
}