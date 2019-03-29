
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
    "insa2sap1.pc"
};


static unsigned int sqlctx = 304387;


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

 static char *sq0007 = 
"select TO_NUMBER(TO_CHAR(ADD_MONTHS(sysdate,(-1)),'YYYY')) ,TO_CHAR(ADD_MON\
THS(sysdate,(-1)),'MM') ,TO_CHAR(sysdate,'yyyymmddhh24miss') ,fincode ,covena\
nt ,decode(covenant,'1','정규직','2','파견직','3','계약직','') ,paycl ,decode\
(paycl,'01','임원','10','사원','') ,sum(cnt)  from (select A.fincode ,A.coven\
ant ,decode(substr(A.paycl,1,1),'A','01','0','01','10') paycl ,sum(A.cnt) cnt\
  from EAI_DEPTNO_TEMP A where C_DATE=to_char(LAST_DAY(ADD_MONTHS(sysdate,(-1\
))),'yyyymmdd') group by A.fincode,A.covenant,a.paycl)  group by fincode,cove\
nant,paycl           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,49,0,4,102,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,66,0,4,105,0,0,1,0,0,1,0,2,97,0,0,
43,0,0,3,0,0,32,113,0,0,0,0,0,1,0,
58,0,0,4,0,0,32,119,0,0,0,0,0,1,0,
73,0,0,5,0,0,32,129,0,0,0,0,0,1,0,
88,0,0,6,703,0,3,148,0,0,0,0,0,1,0,
103,0,0,7,558,0,9,218,0,0,0,0,0,1,0,
118,0,0,7,0,0,13,231,0,0,9,0,0,1,0,2,3,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,
0,0,2,9,0,0,2,9,0,0,2,4,0,0,
169,0,0,7,0,0,15,248,0,0,0,0,0,1,0,
184,0,0,7,0,0,15,296,0,0,0,0,0,1,0,
199,0,0,8,210,0,4,307,0,0,4,3,0,1,0,2,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
230,0,0,7,0,0,15,330,0,0,0,0,0,1,0,
245,0,0,9,255,0,3,342,0,0,10,10,0,1,0,1,3,0,0,1,9,0,0,1,3,0,0,1,3,0,0,1,9,0,0,
1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,4,0,0,
300,0,0,10,144,0,4,399,0,0,5,4,0,1,0,2,3,0,0,1,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
335,0,0,7,0,0,15,414,0,0,0,0,0,1,0,
350,0,0,11,374,0,4,428,0,0,7,6,0,1,0,2,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,
9,0,0,1,9,0,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : insa2sap1.pc
     PROGRM-Decription : 인사테이블을 읽어서 ERP쪽 Temp테이블에 추가 매일, Interface 테이블에 추가 매월 1회 실행
     Version           : 1.00
     Date              : 2005.08.10
  
    Update Contents
     Version      date(yy.mm.dd)     programmer      description            relevant doc.n
       1.00       2005.08.10         이현동          최초작성
       1.01       2005.10.19         CH.K.J          수정
    Comments
    => 1) 현 조직차수를 자동으로 가지고 오도록 수정
       2) eai_deptno 테이블에 zmons 필드 타입 변경으로 프로그램 수정
       *) HR 인프라 고도화 Project(직위-> 직책, 직급 -> BAND(비공개),일반직->파견직)    2009.02.26   
       4) 임단협 : 무기계약직(J사번) -> 정규직 사번 전환  2016.12.28
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


#define   SQL_DUP        -1

#define   ZMONS           2
#define   IFDAT          14
#define   CCTR            6
#define   COVENANT        1
#define   COVENANT_NM    15
#define   HRLEVEL        10
#define   HRLEVEL_NM     20
#define   TRUE_RET    25600

/* EXEC SQL BEGIN DECLARE SECTION; */ 

