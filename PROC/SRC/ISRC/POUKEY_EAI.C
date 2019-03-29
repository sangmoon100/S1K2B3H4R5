
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
           char  filnam[14];
};
static struct sqlcxp sqlfpn =
{
    13,
    "poukey_eai.pc"
};


static unsigned int sqlctx = 654291;


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
5,0,0,1,2631,0,3,92,0,0,0,0,0,1,0,
20,0,0,2,2708,0,3,182,0,0,0,0,0,1,0,
35,0,0,3,4366,0,3,274,0,0,0,0,0,1,0,
50,0,0,4,1983,0,3,402,0,0,0,0,0,1,0,
65,0,0,5,1990,0,3,486,0,0,0,0,0,1,0,
80,0,0,6,2665,0,3,569,0,0,0,0,0,1,0,
95,0,0,7,110,0,4,676,0,0,1,0,0,1,0,2,3,0,0,
114,0,0,8,517,0,3,685,0,0,1,1,0,1,0,1,3,0,0,
133,0,0,9,746,0,3,708,0,0,2,2,0,1,0,1,3,0,0,1,3,0,0,
156,0,0,10,2026,0,3,735,0,0,0,0,0,1,0,
171,0,0,11,97,0,5,806,0,0,0,0,0,1,0,
186,0,0,12,98,0,5,813,0,0,0,0,0,1,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : 종합인사정보 변경데이터 UKey로 전송 poukey_eai.pc
     PROGRM-Decription : 인사테이블을 읽어서 UKey Interface  cron 실행
                         EAI에서 poukeymas(인사), poukeydept(부서) 테이블을 읽어감....새벽 05시 20분
     Version           : 1.00
     Date              : 2011.04.26
       
    Update Contents
     Version  date(yy.mm.dd)  programmer    description  Comments
       1.00   2011.04.26      이희용        최초작성
       2.00   2014.03.05      강륜종dsa2000 도급인력 신규 생성으로 인하여 프로그램 수정. 
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
typedef struct HINSA_ctrl_inter 
{
  /* varchar  v_dt_create  [YYMMDD   + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } v_dt_create;
  /* 생성일자 */
  int      v_no_crt_srl;                 /* 생성 일련번호 */
  int      v_cnt_line;                   /* 라인 건수 */
} ts_ctrl_inter;
 
 int BSeqno;
/* EXEC SQL END DECLARE SECTION; */ 


static ts_ctrl_inter FG_inter_ctrl;
static ts_ctrl_inter *FGP_inter_ctrl;

static int  FG_loopcnt;