/* EAI_DEPTNO 테이블 변수들 */

     typedef struct stdeptno ST_DEPTNO;
     struct stdeptno
     {
          int      v_gjahr                       ;
          /* varchar  v_zmons      [ZMONS       + 1]; */ 
struct { unsigned short len; unsigned char arr[3]; } v_zmons;

          /* varchar  v_ifdat      [IFDAT       + 1]; */ 
struct { unsigned short len; unsigned char arr[15]; } v_ifdat;

          /* varchar  v_cctr       [CCTR        + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_cctr;

          /* varchar  v_covenant   [COVENANT    + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } v_covenant;

          /* varchar  v_covenantnm [COVENANT_NM + 1]; */ 
struct { unsigned short len; unsigned char arr[16]; } v_covenantnm;

          /* varchar  v_hrlevel    [HRLEVEL     + 1]; */ 
struct { unsigned short len; unsigned char arr[11]; } v_hrlevel;

          /* varchar  v_hrlevelnm  [HRLEVEL_NM  + 1]; */ 
struct { unsigned short len; unsigned char arr[21]; } v_hrlevelnm;

          float    v_manno                       ;
     };
     ST_DEPTNO    FL_deptno;

/* EXEC SQL END DECLARE SECTION; */ 


int PL_fetch_depttmp(void);
int PL_insert_deptno(int FL_seqno);
int PL_insert_depttmp(void);
int PL_select_deptno(void);
int PL_select_depttmp(void);
int PL_select_premon_deptno(void);

static int  pre_mon_manno = 0;
static int  FL_seqno      = 0;
static int  pre_seqno     = 0;
static int  FG_loopcnt    = 0;
static int  FG_seqno      = 0;

     char s_day[3];
     char s_mon[3];

int main()
{
     char *FL_date;
     char FL_Line[255];
     char FL_file[255];
     
     int  ret;
   
     STRINIT(FL_file);
     STRINIT(FL_Line);
     STRINIT(s_day);
     STRINIT(s_mon);
     strcpy(FL_file,"insa2sap1");
   
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
     }
   
     hinsa_db_connect();
    
     
     /* EXEC SQL 
     select to_char(sysdate,'DD')  into :s_day  from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'DD') into :b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)s_day;
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


     	
     /* EXEC SQL 
     select to_char(ADD_MONTHS(sysdate, -1),'MM')  into :s_mon  from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(ADD_MONTHS(sysdate,(-1)),'MM') into :b0 \
 from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )24;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)s_mon;
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

     	

     if  (strcmp(s_day,"01") == 0) 
     {
          printf("=========> month");
          if (PL_fetch_depttmp() == FAILURE)
          {
               /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 1;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )43;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"PL_fetch_depttmp Function 에러로 종료...");
               return 1;
          }
          if (PL_insert_depttmp() == FAILURE)
          {
               /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 1;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )58;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"PL_insert_depttmp Function 에러로 종료...");
               return 1;
          }    
     }
     else 
     { 
          printf("=========> day");     
          if (PL_insert_depttmp() == FAILURE)
          {
               /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 1;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )73;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"PL_insert_depttmp Function 에러로 종료...");
               return 1;
          }
     }
     
     hinsa_exit(0,"인사인터페이스(insa2sap1) 프로그램 정상 처리...");   
}
/*****************************************/