void main(void)
{
     char *FL_date;
     char FL_Line[255];
     char FL_file[255];
     char worktime[6] = "";
       
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */  
     STRINIT(&FL_file);
     STRINIT(&FL_Line);
     strcpy(FL_file,"poukey_eai");
   
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
     
     STR2VCTRIM(FGP_inter_ctrl->v_dt_create, FL_date, YYMMDD);  
     
     hinsa_log_print(0,"UKEY 인사/부서 정보 인터페이스(poukey_eai) 프로그램 시작...");
   
     hinsa_db_connect();  

     sprintf(FL_Line, "생성일자 : %s", FGP_inter_ctrl->v_dt_create.arr);
     hinsa_log_print(0, FL_Line);

    /*======================================================================================
     POUKEYMAS INSERT : 변경(신규/퇴사/수정)된  종합인사정보를 EAI통해 UKEY로  전송.
     ======================================================================================*/   

     /*신규입사자*/
     sprintf(FL_Line, "입사자 입력 시작...");
     hinsa_log_print(0, FL_Line);
     
     /* EXEC SQL
     INSERT INTO POUKEYMAS (
                           WORKDATE, PERNR, ENAME, FNAME, CNAME, REGNO, ORGEH, MC_STEXT, SOSOK, INDEPT_TSOSOK, 
                           JIKGUN, JIKWI, JIKCHAK, STAT1, WPLACE, JOINCOMDD, PRODATE, RETIREDD, JOBCODE, JOBTXT, 
                           STARTDATE, CLOSEDATE, GESCH, MOREPOYN, INTELNO, MOVETELNO, TELNR, FAX, EMAIL, EMAIL2, 
                           NOWADDRESS1, NOWADDRESS2, NOWADDRESS3, NOWADDRESS4, NOWZIPCD, AEDTM, PHOTOURL, 
                           TASK1, TASK2, TASK3, WKADDR, WKFLOOR, PDANO, ETCNO, ESOSOK, INDEPT_ETSOSOK, T_FLAG, 
                           SENDDT, BIRTH, GUBUN, EAI_FLAG, EAI_DATE, EAI_FLAG2, EAI_DATE2,
                           EAI_FLAG3, EAI_DATE3, EAI_FLAG4, EAI_DATE4, EAI_FLAG5, EAI_DATE5
                          )   
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')                              "생성일자",          
            M.EMPNO                                                  "사번", 
            M.KORNAME                                                "한글이름", 
            UPPER(M.ENGNAME)                                         "영문이름", 
            M.CHNNAME                                                "한문이름", 
            REPLACE(M.JUMINID, '-', '')                              "주민번호", 
            --Decode(M.DEPTCODE,'','',Substr(M.ORGNUM,-2))||M.DEPTCODE "부서코드(내부)",    --2018.11. H23차부터 트라이브조직은 근무부서로 전송.
            --B.DEPTNAME                                               "부서명", 
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then
                 Substr(M.ORGNUM,-2)||M.JobDept                   --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함 --//2018.11.30  소속과 근무부서 모두 트라이브면 근무부서  dsa2000
            Else Substr(M.ORGNUM,-2)||M.Deptcode End  "부서코드", 
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then C.DEPTNAME Else B.DEPTNAME End  "부서명",  --//2018.11.30  
            ''                                                       "소속",             
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then C.DEPTFNAME Else B.DEPTFNAME End "토탈소속",
            M.JOBGUN                                                 "직군코드",
            ''                                                       "직위코드",
            /oDECODE(M.EMPNO, 'P590','H31','P591','H31','P592','H31','P601','H31','P602','H31',  'P603','H31','P617','H31', M.PAYRA)    "직책코드",o/
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then Jobpayra Else Payra End "직책코드", --M.PAYRA  --//2018.11.30  
            ''                                                       "재직구분",
            ''                                                       "근무장소", 
            M.EMPDATE                                                "입사일",
            M.PAYCLDATE                                              "승진기준일",
            M.RETDATE                                                "퇴사일",
            ''                                                       "직무코드",   
            ''                                                       "직무명",     
            M.EMPDATE                                                "근무기간시작일",
            M.RETDATE                                                "근무기간종료일",
            DECODE(M.SEX, 'M', '1', 'F', '2', M.SEX)                 "성별",
            ''                                                       "겸직여부",
            FUNC_TEL_CHE(M.Offitel)                                  "사내번화번호",
            FUNC_TEL_CHE(M.Retcont)                                  "이동전화",
            FUNC_TEL_CHE(M.TELNO)                                    "집전화",
            ''                                                       "팩스",
            M.SKEMAIL                                                "E-MAIL",
            M.E_MAIL                                                 "외부MAIL",
            ''                                                       "현주소(지역)",
            ''                                                       "현주소(시/군/구)",
            ''                                                       "현주소(읍/면/동)",
            ''                                                       "현주소(상세주소)",
            ''                                                       "현주소우편번호(지역)",
            ''                                                       "ID사용시작일",
            ''                                                       "사진URL",
            ''                                                       "담당업무1",
            ''                                                       "담당업무2",
            ''                                                       "담당업무3",
            ''                                                       "근무주소",
            ''                                                       "근무층수",
            ''                                                       "PDA번호",
            ''                                                       "기타번호",
            ''                                                       "영문소속",
            ''                                                       "영문토탈소속",
            'I'                                                      "구분",
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')                     "전송일자",
            M.BIRTHDAY                                               "실제생일",
            DECODE(M.BIRTHGUBUN, '양력', '1', '2')                   "양/음력구분",
            'N', '', 'N', '', 'N', '', 'N', '', 'N', ''              "EAI 1~5"
       From (Select * From Pimpmas Where Pstate < '80' And Juminid Is Not Null) M,
             V_HINTDEPT B, V_HINTDEPT C,
            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Func_Orgnum) X,
            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Func_Orgnum) Y
      Where M.DEPTCODE = B.DEPTCODE 
        AND M.JOBDEPT  = C.DEPTCODE 
        And M.Deptcode = X.Deptcode
        And M.Jobdept  = Y.Deptcode
        AND M.EMPNO NOT IN (SELECT PERNR FROM POUKEYMAS WHERE WORKDATE <= TO_CHAR(SYSDATE-1,'YYYYMMDD') and T_FLAG='I')/o2015.02.09. 변경이 먼저 발생한 경우 신규 발생이 되지 않은 오류로 인해 변경..WHERE WORKDATE <= TO_CHAR(SYSDATE-1,'YYYYMMDD')) o/        
        ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into POUKEYMAS (WORKDATE,PERNR,ENAME,FNAME,CNAME,REGNO,ORGEH,\
MC_STEXT,SOSOK,INDEPT_TSOSOK,JIKGUN,JIKWI,JIKCHAK,STAT1,WPLACE,JOINCOMDD,PRO\
DATE,RETIREDD,JOBCODE,JOBTXT,STARTDATE,CLOSEDATE,GESCH,MOREPOYN,INTELNO,MOVE\
TELNO,TELNR,FAX,EMAIL,EMAIL2,NOWADDRESS1,NOWADDRESS2,NOWADDRESS3,NOWADDRESS4\
,NOWZIPCD,AEDTM,PHOTOURL,TASK1,TASK2,TASK3,WKADDR,WKFLOOR,PDANO,ETCNO,ESOSOK\
,INDEPT_ETSOSOK,T_FLAG,SENDDT,BIRTH,GUBUN,EAI_FLAG,EAI_DATE,EAI_FLAG2,EAI_DA\
TE2,EAI_FLAG3,EAI_DATE3,EAI_FLAG4,EAI_DATE4,EAI_FLAG5,EAI_DATE5)select TO_CH\
AR(SYSDATE,'YYYYMMDD') \"생성일자\" ,M.EMPNO \"사번\" ,M.KORNAME \"한글이름\"\
 ,UPPER(M.ENGNAME) \"영문이름\" ,M.CHNNAME \"한문이름\" ,REPLACE(M.JUMINID,'\
-','') \"주민번호\" , case  when ((X.Tribegb='2' and Y.Tribegb='2') or M.Tjo\
bduty='09') then (Substr(M.ORGNUM,(-2))||M.JobDept) else (Substr(M.ORGNUM,(-\
2))||M.Deptcode)  end  \"부서코드\" , case  when ((X.Tribegb='2' and Y.Tribe\
gb='2') or M.Tjobduty='09') then C.DEPTNAME else B.DEPTNAME  end  \"부서명\"\
 ,'' \"소속\" , case  when ((X.Tribegb='2' and Y.Tribegb='2')");
     sqlbuft((void **)0,
       " or M.Tjobduty='09') then C.DEPTFNAME else B.DEPTFNAME  end  \"토탈소\
속\" ,M.JOBGUN \"직군코드\" ,'' \"직위코드\" , case  when ((X.Tribegb='2' an\
d Y.Tribegb='2') or M.Tjobduty='09') then Jobpayra else Payra  end  \"직책코\
드\" ,'' \"재직구분\" ,'' \"근무장소\" ,M.EMPDATE \"입사일\" ,M.PAYCLDATE \"\
승진기준일\" ,M.RETDATE \"퇴사일\" ,'' \"직무코드\" ,'' \"직무명\" ,M.EMPDAT\
E \"근무기간시작일\" ,M.RETDATE \"근무기간종료일\" ,DECODE(M.SEX,'M','1','F'\
,'2',M.SEX) \"성별\" ,'' \"겸직여부\" ,FUNC_TEL_CHE(M.Offitel) \"사내번화번호\
\" ,FUNC_TEL_CHE(M.Retcont) \"이동전화\" ,FUNC_TEL_CHE(M.TELNO) \"집전화\" ,\
'' \"팩스\" ,M.SKEMAIL \"E-MAIL\" ,M.E_MAIL \"외부MAIL\" ,'' \"현주소(지역)\"\
 ,'' \"현주소(시/군/구)\" ,'' \"현주소(읍/면/동)\" ,'' \"현주소(상세주소)\" \
,'' \"현주소우편번호(지역)\" ,'' \"ID사용시작일\" ,'' \"사진URL\" ,'' \"담당\
업무1\" ,'' \"담당업무2\" ,'' \"담당업무3\" ,'' \"근무주소\" ,'' \"근무층수\"\
 ,'' \"PDA번호\" ,'' \"기타번호\" ,'' \"영문소속\" ,'' \"영문토탈소속\" ,'I'\
 \"구분\" ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') \"전송일자\" ,M.BIRTHDAY \"실\
제생일\" ,DECODE(M.BIRTHGUBUN,'양력','1','2'");
     sqlstm.stmt = ") \"양/음력구분\" ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,\
'N' ,'' \"EAI 1~5\"  from (select *  from Pimpmas where (Pstate<'80' and Jumi\
nid is  not null )) M ,V_HINTDEPT B ,V_HINTDEPT C ,(select Deptcode ,Substr(T\
ribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) X ,(select Deptco\
de ,Substr(Tribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) Y whe\
re ((((M.DEPTCODE=B.DEPTCODE and M.JOBDEPT=C.DEPTCODE) and M.Deptcode=X.Deptc\
ode) and M.Jobdept=Y.Deptcode) and M.EMPNO not  in (select PERNR  from POUKEY\
MAS where (WORKDATE<=TO_CHAR((SYSDATE-1),'YYYYMMDD') and T_FLAG='I')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                           
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into POUKEYMAS 입사자 !! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }                
     sprintf(FL_Line, "입사자 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);

     /*퇴사자*/
     sprintf(FL_Line, "퇴직자 입력 시작...");
     hinsa_log_print(0, FL_Line);

     /* EXEC SQL
     INSERT INTO POUKEYMAS (
                           WORKDATE, PERNR, ENAME, FNAME, CNAME, REGNO, ORGEH, MC_STEXT, SOSOK, INDEPT_TSOSOK, 
                           JIKGUN, JIKWI, JIKCHAK, STAT1, WPLACE, JOINCOMDD, PRODATE, RETIREDD, JOBCODE, JOBTXT, 
                           STARTDATE, CLOSEDATE, GESCH, MOREPOYN, INTELNO, MOVETELNO, TELNR, FAX, EMAIL, EMAIL2, 
                           NOWADDRESS1, NOWADDRESS2, NOWADDRESS3, NOWADDRESS4, NOWZIPCD, AEDTM, PHOTOURL, 
                           TASK1, TASK2, TASK3, WKADDR, WKFLOOR, PDANO, ETCNO, ESOSOK, INDEPT_ETSOSOK, T_FLAG, 
                           SENDDT, BIRTH, GUBUN, EAI_FLAG, EAI_DATE, EAI_FLAG2, EAI_DATE2,
                           EAI_FLAG3, EAI_DATE3, EAI_FLAG4, EAI_DATE4, EAI_FLAG5, EAI_DATE5
                          )  
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')                              "생성일자",          
            M.EMPNO                                                  "사번", 
            M.KORNAME                                                "한글이름", 
            UPPER(M.ENGNAME)                                         "영문이름", 
            M.CHNNAME                                                "한문이름", 
            REPLACE(M.JUMINID, '-', '')                              "주민번호", 
            --Decode(M.DEPTCODE,'','',Substr(M.ORGNUM,-2))||M.DEPTCODE "부서코드(내부)",    --2018.11. H23차부터 트라이브조직은 근무부서로 전송.
            --B.DEPTNAME                                               "부서명",             
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then 
                 Substr(M.ORGNUM,-2)||M.JobDept                  --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함 --//2018.11.30  소속과 근무부서 모두 트라이브면 근무부서  dsa2000
            Else Substr(M.ORGNUM,-2)||M.Deptcode End  "부서코드",
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then C.DEPTNAME Else B.DEPTNAME End  "부서명",  --//2018.11.30  
            ''                                                       "소속",             
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then C.DEPTFNAME Else B.DEPTFNAME End "토탈소속",
            M.JOBGUN                                                 "직군코드",
            ''                                                       "직위코드",
            /oDECODE(M.EMPNO, 'P590','H31','P591','H31','P592','H31','P601','H31','P602','H31',  'P603','H31','P617','H31', M.PAYRA)    "직책코드",o/
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then Jobpayra Else Payra End "직책코드", --M.PAYRA  --//2018.11.30              
            ''                                                       "재직구분",
            ''                                                       "근무장소", 
            M.EMPDATE                                                "입사일",
            M.PAYCLDATE                                              "승진기준일",
            M.RETDATE                                                "퇴사일",
            ''                                                       "직무코드",   
            ''                                                       "직무명",     
            M.EMPDATE                                                "근무기간시작일",
            M.RETDATE                                                "근무기간종료일",
            DECODE(M.SEX, 'M', '1', 'F', '2', M.SEX)                 "성별",
            ''                                                       "겸직여부",
            FUNC_TEL_CHE(M.Offitel)                                  "사내번화번호",          
            FUNC_TEL_CHE(M.Retcont)                                  "이동전화",          
            FUNC_TEL_CHE(M.TELNO)                                    "집전화",           
            ''                                                       "팩스",
            M.SKEMAIL                                                "E-MAIL",
            M.E_MAIL                                                 "외부MAIL",
            ''                                                       "현주소(지역)",
            ''                                                       "현주소(시/군/구)",
            ''                                                       "현주소(읍/면/동)",
            ''                                                       "현주소(상세주소)",
            ''                                                       "현주소우편번호(지역)",
            ''                                                       "ID사용시작일",
            ''                                                       "사진URL",
            ''                                                       "담당업무1",
            ''                                                       "담당업무2",
            ''                                                       "담당업무3",
            ''                                                       "근무주소",
            ''                                                       "근무층수",
            ''                                                       "PDA번호",
            ''                                                       "기타번호",
            ''                                                       "영문소속",
            ''                                                       "영문토탈소속",
            'D'                                                      "구분",
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')                     "전송일자",
            M.BIRTHDAY                                               "실제생일",
            DECODE(M.BIRTHGUBUN, '양력', '1', '2')                   "양/음력구분",
            'N', '', 'N', '', 'N', '', 'N', '', 'N', ''              "EAI 1~5"
       From (Select * From Pimpmas Where Juminid Is Not Null) M,
             V_HINTDEPT B, V_HINTDEPT C,
            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Func_Orgnum) X,
            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Func_Orgnum) Y
      Where M.DEPTCODE = B.DEPTCODE 
        AND M.JOBDEPT  = C.DEPTCODE 
        And M.Deptcode = X.Deptcode
        And M.Jobdept  = Y.Deptcode
        And ((NVL(RETDATE,'99999999') < TO_CHAR(SYSDATE,'YYYYMMDD') AND NVL(RETDATE,'99999999') >= '20110901') /o2015.04.01.hjku..퇴직일 이후에 전송되도록 수정..((NVL(RETDATE,'99999999') <= TO_CHAR(SYSDATE,'YYYYMMDD') AND NVL(RETDATE,'99999999') >= '20110901') o/         
             OR ((PSTATE = '80') AND (LANFRDATE >= '20110901')))
        AND EMPNO NOT IN (SELECT PERNR FROM POUKEYMAS WHERE T_FLAG ='D' )
        ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into POUKEYMAS (WORKDATE,PERNR,ENAME,FNAME,CNAME,REGNO,ORGEH,\
MC_STEXT,SOSOK,INDEPT_TSOSOK,JIKGUN,JIKWI,JIKCHAK,STAT1,WPLACE,JOINCOMDD,PRO\
DATE,RETIREDD,JOBCODE,JOBTXT,STARTDATE,CLOSEDATE,GESCH,MOREPOYN,INTELNO,MOVE\
TELNO,TELNR,FAX,EMAIL,EMAIL2,NOWADDRESS1,NOWADDRESS2,NOWADDRESS3,NOWADDRESS4\
,NOWZIPCD,AEDTM,PHOTOURL,TASK1,TASK2,TASK3,WKADDR,WKFLOOR,PDANO,ETCNO,ESOSOK\
,INDEPT_ETSOSOK,T_FLAG,SENDDT,BIRTH,GUBUN,EAI_FLAG,EAI_DATE,EAI_FLAG2,EAI_DA\
TE2,EAI_FLAG3,EAI_DATE3,EAI_FLAG4,EAI_DATE4,EAI_FLAG5,EAI_DATE5)select TO_CH\
AR(SYSDATE,'YYYYMMDD') \"생성일자\" ,M.EMPNO \"사번\" ,M.KORNAME \"한글이름\"\
 ,UPPER(M.ENGNAME) \"영문이름\" ,M.CHNNAME \"한문이름\" ,REPLACE(M.JUMINID,'\
-','') \"주민번호\" , case  when ((X.Tribegb='2' and Y.Tribegb='2') or M.Tjo\
bduty='09') then (Substr(M.ORGNUM,(-2))||M.JobDept) else (Substr(M.ORGNUM,(-\
2))||M.Deptcode)  end  \"부서코드\" , case  when ((X.Tribegb='2' and Y.Tribe\
gb='2') or M.Tjobduty='09') then C.DEPTNAME else B.DEPTNAME  end  \"부서명\"\
 ,'' \"소속\" , case  when ((X.Tribegb='2' and Y.Tribegb='2')");
     sqlbuft((void **)0,
       " or M.Tjobduty='09') then C.DEPTFNAME else B.DEPTFNAME  end  \"토탈소\
속\" ,M.JOBGUN \"직군코드\" ,'' \"직위코드\" , case  when ((X.Tribegb='2' an\
d Y.Tribegb='2') or M.Tjobduty='09') then Jobpayra else Payra  end  \"직책코\
드\" ,'' \"재직구분\" ,'' \"근무장소\" ,M.EMPDATE \"입사일\" ,M.PAYCLDATE \"\
승진기준일\" ,M.RETDATE \"퇴사일\" ,'' \"직무코드\" ,'' \"직무명\" ,M.EMPDAT\
E \"근무기간시작일\" ,M.RETDATE \"근무기간종료일\" ,DECODE(M.SEX,'M','1','F'\
,'2',M.SEX) \"성별\" ,'' \"겸직여부\" ,FUNC_TEL_CHE(M.Offitel) \"사내번화번호\
\" ,FUNC_TEL_CHE(M.Retcont) \"이동전화\" ,FUNC_TEL_CHE(M.TELNO) \"집전화\" ,\
'' \"팩스\" ,M.SKEMAIL \"E-MAIL\" ,M.E_MAIL \"외부MAIL\" ,'' \"현주소(지역)\"\
 ,'' \"현주소(시/군/구)\" ,'' \"현주소(읍/면/동)\" ,'' \"현주소(상세주소)\" \
,'' \"현주소우편번호(지역)\" ,'' \"ID사용시작일\" ,'' \"사진URL\" ,'' \"담당\
업무1\" ,'' \"담당업무2\" ,'' \"담당업무3\" ,'' \"근무주소\" ,'' \"근무층수\"\
 ,'' \"PDA번호\" ,'' \"기타번호\" ,'' \"영문소속\" ,'' \"영문토탈소속\" ,'D'\
 \"구분\" ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') \"전송일자\" ,M.BIRTHDAY \"실\
제생일\" ,DECODE(M.BIRTHGUBUN,'양력','1','2'");
     sqlstm.stmt = ") \"양/음력구분\" ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,\
'N' ,'' \"EAI 1~5\"  from (select *  from Pimpmas where Juminid is  not null \
) M ,V_HINTDEPT B ,V_HINTDEPT C ,(select Deptcode ,Substr(Tribegb,1,1) Tribeg\
b  from Pycdept where Orgnum=Func_Orgnum) X ,(select Deptcode ,Substr(Tribegb\
,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) Y where (((((M.DEPTCODE\
=B.DEPTCODE and M.JOBDEPT=C.DEPTCODE) and M.Deptcode=X.Deptcode) and M.Jobdep\
t=Y.Deptcode) and ((NVL(RETDATE,'99999999')<TO_CHAR(SYSDATE,'YYYYMMDD') and N\
VL(RETDATE,'99999999')>='20110901') or (PSTATE='80' and LANFRDATE>='20110901'\
))) and EMPNO not  in (select PERNR  from POUKEYMAS where T_FLAG='D'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into POUKEYMAS 퇴사자!! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }
     sprintf(FL_Line, "퇴직자 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);

     /*변경자*/         
     sprintf(FL_Line, "변경자 입력 시작...");
     hinsa_log_print(0, FL_Line);

     /* EXEC SQL
     INSERT INTO POUKEYMAS(
                           WORKDATE, PERNR, ENAME, FNAME, CNAME, REGNO, ORGEH, MC_STEXT, SOSOK, INDEPT_TSOSOK, 
                           JIKGUN, JIKWI, JIKCHAK, STAT1, WPLACE, JOINCOMDD, PRODATE, RETIREDD, JOBCODE, JOBTXT, 
                           STARTDATE, CLOSEDATE, GESCH, MOREPOYN, INTELNO, MOVETELNO, TELNR, FAX, EMAIL, EMAIL2, 
                           NOWADDRESS1, NOWADDRESS2, NOWADDRESS3, NOWADDRESS4, NOWZIPCD, AEDTM, PHOTOURL, 
                           TASK1, TASK2, TASK3, WKADDR, WKFLOOR, PDANO, ETCNO, ESOSOK, INDEPT_ETSOSOK, T_FLAG, 
                           SENDDT, BIRTH, GUBUN, EAI_FLAG, EAI_DATE, EAI_FLAG2, EAI_DATE2, 
                           EAI_FLAG3, EAI_DATE3, EAI_FLAG4, EAI_DATE4, EAI_FLAG5, EAI_DATE5
                          )
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')                              "생성일자",          
            M.EMPNO                                                  "사번", 
            M.KORNAME                                                "한글이름", 
            UPPER(M.ENGNAME)                                         "영문이름", 
            M.CHNNAME                                                "한문이름", 
            REPLACE(M.JUMINID, '-', '')                              "주민번호", 
            --Decode(M.DEPTCODE,'','',Substr(M.ORGNUM,-2))||M.DEPTCODE "부서코드(내부)",    --2018.11. H23차부터 트라이브조직은 근무부서로 전송.
            --B.DEPTNAME                                               "부서명", 
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then 
                 Substr(M.ORGNUM,-2)||M.JobDept                  --//2019.01.09  트라이브조직 구성원 또는 비서는 근무부서를 기준으로 함 --//2018.11.30  소속과 근무부서 모두 트라이브면 근무부서  dsa2000
            Else Substr(M.ORGNUM,-2)||M.Deptcode End  "부서코드",
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then C.DEPTNAME Else B.DEPTNAME End  "부서명",  --//2018.11.30  
            ''                                                       "소속",             
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then C.DEPTFNAME Else B.DEPTFNAME End "토탈소속",
            M.JOBGUN                                                 "직군코드",
            ''                                                       "직위코드",
            /oDECODE(M.EMPNO, 'P590','H31','P591','H31','P592','H31','P601','H31','P602','H31',  'P603','H31','P617','H31', M.PAYRA)    "직책코드",o/
            Case When (X.Tribegb='2' And Y.Tribegb='2') Or (M.Tjobduty='09') Then M.Jobpayra Else M.Payra End "직책코드", --M.PAYRA  --//2018.11.30  
            ''                                                       "재직구분",
            M.JOBPLACE                                               "근무장소", 
            M.EMPDATE                                                "입사일",
            M.PAYCLDATE                                              "승진기준일",
            M.RETDATE                                                "퇴사일",
            ''                                                       "직무코드",   
            ''                                                       "직무명",     
            M.EMPDATE                                                "근무기간시작일",
            M.RETDATE                                                "근무기간종료일",
            DECODE(M.SEX, 'M', '1', 'F', '2', M.SEX)                 "성별",
            ''                                                       "겸직여부",
            FUNC_TEL_CHE(M.Offitel)                                  "사내번화번호",          
            FUNC_TEL_CHE(M.Retcont)                                  "이동전화",          
            FUNC_TEL_CHE(M.TELNO)                                    "집전화",           
            ''                                                       "팩스",
            M.SKEMAIL                                                "E-MAIL",
            M.E_MAIL                                                 "외부MAIL",
            ''                                                       "현주소(지역)",
            ''                                                       "현주소(시/군/구)",
            ''                                                       "현주소(읍/면/동)",
            ''                                                       "현주소(상세주소)",
            ''                                                       "현주소우편번호(지역)",
            ''                                                       "ID사용시작일",
            ''                                                       "사진URL",
            ''                                                       "담당업무1",
            ''                                                       "담당업무2",
            ''                                                       "담당업무3",
            ''                                                       "근무주소",
            ''                                                       "근무층수",
            ''                                                       "PDA번호",
            ''                                                       "기타번호",
            ''                                                       "영문소속",
            ''                                                       "영문토탈소속",
            'U'                                                      "구분",
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')                     "전송일자",
            M.BIRTHDAY                                               "실제생일",
            DECODE(M.BIRTHGUBUN, '양력', '1', '2')                   "양/음력구분",
            'N', '', 'N', '', 'N', '', 'N', '', 'N', ''              "EAI 1~5"
       From (Select * From Pimpmas Where Juminid Is Not Null) M,
             PIMPMAS_HINT A, V_HINTDEPT B, V_HINTDEPT C,
            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Func_Orgnum) X,  /o2018.11. H23차 트라이브 조직 반영o/
            (Select Deptcode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum=Func_Orgnum) Y   /o2018.11. H23차 트라이브 조직 반영o/
      Where M.DEPTCODE = B.DEPTCODE 
        AND M.JOBDEPT  = C.DEPTCODE 
        And M.Deptcode = X.Deptcode
        And M.Jobdept  = Y.Deptcode
        And A.WORKDATE = TO_CHAR(SYSDATE-1,'YYYYMMDD')  
        AND M.EMPNO    = A.EMPNO
        AND EXISTS(SELECT 1 FROM POUKEYMAS WHERE WORKDATE < TO_CHAR(SYSDATE,'YYYYMMDD') AND M.EMPNO = PERNR AND T_FLAG='I') -- /o2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..o/    
        AND NOT EXISTS(SELECT 1 FROM POUKEYMAS WHERE T_FLAG='D' AND M.EMPNO = PERNR )  --/o2015.02.10. 삭제가 발생한 대상자가 다시 전송되는 오류로 인해 추가..o/
        AND M.EMPNO NOT IN (SELECT TRIM(PERNR) FROM POUKEYMAS
                             WHERE WORKDATE = TO_CHAR(SYSDATE,'YYYYMMDD') AND T_FLAG IN ('I','D'))
        AND (
            NVL(TRIM(M.KORNAME),' ')  <> NVL(TRIM(A.KORNAME), ' ')
        OR  NVL(TRIM(M.ENGNAME),' ')  <> NVL(TRIM(A.ENGNAME), ' ')
        OR  M.JUMINID                 <> A.JUMINID       
        OR  M.ORGNUM                  <> A.ORGNUM     /o2014.12.30.hjku. 누락부분 추가o/ 
        OR  M.DEPTCODE                <> A.DEPTCODE
        OR  M.PAYRA                   <> A.PAYRA
        OR  M.JOBDEPT                 <> A.JOBDEPT    /o2018.12.17 근무지정보 변경시에도 전송토록 수정o/
        OR  M.JOBPAYRA                <> A.JOBPAYRA   /o2018.12.17 근무지정보 변경시에도 전송토록 수정o/
        OR  M.JOBGUN                  <> A.JOBGUN        
        OR  M.EMPDATE                 <> A.EMPDATE       
        OR  M.RETDATE                 <> A.RETDATE       
        OR  M.SEX                     <> A.SEX           
        OR  NVL(TRIM(M.OFFITEL), ' ') <> NVL(TRIM(A.OFFITEL), ' ') 
        OR  NVL(TRIM(M.TELNO), ' ')   <> NVL(TRIM(A.TELNO), ' ') 
        OR  NVL(TRIM(M.RETCONT), ' ') <> NVL(TRIM(A.RETCONT), ' ') 
        OR  NVL(TRIM(M.SKEMAIL), ' ') <> NVL(TRIM(A.SKEMAIL), ' ') 
        OR  NVL(TRIM(M.CURADDR), ' ') <> NVL(TRIM(A.CURADDR), ' ') 
        OR  M.ZIPNO                   <> A.ZIPNO         
        OR  M.BIRTHDAY                <> A.BIRTHDAY      
        OR  M.BIRTHGUBUN              <> A.BIRTHGUBUN) 
        Union 
        Select TO_CHAR(SYSDATE,'YYYYMMDD') Workdate, Pernr, Ename, Fname, Cname, Regno, Orgeh, Mc_Stext, Sosok, Indept_Tsosok, Jikgun, Jikwi, Jikchak, Stat1, Wplace, Joincomdd, 
               Prodate, Retiredd, Jobcode, Jobtxt, Startdate, Closedate, Gesch, Morepoyn, Intelno, Movetelno, Telnr, Fax, Email, Email2,
               Nowaddress1, Nowaddress2, Nowaddress3, Nowaddress4, Nowzipcd, Aedtm, Photourl, Task1, Task2, Task3, Wkaddr, Wkfloor, Pdano, Etcno, Esosok, Indept_Etsosok, T_Flag,
               To_Char(Sysdate, 'YYYYMMDDHH24MISS') Senddt, Birth, Gubun, 'N', '', 'N', '', 'N', '', 'N', '', 'N', ''
         From Hperson.Poukeymas_Dsa2 
        Where Pernr In ('0889','1002','1136','1234','1805','2009','2648','2662','3103','YN72')
          And TO_CHAR(SYSDATE,'YYYYMMDD')='20190129'
        ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into POUKEYMAS (WORKDATE,PERNR,ENAME,FNAME,CNAME,REGNO,ORGEH,\
MC_STEXT,SOSOK,INDEPT_TSOSOK,JIKGUN,JIKWI,JIKCHAK,STAT1,WPLACE,JOINCOMDD,PRO\
DATE,RETIREDD,JOBCODE,JOBTXT,STARTDATE,CLOSEDATE,GESCH,MOREPOYN,INTELNO,MOVE\
TELNO,TELNR,FAX,EMAIL,EMAIL2,NOWADDRESS1,NOWADDRESS2,NOWADDRESS3,NOWADDRESS4\
,NOWZIPCD,AEDTM,PHOTOURL,TASK1,TASK2,TASK3,WKADDR,WKFLOOR,PDANO,ETCNO,ESOSOK\
,INDEPT_ETSOSOK,T_FLAG,SENDDT,BIRTH,GUBUN,EAI_FLAG,EAI_DATE,EAI_FLAG2,EAI_DA\
TE2,EAI_FLAG3,EAI_DATE3,EAI_FLAG4,EAI_DATE4,EAI_FLAG5,EAI_DATE5)select TO_CH\
AR(SYSDATE,'YYYYMMDD') \"생성일자\" ,M.EMPNO \"사번\" ,M.KORNAME \"한글이름\"\
 ,UPPER(M.ENGNAME) \"영문이름\" ,M.CHNNAME \"한문이름\" ,REPLACE(M.JUMINID,'\
-','') \"주민번호\" , case  when ((X.Tribegb='2' and Y.Tribegb='2') or M.Tjo\
bduty='09') then (Substr(M.ORGNUM,(-2))||M.JobDept) else (Substr(M.ORGNUM,(-\
2))||M.Deptcode)  end  \"부서코드\" , case  when ((X.Tribegb='2' and Y.Tribe\
gb='2') or M.Tjobduty='09') then C.DEPTNAME else B.DEPTNAME  end  \"부서명\"\
 ,'' \"소속\" , case  when ((X.Tribegb='2' and Y.Tribegb='2')");
     sqlbuft((void **)0,
       " or M.Tjobduty='09') then C.DEPTFNAME else B.DEPTFNAME  end  \"토탈소\
속\" ,M.JOBGUN \"직군코드\" ,'' \"직위코드\" , case  when ((X.Tribegb='2' an\
d Y.Tribegb='2') or M.Tjobduty='09') then M.Jobpayra else M.Payra  end  \"직\
책코드\" ,'' \"재직구분\" ,M.JOBPLACE \"근무장소\" ,M.EMPDATE \"입사일\" ,M.\
PAYCLDATE \"승진기준일\" ,M.RETDATE \"퇴사일\" ,'' \"직무코드\" ,'' \"직무명\
\" ,M.EMPDATE \"근무기간시작일\" ,M.RETDATE \"근무기간종료일\" ,DECODE(M.SEX\
,'M','1','F','2',M.SEX) \"성별\" ,'' \"겸직여부\" ,FUNC_TEL_CHE(M.Offitel) \"\
사내번화번호\" ,FUNC_TEL_CHE(M.Retcont) \"이동전화\" ,FUNC_TEL_CHE(M.TELNO) \
\"집전화\" ,'' \"팩스\" ,M.SKEMAIL \"E-MAIL\" ,M.E_MAIL \"외부MAIL\" ,'' \"현\
주소(지역)\" ,'' \"현주소(시/군/구)\" ,'' \"현주소(읍/면/동)\" ,'' \"현주소(\
상세주소)\" ,'' \"현주소우편번호(지역)\" ,'' \"ID사용시작일\" ,'' \"사진URL\"\
 ,'' \"담당업무1\" ,'' \"담당업무2\" ,'' \"담당업무3\" ,'' \"근무주소\" ,'' \
\"근무층수\" ,'' \"PDA번호\" ,'' \"기타번호\" ,'' \"영문소속\" ,'' \"영문토탈\
소속\" ,'U' \"구분\" ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') \"전송일자\" ,M.BI\
RTHDAY \"실제생일\" ,DECODE(M.BIRTHGUBUN,'");
     sqlbuft((void **)0,
       "양력','1','2') \"양/음력구분\" ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,\
'N' ,'' \"EAI 1~5\"  from (select *  from Pimpmas where Juminid is  not null\
 ) M ,PIMPMAS_HINT A ,V_HINTDEPT B ,V_HINTDEPT C ,(select Deptcode ,Substr(T\
ribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) X ,(select Deptc\
ode ,Substr(Tribegb,1,1) Tribegb  from Pycdept where Orgnum=Func_Orgnum) Y w\
here (((((((((M.DEPTCODE=B.DEPTCODE and M.JOBDEPT=C.DEPTCODE) and M.Deptcode\
=X.Deptcode) and M.Jobdept=Y.Deptcode) and A.WORKDATE=TO_CHAR((SYSDATE-1),'Y\
YYYMMDD')) and M.EMPNO=A.EMPNO) and exists (select 1  from POUKEYMAS where (\
(WORKDATE<TO_CHAR(SYSDATE,'YYYYMMDD') and M.EMPNO=PERNR) and T_FLAG='I'))) a\
nd  not exists (select 1  from POUKEYMAS where (T_FLAG='D' and M.EMPNO=PERNR\
))) and M.EMPNO not  in (select trim(PERNR)  from POUKEYMAS where (WORKDATE=\
TO_CHAR(SYSDATE,'YYYYMMDD') and T_FLAG in ('I','D')))) and (((((((((((((((((\
((NVL(trim(M.KORNAME),' ')<>NVL(trim(A.KORNAME),' ') or NVL(trim(M.ENGNAME),\
' ')<>NVL(trim(A.ENGNAME),' ')) or M.JUMINID<>A.");
     sqlbuft((void **)0,
       "JUMINID) or M.ORGNUM<>A.ORGNUM) or M.DEPTCODE<>A.DEPTCODE) or M.PAYR\
A<>A.PAYRA) or M.JOBDEPT<>A.JOBDEPT) or M.JOBPAYRA<>A.JOBPAYRA) or M.JOBGUN<\
>A.JOBGUN) or M.EMPDATE<>A.EMPDATE) or M.RETDATE<>A.RETDATE) or M.SEX<>A.SEX\
) or NVL(trim(M.OFFITEL),' ')<>NVL(trim(A.OFFITEL),' ')) or NVL(trim(M.TELNO\
),' ')<>NVL(trim(A.TELNO),' ')) or NVL(trim(M.RETCONT),' ')<>NVL(trim(A.RETC\
ONT),' ')) or NVL(trim(M.SKEMAIL),' ')<>NVL(trim(A.SKEMAIL),' ')) or NVL(tri\
m(M.CURADDR),' ')<>NVL(trim(A.CURADDR),' ')) or M.ZIPNO<>A.ZIPNO) or M.BIRTH\
DAY<>A.BIRTHDAY) or M.BIRTHGUBUN<>A.BIRTHGUBUN)) union select TO_CHAR(SYSDAT\
E,'YYYYMMDD') Workdate ,Pernr ,Ename ,Fname ,Cname ,Regno ,Orgeh ,Mc_Stext ,\
Sosok ,Indept_Tsosok ,Jikgun ,Jikwi ,Jikchak ,Stat1 ,Wplace ,Joincomdd ,Prod\
ate ,Retiredd ,Jobcode ,Jobtxt ,Startdate ,Closedate ,Gesch ,Morepoyn ,Intel\
no ,Movetelno ,Telnr ,Fax ,Email ,Email2 ,Nowaddress1 ,Nowaddress2 ,Nowaddre\
ss3 ,Nowaddress4 ,Nowzipcd ,Aedtm ,Photourl ,Task1 ,Task2 ,Task3 ,Wkaddr ,Wk\
floor ,Pdano ,Etcno ,Esosok ,Indept_Etsosok ");
     sqlstm.stmt = ",T_Flag ,To_Char(Sysdate,'YYYYMMDDHH24MISS') Senddt ,Bi\
rth ,Gubun ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,''  from Hperson.Poukeym\
as_Dsa2 where (Pernr in ('0889','1002','1136','1234','1805','2009','2648','26\
62','3103','YN72') and TO_CHAR(SYSDATE,'YYYYMMDD')='20190129')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )35;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into POUKEYMAS 변경자!! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }                         
     sprintf(FL_Line, "변경자 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
     
     
     
     /*======================================================================================
     도급인력 인터페이스 추가에 따른 프로그램 Add Start.  dsa2000   2014.03. 
     ======================================================================================*/  
     sprintf(FL_Line, "도급인력 신규입사자 입력 시작...");
     hinsa_log_print(0, FL_Line);
     
     /* EXEC SQL
     INSERT INTO POUKEYMAS (
                           WORKDATE, PERNR, ENAME, FNAME, CNAME, REGNO, ORGEH, MC_STEXT, SOSOK, INDEPT_TSOSOK, 
                           JIKGUN, JIKWI, JIKCHAK, STAT1, WPLACE, JOINCOMDD, PRODATE, RETIREDD, JOBCODE, JOBTXT, 
                           STARTDATE, CLOSEDATE, GESCH, MOREPOYN, INTELNO, MOVETELNO, TELNR, FAX, EMAIL, EMAIL2, 
                           NOWADDRESS1, NOWADDRESS2, NOWADDRESS3, NOWADDRESS4, NOWZIPCD, AEDTM, PHOTOURL, 
                           TASK1, TASK2, TASK3, WKADDR, WKFLOOR, PDANO, ETCNO, ESOSOK, INDEPT_ETSOSOK, T_FLAG, 
                           SENDDT, BIRTH, GUBUN, EAI_FLAG, EAI_DATE, EAI_FLAG2, EAI_DATE2,
                           EAI_FLAG3, EAI_DATE3, EAI_FLAG4, EAI_DATE4, EAI_FLAG5, EAI_DATE5
                          )   
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')                              "생성일자",          
            A.EMPNO                                                  "사번", 
            A.KNAME                                                  "한글이름", 
            ''                                                       "영문이름", 
            ''                                                       "한문이름", 
            REPLACE(A.JUMINID, '-', '')                              "주민번호", 
            Decode(A.DEPTCODE,'','',Substr(A.ORGNUM,-2))||A.DEPTCODE "부서코드(내부)", 
            B.DEPTNAME                                               "부서명", 
            ''                                                       "소속", 
            C.DEPTFNAME                                              "토탈소속", 
            ''                                                       "직군코드",
            ''                                                       "직위코드",
            A.PAYRA                                                  "직책코드",
            ''                                                       "재직구분",
            ''                                                       "근무장소", 
            A.EMPDATE                                                "입사일",
            A.EMPDATE                                                "승진기준일",
            A.RETDATE                                                "퇴사일",
            ''                                                       "직무코드",   
            ''                                                       "직무명",     
            A.EMPDATE                                                "근무기간시작일",
            A.RETDATE                                                "근무기간종료일",
            SUBSTR(JUMINID,8,1)                                      "성별",
            ''                                                       "겸직여부",
            FUNC_TEL_CHE(A.Otel)                                     "사내번화번호",
            FUNC_TEL_CHE(A.HANDP)                                    "이동전화",
            ''                                                       "집전화",
            ''                                                       "팩스",
            A.SKEMAIL                                                "E-MAIL",
            ''                                                       "외부MAIL",
            ''                                                       "현주소(지역)",
            ''                                                       "현주소(시/군/구)",
            ''                                                       "현주소(읍/면/동)",
            ''                                                       "현주소(상세주소)",
            ''                                                       "현주소우편번호(지역)",
            ''                                                       "ID사용시작일",
            ''                                                       "사진URL",
            ''                                                       "담당업무1",
            ''                                                       "담당업무2",
            ''                                                       "담당업무3",
            ''                                                       "근무주소",
            ''                                                       "근무층수",
            ''                                                       "PDA번호",
            ''                                                       "기타번호",
            ''                                                       "영문소속",
            ''                                                       "영문토탈소속",
            'I'                                                      "구분",
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')                     "전송일자",
            ''                                                       "실제생일",
            ''                                                       "양/음력구분",
            'N', '', 'N', '', 'N', '', 'N', '', 'N', ''              "EAI 1~5"
       FROM PZSUBMAS A, PYCDEPT B, V_HINTDEPT C
      WHERE EMPNO NOT IN (SELECT PERNR FROM POUKEYMAS                              
                             WHERE WORKDATE <= TO_CHAR(SYSDATE-1,'YYYYMMDD') and T_FLAG='I') /o2015.02.09. 변경이 먼저 발생한 경우 신규 발생이 되지 않은 오류로 인해 변경.. WHERE WORKDATE <= TO_CHAR(SYSDATE-1,'YYYYMMDD') ) o/
        AND A.Juminid Is Not Null
        AND A.ORGNUM   = B.ORGNUM 
        AND A.DEPTCODE = B.DEPTCODE
        AND A.DEPTCODE = C.DEPTCODE(+)
        And A.Empno in (select distinct empno from poskmail where empno like 'U%'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into POUKEYMAS (WORKDATE,PERNR,ENAME,FNAME,CNAME,REGNO,ORGEH,\
MC_STEXT,SOSOK,INDEPT_TSOSOK,JIKGUN,JIKWI,JIKCHAK,STAT1,WPLACE,JOINCOMDD,PRO\
DATE,RETIREDD,JOBCODE,JOBTXT,STARTDATE,CLOSEDATE,GESCH,MOREPOYN,INTELNO,MOVE\
TELNO,TELNR,FAX,EMAIL,EMAIL2,NOWADDRESS1,NOWADDRESS2,NOWADDRESS3,NOWADDRESS4\
,NOWZIPCD,AEDTM,PHOTOURL,TASK1,TASK2,TASK3,WKADDR,WKFLOOR,PDANO,ETCNO,ESOSOK\
,INDEPT_ETSOSOK,T_FLAG,SENDDT,BIRTH,GUBUN,EAI_FLAG,EAI_DATE,EAI_FLAG2,EAI_DA\
TE2,EAI_FLAG3,EAI_DATE3,EAI_FLAG4,EAI_DATE4,EAI_FLAG5,EAI_DATE5)select TO_CH\
AR(SYSDATE,'YYYYMMDD') \"생성일자\" ,A.EMPNO \"사번\" ,A.KNAME \"한글이름\" \
,'' \"영문이름\" ,'' \"한문이름\" ,REPLACE(A.JUMINID,'-','') \"주민번호\" ,(\
Decode(A.DEPTCODE,'','',Substr(A.ORGNUM,(-2)))||A.DEPTCODE) \"부서코드(내부)\
\" ,B.DEPTNAME \"부서명\" ,'' \"소속\" ,C.DEPTFNAME \"토탈소속\" ,'' \"직군코\
드\" ,'' \"직위코드\" ,A.PAYRA \"직책코드\" ,'' \"재직구분\" ,'' \"근무장소\"\
 ,A.EMPDATE \"입사일\" ,A.EMPDATE \"승진기준일\" ,A.RETDATE \"퇴사일\" ,'' \"\
직무코드\" ,'' \"직무명\" ,A.EMPDATE \"근무기간시작일\" ,A.RETDATE \"근무기간\
종료일\"");
     sqlstm.stmt = " ,SUBSTR(JUMINID,8,1) \"성별\" ,'' \"겸직여부\" ,FUNC_T\
EL_CHE(A.Otel) \"사내번화번호\" ,FUNC_TEL_CHE(A.HANDP) \"이동전화\" ,'' \"집\
전화\" ,'' \"팩스\" ,A.SKEMAIL \"E-MAIL\" ,'' \"외부MAIL\" ,'' \"현주소(지역)\
\" ,'' \"현주소(시/군/구)\" ,'' \"현주소(읍/면/동)\" ,'' \"현주소(상세주소)\"\
 ,'' \"현주소우편번호(지역)\" ,'' \"ID사용시작일\" ,'' \"사진URL\" ,'' \"담당\
업무1\" ,'' \"담당업무2\" ,'' \"담당업무3\" ,'' \"근무주소\" ,'' \"근무층수\"\
 ,'' \"PDA번호\" ,'' \"기타번호\" ,'' \"영문소속\" ,'' \"영문토탈소속\" ,'I' \
\"구분\" ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') \"전송일자\" ,'' \"실제생일\" ,\
'' \"양/음력구분\" ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' \"EAI 1~5\"  \
from PZSUBMAS A ,PYCDEPT B ,V_HINTDEPT C where (((((EMPNO not  in (select PER\
NR  from POUKEYMAS where (WORKDATE<=TO_CHAR((SYSDATE-1),'YYYYMMDD') and T_FLA\
G='I')) and A.Juminid is  not null ) and A.ORGNUM=B.ORGNUM) and A.DEPTCODE=B.\
DEPTCODE) and A.DEPTCODE=C.DEPTCODE(+)) and A.Empno in (select distinct empno\
  from poskmail where empno like 'U%'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )50;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                           
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into POUKEYMAS 도급인력 입사자 !! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }                
     sprintf(FL_Line, "도급인력 입사자 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);


     /*퇴사자*/
     sprintf(FL_Line, "도급인력 퇴직자 입력 시작...");
     hinsa_log_print(0, FL_Line);

     /* EXEC SQL
     INSERT INTO POUKEYMAS (
                           WORKDATE, PERNR, ENAME, FNAME, CNAME, REGNO, ORGEH, MC_STEXT, SOSOK, INDEPT_TSOSOK, 
                           JIKGUN, JIKWI, JIKCHAK, STAT1, WPLACE, JOINCOMDD, PRODATE, RETIREDD, JOBCODE, JOBTXT, 
                           STARTDATE, CLOSEDATE, GESCH, MOREPOYN, INTELNO, MOVETELNO, TELNR, FAX, EMAIL, EMAIL2, 
                           NOWADDRESS1, NOWADDRESS2, NOWADDRESS3, NOWADDRESS4, NOWZIPCD, AEDTM, PHOTOURL, 
                           TASK1, TASK2, TASK3, WKADDR, WKFLOOR, PDANO, ETCNO, ESOSOK, INDEPT_ETSOSOK, T_FLAG, 
                           SENDDT, BIRTH, GUBUN, EAI_FLAG, EAI_DATE, EAI_FLAG2, EAI_DATE2,
                           EAI_FLAG3, EAI_DATE3, EAI_FLAG4, EAI_DATE4, EAI_FLAG5, EAI_DATE5
                          )  
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')                              "생성일자",          
            A.EMPNO                                                  "사번", 
            A.KNAME                                                  "한글이름", 
            ''                                                       "영문이름", 
            ''                                                       "한문이름", 
            REPLACE(A.JUMINID, '-', '')                              "주민번호", 
            Decode(A.DEPTCODE,'','',Substr(A.ORGNUM,-2))||A.DEPTCODE "부서코드(내부)", 
            B.DEPTNAME                                               "부서명", 
            ''                                                       "소속", 
            C.DEPTFNAME                                              "토탈소속", 
            ''                                                       "직군코드",
            ''                                                       "직위코드",
            A.PAYRA                                                  "직책코드",
            ''                                                       "재직구분",
            ''                                                       "근무장소", 
            A.EMPDATE                                                "입사일",
            A.EMPDATE                                                "승진기준일",
            A.RETDATE                                                "퇴사일",
            ''                                                       "직무코드",   
            ''                                                       "직무명",     
            A.EMPDATE                                                "근무기간시작일",
            A.RETDATE                                                "근무기간종료일",
            SUBSTR(JUMINID,8,1)                                      "성별",
            ''                                                       "겸직여부",
            FUNC_TEL_CHE(A.Otel)                                     "사내번화번호",
            FUNC_TEL_CHE(A.HANDP)                                    "이동전화",
            ''                                                       "집전화",
            ''                                                       "팩스",
            A.SKEMAIL                                                "E-MAIL",
            ''                                                       "외부MAIL",
            ''                                                       "현주소(지역)",
            ''                                                       "현주소(시/군/구)",
            ''                                                       "현주소(읍/면/동)",
            ''                                                       "현주소(상세주소)",
            ''                                                       "현주소우편번호(지역)",
            ''                                                       "ID사용시작일",
            ''                                                       "사진URL",
            ''                                                       "담당업무1",
            ''                                                       "담당업무2",
            ''                                                       "담당업무3",
            ''                                                       "근무주소",
            ''                                                       "근무층수",
            ''                                                       "PDA번호",
            ''                                                       "기타번호",
            ''                                                       "영문소속",
            ''                                                       "영문토탈소속",
            'D'                                                      "구분",
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')                     "전송일자",
            ''                                                       "실제생일",
            ''                                                       "양/음력구분",
            'N', '', 'N', '', 'N', '', 'N', '', 'N', ''              "EAI 1~5"
       FROM PZSUBMAS A, PYCDEPT B, V_HINTDEPT C
      WHERE NVL(RETDATE,'99999999') < TO_CHAR(SYSDATE,'YYYYMMDD') /o2015.04.01.hjku..퇴직일 이후에 전송되도록 수정..NVL(RETDATE,'99999999') <= TO_CHAR(SYSDATE,'YYYYMMDD') o/
        AND EMPNO NOT IN (SELECT PERNR FROM POUKEYMAS WHERE WORKDATE >= '20140301' AND T_FLAG ='D' )
        AND A.ORGNUM   = B.ORGNUM 
        AND A.DEPTCODE = B.DEPTCODE
        AND A.DEPTCODE = C.DEPTCODE(+)
        And A.Empno in (select distinct empno from poskmail where empno like 'U%'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into POUKEYMAS (WORKDATE,PERNR,ENAME,FNAME,CNAME,REGNO,ORGEH,\
MC_STEXT,SOSOK,INDEPT_TSOSOK,JIKGUN,JIKWI,JIKCHAK,STAT1,WPLACE,JOINCOMDD,PRO\
DATE,RETIREDD,JOBCODE,JOBTXT,STARTDATE,CLOSEDATE,GESCH,MOREPOYN,INTELNO,MOVE\
TELNO,TELNR,FAX,EMAIL,EMAIL2,NOWADDRESS1,NOWADDRESS2,NOWADDRESS3,NOWADDRESS4\
,NOWZIPCD,AEDTM,PHOTOURL,TASK1,TASK2,TASK3,WKADDR,WKFLOOR,PDANO,ETCNO,ESOSOK\
,INDEPT_ETSOSOK,T_FLAG,SENDDT,BIRTH,GUBUN,EAI_FLAG,EAI_DATE,EAI_FLAG2,EAI_DA\
TE2,EAI_FLAG3,EAI_DATE3,EAI_FLAG4,EAI_DATE4,EAI_FLAG5,EAI_DATE5)select TO_CH\
AR(SYSDATE,'YYYYMMDD') \"생성일자\" ,A.EMPNO \"사번\" ,A.KNAME \"한글이름\" \
,'' \"영문이름\" ,'' \"한문이름\" ,REPLACE(A.JUMINID,'-','') \"주민번호\" ,(\
Decode(A.DEPTCODE,'','',Substr(A.ORGNUM,(-2)))||A.DEPTCODE) \"부서코드(내부)\
\" ,B.DEPTNAME \"부서명\" ,'' \"소속\" ,C.DEPTFNAME \"토탈소속\" ,'' \"직군코\
드\" ,'' \"직위코드\" ,A.PAYRA \"직책코드\" ,'' \"재직구분\" ,'' \"근무장소\"\
 ,A.EMPDATE \"입사일\" ,A.EMPDATE \"승진기준일\" ,A.RETDATE \"퇴사일\" ,'' \"\
직무코드\" ,'' \"직무명\" ,A.EMPDATE \"근무기간시작일\" ,A.RETDATE \"근무기간\
종료일\"");
     sqlstm.stmt = " ,SUBSTR(JUMINID,8,1) \"성별\" ,'' \"겸직여부\" ,FUNC_T\
EL_CHE(A.Otel) \"사내번화번호\" ,FUNC_TEL_CHE(A.HANDP) \"이동전화\" ,'' \"집\
전화\" ,'' \"팩스\" ,A.SKEMAIL \"E-MAIL\" ,'' \"외부MAIL\" ,'' \"현주소(지역)\
\" ,'' \"현주소(시/군/구)\" ,'' \"현주소(읍/면/동)\" ,'' \"현주소(상세주소)\"\
 ,'' \"현주소우편번호(지역)\" ,'' \"ID사용시작일\" ,'' \"사진URL\" ,'' \"담당\
업무1\" ,'' \"담당업무2\" ,'' \"담당업무3\" ,'' \"근무주소\" ,'' \"근무층수\"\
 ,'' \"PDA번호\" ,'' \"기타번호\" ,'' \"영문소속\" ,'' \"영문토탈소속\" ,'D' \
\"구분\" ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') \"전송일자\" ,'' \"실제생일\" ,\
'' \"양/음력구분\" ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' \"EAI 1~5\"  \
from PZSUBMAS A ,PYCDEPT B ,V_HINTDEPT C where (((((NVL(RETDATE,'99999999')<T\
O_CHAR(SYSDATE,'YYYYMMDD') and EMPNO not  in (select PERNR  from POUKEYMAS wh\
ere (WORKDATE>='20140301' and T_FLAG='D'))) and A.ORGNUM=B.ORGNUM) and A.DEPT\
CODE=B.DEPTCODE) and A.DEPTCODE=C.DEPTCODE(+)) and A.Empno in (select distinc\
t empno  from poskmail where empno like 'U%'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )65;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


       
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into POUKEYMAS 도급인력 퇴사자!! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }
     sprintf(FL_Line, "도급인력 퇴직자 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);


     /*변경자*/         
     sprintf(FL_Line, "도급인력 변경자 입력 시작...");
     hinsa_log_print(0, FL_Line);

     /* EXEC SQL
     INSERT INTO POUKEYMAS(
                           WORKDATE, PERNR, ENAME, FNAME, CNAME, REGNO, ORGEH, MC_STEXT, SOSOK, INDEPT_TSOSOK, 
                           JIKGUN, JIKWI, JIKCHAK, STAT1, WPLACE, JOINCOMDD, PRODATE, RETIREDD, JOBCODE, JOBTXT, 
                           STARTDATE, CLOSEDATE, GESCH, MOREPOYN, INTELNO, MOVETELNO, TELNR, FAX, EMAIL, EMAIL2, 
                           NOWADDRESS1, NOWADDRESS2, NOWADDRESS3, NOWADDRESS4, NOWZIPCD, AEDTM, PHOTOURL, 
                           TASK1, TASK2, TASK3, WKADDR, WKFLOOR, PDANO, ETCNO, ESOSOK, INDEPT_ETSOSOK, T_FLAG, 
                           SENDDT, BIRTH, GUBUN, EAI_FLAG, EAI_DATE, EAI_FLAG2, EAI_DATE2,
                           EAI_FLAG3, EAI_DATE3, EAI_FLAG4, EAI_DATE4, EAI_FLAG5, EAI_DATE5
                          )
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')                              "생성일자",          
            A.EMPNO                                                  "사번", 
            A.KNAME                                                  "한글이름", 
            ''                                                       "영문이름", 
            ''                                                       "한문이름", 
            REPLACE(A.JUMINID, '-', '')                              "주민번호", 
            Decode(A.DEPTCODE,'','',Substr(A.ORGNUM,-2))||A.DEPTCODE "부서코드(내부)", 
            C.DEPTNAME                                               "부서명", 
            ''                                                       "소속", 
            D.DEPTFNAME                                              "토탈소속", 
            ''                                                       "직군코드",
            ''                                                       "직위코드",
            A.PAYRA                                                  "직책코드",
            ''                                                       "재직구분",
            C.Placecode                                              "근무장소", 
            A.EMPDATE                                                "입사일",
            A.EMPDATE                                                "승진기준일",
            A.RETDATE                                                "퇴사일",
            ''                                                       "직무코드",   
            ''                                                       "직무명",     
            A.EMPDATE                                                "근무기간시작일",
            A.RETDATE                                                "근무기간종료일",
            SUBSTR(A.JUMINID,8,1)                                    "성별",
            ''                                                       "겸직여부",
            FUNC_TEL_CHE(A.Otel)                                     "사내번화번호",
            FUNC_TEL_CHE(A.HANDP)                                    "이동전화",
            ''                                                       "집전화",
            ''                                                       "팩스",
            A.SKEMAIL                                                "E-MAIL",
            ''                                                       "외부MAIL",
            ''                                                       "현주소(지역)",
            ''                                                       "현주소(시/군/구)",
            ''                                                       "현주소(읍/면/동)",
            ''                                                       "현주소(상세주소)",
            ''                                                       "현주소우편번호(지역)",
            ''                                                       "ID사용시작일",
            ''                                                       "사진URL",
            ''                                                       "담당업무1",
            ''                                                       "담당업무2",
            ''                                                       "담당업무3",
            ''                                                       "근무주소",
            ''                                                       "근무층수",
            ''                                                       "PDA번호",
            ''                                                       "기타번호",
            ''                                                       "영문소속",
            ''                                                       "영문토탈소속",
            'U'                                                      "구분",
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')                     "전송일자",
            ''                                                       "실제생일",
            ''                                                       "양/음력구분",
            'N', '', 'N', '', 'N', '', 'N', '', 'N', ''              "EAI 1~5"
       FROM PZSUBMAS A, PIMPMAS_HINT B, PYCDEPT C, V_HINTDEPT D
      WHERE B.WORKDATE = TO_CHAR(SYSDATE-1,'YYYYMMDD')  
        AND A.EMPNO    = B.EMPNO
        AND A.ORGNUM   = C.ORGNUM 
        AND A.DEPTCODE = C.DEPTCODE
        AND A.DEPTCODE = D.DEPTCODE(+)
        AND A.Juminid Is Not Null        
        AND EXISTS(SELECT 1 FROM POUKEYMAS WHERE WORKDATE < TO_CHAR(SYSDATE,'YYYYMMDD') AND A.EMPNO = PERNR AND T_FLAG='I')--/o2015.02.09. 신규가 발생하기 전에 변경이 발생하는  오류로 인해 추가..o/        
        AND NOT EXISTS(SELECT 1 FROM POUKEYMAS WHERE T_FLAG='D' AND A.EMPNO = PERNR )--/o2015.02.10. 삭제가 발생한 대상자가 다시 전송되는 오류로 인해 추가..o/
        AND A.EMPNO NOT IN (SELECT TRIM(PERNR) FROM POUKEYMAS
                             WHERE WORKDATE = TO_CHAR(SYSDATE,'YYYYMMDD') AND T_FLAG IN ('I','D'))
        AND (
            NVL(TRIM(A.KNAME),' ')    <> NVL(TRIM(B.KORNAME), ' ')
        OR  A.JUMINID                 <> B.JUMINID   
        OR  A.ORGNUM                  <> B.ORGNUM     /o2014.12.30.hjku. 누락부분 추가o/     
        OR  A.DEPTCODE                <> B.DEPTCODE      
        OR  A.PAYRA                   <> B.PAYRA         
        OR  A.EMPDATE                 <> B.EMPDATE       
        OR  A.RETDATE                 <> B.RETDATE       
        OR  NVL(TRIM(A.OTEL), ' ')    <> NVL(TRIM(B.OFFITEL), ' ') 
        OR  NVL(TRIM(A.HANDP), ' ')   <> NVL(TRIM(B.RETCONT), ' ') 
        OR  NVL(TRIM(A.SKEMAIL), ' ') <> NVL(TRIM(B.SKEMAIL), ' ') )
        And A.Empno in (select distinct empno from poskmail where empno like 'U%'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into POUKEYMAS (WORKDATE,PERNR,ENAME,FNAME,CNAME,REGNO,ORGEH,\
MC_STEXT,SOSOK,INDEPT_TSOSOK,JIKGUN,JIKWI,JIKCHAK,STAT1,WPLACE,JOINCOMDD,PRO\
DATE,RETIREDD,JOBCODE,JOBTXT,STARTDATE,CLOSEDATE,GESCH,MOREPOYN,INTELNO,MOVE\
TELNO,TELNR,FAX,EMAIL,EMAIL2,NOWADDRESS1,NOWADDRESS2,NOWADDRESS3,NOWADDRESS4\
,NOWZIPCD,AEDTM,PHOTOURL,TASK1,TASK2,TASK3,WKADDR,WKFLOOR,PDANO,ETCNO,ESOSOK\
,INDEPT_ETSOSOK,T_FLAG,SENDDT,BIRTH,GUBUN,EAI_FLAG,EAI_DATE,EAI_FLAG2,EAI_DA\
TE2,EAI_FLAG3,EAI_DATE3,EAI_FLAG4,EAI_DATE4,EAI_FLAG5,EAI_DATE5)select TO_CH\
AR(SYSDATE,'YYYYMMDD') \"생성일자\" ,A.EMPNO \"사번\" ,A.KNAME \"한글이름\" \
,'' \"영문이름\" ,'' \"한문이름\" ,REPLACE(A.JUMINID,'-','') \"주민번호\" ,(\
Decode(A.DEPTCODE,'','',Substr(A.ORGNUM,(-2)))||A.DEPTCODE) \"부서코드(내부)\
\" ,C.DEPTNAME \"부서명\" ,'' \"소속\" ,D.DEPTFNAME \"토탈소속\" ,'' \"직군코\
드\" ,'' \"직위코드\" ,A.PAYRA \"직책코드\" ,'' \"재직구분\" ,C.Placecode \"\
근무장소\" ,A.EMPDATE \"입사일\" ,A.EMPDATE \"승진기준일\" ,A.RETDATE \"퇴사\
일\" ,'' \"직무코드\" ,'' \"직무명\" ,A.EMPDATE \"근무기간시작일\" ,A.RETDAT\
E \"근무기");
     sqlbuft((void **)0,
       "간종료일\" ,SUBSTR(A.JUMINID,8,1) \"성별\" ,'' \"겸직여부\" ,FUNC_TE\
L_CHE(A.Otel) \"사내번화번호\" ,FUNC_TEL_CHE(A.HANDP) \"이동전화\" ,'' \"집전\
화\" ,'' \"팩스\" ,A.SKEMAIL \"E-MAIL\" ,'' \"외부MAIL\" ,'' \"현주소(지역)\"\
 ,'' \"현주소(시/군/구)\" ,'' \"현주소(읍/면/동)\" ,'' \"현주소(상세주소)\" \
,'' \"현주소우편번호(지역)\" ,'' \"ID사용시작일\" ,'' \"사진URL\" ,'' \"담당\
업무1\" ,'' \"담당업무2\" ,'' \"담당업무3\" ,'' \"근무주소\" ,'' \"근무층수\"\
 ,'' \"PDA번호\" ,'' \"기타번호\" ,'' \"영문소속\" ,'' \"영문토탈소속\" ,'U'\
 \"구분\" ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') \"전송일자\" ,'' \"실제생일\"\
 ,'' \"양/음력구분\" ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' \"EAI 1~5\"\
  from PZSUBMAS A ,PIMPMAS_HINT B ,PYCDEPT C ,V_HINTDEPT D where ((((((((((B\
.WORKDATE=TO_CHAR((SYSDATE-1),'YYYYMMDD') and A.EMPNO=B.EMPNO) and A.ORGNUM=\
C.ORGNUM) and A.DEPTCODE=C.DEPTCODE) and A.DEPTCODE=D.DEPTCODE(+)) and A.Jum\
inid is  not null ) and exists (select 1  from POUKEYMAS where ((WORKDATE<TO\
_CHAR(SYSDATE,'YYYYMMDD') and A.EMPNO=PERNR) and T_FLAG='I'))) and  not exis\
ts (select 1  from POUK");
     sqlstm.stmt = "EYMAS where (T_FLAG='D' and A.EMPNO=PERNR))) and A.EMPN\
O not  in (select trim(PERNR)  from POUKEYMAS where (WORKDATE=TO_CHAR(SYSDATE\
,'YYYYMMDD') and T_FLAG in ('I','D')))) and (((((((((NVL(trim(A.KNAME),' ')<>\
NVL(trim(B.KORNAME),' ') or A.JUMINID<>B.JUMINID) or A.ORGNUM<>B.ORGNUM) or A\
.DEPTCODE<>B.DEPTCODE) or A.PAYRA<>B.PAYRA) or A.EMPDATE<>B.EMPDATE) or A.RET\
DATE<>B.RETDATE) or NVL(trim(A.OTEL),' ')<>NVL(trim(B.OFFITEL),' ')) or NVL(t\
rim(A.HANDP),' ')<>NVL(trim(B.RETCONT),' ')) or NVL(trim(A.SKEMAIL),' ')<>NVL\
(trim(B.SKEMAIL),' '))) and A.Empno in (select distinct empno  from poskmail \
where empno like 'U%'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )80;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into POUKEYMAS 도급인력 변경자!! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }                         
     sprintf(FL_Line, "도급인력 변경자 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);
     /*======================================================================================
     도급인력 인터페이스 추가에 따른 프로그램 Add End.  dsa2000   2014.03. 
     ======================================================================================*/  
     
         
    /*======================================================================================
     POUKEYDEPT INSERT : 부서정보를 EAI통해 UKEY로 전송.
     ======================================================================================*/   

     /*부서정보(신규/변경/폐쇄)*/
     sprintf(FL_Line, "부서정보 입력시작...");
     hinsa_log_print(0, FL_Line);
     
     /* 2016.07.07.hjku.. 재무부서 수정되어도 전송되도록 수정.. 전지영M 요청.. strart..*/
    /* EXEC SQL     
         Select nvl(Max(Seqno),0)+1 BSeqno
          INTO :BSeqno
          From Pycdept_Hint
         Where Workdate = TO_CHAR(SYSDATE-1,'YYYYMMDD')          ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 1;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select (nvl(max(Seqno),0)+1) BSeqno into :b0  from Pycde\
pt_Hint where Workdate=TO_CHAR((SYSDATE-1),'YYYYMMDD')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )95;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&BSeqno;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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

  

     printf("BSeqno : %d\n", BSeqno);     
 
     /* 부서정보관리 프로그램에서 정상적으로 Insert 안되는 경우를 대비하여 추가함.(특히 조직개편시) dsa2000  2013.03.26.*/
     /* EXEC SQL 
     Insert Into Pycdept_Hint
     (Select TO_CHAR(SYSDATE-1,'YYYYMMDD'),       
             :BSeqno,        
             Orgnum,    Deptcode,  Deptname,  Deptna1,    Deptna2,          
             Deptna3,   Deptabbr,  Existon,   Placecode,  Deptlevel,      
             Sectcode,  Fieldcode, Extcode,   Boncode,    Fincode,        
             Overmode,  Deptfunc,  Chanmode,  Reorgdate,  Chandate,     
             Closedate, Borgnum,   Bdeptcode1,Bdeptcode2, Bdeptcode3,
             Writetime, Writeemp,  Technique, Detailstech,Deptorder, Bonbucode, 
             'A', 
             TribeGB    /o2018.11  신구조직구분필드 추가o/
       From Pycdept A           
      Where (Orgnum, Deptcode) Not In (Select Orgnum, Deptcode From Pycdept_Hint)
        And Orgnum >= 'H18' ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into Pycdept_Hint  (select TO_CHAR((SYSDATE-1),'\
YYYYMMDD') ,:b0 ,Orgnum ,Deptcode ,Deptname ,Deptna1 ,Deptna2 ,Deptna3 ,Depta\
bbr ,Existon ,Placecode ,Deptlevel ,Sectcode ,Fieldcode ,Extcode ,Boncode ,Fi\
ncode ,Overmode ,Deptfunc ,Chanmode ,Reorgdate ,Chandate ,Closedate ,Borgnum \
,Bdeptcode1 ,Bdeptcode2 ,Bdeptcode3 ,Writetime ,Writeemp ,Technique ,Detailst\
ech ,Deptorder ,Bonbucode ,'A' ,TribeGB  from Pycdept A where ((Orgnum,Deptco\
de) not  in (select Orgnum ,Deptcode  from Pycdept_Hint ) and Orgnum>='H18'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )114;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&BSeqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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
          sprintf(FL_Line, "Oracle 에러1/insert into Pycdept_Hint 부서정보 !! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }/* dsa2000  2013.03.26.====================================================================*/

     /* EXEC SQL 
     Insert Into Pycdept_Hint
     (Select TO_CHAR(SYSDATE-1,'YYYYMMDD'),       
             :BSeqno,        
             Orgnum,    Deptcode,  Deptname,  Deptna1,    Deptna2,          
             Deptna3,   Deptabbr,  Existon,   Placecode,  Deptlevel,      
             Sectcode,  Fieldcode, Extcode,   Boncode,    Fincode,        
             Overmode,  Deptfunc,  Chanmode,  Reorgdate,  Chandate,     
             Closedate, Borgnum,   Bdeptcode1,Bdeptcode2, Bdeptcode3,
             Writetime, Writeemp,  Technique, Detailstech,Deptorder, Bonbucode, 
             decode(chanmode,3,'D','C') flag, 
             TribeGB    /o2018.11  신구조직구분필드 추가o/
       From Pycdept A            
       where orgnum = (select value1 from pimvari where  gubun='00' and sgubun='0001')
         and not exists(select 1 from pycdept_hint  where workdate = to_char(sysdate-1,'YYYYMMDD') and seqno = :BSeqno and a.orgnum = orgnum and a.deptcode = deptcode)
         and writetime like to_char(sysdate-1,'YYYYMMDD')||'%'  
         )         ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into Pycdept_Hint  (select TO_CHAR((SYSDATE-1),'\
YYYYMMDD') ,:b0 ,Orgnum ,Deptcode ,Deptname ,Deptna1 ,Deptna2 ,Deptna3 ,Depta\
bbr ,Existon ,Placecode ,Deptlevel ,Sectcode ,Fieldcode ,Extcode ,Boncode ,Fi\
ncode ,Overmode ,Deptfunc ,Chanmode ,Reorgdate ,Chandate ,Closedate ,Borgnum \
,Bdeptcode1 ,Bdeptcode2 ,Bdeptcode3 ,Writetime ,Writeemp ,Technique ,Detailst\
ech ,Deptorder ,Bonbucode ,decode(chanmode,3,'D','C') flag ,TribeGB  from Pyc\
dept A where ((orgnum=(select value1  from pimvari where (gubun='00' and sgub\
un='0001')) and  not exists (select 1  from pycdept_hint where (((workdate=to\
_char((sysdate-1),'YYYYMMDD') and seqno=:b0) and a.orgnum=orgnum) and a.deptc\
ode=deptcode))) and writetime like (to_char((sysdate-1),'YYYYMMDD')||'%')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )133;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&BSeqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&BSeqno;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
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


         
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러2/insert into Pycdept_Hint 부서정보 !! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }  
    /* 2016.07.07.hjku.. 재무부서 수정되어도 전송되도록 수정.. 전지영M 요청..end..*/    
     
         
     /* EXEC SQL
     INSERT INTO POUKEYDEPT (
                            WORKDATE, INDEPT, BEGDA, ENDDA, KEYDATE, OUTDEPT, DEPTNM, 
                            SOSOK, INDEPT_TSOSOK, OLEVEL, DEPTREDUCNM, HIGHDEPT, LOWYN, CHIEF, 
                            GSBER, MPRS, DEPTENGNM, ESOSOK, EINDEPT_TSOSOK, T_FLAG, SENDDT, 
                            BF_INDEPTCD, FIN_CD, EAI_FLAG, EAI_DATE, EAI_FLAG2, EAI_DATE2,
                            EAI_FLAG3, EAI_DATE3, EAI_FLAG4, EAI_DATE4, EAI_FLAG5, EAI_DATE5
                            )
     SELECT TO_CHAR(SYSDATE,'YYYYMMDD')                                               "자료생성일", 
            Decode(A.DEPTCODE,'','',Substr(A.ORGNUM,-2))||A.DEPTCODE                  "부서코드", 
            A.REORGDATE                                                               "부서생성일", 
            DECODE(REPLACE(A.CLOSEDATE, ' '), '', '99991231', A.CLOSEDATE)            "부서폐기일", 
            ''                                                                        "유효일자", 
            ''                                                                        "부서코드(외부)", 
            SUBSTRB(A.DEPTNAME,1,40)                                                  "부서명", 
            ''                                                                        "소속", 
            SUBSTRB(C.DEPTNAME,1,200)                                                 "토탈소속", 
            /oDECODE(A.DEPTLEVEL, '40','2', 'A0','4', 'B0','4', 'C0','5', 'D0','7', 'E0','7', '') "레벨코드", o/
            DECODE(A.DEPTLEVEL, '20','1','40','2','60','3','A0','4','B0','4','C0','5','D0','7','E0','7','') "레벨코드OLEVEL", /o2018.12.10 --20,60 추가o/
            SUBSTRB(A.DEPTABBR,1,12)                                                  "부서약명", 
            Decode(A.EXTCODE,'','',Substr(A.ORGNUM,-2))||A.EXTCODE                    "상위부서", 
            ''                                                                        "하위부서", 
            D.EEMPNO                                                                  "부서장사번", 
            CASE      WHEN A.PLACECODE = '2C' THEN  '1' 
            ELSE CASE WHEN A.DEPTCODE LIKE 'CG%00' THEN '3'
            ELSE CASE WHEN A.DEPTCODE LIKE 'IG%00' THEN '5' ELSE '' END END END       "사업장", 
            ''                                                                        "인사조직분류코드", 
            ''                                                                        "부서영문명", 
            ''                                                                        "영문소속", 
            ''                                                                        "영문토탈소속",
            DECODE(B.FLAG, 'A', 'I', 'C', 'U', 'D', 'D')                              "구분",  
            TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')                                      "전송일자", 
            Decode(A.BDEPTCODE1,'','',Substr(A.BORGNUM,-2))||A.BDEPTCODE1             "이전부서코드", 
            Decode(A.FINCODE,'','',Substr(A.FINCODE,-5))                              "재무코드",
            'N', '', 'N', '', 'N', '', 'N', '', 'N', ''                               "EAI 1~5"
       FROM PYCDEPT      A,             
            ( SELECT DISTINCT ORGNUM, DEPTCODE, FLAG
                FROM PYCDEPT_HINT B    /oPYCDEPT_HINT B, 부서코드관리 프로그램에서 저장(PYCDEPT_HINT).o/
               WHERE ORGNUM     = (SELECT VALUE1 FROM PIMVARI WHERE GUBUN='00' AND SGUBUN='0001')  
                 AND B.WORKDATE >= TO_CHAR(SYSDATE-1,'YYYYMMDD') 
            ) B,            
            V_HINTDEPT   C, 
           (SELECT DISTINCT EEMPNO, ORGNUM, JOBDEPT 
              FROM PIMEEMP 
             WHERE EJOBPAYRA <> 'C51' 
               AND DECODE(EJOBDEPT,'YKKK0','Y',EJOBPAYRAYN) ='Y') D  
      WHERE A.ORGNUM    = (SELECT VALUE1 FROM PIMVARI WHERE GUBUN='00' AND SGUBUN='0001') 
        --AND B.WORKDATE >= TO_CHAR(SYSDATE-1,'YYYYMMDD') 
        AND A.ORGNUM    = B.ORGNUM 
        AND A.DEPTCODE  = B.DEPTCODE 
        AND A.DEPTCODE  = C.DEPTCODE(+)    
        AND A.ORGNUM    = D.ORGNUM(+) 
        AND A.DEPTCODE  = D.JOBDEPT(+); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into POUKEYDEPT (WORKDATE,INDEPT,BEGDA,ENDDA,KEYDATE,OUTDEPT,\
DEPTNM,SOSOK,INDEPT_TSOSOK,OLEVEL,DEPTREDUCNM,HIGHDEPT,LOWYN,CHIEF,GSBER,MPR\
S,DEPTENGNM,ESOSOK,EINDEPT_TSOSOK,T_FLAG,SENDDT,BF_INDEPTCD,FIN_CD,EAI_FLAG,\
EAI_DATE,EAI_FLAG2,EAI_DATE2,EAI_FLAG3,EAI_DATE3,EAI_FLAG4,EAI_DATE4,EAI_FLA\
G5,EAI_DATE5)select TO_CHAR(SYSDATE,'YYYYMMDD') \"자료생성일\" ,(Decode(A.DE\
PTCODE,'','',Substr(A.ORGNUM,(-2)))||A.DEPTCODE) \"부서코드\" ,A.REORGDATE \"\
부서생성일\" ,DECODE(REPLACE(A.CLOSEDATE,' '),'','99991231',A.CLOSEDATE) \"부\
서폐기일\" ,'' \"유효일자\" ,'' \"부서코드(외부)\" ,SUBSTRB(A.DEPTNAME,1,40)\
 \"부서명\" ,'' \"소속\" ,SUBSTRB(C.DEPTNAME,1,200) \"토탈소속\" ,DECODE(A.D\
EPTLEVEL,'20','1','40','2','60','3','A0','4','B0','4','C0','5','D0','7','E0'\
,'7','') \"레벨코드OLEVEL\" ,SUBSTRB(A.DEPTABBR,1,12) \"부서약명\" ,(Decode(\
A.EXTCODE,'','',Substr(A.ORGNUM,(-2)))||A.EXTCODE) \"상위부서\" ,'' \"하위부\
서\" ,D.EEMPNO \"부서장사번\" , case  when A.PLACECODE='2C' then '1' else  c\
ase  when A.DEPTCODE like 'CG%00' then '3' else  case  when A.DEPTCODE");
     sqlstm.stmt = " like 'IG%00' then '5' else ''  end   end   end  \"사업\
장\" ,'' \"인사조직분류코드\" ,'' \"부서영문명\" ,'' \"영문소속\" ,'' \"영문\
토탈소속\" ,DECODE(B.FLAG,'A','I','C','U','D','D') \"구분\" ,TO_CHAR(SYSDATE,\
'YYYYMMDDHH24MISS') \"전송일자\" ,(Decode(A.BDEPTCODE1,'','',Substr(A.BORGNUM\
,(-2)))||A.BDEPTCODE1) \"이전부서코드\" ,Decode(A.FINCODE,'','',Substr(A.FINC\
ODE,(-5))) \"재무코드\" ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' ,'N' ,'' \"EAI 1~\
5\"  from PYCDEPT A ,(select distinct ORGNUM ,DEPTCODE ,FLAG  from PYCDEPT_HI\
NT B where (ORGNUM=(select VALUE1  from PIMVARI where (GUBUN='00' and SGUBUN=\
'0001')) and B.WORKDATE>=TO_CHAR((SYSDATE-1),'YYYYMMDD'))) B ,V_HINTDEPT C ,(\
select distinct EEMPNO ,ORGNUM ,JOBDEPT  from PIMEEMP where (EJOBPAYRA<>'C51'\
 and DECODE(EJOBDEPT,'YKKK0','Y',EJOBPAYRAYN)='Y')) D where (((((A.ORGNUM=(se\
lect VALUE1  from PIMVARI where (GUBUN='00' and SGUBUN='0001')) and A.ORGNUM=\
B.ORGNUM) and A.DEPTCODE=B.DEPTCODE) and A.DEPTCODE=C.DEPTCODE(+)) and A.ORGN\
UM=D.ORGNUM(+)) and A.DEPTCODE=D.JOBDEPT(+))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )156;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
                           
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러/insert into POUKEYDEPT 부서정보 !! : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
     }                
     sprintf(FL_Line, "부서정보 건수 : %d", SQL_PROCESS_COUNT);
     hinsa_log_print(0, FL_Line);


/*2017.05.15.SWING 오픈 관련 미전송 자료 재전송 추가..Start
*/     
	if (strcmp(FGP_inter_ctrl->v_dt_create.arr,"20170515") == 0) {      /*2017.05.15 만 동작*/

     sprintf(FL_Line, "5/12~5/15 자료 재전송 반영...[%s]",FGP_inter_ctrl->v_dt_create.arr);
     hinsa_log_print(0, FL_Line);
     
     /* EXEC SQL
          UPDATE POUKEYMAS A
          SET
           EAI_FLAG   ='N', EAI_DATE   =''
          WHERE WORKDATE BETWEEN '20170512' AND '20170514'
          ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update POUKEYMAS A  set EAI_FLAG='N',EAI_DATE='' where \
WORKDATE between '20170512' and '20170514'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )171;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
          
     /* EXEC SQL
          UPDATE POUKEYDEPT A
          SET
           EAI_FLAG   ='N', EAI_DATE   =''
          WHERE WORKDATE BETWEEN '20170512' AND '20170514'
          ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 2;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update POUKEYDEPT A  set EAI_FLAG='N',EAI_DATE='' where\
 WORKDATE between '20170512' and '20170514'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )186;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

              	
	}     
     
/*2017.05.15.SWING 오픈 관련 미전송 자료 재전송 추가..End
*/      

     hinsa_exit(0,"UKEY 인사/부서 정보 인터페이스(poukey_eai) 프로그램 정상 처리...");  
}  