/*==================================================================================================
EAI_DEPTNO_TEMP테이블에 일자별 부서통계를 넣는다.
==================================================================================================*/
int PL_insert_depttmp(void)
{
     char FL_Line[255];
   
     STRINIT(FL_Line);
   
     /* EXEC SQL 
     INSERT INTO eai_deptno_temp
     Select To_Char(Sysdate, 'yyyymmdd'),
            Fincode,
            Covenant,
            Paycl,
            Count(*),
            Sysdate
       From (Select Case When (X.Tribegb='2' And Y.Tribegb='2') Or (Tjobduty='09') Then Y.Fincode Else X.Fincode End Fincode, --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함--//2018.11.30. 소속+근무 모두 트라이브면 근무부서. --Fincode,
                    Decode(Substr(Empno,1,1),'J',3,'P',3,'Q',3,'Y',2,Decode(Paycl,'H10',3,1)) Covenant,    --/odecode(substr(empno,1,1),'J',3,'P',3,'Q',3,'Y',2,1) covenant, 2016.12.28.hjku... J사번 정규직 사번 전환으로 인한 수정(임단협).. 전지영Mo/
                    Paycl
               From Pimpmas A,
                   (Select Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Hper.Func_Orgnum ) X, --//2018.11.30.소속부서
                   (Select Deptcode, Fincode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Hper.Func_Orgnum ) Y  --//2018.11.30.근무부서
              Where Pstate     < '60'
                And Pstateyn   = 'Y'
                And A.Orgnum   = Hper.Func_Orgnum
                And A.Deptcode = X.Deptcode
                And A.Jobdept  = Y.Deptcode
                )
     Group By Fincode,Covenant,Paycl; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into eai_deptno_temp  select To_Char(Sysdate,'yy\
yymmdd') ,Fincode ,Covenant ,Paycl ,count(*)  ,Sysdate  from (select  case  w\
hen ((X.Tribegb='2' and Y.Tribegb='2') or Tjobduty='09') then Y.Fincode else \
X.Fincode  end  Fincode ,Decode(Substr(Empno,1,1),'J',3,'P',3,'Q',3,'Y',2,Dec\
ode(Paycl,'H10',3,1)) Covenant ,Paycl  from Pimpmas A ,(select Deptcode ,Finc\
ode ,Substr(Tribegb,1,1) Tribegb  from Pycdept where Orgnum=Hper.Func_Orgnum)\
 X ,(select Deptcode ,Fincode ,Substr(Tribegb,1,1) Tribegb  from Pycdept wher\
e Orgnum=Hper.Func_Orgnum) Y where ((((Pstate<'60' and Pstateyn='Y') and A.Or\
gnum=Hper.Func_Orgnum) and A.Deptcode=X.Deptcode) and A.Jobdept=Y.Deptcode)) \
 group by Fincode,Covenant,Paycl";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )88;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {    
          sprintf(FL_Line, "Oracle PL_insert_depttmp 에러  : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     STRINIT(FL_Line);
     sprintf(FL_Line, "인사 일별생성 자료 추가 성공");
     hinsa_log_print(0, FL_Line);
     return (SUCCESS);
}

/*==================================================================================================
EAI_DEPTNO_TEMP을 fetch하여 EAI_DEPTNO테이블에 넣는다.
==================================================================================================*/
int PL_fetch_depttmp(void)
{
     char FL_Line[255];
     int  tmp;
     int  pre_seq=0;
     int  return_value = 0;
   
     /* VARCHAR  sql_cmd[4096]; */ 
struct { unsigned short len; unsigned char arr[4096]; } sql_cmd;

   
     STRINIT(FL_Line);
     hinsa_log_print(0, "EAI_DEPTNO_TEMP FETCH START...");
   
     /* EXEC SQL DECLARE cur_01 CURSOR FOR
     select TO_NUMBER(TO_CHAR(ADD_MONTHS(sysdate, -1), 'YYYY'))            ,
            TO_CHAR(ADD_MONTHS(sysdate, -1), 'MM'  )                       ,
            TO_CHAR(sysdate, 'yyyymmddhh24miss')                           , 
            fincode                                                        ,
            covenant                                                       ,
            decode(covenant,'1','정규직','2','파견직','3','계약직','')     ,
            paycl                                                          ,
            decode(paycl, '01','임원','10','사원','')                      ,
            sum(cnt)                                                       
       from                                                                
           (SELECT A.fincode,
                   A.covenant,
                   decode(substr(A.paycl,1,1), 'A','01','0','01','10') paycl,
                   sum(A.cnt) cnt
              FROM EAI_DEPTNO_TEMP A
             WHERE C_DATE =  to_char(LAST_DAY(ADD_MONTHS(sysdate, -1)), 'yyyymmdd')
             GROUP by A.fincode, A.covenant, a.paycl)
      GROUP by fincode, covenant, paycl; */ 

   
     /* EXEC SQL OPEN cur_01; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0007;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )103;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  (SQLCODE != SQL_OK)
     {
          sprintf(FL_Line, "Oracle OPEN 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     while(TRUE)
     {
          memset((char *)&FL_deptno, NULL, sizeof(FL_deptno));
          
          /* EXEC SQL FETCH cur_01 INTO
                        :FL_deptno.v_gjahr,
                        :FL_deptno.v_zmons,
                        :FL_deptno.v_ifdat,
                        :FL_deptno.v_cctr,
                        :FL_deptno.v_covenant,
                        :FL_deptno.v_covenantnm,
                        :FL_deptno.v_hrlevel,
                        :FL_deptno.v_hrlevelnm,
                        :FL_deptno.v_manno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )118;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FL_deptno.v_gjahr);
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FL_deptno.v_zmons);
          sqlstm.sqhstl[1] = (unsigned long )5;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FL_deptno.v_ifdat);
          sqlstm.sqhstl[2] = (unsigned long )17;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FL_deptno.v_cctr);
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(FL_deptno.v_covenant);
          sqlstm.sqhstl[4] = (unsigned long )4;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&(FL_deptno.v_covenantnm);
          sqlstm.sqhstl[5] = (unsigned long )18;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&(FL_deptno.v_hrlevel);
          sqlstm.sqhstl[6] = (unsigned long )13;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&(FL_deptno.v_hrlevelnm);
          sqlstm.sqhstl[7] = (unsigned long )23;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&(FL_deptno.v_manno);
          sqlstm.sqhstl[8] = (unsigned long )sizeof(float);
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


          
          if  (SQLCODE == SQL_NO_DATA)     break;
         
          if  ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK))
          {
               sprintf(FL_Line, "Oracle FETCH  에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               /* EXEC SQL CLOSE cur_01; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 9;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )169;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return (FAILURE);
          }

          if  (strcmp(s_mon,"01") != 0)  {
			         return_value = PL_select_premon_deptno();
			         
			         if  (return_value == SQL_NO_DATA)
			         {
			              if  (PL_select_depttmp()  == FAILURE)     return (FAILURE);
			              
			              sprintf(FL_Line, "Oracle PL_select_depttmp  pre_mon_manno : [%d]", pre_mon_manno);
			              hinsa_log_print(0, FL_Line);
			              
			              FL_deptno.v_manno = (pre_mon_manno + FL_deptno.v_manno) / 2;
			         }
			         else if  (return_value == SQL_OK)
			              FL_deptno.v_manno = (pre_mon_manno + FL_deptno.v_manno) / 2;
			         else
			              return (FAILURE);
          }
          
          FG_loopcnt++;
          
          FL_seqno = 0;
          return_value = PL_insert_deptno(FL_seqno);
          
          if  (return_value == SQL_DUP)
          {
               if  (PL_select_deptno() == FAILURE)
               {
                    sprintf(FL_Line, "PL_select_deptno() 실패");
                    hinsa_log_print(0, FL_Line);
                    return (FAILURE);
               }
              
               FL_seqno = pre_seqno + 1;
               if  (PL_insert_deptno(FL_seqno) == FAILURE)
               {
                    sprintf(FL_Line, "인사 월별생성 자료 추가 실패");
                    hinsa_log_print(0, FL_Line);
                    return (FAILURE);
               }
          }
          else if  (return_value == FAILURE)
               return (FAILURE);
     }
   
     /* EXEC SQL CLOSE cur_01; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )184;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     return (SUCCESS);
}
/*==================================================================================================
EAI_DEPTNO테이블에서 전월 부서인원을 가져 온다.
==================================================================================================*/
int PL_select_premon_deptno(void)
{
     char FL_Line[255];

     /* EXEC SQL 
     SELECT sum(cnt) INTO :pre_mon_manno
       FROM EAI_DEPTNO_TEMP
      WHERE c_date   =  TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -2)),'yyyymmdd') 
        AND fincode  = :FL_deptno.v_cctr
        AND covenant = :FL_deptno.v_covenant
        AND decode(substr(paycl,1,1),'A','01','0','01','10') = :FL_deptno.v_hrlevel; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(cnt) into :b0  from EAI_DEPTNO_TEMP where ((\
(c_date=TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,(-2))),'yyyymmdd') and fincode=:b\
1) and covenant=:b2) and decode(substr(paycl,1,1),'A','01','0','01','10')=:b3\
)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )199;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_mon_manno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FL_deptno.v_cctr);
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FL_deptno.v_covenant);
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FL_deptno.v_hrlevel);
     sqlstm.sqhstl[3] = (unsigned long )13;
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

     
     
     if (SQLCODE == SQL_NO_DATA)
     {
          sprintf(FL_Line, "Oracle PL_select_premon_deptno SQL_NO_DATA : [%s][%s][%s]",
                           FL_deptno.v_cctr.arr, FL_deptno.v_covenant.arr, FL_deptno.v_hrlevel.arr);
          hinsa_log_print(0, FL_Line);
          return (SQL_NO_DATA);
     }
     else if(SQLCODE == SQL_OK)
     {
          return (SQL_OK);
     }
     else
     {
          sprintf(FL_Line, "Oracle PL_select_premon_deptno 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          /* EXEC SQL CLOSE cur_01; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )230;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return (FAILURE);
     }
}

/*==================================================================================================
eai_deptno테이블에 값을 넣는다.
==================================================================================================*/
int PL_insert_deptno(int FL_seqno)
{
     char FL_Line[255];
   
     /* EXEC SQL 
     INSERT INTO eai_deptno
            (gjahr                 ,
             zmons                 ,
             mdgbn                 ,
             dctyp                 ,
             seqno                 ,
             seqln                 ,
             ifsys                 ,
             ifdat                 ,
             cctr                  ,
             covenant              ,
             covenant_nm           ,
             hrlevel               ,
             hrlevel_nm            ,
             manno                 ,
             mode_flag             ,
             eai_flag               )
     values(:FL_deptno.v_gjahr     ,
            :FL_deptno.v_zmons     ,
            'PA'                   ,
            'H81'                  ,
            :FL_seqno              ,
            :FG_loopcnt            ,
            'HR'                   ,
            to_char(sysdate, 'yyyymmdd')||'000000',
            :FL_deptno.v_cctr      ,
            :FL_deptno.v_covenant  ,
            :FL_deptno.v_covenantnm,
            :FL_deptno.v_hrlevel   ,
            :FL_deptno.v_hrlevelnm ,
            :FL_deptno.v_manno     ,
            'I'                    ,
            'N'                    ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into eai_deptno (gjahr,zmons,mdgbn,dctyp,seqno,s\
eqln,ifsys,ifdat,cctr,covenant,covenant_nm,hrlevel,hrlevel_nm,manno,mode_flag\
,eai_flag) values (:b0,:b1,'PA','H81',:b2,:b3,'HR',(to_char(sysdate,'yyyymmdd\
')||'000000'),:b4,:b5,:b6,:b7,:b8,:b9,'I','N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )245;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FL_deptno.v_gjahr);
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FL_deptno.v_zmons);
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&FL_seqno;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&FG_loopcnt;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FL_deptno.v_cctr);
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FL_deptno.v_covenant);
     sqlstm.sqhstl[5] = (unsigned long )4;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FL_deptno.v_covenantnm);
     sqlstm.sqhstl[6] = (unsigned long )18;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&(FL_deptno.v_hrlevel);
     sqlstm.sqhstl[7] = (unsigned long )13;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&(FL_deptno.v_hrlevelnm);
     sqlstm.sqhstl[8] = (unsigned long )23;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&(FL_deptno.v_manno);
     sqlstm.sqhstl[9] = (unsigned long )sizeof(float);
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


            
     if  (SQLCODE == SQL_DUP)
     {
          return (SQL_DUP);
     }
     else if  (SQLCODE != SQL_OK )
     {
          STRINIT(FL_Line);
          sprintf(FL_Line, "Oracle PL_insert_deptno 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     return (SUCCESS);
}

/*==================================================================================================
eai_deptno에서 seqno의 MAX값을가져 온다
==================================================================================================*/
int PL_select_deptno(void)
{
     char FL_Line[255];
   
     /* EXEC SQL 
     SELECT max(seqno)  INTO  :pre_seqno
       FROM EAI_DEPTNO
      WHERE gjahr         = :FL_deptno.v_gjahr
        and zmons         = :FL_deptno.v_zmons
        and mdgbn         = 'PA'
        and dctyp         = 'H81'
        and cctr          = :FL_deptno.v_cctr
        and covenant      = :FL_deptno.v_covenant; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(seqno) into :b0  from EAI_DEPTNO where (((((\
gjahr=:b1 and zmons=:b2) and mdgbn='PA') and dctyp='H81') and cctr=:b3) and c\
ovenant=:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )300;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_seqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FL_deptno.v_gjahr);
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FL_deptno.v_zmons);
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FL_deptno.v_cctr);
     sqlstm.sqhstl[3] = (unsigned long )9;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FL_deptno.v_covenant);
     sqlstm.sqhstl[4] = (unsigned long )4;
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


        //and hrlevel      = :FL_deptno.v_hrlevel;
   
     if  (SQLCODE != SQL_OK)
     {
          sprintf(FL_Line, "Oracle PL_select_deptno 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          /* EXEC SQL CLOSE cur_01; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 10;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )335;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return (FAILURE);
     }
     return (SUCCESS);

}

/*==================================================================================================
처음 생긴 부서인경우 해당월의 시작일자의 인원수를 가져온다.
==================================================================================================*/
int PL_select_depttmp(void)
{
     char FL_Line[255];
   
     /* EXEC SQL 
     SELECT sum(cnt)  INTO :pre_mon_manno
       FROM eai_deptno_temp
      WHERE c_date   = (select min(C_DATE)
                          from eai_deptno_temp
                         where c_date   like to_char(ADD_MONTHS(sysdate, -1), 'yyyymm')||'%'
                           and fincode  = TRIM(:FL_deptno.v_cctr)
                           and covenant = :FL_deptno.v_covenant
                           and decode(substr(paycl,1,1),'A','01','0','01','10')    = :FL_deptno.v_hrlevel)
        and fincode  = TRIM(:FL_deptno.v_cctr)
        and covenant = :FL_deptno.v_covenant
        and decode(substr(paycl,1,1),'A','01','0','01','10')    = :FL_deptno.v_hrlevel; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 10;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select sum(cnt) into :b0  from eai_deptno_temp where ((\
(c_date=(select min(C_DATE)  from eai_deptno_temp where (((c_date like (to_ch\
ar(ADD_MONTHS(sysdate,(-1)),'yyyymm')||'%') and fincode=trim(:b1)) and covena\
nt=:b2) and decode(substr(paycl,1,1),'A','01','0','01','10')=:b3)) and fincod\
e=trim(:b1)) and covenant=:b2) and decode(substr(paycl,1,1),'A','01','0','01'\
,'10')=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )350;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_mon_manno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FL_deptno.v_cctr);
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FL_deptno.v_covenant);
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FL_deptno.v_hrlevel);
     sqlstm.sqhstl[3] = (unsigned long )13;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FL_deptno.v_cctr);
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FL_deptno.v_covenant);
     sqlstm.sqhstl[5] = (unsigned long )4;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FL_deptno.v_hrlevel);
     sqlstm.sqhstl[6] = (unsigned long )13;
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


   
     if (SQLCODE != SQL_OK)
     {
          sprintf(FL_Line, "Oracle PL_select_depttmp 에러 : %s/%s/%s/%s/%d", SQLERRM, FL_deptno.v_cctr.arr,FL_deptno.v_covenant.arr,FL_deptno.v_hrlevel.arr, pre_mon_manno);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     return (SUCCESS);

}
