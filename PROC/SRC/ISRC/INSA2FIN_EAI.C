
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
           char  filnam[16];
};
static struct sqlcxp sqlfpn =
{
    15,
    "insa2fin_eai.pc"
};


static unsigned int sqlctx = 2434131;


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
   unsigned char  *sqhstv[20];
   unsigned long  sqhstl[20];
            int   sqhsts[20];
            short *sqindv[20];
            int   sqinds[20];
   unsigned long  sqharm[20];
   unsigned long  *sqharc[20];
   unsigned short  sqadto[20];
   unsigned short  sqtdso[20];
} sqlstm = {12,20};

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

 static char *sq0015 = 
"select A.empno ,A.korname ,A.orgnum ,A.jobdept  from pimpmas A ,(select org\
num ,jobdept  from pimpmas where (pstate<'60' and jobpayrayn='Y') group by or\
gnum,jobdept having count(empno)>1) B where (A.orgnum=B.orgnum and A.jobdept=\
B.jobdept)           ";

 static char *sq0021 = 
"') and anfrdate>'2009') minus select\
 empno ,orgnum ,(replace(addeptcode,'0','')||'%') addeptcode  from pihanno B \
where ((anupdyn='Y' and ancode='248') and anfrdate>'2009')) Q ,(select empno \
,orgnum ,addeptcode  from pihanno where ((anupdyn='Y' and ancode='243') and a\
nfrdate>'2009') minus select empno ,orgnum ,addeptcode  from pihanno B where \
((anupdyn='Y' and ancode='248') and anfrdate>'2009')) Q1 where ((((((((A.empn\
o=B.empno(+) and A.orgnum=C.orgnum) and A.jobdept=C.deptcode) and A.orgnum=Q.\
orgnum(+)) and A.jobdept like Q.addeptcode(+)) and A.empno=Q1.empno(+)) and A\
.orgnum=A1.orgnum(+)) and A.jobdept=A1.jobdept(+)) and D.codeno=A.jobpayra) o\
rder by C.fincode,A.empno            ";

 static char *sq0041 = 
"select A.empcode  from EAI_PIMPMAS_TEMP A where (((c_date=:b0 and seqno=:b1\
) and h_year=substr(:b0,1,4)) and h_month=substr(:b0,5,2))           ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,33,0,4,184,0,0,1,0,0,1,0,2,9,0,0,
24,0,0,2,0,0,32,189,0,0,0,0,0,1,0,
39,0,0,3,0,0,32,196,0,0,0,0,0,1,0,
54,0,0,4,0,0,32,203,0,0,0,0,0,1,0,
69,0,0,5,0,0,32,210,0,0,0,0,0,1,0,
84,0,0,6,0,0,32,219,0,0,0,0,0,1,0,
99,0,0,7,0,0,32,223,0,0,0,0,0,1,0,
114,0,0,8,0,0,32,231,0,0,0,0,0,1,0,
129,0,0,9,109,0,4,255,0,0,3,2,0,1,0,2,3,0,0,1,9,0,0,1,9,0,0,
156,0,0,10,26,0,2,286,0,0,0,0,0,1,0,
171,0,0,11,165,0,3,324,0,0,8,8,0,1,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,1,
9,0,0,1,9,0,0,1,9,0,0,
218,0,0,12,149,0,5,348,0,0,5,5,0,1,0,1,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,
253,0,0,13,116,0,5,362,0,0,4,4,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,
284,0,0,14,40,0,4,390,0,0,1,0,0,1,0,2,9,0,0,
303,0,0,15,250,0,9,438,0,0,0,0,0,1,0,
318,0,0,15,0,0,13,452,0,0,4,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
349,0,0,15,0,0,15,464,0,0,0,0,0,1,0,
364,0,0,15,0,0,15,476,0,0,0,0,0,1,0,
379,0,0,16,188,0,4,517,0,0,6,2,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,1,97,0,0,
1,97,0,0,
418,0,0,17,521,0,4,550,0,0,9,6,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,1,97,0,0,1,97,0,0,
1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
469,0,0,18,198,0,4,601,0,0,5,2,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,1,97,0,0,1,9,0,0,
504,0,0,19,98,0,4,640,0,0,4,2,0,1,0,2,9,0,0,2,9,0,0,1,97,0,0,1,97,0,0,
535,0,0,20,109,0,4,668,0,0,3,2,0,1,0,2,9,0,0,1,9,0,0,1,9,0,0,
562,0,0,21,1713,0,9,780,0,0,0,0,0,1,0,
577,0,0,21,0,0,13,794,0,0,19,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,
9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
668,0,0,21,0,0,15,822,0,0,0,0,0,1,0,
683,0,0,21,0,0,15,869,0,0,0,0,0,1,0,
698,0,0,22,306,0,3,899,0,0,20,20,0,1,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,
1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
793,0,0,21,0,0,15,964,0,0,0,0,0,1,0,
808,0,0,23,1672,0,3,969,0,0,4,4,0,1,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,
839,0,0,24,119,0,4,1074,0,0,3,2,0,1,0,2,3,0,0,1,9,0,0,1,9,0,0,
866,0,0,25,1440,0,3,1087,0,0,2,2,0,1,0,1,3,0,0,1,9,0,0,
889,0,0,26,168,0,4,1196,0,0,5,4,0,1,0,2,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,
924,0,0,27,1543,0,3,1214,0,0,2,2,0,1,0,1,3,0,0,1,3,0,0,
947,0,0,28,185,0,5,1317,0,0,4,4,0,1,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,
978,0,0,29,552,0,5,1335,0,0,8,8,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,
1,9,0,0,1,9,0,0,1,3,0,0,
1025,0,0,30,59,0,4,1361,0,0,1,0,0,1,0,2,97,0,0,
1044,0,0,31,235,0,4,1364,0,0,7,6,0,1,0,2,3,0,0,1,97,0,0,1,9,0,0,1,9,0,0,1,3,0,
0,1,9,0,0,1,9,0,0,
1087,0,0,32,228,0,5,1376,0,0,6,6,0,1,0,1,97,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,
0,1,9,0,0,
1126,0,0,33,236,0,4,1390,0,0,7,6,0,1,0,2,3,0,0,1,97,0,0,1,9,0,0,1,9,0,0,1,3,0,
0,1,9,0,0,1,9,0,0,
1169,0,0,34,229,0,5,1401,0,0,6,6,0,1,0,1,97,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,
0,1,9,0,0,
1208,0,0,35,576,0,4,1416,0,0,13,12,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,
1275,0,0,36,568,0,5,1439,0,0,12,12,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,
1338,0,0,37,237,0,4,1468,0,0,7,6,0,1,0,2,3,0,0,1,97,0,0,1,9,0,0,1,9,0,0,1,3,0,
0,1,9,0,0,1,9,0,0,
1381,0,0,38,230,0,5,1480,0,0,6,6,0,1,0,1,97,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,
0,1,9,0,0,
1420,0,0,39,458,0,4,1501,0,0,12,11,0,1,0,2,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
1483,0,0,40,505,0,5,1523,0,0,11,11,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
1542,0,0,41,144,0,9,1558,0,0,4,4,0,1,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,
1573,0,0,41,0,0,13,1570,0,0,1,0,0,1,0,2,9,0,0,
1592,0,0,42,697,0,4,1576,0,0,2,1,0,1,0,2,3,0,0,1,9,0,0,
1615,0,0,43,855,0,5,1606,0,0,6,6,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,
1,9,0,0,
1654,0,0,44,641,0,5,1654,0,0,6,6,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,
1,9,0,0,
1693,0,0,41,0,0,15,1693,0,0,0,0,0,1,0,
1708,0,0,45,831,0,5,1696,0,0,0,0,0,1,0,
1723,0,0,46,1010,0,3,1724,0,0,4,4,0,1,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : 사원정보(직상위자포함) SAP전송 insa2fin_eai.pc
     PROGRM-Decription : 인사테이블을 읽어서 ERP쪽 Interface 테이블에 추가 매일 1회 cron 실행
     Version           : 1.00
     Date              : 2003.03.31 
     Update Contents
     Version      date(yy.mm.dd)     programmer      description            relevant doc.n
       1.00       2003.03.31         전철호          최초작성
     Comments
       1) 재무부서코드가 없을 경우 인사팀의 부서코드가 들어가기때문에 인사팀의 부서코드가 변경 되면 반드시   2005.01.17 정규용
          cur_02의 부서코드를 반드시 변경한다.
       2) FL_dept.v_empno 을 FL_dept.v_empno.arr로 변경하여 coredump에러 처리함                              2003.11.18 이민용
       3) 처리과정 7) 실근무지부서[EK140] <> 소속부서[QI100] 경우 직상위자 사번를 실근무지부서 상위자로 한다.2003.12.01 이민용
          처리과정 7) deptcode를 jobdept로 수정  
       4) 비정상적인 사원 추출에서  maxseqno 오류수정                                                        2004.01.07 정규용
       5) 비서팀장 결자재가 사장님에서 경영지원실장으로 변경                                                 2005.01.17 정규용 
       6) 로그량을 줄이기 위해 정상적으로 수행된 sprintf()부분은 막음                                        2005.02.17 강륜종
       7) HINT조직도 관리를 위한 PIMPMAS/PYCDEPT 매일 백업                                                   2007.02.22 서혜미 
       *) HR 인프라 고도화 Project(직위-> 직책, 직급 -> BAND(비공개))                                        2008.08.14 jissi
       2.00       2014.03.05.        강륜종dsa2000   도급인력 신규 생성으로 인하여 프로그램 수정.
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

#define   EMPNO       4
#define   YYMMDD      8
#define   YYMM        6
#define   STATE       1
#define   KORNAME     12
#define   ORGNUM      3
#define   DEPTCODE    6
#define   JUMINID     13
#define   TELNO       15
#define   CODENAME    20
#define   CURADDR     50
#define   ZIPNO       7
#define   PAYACNT     20
#define   PAYBANK     3
#define   REFER       12
#define   TRUE_RET 25600

/* EXEC SQL INCLUDE sqlca.h; */

/* EXEC SQL BEGIN DECLARE SECTION; */ 

    /* 인터페이스 콘트롤 테이블 변수들 */
    typedef struct HINSA_ctrl_inter {
            /* varchar  v_dt_create  [YYMMDD   + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } v_dt_create;
  /* 생성일자 */
            /* varchar  v_cd_data    [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_cd_data;
  /* Employee Data Code -> AP03 */
            /* varchar  v_ym_acct    [YYMM     + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_ym_acct;
  /* 회계년월 */
            /* varchar  v_ph_proc    [STATE    + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } v_ph_proc;
  /* 처리 단계 */
            /* varchar  v_st_proc    [STATE    + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } v_st_proc;
  /* 처리 상태 ( P, N, A) */
            /* varchar  v_cl_data_use[STATE    + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } v_cl_data_use;
  /* Data 활용 구분 */
            /* varchar  v_id_crt_user[EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_id_crt_user;
  /* 생성 User ID */
            int      v_no_crt_srl;                 /* 생성 일련번호 */
            int      v_cnt_line;                   /* 라인 건수 */
    } ts_ctrl_inter;
  
    /* 인터페이스 Employee 테이블 변수들 */
    typedef struct HINSA_empployee_inter {
            /* varchar  v_rst_valid[STATE    + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } v_rst_valid;

            /* varchar  v_empno    [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_empno;
    /* 사원번호 */
            /* varchar  v_korname  [KORNAME  + 1]; */ 
struct { unsigned short len; unsigned char arr[13]; } v_korname;
    /* 성명 */
            /* varchar  v_orgnum   [ORGNUM   + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_orgnum;
    /* 조직차수 */
            /* varchar  v_deptcode [DEPTCODE + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_deptcode;
    /* 실근무부서코드 */
            /* varchar  v_juminid  [JUMINID  + 1]; */ 
struct { unsigned short len; unsigned char arr[14]; } v_juminid;
    /* 주민번호 */
            /* varchar  v_fincode  [DEPTCODE + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_fincode;
    /* 재무부서 */
            /* varchar  v_empdate  [YYMMDD   + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } v_empdate;
    /* 입사일자 */
            /* varchar  v_retdate  [YYMMDD   + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } v_retdate;
    /* 퇴사일자 */
            /* varchar  v_telno    [TELNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[16]; } v_telno;
    /* 전화번호 */
            /* varchar  v_payra    [ORGNUM   + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_payra;
    /* 직책코드 */
            /* varchar  v_clname   [CODENAME + 1]; */ 
struct { unsigned short len; unsigned char arr[21]; } v_clname;
    /* BAND명 */
            /* varchar  v_raname   [CODENAME + 1]; */ 
struct { unsigned short len; unsigned char arr[21]; } v_raname;
    /* 직책명 */
            /* varchar  v_payrayn  [STATE    + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } v_payrayn;
    /* 보임여부 */
            /* varchar  v_curaddr  [CURADDR  + 1]; */ 
struct { unsigned short len; unsigned char arr[51]; } v_curaddr;
    /* 주소 */
            /* varchar  v_zipno    [ZIPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[8]; } v_zipno;
    /* 우편번호 */
            /* varchar  v_payacnt  [PAYACNT  + 1]; */ 
struct { unsigned short len; unsigned char arr[21]; } v_payacnt;
    /* 급여계좌번호 */
            /* varchar  v_paybank  [PAYBANK  + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_paybank;
    /* 급여계좌은행코드 */
            /* varchar  v_refer    [REFER    + 1]; */ 
struct { unsigned short len; unsigned char arr[13]; } v_refer;
    /* 직무 */
            /* varchar  v_sempno   [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_sempno;
    /* 직상위자 */
    } ts_employee_inter;

    /* 겸직자 체크시 사용하는 테이블 변수들 */
            /* varchar v_empno_ [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_empno_;
    /* 사원번호 */
            int     v_count;
    /* 겸직자 체크시 사용하는 테이블 변수들 */
    typedef struct HINSA_dept_inter {
            /* varchar  v_empno  [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_empno;
    /* 겸직자 사번 */
            /* varchar  v_korname[KORNAME  + 1]; */ 
struct { unsigned short len; unsigned char arr[13]; } v_korname;
    /* 겸직자 사   */
            /* varchar  v_orgnum [ORGNUM   + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_orgnum;
    /* 조직차수    */
            /* varchar  v_jobdept[DEPTCODE + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_jobdept;
    /* 겸직부서    */
    } ts_dept_inter;
  
    /* 겸직자 체크시 사용하는 테이블 변수들 */
    typedef struct HINSA_dept_inter1 {
            /* varchar  v_empno  [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_empno;
    /* 겸직자 사번 */
            /* varchar  v_korname[KORNAME  + 1]; */ 
struct { unsigned short len; unsigned char arr[13]; } v_korname;
    /* 겸직자 사   */
            /* varchar  v_orgnum [ORGNUM   + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_orgnum;
    /* 조직차수    */
            /* varchar  v_jobdept[DEPTCODE + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_jobdept;
    /* 겸직부서    */
    } ts_dept_inter1;  
   
    /* varchar  v_presempno     [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_presempno;
    /* 사장 사번 */
    /* varchar  v_temp_orgnum   [ORGNUM   + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_temp_orgnum;
    /* 조직차수  */
    /* varchar  v_temp_deptcode [DEPTCODE + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_temp_deptcode;
    /* 부서코드  */
    /* varchar  v_imsi_deptcode [DEPTCODE + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } v_imsi_deptcode;
    /* 부서코드  */
    /* varchar  v_temp_sempno   [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_temp_sempno;
    /* 직상위자 추룰을 하기위한 임시 변수 */
    /* varchar  v_temp_ssempno  [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_temp_ssempno;
    /* 2015.11.06.hjku..결재특이자 임시 변수 */    
    /* varchar  v_empno         [EMPNO    + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } v_empno;
    /* 사원번호 */
    /* varchar  v_payra         [ORGNUM   + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } v_payra;
    /* payra */
    int      v_seqno;                           /* 생성 일련번호(월) */
    int      v_seqln;                           /* 생성 일련번호(횟수) */
  
/* EXEC SQL END DECLARE SECTION; */ 


int PL_get_chairman(void);
int PL_ctrl_control(void);
int PL_delete_erp(void);
int PL_write_ctrl_control(int amod);
int PL_double_jobdept_check(void);
int PL_write_erp(void);
int PL_get_sempno(char *aorgnum, char *adeptcode, char *asempno);


static ts_employee_inter FG_inter_emp;
static ts_ctrl_inter     FG_inter_ctrl;

static ts_employee_inter *FGP_inter_emp;
static ts_ctrl_inter     *FGP_inter_ctrl;

static int  FG_loopcnt;

int main(void)
{
     char *FL_date;
     char FL_dir[255];
     char FL_Line[255];
     char FL_file[255];
     int  ret;
   
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */  
     STRINIT(&FL_file);
     STRINIT(&FL_Line);
     strcpy(FL_file,"insa2fin_eai");
   
     hinsa_get_filename(1, FL_file);
     if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
     }
     
     /* 64bit 실행 가능하기 위해 각 변수 앞에 & 를 붙혀줌 */
     memset(&FG_inter_emp,  0x00, sizeof(ts_employee_inter));
     memset(&FG_inter_ctrl, 0x00, sizeof(ts_ctrl_inter));
   
     FGP_inter_emp  = &FG_inter_emp;
     FGP_inter_ctrl = &FG_inter_ctrl;
     FGP_inter_ctrl->v_cnt_line = 0;
   
     /* 생성일자, 회계년월을 등록한다.. */ 
     FL_date = hinsa_sys_date(1);     
     
     STR2VCTRIM(FGP_inter_ctrl->v_dt_create,FL_date,YYMMDD);
     
     FL_date = hinsa_sys_date(2); /* k.j. **1.임시 작업할 경우 반드시 주석처리 할 것 */
     
     STR2VCTRIM(FGP_inter_ctrl->v_ym_acct,FL_date,YYMM);
   
     hinsa_log_print(0,"재무인터페이스(insa2fin_eai) 프로그램 시작...");
   
     hinsa_db_connect();
   
     STRINIT(&v_payra); 
     
     /* EXEC SQL 
     SELECT 'C15' INTO :v_payra  FROM dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select 'C15' into :b0  from dual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_payra;
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

  //'C15' 팀장직대.
   
     if (PL_get_chairman()  == FAILURE)
     {
          /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 1;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )24;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"PL_get_chairman Function 에러로 종료...");
          return 1;
     }
   
     if (PL_ctrl_control() == FAILURE)
     {
         /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 1;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )39;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         hinsa_exit(0,"PL_ctrl_control Function 에러로 종료...");
         return 1;
     }
   
     if (PL_delete_erp() == FAILURE)
     {
         /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 1;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )54;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         hinsa_exit(0,"PL_delete_erp Function 에러로 종료...");
         return 1;
     }
   
     if (PL_write_ctrl_control(0) == FAILURE)
     {
         /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 1;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )69;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


         hinsa_exit(0,"PL_write_ctrl_control Function 에러로 종료0...");
         return 1;
     }
   
     if (PL_write_erp() == FAILURE)
     {
          if (PL_write_ctrl_control(2) == FAILURE)
          {
               /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 1;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )84;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"PL_write_ctrl_control Function 에러로 종료1...");
               return 1;
          }
          /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 1;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )99;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"PL_write_ctrl_control Function 에러로 종료2...");
          return 1;
     }
     else
     {
          if (PL_write_ctrl_control(1) == FAILURE)
          {
               /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 1;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )114;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"PL_write_ctrl_control Function 에러로 종료3...");
               return 1;
          }
     }        
     hinsa_exit(0,"재무인터페이스(insa2fin_eai) 프로그램 정상 처리...");
}        

/*==================================================================================================
   현재 날짜의 생성일련번호를 가져온다...
==================================================================================================*/
int PL_ctrl_control(void)
{
     char FL_Line[255];
   
     STRINIT(&FL_Line);
     FGP_inter_ctrl->v_no_crt_srl = 0;
   
     STR2VCTRIM(FGP_inter_ctrl->v_cd_data,"AP03",EMPNO);
   
     sprintf(FL_Line, "나. PL_ctrl_control, 바인딩값(v_cd_data, v_dt_create) : %s, %s",
             FGP_inter_ctrl->v_cd_data.arr, FGP_inter_ctrl->v_dt_create.arr);
     hinsa_log_print(0, FL_Line);
   
     /* EXEC SQL 
     SELECT MAX(no_crt_srl)
       INTO :FGP_inter_ctrl->v_no_crt_srl
       FROM INSA_HIT_CTRL
      WHERE cd_data   = :FGP_inter_ctrl->v_cd_data
        AND dt_create = TO_DATE(:FGP_inter_ctrl->v_dt_create, 'YYYYMMDD'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select max(no_crt_srl) into :b0  from INSA_HIT_CTRL whe\
re (cd_data=:b1 and dt_create=TO_DATE(:b2,'YYYYMMDD'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )129;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_no_crt_srl);
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_cd_data);
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
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


   
     if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     STRINIT(&FL_Line);
     FGP_inter_ctrl->v_no_crt_srl++;
     sprintf(FL_Line, "나. PL_ctrl_control, 생성일련번호(v_no_crt_srl) : %d",FGP_inter_ctrl->v_no_crt_srl);
     hinsa_log_print(0, FL_Line);
   
     return (SUCCESS);
}

/*==================================================================================================
   erp_hap_ap04 Table을 삭제한다...
==================================================================================================*/
int PL_delete_erp(void)
{
     char FL_Line[255];
   
     STRINIT(&FL_Line);
   
     /* EXEC SQL 
     DELETE  FROM erp_hap_ap04; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from erp_hap_ap04 ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )156;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
     
     hinsa_log_print(0, "다. PL_delete_erp, erp_hap_ap04 테이블 삭제완료...");
   
     if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     return (SUCCESS);
}

/*==================================================================================================
   INSA_HIT_CTRL Table에 Inert, Update 한다...
   프로그램을 한번 실행할 때 마다 no_crt_srl을 1씩 증가하여 테이블에 추가하며
   st_proc에 실행을 의미하는 'P' 구분자를 넣고
   프로그램 실행 도중 에러가 난 경우는 st_proc 필드에 비정상 종료 구분자 'A'를 넣고 정상종료시에는 'N'을 넣는다.
==================================================================================================*/
int PL_write_ctrl_control(int amod)
{
     char FL_Line[255];
   
     STRINIT(&FL_Line);
     STR2VCTRIM(FGP_inter_ctrl->v_ph_proc, "P", STATE);
     STR2VCTRIM(FGP_inter_ctrl->v_cl_data_use, "A", STATE);
     STR2VCTRIM(FGP_inter_ctrl->v_id_crt_user, "0000", EMPNO);
   
     if       (amod == 0)     STR2VCTRIM(FGP_inter_ctrl->v_st_proc, "P", STATE);
     else if  (amod == 1)     STR2VCTRIM(FGP_inter_ctrl->v_st_proc, "N", STATE);
     else if  (amod == 2)     STR2VCTRIM(FGP_inter_ctrl->v_st_proc, "A", STATE);
   
     if  (amod == 0)
     {
          hinsa_log_print(0, "라. PL_write_ctrl_control, amod == 0, INSA_HIT_CTRL 테이블 추가...");
          
          /* EXEC SQL 
          INSERT INTO INSA_HIT_CTRL
                 (dt_create,
                  cd_data,
                  no_crt_srl,
                  ym_acct,
                  ph_proc,
                  st_proc,
                  cl_data_use,
                  id_crt_user)
          VALUES (TO_DATE(:FGP_inter_ctrl->v_dt_create,'YYYYMMDD'),
                  :FGP_inter_ctrl->v_cd_data,
                  :FGP_inter_ctrl->v_no_crt_srl,
                  :FGP_inter_ctrl->v_ym_acct,
                  :FGP_inter_ctrl->v_ph_proc,
                  :FGP_inter_ctrl->v_st_proc,
                  :FGP_inter_ctrl->v_cl_data_use,
                  :FGP_inter_ctrl->v_id_crt_user); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 8;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "insert into INSA_HIT_CTRL (dt_create,cd_data,no_cr\
t_srl,ym_acct,ph_proc,st_proc,cl_data_use,id_crt_user) values (TO_DATE(:b0,'Y\
YYYMMDD'),:b1,:b2,:b3,:b4,:b5,:b6,:b7)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )171;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
          sqlstm.sqhstl[0] = (unsigned long )11;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_cd_data);
          sqlstm.sqhstl[1] = (unsigned long )7;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_no_crt_srl);
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_ym_acct);
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_ph_proc);
          sqlstm.sqhstl[4] = (unsigned long )4;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_st_proc);
          sqlstm.sqhstl[5] = (unsigned long )4;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_cl_data_use);
          sqlstm.sqhstl[6] = (unsigned long )4;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_inter_ctrl->v_id_crt_user);
          sqlstm.sqhstl[7] = (unsigned long )7;
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


     }
   
     if  (amod == 1)
     {
          hinsa_log_print(0, "라. PL_write_ctrl_control, amod == 1, INSA_HIT_CTRL 수정... (작업 정상 종료)");
          
          /* EXEC SQL 
          UPDATE INSA_HIT_CTRL
             SET cnt_line    = :FGP_inter_ctrl->v_cnt_line,       -- 처리건수
                 st_proc     = :FGP_inter_ctrl->v_st_proc,        -- 처리상태
                 dt_crt_comp = SYSDATE                            -- 작업완료일자
           WHERE dt_create   = TO_DATE(:FGP_inter_ctrl->v_dt_create, 'YYYYMMDD')
             AND cd_data     = :FGP_inter_ctrl->v_cd_data
             AND no_crt_srl  = :FGP_inter_ctrl->v_no_crt_srl; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 8;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update INSA_HIT_CTRL  set cnt_line=:b0,st_proc=:b1\
,dt_crt_comp=SYSDATE where ((dt_create=TO_DATE(:b2,'YYYYMMDD') and cd_data=:b\
3) and no_crt_srl=:b4)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )218;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_cnt_line);
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_st_proc);
          sqlstm.sqhstl[1] = (unsigned long )4;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
          sqlstm.sqhstl[2] = (unsigned long )11;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_cd_data);
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_no_crt_srl);
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
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

         
     }
   
     if  (amod == 2)
     {
          hinsa_log_print(0, "라. PL_write_ctrl_control, amod == 2, INSA_HIT_CTRL 수정... (작업 비정상 종료)");
          
          /* EXEC SQL 
          UPDATE INSA_HIT_CTRL
             SET st_proc     = :FGP_inter_ctrl->v_st_proc           -- 처리상태
           WHERE dt_create   = TO_DATE(:FGP_inter_ctrl->v_dt_create, 'YYYYMMDD')
             AND cd_data     = :FGP_inter_ctrl->v_cd_data
             AND no_crt_srl  = :FGP_inter_ctrl->v_no_crt_srl; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 8;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update INSA_HIT_CTRL  set st_proc=:b0 where ((dt_c\
reate=TO_DATE(:b1,'YYYYMMDD') and cd_data=:b2) and no_crt_srl=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )253;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_st_proc);
          sqlstm.sqhstl[0] = (unsigned long )4;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
          sqlstm.sqhstl[1] = (unsigned long )11;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_cd_data);
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_no_crt_srl);
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
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


     }
   
     if ((SQLCODE != SQL_OK))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     return (SUCCESS);
}

/*==================================================================================================
   급여지급기준테이블에서 사장 사번을 읽는다...
==================================================================================================*/
int PL_get_chairman(void)
{
     char FL_Line[255];
   
     hinsa_log_print(0, "가. PL_get_chairman, 사장 사번을 읽는다...");
     STRINIT(&FL_Line);
     STRINIT(&v_presempno);
     
     /* EXEC SQL 
     SELECT presempno  INTO :v_presempno  FROM pkcpbas; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select presempno into :b0  from pkcpbas ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )284;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_presempno;
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


   
     if (SQLCODE != SQL_OK)
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     if ((SQLCODE == SQL_NO_DATA) || (SQLCODE == SQL_NULL_COL))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "급여기준테이블에 사장 사번 데이타 미존재... : Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     return (SUCCESS);
}

/*==================================================================================================
   겸직자가 2명인 부서를 체크한다... 겸직자가 2명인 부서가 있을 경우가 존재하면 안됨..
   이때 인사 마스터에 보임여부(payrayn)와 실근무부서 보임여부(jobpayrayn)을 체크한다...
   둘중에 하나만 'Y'로 셋팅되어야 함.
==================================================================================================*/
int PL_double_jobdept_check(void)
{
     char FL_Line[255];
     int  FL_count;
   
     ts_dept_inter FL_dept;
   
     STRINIT(&FL_Line);
     hinsa_log_print(0, "마. PL_double_jobdept_check, 겸직자가 2명 이상인 부서 체크...");
   
     /* EXEC SQL DECLARE cur_01 CURSOR FOR
               SELECT A.empno, A.korname, A.orgnum, A.jobdept
                 FROM pimpmas A,
                      ( SELECT orgnum,jobdept
                          FROM pimpmas
                         WHERE pstate     <'60'
                           AND jobpayrayn ='Y'
                         GROUP BY orgnum, jobdept
                        HAVING count(empno) > 1
                      ) B
                WHERE A.orgnum  = B.orgnum
                  AND A.jobdept = B.jobdept; */ 

     /* EXEC SQL OPEN cur_01; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0015;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )303;
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
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     FL_count = 0;
     while (TRUE)
     {
          memset(&FL_dept,0x00,sizeof(ts_dept_inter));   
          
          /* EXEC SQL FETCH cur_01 INTO
                        :FL_dept.v_empno,
                        :FL_dept.v_korname,
                        :FL_dept.v_orgnum,
                        :FL_dept.v_jobdept; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 8;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )318;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FL_dept.v_empno);
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FL_dept.v_korname);
          sqlstm.sqhstl[1] = (unsigned long )15;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FL_dept.v_orgnum);
          sqlstm.sqhstl[2] = (unsigned long )6;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FL_dept.v_jobdept);
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


          
          if (SQLCODE == SQL_NO_DATA)     break;
          
          if ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK))
          {
               sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               /* EXEC SQL CLOSE cur_01; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 8;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )349;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return (FAILURE);
          }
          
          FL_count++;    
          
          STRINIT(&FL_Line);
          sprintf(FL_Line, "겸직자 정보 : 사번[%s] 성명[%s] 조직차수[%s] 부서코드[%s]",
                  FL_dept.v_empno.arr, FL_dept.v_korname.arr, FL_dept.v_orgnum.arr, FL_dept.v_jobdept.arr);
          hinsa_log_print(0, FL_Line);
     }
   
     /* EXEC SQL CLOSE cur_01; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )364;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


   
     if  (FL_count > 0)
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "겸직자 부서 존재 [%d]",FL_count);
          return (FAILURE);
     }
   
     return (SUCCESS);
}

/*==================================================================================================
   직상위자 판단하는 함수..
==================================================================================================*/
int PL_get_sempno(char *aorgnum, char *adeptcode, char *asempno)
{
     char FL_Line[255];
   
     STRINIT(&FL_Line);
     STRINIT(&v_temp_orgnum);   
     STRINIT(&v_temp_deptcode); 
     STRINIT(&v_temp_sempno);   
     STRINIT(&v_temp_ssempno);   
     
     if  (FG_loopcnt > 5)
     {
          /* 사장 사번을 직상위자로 설정 */
          sprintf(asempno, "%s", v_presempno.arr);
          
          STRINIT(&FL_Line);
          sprintf(FL_Line, "      사...........처리과정 5) 무한루프  사번[%s] 부서[%s]", asempno, adeptcode);
          return (SUCCESS);
     }
     FG_loopcnt++;
     
     /* 2015.11.05.hjku.. 결재자 하드 코딩.. 김현순M 요청 */
     STRINIT(&v_temp_orgnum);  
     STRINIT(&v_temp_deptcode);
     STRINIT(&v_temp_sempno);  

     /* EXEC SQL 
     SELECT A.ORGNUM, A.JOBDEPT, A.EMPNO, B.SUPEREMPNO
       INTO :v_temp_orgnum, :v_temp_deptcode, :v_temp_sempno, :v_temp_ssempno
       FROM PIMPMAS A, INSA2FIN_EEMPFIX B
      WHERE A.EMPNO    = B.EEMPNO
        AND B.EORGNUM  = :aorgnum 
        AND B.EJOBDEPT = :adeptcode
        AND B.USEYN    = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 8;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select A.ORGNUM ,A.JOBDEPT ,A.EMPNO ,B.SUPEREMPNO into \
:b0,:b1,:b2,:b3  from PIMPMAS A ,INSA2FIN_EEMPFIX B where (((A.EMPNO=B.EEMPNO\
 and B.EORGNUM=:b4) and B.EJOBDEPT=:b5) and B.USEYN='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )379;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_temp_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_temp_deptcode;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&v_temp_sempno;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&v_temp_ssempno;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)aorgnum;
     sqlstm.sqhstl[4] = (unsigned long )0;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)adeptcode;
     sqlstm.sqhstl[5] = (unsigned long )0;
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



     if  ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }   

     if ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(asempno, "%s", v_temp_sempno.arr);
          STRINIT(&FL_Line);
          sprintf(FL_Line, "      사...........처리과정 7) 실근무지부서[%s] = 부서[%s] 경우 사번[%s]",
          
          FGP_inter_emp->v_deptcode.arr, v_temp_deptcode.arr, asempno);
          return (SUCCESS);       
     }   


     STRINIT(&v_temp_orgnum);  
     STRINIT(&v_temp_deptcode);
     STRINIT(&v_temp_sempno);
       
     /* 현 조직차수에서 겸직인 사원 자료 추출 */
     /* EXEC SQL 
     SELECT D.orgnum, D.addeptcode, D.empno  -- D.korname, D.orgnum, D.deptcode, D.addeptcode
       INTO :v_temp_orgnum, :v_temp_deptcode, :v_temp_sempno
       FROM pimpmas C,
           (SELECT A.empno, A.korname, A.orgnum, A.deptcode, A.addeptcode --, decode(a.ancode,'233','233','243')
              FROM pihanno A
             WHERE A.anupdyn    = 'Y'
               AND A.ancode     in ('233') --,'243'
               AND A.orgnum     = :aorgnum               
               AND A.addeptcode = :adeptcode
               And A.adpayra   <= 'C20'    /odsa2000 2018.11 'C18'=>'C20'으로 변경 H23차조직개편o/
             MINUS
            SELECT B.empno, B.korname, B.orgnum, B.deptcode, B.addeptcode --, decode(b.ancode,'238','233','243')
              FROM pihanno B
             WHERE B.anupdyn    = 'Y'
               AND B.ancode     in ('238') --,'248'
               AND B.orgnum     = :aorgnum
               AND B.addeptcode = :adeptcode
           ) D
      WHERE C.empno         = D.empno
        AND C.pstate        < '60'
        AND D.orgnum        = :aorgnum
        AND D.addeptcode    = :adeptcode; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select D.orgnum ,D.addeptcode ,D.empno into :b0,:b1,:b2\
  from pimpmas C ,(select A.empno ,A.korname ,A.orgnum ,A.deptcode ,A.addeptc\
ode  from pihanno A where ((((A.anupdyn='Y' and A.ancode in ('233')) and A.or\
gnum=:b3) and A.addeptcode=:b4) and A.adpayra<='C20') minus select B.empno ,B\
.korname ,B.orgnum ,B.deptcode ,B.addeptcode  from pihanno B where (((B.anupd\
yn='Y' and B.ancode in ('238')) and B.orgnum=:b3) and B.addeptcode=:b4)) D wh\
ere (((C.empno=D.empno and C.pstate<'60') and D.orgnum=:b3) and D.addeptcode=\
:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )418;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_temp_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_temp_deptcode;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&v_temp_sempno;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)aorgnum;
     sqlstm.sqhstl[3] = (unsigned long )0;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)adeptcode;
     sqlstm.sqhstl[4] = (unsigned long )0;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)aorgnum;
     sqlstm.sqhstl[5] = (unsigned long )0;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)adeptcode;
     sqlstm.sqhstl[6] = (unsigned long )0;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)aorgnum;
     sqlstm.sqhstl[7] = (unsigned long )0;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)adeptcode;
     sqlstm.sqhstl[8] = (unsigned long )0;
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


   
     if  ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     /* 겸직자 사번과 사번이 같으면 무효 */
     if  ((SQLCODE != SQL_NO_DATA) && 
          ((strcmp(v_temp_sempno.arr, FGP_inter_emp->v_empno.arr) != 0) && 
           (strcmp(v_payra.arr,FGP_inter_emp->v_payra.arr) != 0)))
     {
          sprintf(asempno, "%s", v_temp_sempno.arr);
          STRINIT(&FL_Line);
          sprintf(FL_Line, "      사...........처리과정 1)겸직상위자 사번[%s] ", asempno);
          hinsa_log_print(0, FL_Line);
          return (SUCCESS);
     }
   
     /* 실근무부서 코드와 같고 실근무부서 보임여부 Y 인경우의 직상위자를 찾아서 그사원을 직상위자로 등록한다..
        발생되는 경우 : 파견일 경우 실근무부서는 파견근무지로 되기 때문...*/   
     if  (strcmp(FGP_inter_emp->v_payrayn.arr, "Y") != 0) 
     {
          STRINIT(&v_temp_orgnum);
          STRINIT(&v_temp_deptcode);
          STRINIT(&v_temp_sempno);
          
          /* EXEC SQL 
          SELECT orgnum, jobdept, empno
            INTO :v_temp_orgnum, :v_temp_deptcode, :v_temp_sempno
            FROM pimpmas
           WHERE pstate     <  '60'
             AND jobpayrayn =  'Y'
             AND jobpayra   <  'C51' --//근무부서PL이면서 겸직부서팀장인 경우 근무부서는 직상위자 지정 안되도록
             AND orgnum     =  :aorgnum
             AND jobdept    =  (SELECT jobdept FROM pimpmas WHERE empno = :FGP_inter_emp->v_empno); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select orgnum ,jobdept ,empno into :b0,:b1,:b2  fr\
om pimpmas where ((((pstate<'60' and jobpayrayn='Y') and jobpayra<'C51') and \
orgnum=:b3) and jobdept=(select jobdept  from pimpmas where empno=:b4))";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )469;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&v_temp_orgnum;
          sqlstm.sqhstl[0] = (unsigned long )6;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&v_temp_deptcode;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&v_temp_sempno;
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)aorgnum;
          sqlstm.sqhstl[3] = (unsigned long )0;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_emp->v_empno);
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


          
          if  ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
          {
               STRINIT(&FL_Line);
               sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               return (FAILURE);
          }
          
          if ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_NO_DATA))
          {
               if (strcmp(FGP_inter_emp->v_deptcode.arr, v_temp_deptcode.arr) == 0) //!=
               {
                    sprintf(asempno, "%s", v_temp_sempno.arr);
                    STRINIT(&FL_Line);
                    sprintf(FL_Line, "      사...........처리과정 7) 실근무지부서[%s] = 부서[%s] 경우 사번[%s]",
                    
                    FGP_inter_emp->v_deptcode.arr, v_temp_deptcode.arr, asempno);
                    /* hinsa_log_print(0, FL_Line);  dsa2000  2005.02.16.  로그량을 줄이기 위해 막아놓음     */
                    return (SUCCESS);
               }
            
          }
     }
      
     /* 상위부서를 찾아서 상위부서와 인사마스터의 근무부서와 일치하는 사번을 찾아서 직상위자로 등록한다. */
     STRINIT(&v_temp_orgnum);   
     STRINIT(&v_temp_deptcode); 
     STRINIT(&v_temp_sempno);   

     /* EXEC SQL 
     SELECT orgnum, NVL(extcode,'*****')
       INTO :v_temp_orgnum, :v_temp_deptcode
       FROM pycdept
      WHERE orgnum   = :aorgnum
        AND deptcode = :adeptcode; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select orgnum ,NVL(extcode,'*****') into :b0,:b1  from \
pycdept where (orgnum=:b2 and deptcode=:b3)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )504;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_temp_orgnum;
     sqlstm.sqhstl[0] = (unsigned long )6;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_temp_deptcode;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)aorgnum;
     sqlstm.sqhstl[2] = (unsigned long )0;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)adeptcode;
     sqlstm.sqhstl[3] = (unsigned long )0;
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


   
     if  ((SQLCODE != SQL_NULL_COL) && (SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     STRINIT(&FL_Line);
     sprintf(FL_Line, "      사..........처리과정 2,3,4 공통) 상위부서[%s] 확인작업", v_temp_deptcode.arr);
     
     if  ((SQLCODE != SQL_NO_DATA) && (strncmp(v_temp_deptcode.arr,"*****",5) == 0))
     {
          sprintf(asempno, "%s", v_presempno.arr); /* 사장 사번을 직상위자로 설정 */
          STRINIT(&FL_Line);
          sprintf(FL_Line, "      사...........처리과정 2) 상위부서[%s] 사장 사번 [%s]", v_temp_deptcode.arr, asempno);
          hinsa_log_print(0, FL_Line);
          return (SUCCESS);
     }
     else
     {
          /* EXEC SQL
          SELECT empno
            INTO :v_temp_sempno
            FROM pimpmas
           WHERE orgnum    = :v_temp_orgnum
             AND ((jobdept = :v_temp_deptcode AND jobpayrayn  = 'Y')) //(deptcode = :v_temp_deptcode AND payrayn = 'Y') OR 
             AND pstate   < '60'; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 9;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select empno into :b0  from pimpmas where ((orgnum\
=:b1 and (jobdept=:b2 and jobpayrayn='Y')) and pstate<'60')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )535;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&v_temp_sempno;
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&v_temp_orgnum;
          sqlstm.sqhstl[1] = (unsigned long )6;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&v_temp_deptcode;
          sqlstm.sqhstl[2] = (unsigned long )9;
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


                    
          if  ((SQLCODE == SQL_NO_DATA) || (SQLCODE == SQL_NULL_COL))
          {
               VC2VC(FGP_inter_emp->v_orgnum, v_temp_orgnum);
               VC2VC(FGP_inter_emp->v_deptcode, v_temp_deptcode);
               
               /* 재귀 호출..*/
               STRINIT(&FL_Line);
               sprintf(FL_Line, "      사...........처리과정 3) 상위부서 재귀호출 [%s | %s]",  v_temp_orgnum.arr,  v_temp_deptcode.arr);
               hinsa_log_print(0, FL_Line);
               PL_get_sempno((char *)FGP_inter_emp->v_orgnum.arr, (char *)FGP_inter_emp->v_deptcode.arr, (char *)FGP_inter_emp->v_sempno.arr);
          }
          else if  (SQLCODE != SQL_OK)
          {
               STRINIT(&FL_Line);
               sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               return (FAILURE);
          }
          else
          {
               sprintf(asempno, "%s", v_temp_sempno.arr);
               VC2VC(FGP_inter_emp->v_orgnum, v_temp_orgnum);
               VC2VC(FGP_inter_emp->v_deptcode, v_temp_deptcode);
               STRINIT(&FL_Line);
               /*printf("[%s] [%s] [%s]\n", v_temp_sempno, v_temp_orgnum, v_temp_deptcode);*/
               sprintf(FL_Line, "      사...........처리과정 4) 상위부서[%s] 사번 [%s]", v_temp_deptcode.arr, asempno);
               hinsa_log_print(0, FL_Line);  /*dsa2000  2005.02.16.  로그량을 줄이기 위해 막아놓음*/
          }
     }
     return (SUCCESS);
}

/*============================ ======================================================================
   erp_hap_ap04 Table에 데이타를 기록한다...
==================================================================================================*/
int PL_write_erp(void)
{
     char FL_Line[255];
     int  FL_count;
     int  FL_result;
     int  v_cnt;
     char v_date[9];
          
     STRINIT(&FL_Line);
     
     if (PL_double_jobdept_check() == FAILURE)
     {
          hinsa_exit(0,"PL_double_jobdept_check Function 에러...");
          return (FAILURE);
     }
   
     hinsa_log_print(0, "바. PL_write_erp, 정상적인 사원별 직상위자 추출 시작...");

     /*=============================================================================================
       실근무지부서 보임여부가 Y and 실근무지부서와 부서가 같고 and 인사상태가 < '60인 사원을 직상위자로 등록한다.
       (직상위자가 없는 사원은 '****' 마크를 한다.)
     =============================================================================================*/  
     /* EXEC SQL DECLARE  cur_02 CURSOR  FOR
               SELECT /o+ ordered A, A1, B o/
                      A.empno,                                         -- 사원번호
                      A.korname,                                       -- 성명
                      A.orgnum,                                        -- 조직차수
                      Decode(Q1.empno,A.empno,Q1.Addeptcode,A.jobdept),-- 근무부서 A.jobdept
                      NVL(REPLACE(A.juminid, '-'), '9999999999999'),   -- 주민번호                      
                      NVL(C.fincode, F.EMPTY_FINCODE),                 --재무부서코드                        --2017.02.27.hjku.. 담당자가 관리할 수 있도록 테이블에서 읽어서 반영.. 자체 개선
                      NVL(A.empdate,'00000000'),                       -- 입사일
                      NVL(A.retdate,'20501231'),                       -- 퇴직일
                      NVL(A.telno,' '),                                -- 전화번호                      
                      NVL(A.jobpayra,A.payra), 
                      ' ',                                             -- BAND명
                      NVL(D.codename,' '),                             -- 직책명                      
                      decode(A.jobpayra,'C15','Y',NVL(A.jobpayrayn, 'N')),-- 실근무지 보임여부 : 팀장직대이상만 결재권한이 있음. -- 결재권자 : 팀장, 소팀장, 대팀장, 단장, 실장, 단장, 지사장등등..
                      NVL(A.curaddr,'서울'),                          -- 현주소지(서울)
                      NVL(A.zipno,'      '),                          -- 우편번호 -- 2015.08.03.hjku.. 우편번호 체계변경으로 수정.. 이진석이사..-- NVL(A.zipno,'   -   '),                         -- 우편번호
                      NVL(B.payacnt,' '),                             -- 급여이체 계좌번호
                      NVL(B.paybank,' '),                             -- 급여계좌은행코드
                      NVL(A.tjobduty,' '),                            -- 담당직무 : 비서check용
                      NVL(Decode(a.jobpayrayn,'Y','****',Decode(Q1.empno,A.empno,'****',Decode(Q.empno,A.empno,'****',Q.empno))), NVL(A1.empno,'****') )             -- 직상위자 NVL(A1.empno,'****')
                 FROM (select * from pimpmas where pstate < '80' ) A,
                      (select * from pimpmas where pstate < '60' AND jobpayrayn = 'Y' ) A1, 
                       pkmpmas B, pycdept C, 
                      (Select * From Pyccode Where Codeid='I113') D,
                      (SELECT B.* FROM PIMVARI A, PSAPFINCODE B WHERE A.GUBUN='00' AND A.SGUBUN='0001' And a.value1 = b.orgnum(+)) F, 
                      (select empno, orgnum, replace(addeptcode,'0','')||'%' addeptcode  FROM pihanno
                        WHERE anupdyn = 'Y' AND ancode = '243' AND anfrdate > '2009' 
                        MINUS
                       SELECT empno, orgnum, replace(addeptcode,'0','')||'%' addeptcode FROM pihanno B
                        WHERE anupdyn = 'Y' AND ancode = '248' AND anfrdate > '2009' ) Q,   --//본인의 근무부서와 같은 직무대행자를 찾는다
                      (select empno, orgnum, addeptcode  FROM pihanno
                        WHERE anupdyn = 'Y' AND ancode = '243' AND anfrdate > '2009' 
                        MINUS
                       SELECT empno, orgnum, addeptcode FROM pihanno B
                        WHERE anupdyn = 'Y' AND ancode = '248' AND anfrdate > '2009' ) Q1  --//본인이 직무대행자인 경우
                WHERE A.empno   = B.empno(+)
                  AND A.orgnum  = C.orgnum   
                  AND A.jobdept = C.deptcode
                  AND A.orgnum  = Q.orgnum(+)  
                  AND A.jobdept like Q.addeptcode(+)
                  and A.empno   = Q1.empno(+)       
                  AND A.orgnum  = A1.orgnum(+)   
                  AND A.jobdept = A1.jobdept(+) --//HR그룹 특별관리 HR팀장을 재무결재자로 지정
                  And D.codeno  = A.jobpayra
                ORDER BY C.fincode, A.empno; */ 

   
     /* EXEC SQL OPEN cur_02; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select  /*+  ordered A, A1, B  */ A.empno ,A.korname ,A.orgnum ,Deco\
de(Q1.empno,A.empno,Q1.Addeptcode,A.jobdept) ,NVL(REPLACE(A.juminid,'-'),'99\
99999999999') ,NVL(C.fincode,F.EMPTY_FINCODE) ,NVL(A.empdate,'00000000') ,NV\
L(A.retdate,'20501231') ,NVL(A.telno,' ') ,NVL(A.jobpayra,A.payra) ,' ' ,NVL\
(D.codename,' ') ,decode(A.jobpayra,'C15','Y',NVL(A.jobpayrayn,'N')) ,NVL(A.\
curaddr,'서울') ,NVL(A.zipno,'      ') ,NVL(B.payacnt,' ') ,NVL(B.paybank,' \
') ,NVL(A.tjobduty,' ') ,NVL(Decode(a.jobpayrayn,'Y','****',Decode(Q1.empno,\
A.empno,'****',Decode(Q.empno,A.empno,'****',Q.empno))),NVL(A1.empno,'****')\
)  from (select *  from pimpmas where pstate<'80') A ,(select *  from pimpma\
s where (pstate<'60' and jobpayrayn='Y')) A1 ,pkmpmas B ,pycdept C ,(select \
*  from Pyccode where Codeid='I113') D ,(select B.*  from PIMVARI A ,PSAPFIN\
CODE B where ((A.GUBUN='00' and A.SGUBUN='0001') and a.value1=b.orgnum(+))) \
F ,(select empno ,orgnum ,(replace(addeptcode,'0','')||'%') addeptcode  from\
 pihanno where ((anupdyn='Y' and ancode='243");
     sqlstm.stmt = sq0021;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )562;
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
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     FL_count = 1;
     while(TRUE)
     {
          memset(&FG_inter_emp,  0x00, sizeof(ts_employee_inter));    
          
          /* EXEC SQL FETCH cur_02 INTO
                        :FGP_inter_emp->v_empno,
                        :FGP_inter_emp->v_korname,
                        :FGP_inter_emp->v_orgnum,
                        :FGP_inter_emp->v_deptcode,
                        :FGP_inter_emp->v_juminid,
                        :FGP_inter_emp->v_fincode,
                        :FGP_inter_emp->v_empdate,
                        :FGP_inter_emp->v_retdate,
                        :FGP_inter_emp->v_telno,
                        :FGP_inter_emp->v_payra,
                        :FGP_inter_emp->v_clname,
                        :FGP_inter_emp->v_raname,
                        :FGP_inter_emp->v_payrayn,
                        :FGP_inter_emp->v_curaddr,
                        :FGP_inter_emp->v_zipno,
                        :FGP_inter_emp->v_payacnt,
                        :FGP_inter_emp->v_paybank,
                        :FGP_inter_emp->v_refer,
                        :FGP_inter_emp->v_sempno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 19;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )577;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_emp->v_empno);
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_emp->v_korname);
          sqlstm.sqhstl[1] = (unsigned long )15;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_emp->v_orgnum);
          sqlstm.sqhstl[2] = (unsigned long )6;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_emp->v_deptcode);
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_emp->v_juminid);
          sqlstm.sqhstl[4] = (unsigned long )16;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_emp->v_fincode);
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_emp->v_empdate);
          sqlstm.sqhstl[6] = (unsigned long )11;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_inter_emp->v_retdate);
          sqlstm.sqhstl[7] = (unsigned long )11;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&(FGP_inter_emp->v_telno);
          sqlstm.sqhstl[8] = (unsigned long )18;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&(FGP_inter_emp->v_payra);
          sqlstm.sqhstl[9] = (unsigned long )6;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&(FGP_inter_emp->v_clname);
          sqlstm.sqhstl[10] = (unsigned long )23;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&(FGP_inter_emp->v_raname);
          sqlstm.sqhstl[11] = (unsigned long )23;
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&(FGP_inter_emp->v_payrayn);
          sqlstm.sqhstl[12] = (unsigned long )4;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&(FGP_inter_emp->v_curaddr);
          sqlstm.sqhstl[13] = (unsigned long )53;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&(FGP_inter_emp->v_zipno);
          sqlstm.sqhstl[14] = (unsigned long )10;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&(FGP_inter_emp->v_payacnt);
          sqlstm.sqhstl[15] = (unsigned long )23;
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&(FGP_inter_emp->v_paybank);
          sqlstm.sqhstl[16] = (unsigned long )6;
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&(FGP_inter_emp->v_refer);
          sqlstm.sqhstl[17] = (unsigned long )15;
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&(FGP_inter_emp->v_sempno);
          sqlstm.sqhstl[18] = (unsigned long )7;
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
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
               hinsa_log_print(0, "정상적인 사원별 직상위자 추출 실패...");
               sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               /* EXEC SQL CLOSE cur_02; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 19;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )668;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return (FAILURE);
          }
          
          STRINIT(&v_imsi_deptcode);    
          VC2VC(v_imsi_deptcode, FGP_inter_emp->v_deptcode);
          
          STRINIT(&FL_Line);
          sprintf(FL_Line, " ☞111    %5d : 사번[%s : %s] 보임[%s : %s] 부서[%s] 재무부서[%s] 직상위자[%s] ",
                  FL_count,
                  FGP_inter_emp->v_empno.arr,   FGP_inter_emp->v_korname.arr,
                  FGP_inter_emp->v_payrayn.arr, FGP_inter_emp->v_raname.arr,
                  FGP_inter_emp->v_deptcode.arr,FGP_inter_emp->v_fincode.arr, FGP_inter_emp->v_sempno.arr);
          /*hinsa_log_print(0, FL_Line);            dsa2000  2007.03.12.  로그량을 줄이기 위해 막아놓음     */
          
          /*==============================================================================================
             ** 직상위가 가져오는 함수 **
             1. 보임자일 경우..
                발령테이블에서 겸직자를 검색하여 겸직자가 있으면 직상위자는 겸직자 사번이 되고
                아니면 부서테이블에서 상위부서를 검색하여 인사마스터의 근무부서와 상위부서가 같은 사번을
                겸직자 사번으로 한다.
             2. 보임자가 아닐 경우..
                현상위자가 있으면 직상위자는 현상위자
                현상위자가 없으면 1번 루틴을 실행한다.
          ==============================================================================================*/
          FG_loopcnt = 0;
          FL_result  = 0;
          if  (strcmp(FGP_inter_emp->v_payrayn.arr, "Y") == 0)
          {
               /*hinsa_log_print(0,"..........보임자 처리...");             dsa2000  2007.03.12.  로그량을 줄이기 위해 막아놓음       */
               FL_result = PL_get_sempno((char *)FGP_inter_emp->v_orgnum.arr,
                                         (char *)FGP_inter_emp->v_deptcode.arr,
                                         (char *)FGP_inter_emp->v_sempno.arr);
          }
          else
          {
               if (strcmp(FGP_inter_emp->v_sempno.arr,"****") == 0)
               {
                    /*hinsa_log_print(0,"..........[****] 직상위자 처리...");   dsa2000  2007.03.12.  로그량을 줄이기 위해 막아놓음     */
                    FL_result = PL_get_sempno((char *)FGP_inter_emp->v_orgnum.arr,
                                              (char *)FGP_inter_emp->v_deptcode.arr,
                                              (char *)FGP_inter_emp->v_sempno.arr);
               }
          }
          
          if  (FL_result == FAILURE)
          {
               /* EXEC SQL CLOSE cur_02; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 19;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )683;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"PL_get_sempno Function 에러로 종료...");
               return (FAILURE);
          }
          
          STR2VCTRIM(FGP_inter_emp->v_rst_valid, "A", STATE);

          /*2015.11.06.hjku.. 결재특이자 처리.. 전지영M 요청*/ 
          if  ((strcmp((char *)FGP_inter_emp->v_empno.arr,(char *)FGP_inter_emp->v_sempno.arr) == 0) &&
          	   (strcmp((char *)v_temp_sempno.arr,"") != 0)  ) 
          	
          {
               /*sprintf((char *)FGP_inter_emp->v_sempno, "%s", v_temp_sempno.arr);*/
               STR2VCTRIM(FGP_inter_emp->v_sempno, v_temp_sempno.arr, EMPNO);
          }
          
          
          /* 피결재자와 결재자가 같을 경우 사번을 0000으로 셋팅한다... */
          if  (strcmp((char *)FGP_inter_emp->v_empno.arr,(char *)FGP_inter_emp->v_sempno.arr) == 0)
          {
              if  (v_temp_ssempno.len == 4)           	
              {
                  STR2VCTRIM(FGP_inter_emp->v_sempno, v_temp_ssempno.arr, EMPNO);
              } else {          	
                  STR2VCTRIM(FGP_inter_emp->v_sempno, "0000", EMPNO);
                  /*hinsa_log_print(0, "..........처리과정 6) 피결재자 결재자가 같은 경우 발생.");  dsa2000  2007.03.12.  로그량을 줄이기 위해 막아놓음     */
              }
          }
            
          /* key DT_CREATE, CD_DATA, NO_CRT_SRL, EMPCODE */
          /* EXEC SQL 
          INSERT INTO erp_hap_ap04 
                 ( trandate,           /o-- 생성일자                 o/
                   extno,              /o-- Employee Data Code "AP03"o/
                   nocrt,              /o-- 생성 일련번호            o/
                   empcode,            /o-- 사번                     o/
                   empname,            /o-- 성명                     o/
                   regno,              /o-- 주민번호(9999999999999)  o/
                   defaultdept,        /o-- 재무부서코드             o/
                   empbdate,           /o-- 입사일                   o/
                   empedate,           /o-- 퇴직일                   o/
                   telno,              /o-- 전화번호                 o/
                   rank,               /o-- 직급명.직위명            o/
                   title,              /o-- 직위명                   o/
                   assign,             /o-- 보임여부                 o/
                   address,            /o-- 현주소지(서울)           o/
                   zipcode,            /o-- 우편번호                 o/
                   bankaccount,        /o-- 급여계*좌번호            o/
                   bankgubun,          /o-- 급여계좌은행코드         o/
                   reference1,         /o-- 담당 직무(비서 09)       o/
                   superempcode,       /o-- 상위자                   o/
                   valid,              /o-- "A"                      o/
                   sitecode )
          VALUES
                 ( :FGP_inter_ctrl->v_dt_create,
                   :FGP_inter_ctrl->v_cd_data,
                   :FGP_inter_ctrl->v_no_crt_srl,
                   :FGP_inter_emp->v_empno,
                   :FGP_inter_emp->v_korname,
                   :FGP_inter_emp->v_juminid,
                   :FGP_inter_emp->v_fincode,
                   :FGP_inter_emp->v_empdate,
                   :FGP_inter_emp->v_retdate,
                   :FGP_inter_emp->v_telno,
                   :FGP_inter_emp->v_clname,
                   :FGP_inter_emp->v_raname,
                   :FGP_inter_emp->v_payrayn,
                   :FGP_inter_emp->v_curaddr,
                   :FGP_inter_emp->v_zipno,
                   :FGP_inter_emp->v_payacnt,
                   :FGP_inter_emp->v_paybank,
                   :FGP_inter_emp->v_refer,
                   :FGP_inter_emp->v_sempno,
                   :FGP_inter_emp->v_rst_valid,
                   'T001' ); */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "insert into erp_hap_ap04 (trandate,extno,nocrt,emp\
code,empname,regno,defaultdept,empbdate,empedate,telno,rank,title,assign,addr\
ess,zipcode,bankaccount,bankgubun,reference1,superempcode,valid,sitecode) val\
ues (:b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b\
16,:b17,:b18,:b19,'T001')";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )698;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
          sqlstm.sqhstl[0] = (unsigned long )11;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_cd_data);
          sqlstm.sqhstl[1] = (unsigned long )7;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_no_crt_srl);
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_emp->v_empno);
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_emp->v_korname);
          sqlstm.sqhstl[4] = (unsigned long )15;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_emp->v_juminid);
          sqlstm.sqhstl[5] = (unsigned long )16;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_emp->v_fincode);
          sqlstm.sqhstl[6] = (unsigned long )9;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_inter_emp->v_empdate);
          sqlstm.sqhstl[7] = (unsigned long )11;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&(FGP_inter_emp->v_retdate);
          sqlstm.sqhstl[8] = (unsigned long )11;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&(FGP_inter_emp->v_telno);
          sqlstm.sqhstl[9] = (unsigned long )18;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&(FGP_inter_emp->v_clname);
          sqlstm.sqhstl[10] = (unsigned long )23;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&(FGP_inter_emp->v_raname);
          sqlstm.sqhstl[11] = (unsigned long )23;
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&(FGP_inter_emp->v_payrayn);
          sqlstm.sqhstl[12] = (unsigned long )4;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&(FGP_inter_emp->v_curaddr);
          sqlstm.sqhstl[13] = (unsigned long )53;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&(FGP_inter_emp->v_zipno);
          sqlstm.sqhstl[14] = (unsigned long )10;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&(FGP_inter_emp->v_payacnt);
          sqlstm.sqhstl[15] = (unsigned long )23;
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&(FGP_inter_emp->v_paybank);
          sqlstm.sqhstl[16] = (unsigned long )6;
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&(FGP_inter_emp->v_refer);
          sqlstm.sqhstl[17] = (unsigned long )15;
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&(FGP_inter_emp->v_sempno);
          sqlstm.sqhstl[18] = (unsigned long )7;
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&(FGP_inter_emp->v_rst_valid);
          sqlstm.sqhstl[19] = (unsigned long )4;
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
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
               sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               return (FAILURE);
          }
          /*
          STRINIT(&FL_Line);
          sprintf(FL_Line, " ☞222    %5d : 사번[%s : %s] 보임[%s : %s] 부서[%s] 재무부서[%s] 직상위자[%s] ",
                  FL_count,
                  FGP_inter_emp->v_empno.arr,   FGP_inter_emp->v_korname.arr,
                  FGP_inter_emp->v_payrayn.arr, FGP_inter_emp->v_raname.arr,
                  FGP_inter_emp->v_deptcode.arr,FGP_inter_emp->v_fincode.arr, FGP_inter_emp->v_sempno.arr);
          hinsa_log_print(0, FL_Line);
          */
          FL_count++;
     }

     /* EXEC SQL CLOSE cur_02; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )793;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     hinsa_log_print(0, "바. PL_write_erp, 정상적인 사원별 직상위자 추출 완료...");
     
     /*==================================================================================================*/      
     hinsa_log_print(0, "바. PL_write_erp, 비정상적인 사원별 데이타 저장 시작...");
     /* EXEC SQL 
     INSERT INTO erp_hap_ap04
                (trandate,
                 extno,
                 nocrt,
                 empcode,
                 empname,
                 regno,
                 defaultdept,
                 empbdate,
                 empedate,
                 telno,
                 rank,
                 title,
                 assign,
                 address,
                 zipcode,
                 bankaccount,
                 bankgubun,
                 superempcode,
                 valid,
                 sitecode
                )
         SELECT :FGP_inter_ctrl->v_dt_create,
                :FGP_inter_ctrl->v_cd_data,
                :FGP_inter_ctrl->v_no_crt_srl,
                SUBSTR(A.empno,1, 4),
                SUBSTR(A.korname,1, 8),
                SUBSTR(NVL(REPLACE(A.juminid, '-'),'9999999999999'),1, 13),                
                F.RETIRE_FINCODE,                       --2017.02.27.hjku.. 담당자가 관리할 수 있도록 테이블에서 읽어서 반영.. 자체 개선  --'CHA00',
                SUBSTR(NVL(A.empdate,'00000000'),1, 8),
                SUBSTR(NVL(A.retdate,F.anfrdate),1, 8),
                SUBSTR(NVL(A.telno,' '),1, 20),
                ' ', --rank
                SUBSTR(NVL(E.codename,' '),1, 20),   --직책명                
                SUBSTR(NVL(A.jobpayrayn,'N'),1, 1),
                SUBSTR(NVL(A.curaddr,'서울'),1,35),  
                SUBSTR(NVL(A.zipno,  '      '),1, 7), -- 2015.08.03.hjku.. 우편번호체계 변경으로 수정.. 이진석이사..           -- SUBSTR(NVL(A.zipno,  '   -   '),1, 7),
                SUBSTR(NVL(B.payacnt,' '),1, 30),                
                NVL(B.paybank,' '),                   -- 급여계좌은행코드   //SUBSTR(NVL(B.paybank,' '),1, 2),
                NULL,
                SUBSTR(:FGP_inter_emp->v_rst_valid,1, 1),
                'T001'
           FROM (Select * From pimpmas Where pstate > '80') A,
                 pkmpmas B,
                (Select * From pyccode Where codeid = 'I113') E,
                (SELECT B.* FROM PIMVARI A, PSAPFINCODE B WHERE A.GUBUN='00' AND A.SGUBUN='0001' and a.value1 = b.orgnum(+)) F, 
                (SELECT A1.empno, A1.korname, A1.anfrdate, A1.antodate, A1.ancode
                   FROM pihanno A1,
                       ( SELECT empno, anfrdate maxfrdate, annono maxnono, anseqno maxseqno
                           FROM pihanno
                          WHERE anupdyn  = 'Y'
                            AND (empno,anfrdate) in (select empno,max(anfrdate) 
                                                       from pihanno
                                                      where (ancode IN ('511','512','600','619','629','631','641') 
                                                         OR  ancode LIKE '8%')
                                                      group by empno)  
                         ) B1
                  WHERE A1.empno    = B1.empno
                    AND A1.anfrdate = B1.maxfrdate
                    AND A1.annono   = B1.maxnono
                    AND A1.anseqno  = B1.maxseqno
                    AND A1.anupdyn  = 'Y'                    
                    AND (A1.ancode IN ('511','512','600','619','629','631','641') OR  A1.ancode LIKE '8%') /o 511 휴직; 512 휴직연장; 600 징계; 619 징계해고; 629 권고사직; 631 강직; 641 정직; 8 휴직 o/
                    AND not (A1.anfrdate >= '20090708' and A1.ancode='600' and A1.andetcode = '62') 
                ) F
          WHERE A.empno  = B.empno(+)
            AND A.empno  = F.empno
            AND TO_CHAR(SYSDATE,'YYYYMMDD') >= F.anfrdate
            And A.Jobpayra = E.codeno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into erp_hap_ap04 (trandate,extno,nocrt,empcode,empname,regno\
,defaultdept,empbdate,empedate,telno,rank,title,assign,address,zipcode,banka\
ccount,bankgubun,superempcode,valid,sitecode)select :b0 ,:b1 ,:b2 ,SUBSTR(A.\
empno,1,4) ,SUBSTR(A.korname,1,8) ,SUBSTR(NVL(REPLACE(A.juminid,'-'),'999999\
9999999'),1,13) ,F.RETIRE_FINCODE ,SUBSTR(NVL(A.empdate,'00000000'),1,8) ,SU\
BSTR(NVL(A.retdate,F.anfrdate),1,8) ,SUBSTR(NVL(A.telno,' '),1,20) ,' ' ,SUB\
STR(NVL(E.codename,' '),1,20) ,SUBSTR(NVL(A.jobpayrayn,'N'),1,1) ,SUBSTR(NVL\
(A.curaddr,'서울'),1,35) ,SUBSTR(NVL(A.zipno,'      '),1,7) ,SUBSTR(NVL(B.pa\
yacnt,' '),1,30) ,NVL(B.paybank,' ') ,null  ,SUBSTR(:b3,1,1) ,'T001'  from (\
select *  from pimpmas where pstate>'80') A ,pkmpmas B ,(select *  from pycc\
ode where codeid='I113') E ,(select B.*  from PIMVARI A ,PSAPFINCODE B where\
 ((A.GUBUN='00' and A.SGUBUN='0001') and a.value1=b.orgnum(+))) F ,(select A\
1.empno ,A1.korname ,A1.anfrdate ,A1.antodate ,A1.ancode  from pihanno A1 ,(\
select empno ,anfrdate maxfrdate ,annono max");
     sqlstm.stmt = "nono ,anseqno maxseqno  from pihanno where (anupdyn='Y'\
 and (empno,anfrdate) in (select empno ,max(anfrdate)  from pihanno where (an\
code in ('511','512','600','619','629','631','641') or ancode like '8%') grou\
p by empno))) B1 where ((((((A1.empno=B1.empno and A1.anfrdate=B1.maxfrdate) \
and A1.annono=B1.maxnono) and A1.anseqno=B1.maxseqno) and A1.anupdyn='Y') and\
 (A1.ancode in ('511','512','600','619','629','631','641') or A1.ancode like \
'8%')) and  not ((A1.anfrdate>='20090708' and A1.ancode='600') and A1.andetco\
de='62'))) F where (((A.empno=B.empno(+) and A.empno=F.empno) and TO_CHAR(SYS\
DATE,'YYYYMMDD')>=F.anfrdate) and A.Jobpayra=E.codeno)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )808;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_cd_data);
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_no_crt_srl);
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_emp->v_rst_valid);
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


     
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s\n", SQLERRM);    
          sprintf(FL_Line, " ☞333   %5d : 사번[%s : %s] 보임[%s : %s] 부서[%s] 재무부서[%s] 직상위자[%s] ",
                  FL_count,
                  FGP_inter_emp->v_empno.arr,   FGP_inter_emp->v_korname.arr,
                  FGP_inter_emp->v_payrayn.arr, FGP_inter_emp->v_raname.arr,
                  FGP_inter_emp->v_deptcode.arr,FGP_inter_emp->v_fincode.arr, FGP_inter_emp->v_sempno.arr);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     /* 해당사항이 없어 주석 처리함.  dsa2000 2008.04.01                  최초작성자:정규용
     hinsa_log_print(0, " - 비서팀장 결자재가 사장님에서 경영지원실장으로 변경, <하드코딩>");
     EXEC SQL UPDATE erp_hap_ap04
              SET superempcode =(select empcode from erp_hap_ap04
                                  where defaultdept='CCB00'       경영지원실 fincode 
                                    and assign     ='Y')
              where defaultdept='C0010'                          비서팀 fincode  
                and assign     ='Y';                                               
     hinsa_log_print(0, "바. PL_write_erp, 비정상적인 사원별 데이타 저장 완료..."); */
     /*==================================================================================================*/ 
     
     /*2015.10.30.hjku. 1775 이광조 매니저 결재 권한 HR팀장님으로 변경 요청.. 전지영M
     hinsa_log_print(0, " - 1775 이광조 매니저 결재 권한 HR팀장님으로 변경, <하드코딩>");
     EXEC SQL UPDATE erp_hap_ap04
              SET superempcode ='2545'
              where empcode='1775';  퇴사로 주석처리                                         
     hinsa_log_print(0, "바. PL_write_erp, 1775 이광조 매니저 데이타 저장 완료..."); */
          
     hinsa_log_print(0, "★. PL_write_erp, erp_hap_ap04 테이블 -> EMPMASTER_TEMP에 이관...");  
     v_seqno = 1;
          
     /* EXEC SQL 
     SELECT nvl(MAX(seqno),0) + 1 INTO :v_seqno
       FROM EAI_PIMPMAS_TEMP
      WHERE h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
        AND h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (nvl(max(seqno),0)+1) into :b0  from EAI_PIMPMAS\
_TEMP where (h_year=substr(:b1,1,4) and h_month=substr(:b1,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )839;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
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


   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
                                    
     /* EXEC SQL 
     INSERT INTO EAI_PIMPMAS_TEMP 
               ( h_year,
                 h_month,
                 c_date,
                 module_gu,
                 cd_data,
                 seqno,
                 seqln,
                 ifsys,
                 createddate,
                 empcode,
                 empname,
                 trans_gu,
                 regno,
                 defaultdept,
                 empbdate,
                 empedate,
                 email,
                 telno,
                 extno,
                 paycl,
                 rank,
                 payra,
                 title,
                 assign,
                 zipcode,
                 bankaccount,
                 bankgubun,
                 superempcode,
                 valid,
                 address,
                 descr,
                 reference1,
                 reference2,
                 reference3,
                 reference4,
                 reference5,
                 createdby,
                 lastupdateddate,
                 lastupdatedby,
                 sitecode,
                 reference6,
                 reference7,
                 reference8,
                 reference9,
                 reference10 )
          SELECT substr(a.trandate,1,4) h_year,
                 substr(a.trandate,5,2) h_month,
                 substr(a.trandate,1,8) c_date,
                 'AP'                   module_gu,
                 'B19'                  cd_data,
                 :v_seqno               seqno,
                 rownum                 seqln,
                 'HRIS'                 ifsys,
                 TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') createddate,
                 a.empcode      empcode,
                 a.empname      empname,
                 'C'            trans_gu,
                 a.regno        regno,
                 a.defaultdept  defaultdept, 
                 a.empbdate     empbdate,
                 a.empedate     empedate,
                 ''             email,
                 a.telno        telno,
                 ''             extno,
                 ' '            paycl, --b.paycl paycl,
                 a.rank         rank,
                 b.jobpayra     jobpayra, 
                 a.title        title,
                 a.assign       assign,
                 a.zipcode      zipcode,
                 a.bankaccount  bankaccount,
                 a.bankgubun    bankgubun,
                 a.superempcode superempcode,
                 a.valid        valid,
                 a.address      address,
                 ''             descr,
                 DECODE(a.reference1,'09','비서','') reference1,
                 ''             reference2,
                 ''             reference3,
                 ''             reference4, 
                 ''             reference5,
                 'INSA'         createdby,
                 TO_CHAR(SYSDATE,'YYYYMMDD') lastupdateddate,
                 'INSA'         lastupdatedby,
                 a.sitecode     sitecode,
                 ''             reference6,
                 ''             reference7,
                 ''             reference8, 
                 ''             reference9,
                 ''             reference10
            FROM erp_hap_ap04 a, pimpmas b
           WHERE trandate  = :FGP_inter_ctrl->v_dt_create
             and a.empcode = b.empno
             and Trim(b.pstate) is not null; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into EAI_PIMPMAS_TEMP (h_year,h_month,c_date,module_gu,cd_dat\
a,seqno,seqln,ifsys,createddate,empcode,empname,trans_gu,regno,defaultdept,e\
mpbdate,empedate,email,telno,extno,paycl,rank,payra,title,assign,zipcode,ban\
kaccount,bankgubun,superempcode,valid,address,descr,reference1,reference2,re\
ference3,reference4,reference5,createdby,lastupdateddate,lastupdatedby,sitec\
ode,reference6,reference7,reference8,reference9,reference10)select substr(a.\
trandate,1,4) h_year ,substr(a.trandate,5,2) h_month ,substr(a.trandate,1,8)\
 c_date ,'AP' module_gu ,'B19' cd_data ,:b0 seqno ,rownum seqln ,'HRIS' ifsy\
s ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') createddate ,a.empcode empcode ,a.emp\
name empname ,'C' trans_gu ,a.regno regno ,a.defaultdept defaultdept ,a.empb\
date empbdate ,a.empedate empedate ,'' email ,a.telno telno ,'' extno ,' ' p\
aycl ,a.rank rank ,b.jobpayra jobpayra ,a.title title ,a.assign assign ,a.zi\
pcode zipcode ,a.bankaccount bankaccount ,a.bankgubun bankgubun ,a.superempc\
ode superempcode ,a.valid valid ,a.address a");
     sqlstm.stmt = "ddress ,'' descr ,DECODE(a.reference1,'09','비서','') r\
eference1 ,'' reference2 ,'' reference3 ,'' reference4 ,'' reference5 ,'INSA'\
 createdby ,TO_CHAR(SYSDATE,'YYYYMMDD') lastupdateddate ,'INSA' lastupdatedby\
 ,a.sitecode sitecode ,'' reference6 ,'' reference7 ,'' reference8 ,'' refere\
nce9 ,'' reference10  from erp_hap_ap04 a ,pimpmas b where ((trandate=:b1 and\
 a.empcode=b.empno) and trim(b.pstate) is  not null )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )866;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
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

  /* 2013.03.19 dsa2000 Add */
      
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     
     /*=======================================================
       dsa2000  2014.03.  도급인력 SAP 인터페이스 위해 추가 */
     v_seqln = 0;
          
     /* EXEC SQL 
     SELECT Count(*) INTO :v_seqln
       FROM EAI_PIMPMAS_TEMP
      WHERE h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
        AND h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2)
        AND C_Date  = :FGP_inter_ctrl->v_dt_create
        AND Seqno   = :v_seqno
        AND Empcode Not like 'U%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from EAI_PIMPMAS_TEMP where \
((((h_year=substr(:b1,1,4) and h_month=substr(:b1,5,2)) and C_Date=:b1) and S\
eqno=:b4) and Empcode not like 'U%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )889;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_seqln;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
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


                   
     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }    
     
     printf("v_seqln : %d\n",v_seqln);      
     
     /* EXEC SQL 
     INSERT INTO EAI_PIMPMAS_TEMP 
               ( h_year,
                 h_month,
                 c_date,
                 module_gu,
                 cd_data,
                 seqno,
                 seqln,
                 ifsys,
                 createddate,
                 empcode,
                 empname,
                 trans_gu,
                 regno,
                 defaultdept,
                 empbdate,
                 empedate,
                 email,
                 telno,
                 extno,
                 paycl,
                 rank,
                 payra,
                 title,
                 assign,
                 zipcode,
                 bankaccount,
                 bankgubun,
                 superempcode,
                 valid,
                 address,
                 descr,
                 reference1,
                 reference2,
                 reference3,
                 reference4,
                 reference5,
                 createdby,
                 lastupdateddate,
                 lastupdatedby,
                 sitecode,
                 reference6,
                 reference7,
                 reference8,
                 reference9,
                 reference10 )     
          Select To_Char(Sysdate,'YYYY')     H_Year,
                 To_Char(Sysdate,'MM')       H_Month,
                 To_Char(Sysdate,'YYYYMMDD') C_Date,
                 'AP'                        Module_Gu,
                 'B19'                       Cd_Data,
                 :v_seqno                    Seqno,
                (:v_seqln + rownum)          Seqln,  /oPimpmas 총계 이후 값으로 .o/
                 'HRIS'                      Ifsys,
                 To_Char(Sysdate,'YYYYMMDDHH24MISS') Createddate,
                 Empno    Empcode,
                 Kname    Empname,
                 'C'      Trans_Gu,
                 NVL(REPLACE(A.juminid, '-'), '9999999999999') Regno,
                 Fincode  Defaultdept, 
                 /oEmpdate  Empbdate,  Retdate  Empedate, 2014.06.23.hjku. U사번일 경우 퇴직일자 default setting 추가..회계팀 요청.o/
                 NVL(empdate,'00000000') Empbdate,                      -- 입사일
                 NVL(retdate,'20501231') Empedate,                      -- 퇴직일
                 ''       Email,
                 Otel     Telno,
                 ''       Extno,
                 ' '      Paycl,
                 ' '      Rank,
                 Payra    Jobpayra, 
                 '팀원'   Title,
                 'N'      Assign,
                 '  '     Zipcode,
                 '  '     Bankaccount,
                 '  '     Bankgubun,
                 ''       Superempcode, /o따로 업데이트 o/
                 /oDecode(Retdate,Null,'A','')  Valid,  2015.10.23.hjku.. 퇴직일 종료되지 않으면 정상적으로 전송 o/
                 case when retdate is null or retdate >= to_char(sysdate,'YYYYMMDD') then 'A' else '' end valid,
                 '서울'   Address,
                 ''       Descr,
                 ''       Reference1,
                 ''       Reference2,
                 ''       Reference3,
                 ''       Reference4, 
                 ''       Reference5,
                 'INSA'   Createdby,
                 To_Char(Sysdate,'YYYYMMDD') Lastupdateddate,
                 'INSA'   Lastupdatedby,
                 'T001'   Sitecode,
                 ''       Reference6,
                 ''       Reference7,
                 ''       Reference8, 
                 ''       Reference9,
                 ''       Reference10
            From Pzsubmas A, Pycdept B
		   Where A.Orgnum   = B.Orgnum 
		     And A.Deptcode = B.Deptcode
		     And A.Empno in (select distinct empno from poskmail where empno like 'U%'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "insert into EAI_PIMPMAS_TEMP (h_year,h_month,c_date,module_gu,cd_dat\
a,seqno,seqln,ifsys,createddate,empcode,empname,trans_gu,regno,defaultdept,e\
mpbdate,empedate,email,telno,extno,paycl,rank,payra,title,assign,zipcode,ban\
kaccount,bankgubun,superempcode,valid,address,descr,reference1,reference2,re\
ference3,reference4,reference5,createdby,lastupdateddate,lastupdatedby,sitec\
ode,reference6,reference7,reference8,reference9,reference10)select To_Char(S\
ysdate,'YYYY') H_Year ,To_Char(Sysdate,'MM') H_Month ,To_Char(Sysdate,'YYYYM\
MDD') C_Date ,'AP' Module_Gu ,'B19' Cd_Data ,:b0 Seqno ,(:b1+rownum) Seqln ,\
'HRIS' Ifsys ,To_Char(Sysdate,'YYYYMMDDHH24MISS') Createddate ,Empno Empcode\
 ,Kname Empname ,'C' Trans_Gu ,NVL(REPLACE(A.juminid,'-'),'9999999999999') R\
egno ,Fincode Defaultdept ,NVL(empdate,'00000000') Empbdate ,NVL(retdate,'20\
501231') Empedate ,'' Email ,Otel Telno ,'' Extno ,' ' Paycl ,' ' Rank ,Payr\
a Jobpayra ,'팀원' Title ,'N' Assign ,'  ' Zipcode ,'  ' Bankaccount ,'  ' B\
ankgubun ,'' Superempcode , case  when (retd");
     sqlstm.stmt = "ate is null  or retdate>=to_char(sysdate,'YYYYMMDD')) t\
hen 'A' else ''  end  valid ,'서울' Address ,'' Descr ,'' Reference1 ,'' Refe\
rence2 ,'' Reference3 ,'' Reference4 ,'' Reference5 ,'INSA' Createdby ,To_Cha\
r(Sysdate,'YYYYMMDD') Lastupdateddate ,'INSA' Lastupdatedby ,'T001' Sitecode \
,'' Reference6 ,'' Reference7 ,'' Reference8 ,'' Reference9 ,'' Reference10  \
from Pzsubmas A ,Pycdept B where ((A.Orgnum=B.Orgnum and A.Deptcode=B.Deptcod\
e) and A.Empno in (select distinct empno  from poskmail where empno like 'U%'\
))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )924;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_seqln;
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


                 
     hinsa_log_print(0, "바. 도급인력내역 EAI_PIMPMAS_TEMP Insert...");
     
     
     /*2018.12.14. 2018.12.31 : CEO(M213) 운영총괄(M214) 센터장(M220) 결재자->경영기획실장(M216)으로 강제 변경.. 윤진석M 요청*/
     /* EXEC SQL 
     update EAI_PIMPMAS_TEMP set superempcode = 'M216'
      where c_date  = :FGP_inter_ctrl->v_dt_create
        and seqno   = :v_seqno
        and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
        and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2)
        and superempcode in ('M213','M214','M220'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update EAI_PIMPMAS_TEMP  set superempcode='M216' where \
((((c_date=:b0 and seqno=:b1) and h_year=substr(:b0,1,4)) and h_month=substr(\
:b0,5,2)) and superempcode in ('M213','M214','M220'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )947;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
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


        
     if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
           STRINIT(&FL_Line);
           sprintf(FL_Line, "CEO 결재자 처리 : Oracle 에러 : %s", SQLERRM);
           hinsa_log_print(0, FL_Line);
           return (FAILURE);
     }  


     /* 도급인력 직상위자 업데이트 dsa2000 */
     /* EXEC SQL        
     Update Eai_Pimpmas_Temp M 
        Set Superempcode = (Select Min(Superempcode)
                              From Eai_Pimpmas_Temp A, Pzsubmas B, Pycdept C
                             Where A.h_year      = substr(:FGP_inter_ctrl->v_dt_create,1,4)
                               And A.h_month     = substr(:FGP_inter_ctrl->v_dt_create,5,2)
                               And A.C_Date      = :FGP_inter_ctrl->v_dt_create
                               And A.Payra      >= 'C11' 
                               And A.Valid       = 'A'   
                               and A.seqno       = :v_seqno
                               And B.Orgnum      = C.Orgnum
                               And B.Deptcode    = C.Deptcode
                               And A.Defaultdept = C.Fincode
                               And B.Empno       = M.Empcode
                               And A.Empcode not like 'U%'                               
                             Group By B.empno, C.Fincode)
      Where h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
        and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2)
        And C_Date  = :FGP_inter_ctrl->v_dt_create            
        And Valid   = 'A'   
        and seqno   = :v_seqno  
        And Empcode like 'U%'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Eai_Pimpmas_Temp M  set Superempcode=(select min\
(Superempcode)  from Eai_Pimpmas_Temp A ,Pzsubmas B ,Pycdept C where ((((((((\
((A.h_year=substr(:b0,1,4) and A.h_month=substr(:b0,5,2)) and A.C_Date=:b0) a\
nd A.Payra>='C11') and A.Valid='A') and A.seqno=:b3) and B.Orgnum=C.Orgnum) a\
nd B.Deptcode=C.Deptcode) and A.Defaultdept=C.Fincode) and B.Empno=M.Empcode)\
 and A.Empcode not like 'U%') group by B.empno,C.Fincode) where (((((h_year=s\
ubstr(:b0,1,4) and h_month=substr(:b0,5,2)) and C_Date=:b0) and Valid='A') an\
d seqno=:b3) and Empcode like 'U%')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )978;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[4] = (unsigned long )11;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[6] = (unsigned long )11;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
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

	
     
     hinsa_log_print(0, "바. 도급인력 직상위자 변경 update...");


     /* EXEC SQL select to_char(sysdate-1,'yyyymmdd') into v_date from dual; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char((sysdate-1),'yyyymmdd') into :b0  from d\
ual ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1025;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_date;
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

      
     
     /* 인사마스터 수정됐을경우 update */     
     /* EXEC SQL 
     select count(*) into :v_cnt from EAI_PIMPMAS_TEMP
      where empcode in (select a.empno
                          from pimpmas a
                         where a.writetime >=  :v_date
                           and a.writetime <   :FGP_inter_ctrl->v_dt_create) /ojissi to_char(sysdate,'YYYYMMDDHH24MISS'))o/
       and c_date = :FGP_inter_ctrl->v_dt_create
       and seqno = :v_seqno
       and h_year = substr(:FGP_inter_ctrl->v_dt_create,1,4)
       and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from EAI_PIMPMAS_TEMP where \
((((empcode in (select a.empno  from pimpmas a where (a.writetime>=:b1 and a.\
writetime<:b2)) and c_date=:b2) and seqno=:b4) and h_year=substr(:b2,1,4)) an\
d h_month=substr(:b2,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1044;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[6] = (unsigned long )11;
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

  
       
     
     /* EXEC SQL 
     update EAI_PIMPMAS_TEMP set trans_gu = '2'
      where empcode in (select a.empno
                        from pimpmas a
                        where a.writetime >=  :v_date
                          and a.writetime <   :FGP_inter_ctrl->v_dt_create) /ojissi to_char(sysdate,'YYYYMMDDHH24MISS'))o/
       and c_date = :FGP_inter_ctrl->v_dt_create
       and seqno  = :v_seqno
       and h_year =  substr(:FGP_inter_ctrl->v_dt_create,1,4)
       and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update EAI_PIMPMAS_TEMP  set trans_gu='2' where ((((emp\
code in (select a.empno  from pimpmas a where (a.writetime>=:b0 and a.writeti\
me<:b1)) and c_date=:b1) and seqno=:b3) and h_year=substr(:b1,1,4)) and h_mon\
th=substr(:b1,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1087;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[4] = (unsigned long )11;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
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

  
       
     printf("                      - 인사마스터 수정건수 : [%d] \n", v_cnt);  
     
     /* 도급인력마스터 수정됐을경우 update dsa2000  2*/     
     /* EXEC SQL 
     select count(*) into :v_cnt from EAI_PIMPMAS_TEMP
      where empcode in (select a.empno
                          from Pzsubmas a
                         where a.writetime >=  :v_date
                           and a.writetime <   :FGP_inter_ctrl->v_dt_create) /ojissi to_char(sysdate,'YYYYMMDDHH24MISS'))o/
        and c_date  = :FGP_inter_ctrl->v_dt_create
        and seqno   = :v_seqno
        and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
        and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from EAI_PIMPMAS_TEMP where \
((((empcode in (select a.empno  from Pzsubmas a where (a.writetime>=:b1 and a\
.writetime<:b2)) and c_date=:b2) and seqno=:b4) and h_year=substr(:b2,1,4)) a\
nd h_month=substr(:b2,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1126;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[6] = (unsigned long )11;
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

         
     
     /* EXEC SQL 
     update EAI_PIMPMAS_TEMP set trans_gu = '2'
      where empcode in (select a.empno
                          from Pzsubmas a
                         where a.writetime >=  :v_date
                           and a.writetime <   :FGP_inter_ctrl->v_dt_create) /ojissi to_char(sysdate,'YYYYMMDDHH24MISS'))o/
        and c_date  = :FGP_inter_ctrl->v_dt_create
        and seqno   = :v_seqno
        and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
        and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update EAI_PIMPMAS_TEMP  set trans_gu='2' where ((((emp\
code in (select a.empno  from Pzsubmas a where (a.writetime>=:b0 and a.writet\
ime<:b1)) and c_date=:b1) and seqno=:b3) and h_year=substr(:b1,1,4)) and h_mo\
nth=substr(:b1,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1169;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[4] = (unsigned long )11;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
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

  
       
     printf("                      - 도급인력마스터 수정건수 : [%d] \n", v_cnt); 
     
          
     /* 발령마스터 수정됐을경우 update : dsa2000 SQL Tunning */ 
     /* EXEC SQL 
     select count(*) into :v_cnt from EAI_PIMPMAS_TEMP
      where empcode in (select c.empno                
                          from (select * from EAI_PIMPMAS_TEMP 
                                 where h_year  = substr(:v_date,1,4) 
                                   and h_month = substr(:v_date,5,2)
                                   and C_DATE  = :v_date                                      
                                   and  lastupdateddate = :v_date ) a, 
                               (select * from EAI_PIMPMAS_TEMP 
                                 where h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4) 
                                   and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2)
                                   and C_DATE  = :FGP_inter_ctrl->v_dt_create
                                   and lastupdateddate = :FGP_inter_ctrl->v_dt_create ) b, 
                               pimpmas c
                         where a.empcode = b.empcode
                           and a.empcode = c.empno
                           and a.superempcode <> b.superempcode
                           and c.pstate < '80' )   
       and c_date  = :FGP_inter_ctrl->v_dt_create
       and seqno   = :v_seqno
       and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
       and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from EAI_PIMPMAS_TEMP where \
((((empcode in (select c.empno  from (select *  from EAI_PIMPMAS_TEMP where (\
((h_year=substr(:b1,1,4) and h_month=substr(:b1,5,2)) and C_DATE=:b1) and las\
tupdateddate=:b1)) a ,(select *  from EAI_PIMPMAS_TEMP where (((h_year=substr\
(:b5,1,4) and h_month=substr(:b5,5,2)) and C_DATE=:b5) and lastupdateddate=:b\
5)) b ,pimpmas c where (((a.empcode=b.empcode and a.empcode=c.empno) and a.su\
perempcode<>b.superempcode) and c.pstate<'80')) and c_date=:b5) and seqno=:b1\
0) and h_year=substr(:b5,1,4)) and h_month=substr(:b5,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1208;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)v_date;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_date;
     sqlstm.sqhstl[3] = (unsigned long )9;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)v_date;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[6] = (unsigned long )11;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[7] = (unsigned long )11;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[8] = (unsigned long )11;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[9] = (unsigned long )11;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[11] = (unsigned long )11;
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[12] = (unsigned long )11;
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
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
     update EAI_PIMPMAS_TEMP set trans_gu = '2'
      where empcode in (select c.empno                
                          from (select * from EAI_PIMPMAS_TEMP 
                                 where h_year  = substr(:v_date,1,4) 
                                   and h_month = substr(:v_date,5,2)
                                   and C_DATE  = :v_date                                      
                                   and  lastupdateddate = :v_date ) a, 
                               (select * from EAI_PIMPMAS_TEMP 
                                 where h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4) 
                                   and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2)
                                   and C_DATE  = :FGP_inter_ctrl->v_dt_create
                                   and lastupdateddate = :FGP_inter_ctrl->v_dt_create ) b, 
                               pimpmas c
                         where a.empcode      =  b.empcode
                           and a.empcode      =  c.empno
                           and a.superempcode <> b.superempcode
                           and c.pstate       < '80' )  
       and c_date  = :FGP_inter_ctrl->v_dt_create
       and seqno   = :v_seqno
       and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
       and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update EAI_PIMPMAS_TEMP  set trans_gu='2' where ((((emp\
code in (select c.empno  from (select *  from EAI_PIMPMAS_TEMP where (((h_yea\
r=substr(:b0,1,4) and h_month=substr(:b0,5,2)) and C_DATE=:b0) and lastupdate\
ddate=:b0)) a ,(select *  from EAI_PIMPMAS_TEMP where (((h_year=substr(:b4,1,\
4) and h_month=substr(:b4,5,2)) and C_DATE=:b4) and lastupdateddate=:b4)) b ,\
pimpmas c where (((a.empcode=b.empcode and a.empcode=c.empno) and a.superempc\
ode<>b.superempcode) and c.pstate<'80')) and c_date=:b4) and seqno=:b9) and h\
_year=substr(:b4,1,4)) and h_month=substr(:b4,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1275;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)v_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)v_date;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_date;
     sqlstm.sqhstl[3] = (unsigned long )9;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[4] = (unsigned long )11;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[6] = (unsigned long )11;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[7] = (unsigned long )11;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[8] = (unsigned long )11;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[10] = (unsigned long )11;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[11] = (unsigned long )11;
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
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
     printf(":v_date                      : [%s] \n", v_date);
     printf(":FGP_inter_ctrl->v_dt_create : [%s] \n", FGP_inter_ctrl->v_dt_create.arr);
     printf(":v_seqno                     : [%d] \n", v_seqno);    */
     printf("                      - 발령마스터 수정건수 : [%d] \n", v_cnt);
     
     /*급여마스터 수정됐을경우 update */
     /* EXEC SQL 
     select count(*) into :v_cnt 
       from EAI_PIMPMAS_TEMP
      where empcode in (select a.empno
                          from pkmpmas a
                         where a.bankchtime >=:v_date
                           and a.bankchtime < :FGP_inter_ctrl->v_dt_create)
       and c_date  = :FGP_inter_ctrl->v_dt_create
       and seqno   = :v_seqno
       and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
       and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from EAI_PIMPMAS_TEMP where \
((((empcode in (select a.empno  from pkmpmas a where (a.bankchtime>=:b1 and a\
.bankchtime<:b2)) and c_date=:b2) and seqno=:b4) and h_year=substr(:b2,1,4)) \
and h_month=substr(:b2,5,2))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1338;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)v_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[5] = (unsigned long )11;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[6] = (unsigned long )11;
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

  
               
      /* EXEC SQL 
      update EAI_PIMPMAS_TEMP set trans_gu = '2'
       where empcode in (select a.empno
                          from pkmpmas a
                          where a.bankchtime >=:v_date
                            and a.bankchtime < :FGP_inter_ctrl->v_dt_create)
         and c_date  = :FGP_inter_ctrl->v_dt_create
         and seqno   = :v_seqno
         and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
         and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 20;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update EAI_PIMPMAS_TEMP  set trans_gu='2' where ((((em\
pcode in (select a.empno  from pkmpmas a where (a.bankchtime>=:b0 and a.bankc\
htime<:b1)) and c_date=:b1) and seqno=:b3) and h_year=substr(:b1,1,4)) and h_\
month=substr(:b1,5,2))";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )1381;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqhstv[0] = (unsigned char  *)v_date;
      sqlstm.sqhstl[0] = (unsigned long )9;
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
      sqlstm.sqhstl[1] = (unsigned long )11;
      sqlstm.sqhsts[1] = (         int  )0;
      sqlstm.sqindv[1] = (         short *)0;
      sqlstm.sqinds[1] = (         int  )0;
      sqlstm.sqharm[1] = (unsigned long )0;
      sqlstm.sqadto[1] = (unsigned short )0;
      sqlstm.sqtdso[1] = (unsigned short )0;
      sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
      sqlstm.sqhstl[2] = (unsigned long )11;
      sqlstm.sqhsts[2] = (         int  )0;
      sqlstm.sqindv[2] = (         short *)0;
      sqlstm.sqinds[2] = (         int  )0;
      sqlstm.sqharm[2] = (unsigned long )0;
      sqlstm.sqadto[2] = (unsigned short )0;
      sqlstm.sqtdso[2] = (unsigned short )0;
      sqlstm.sqhstv[3] = (unsigned char  *)&v_seqno;
      sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
      sqlstm.sqhsts[3] = (         int  )0;
      sqlstm.sqindv[3] = (         short *)0;
      sqlstm.sqinds[3] = (         int  )0;
      sqlstm.sqharm[3] = (unsigned long )0;
      sqlstm.sqadto[3] = (unsigned short )0;
      sqlstm.sqtdso[3] = (unsigned short )0;
      sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
      sqlstm.sqhstl[4] = (unsigned long )11;
      sqlstm.sqhsts[4] = (         int  )0;
      sqlstm.sqindv[4] = (         short *)0;
      sqlstm.sqinds[4] = (         int  )0;
      sqlstm.sqharm[4] = (unsigned long )0;
      sqlstm.sqadto[4] = (unsigned short )0;
      sqlstm.sqtdso[4] = (unsigned short )0;
      sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
      sqlstm.sqhstl[5] = (unsigned long )11;
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

    
      
      printf("                      - 급여마스터 수정건수 : [%d] \n", v_cnt);


   /*===================================================================*/  
      hinsa_log_print(0, "바. 신규입사자 Insert...");  

   /* 신규 입사자 */
   /*********************************** ch.k.j 추가 
    * 최초입사일자를 과거로 두고 발령을 내었을때 문제가 발생하여 추가 함
    ex) 사번 : M100 => 2006년 01월 06일 최초입사일을 5일로 하고 발령등록 : 최초입사일이 6일꺼 (당일 전날)꺼만 '1'로 update 하기 때문에 문제 발생*/
     /* EXEC SQL 
     select count(*) into :v_cnt from EAI_PIMPMAS_TEMP
      where empcode in ( select empcode                      
                           from EAI_PIMPMAS_TEMP                 
                          where h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4) 
                            and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2) 
                            and c_date  = :FGP_inter_ctrl->v_dt_create             
                         minus                               
                         select empcode                      
                           from EAI_PIMPMAS_TEMP                 
                          where h_year  = substr(:v_date,1,4) 
                            and h_month = substr(:v_date,5,2)             
                            and c_date  = :v_date   )
       and c_date   =  :FGP_inter_ctrl->v_dt_create
       and seqno    =  :v_seqno
       and h_year   =  substr(:FGP_inter_ctrl->v_dt_create,1,4)
       and h_month  =  substr(:FGP_inter_ctrl->v_dt_create,5,2)
       and empbdate >= to_char(to_date(:FGP_inter_ctrl->v_dt_create,'YYYYMMDD') -15,'YYYYMMDD') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from EAI_PIMPMAS_TEMP where \
(((((empcode in (select empcode  from EAI_PIMPMAS_TEMP where ((h_year=substr(\
:b1,1,4) and h_month=substr(:b1,5,2)) and c_date=:b1) minus select empcode  f\
rom EAI_PIMPMAS_TEMP where ((h_year=substr(:b4,1,4) and h_month=substr(:b4,5,\
2)) and c_date=:b4)) and c_date=:b1) and seqno=:b8) and h_year=substr(:b1,1,4\
)) and h_month=substr(:b1,5,2)) and empbdate>=to_char((to_date(:b1,'YYYYMMDD'\
)-15),'YYYYMMDD'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1420;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&v_cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)v_date;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)v_date;
     sqlstm.sqhstl[5] = (unsigned long )9;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)v_date;
     sqlstm.sqhstl[6] = (unsigned long )9;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[7] = (unsigned long )11;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[9] = (unsigned long )11;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[10] = (unsigned long )11;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[11] = (unsigned long )11;
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
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

               
                   
   
     /*2013.12.11. 암호화 적용후 oracle 버그로 인하여 인프라팀 신동호 차장 제안으로 힌트 추가함.
     update EAI_PIMPMAS_TEMP set trans_gu = '1' */
     /* EXEC SQL 
     update /o+ opt_param('hash_join_enabled','false') o/ HPER.EAI_PIMPMAS_TEMP  
        set trans_gu = '1'
      where empcode in ( select empcode                      
                           from EAI_PIMPMAS_TEMP                 
                          where h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4) 
                            and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2) 
                            and c_date  = :FGP_inter_ctrl->v_dt_create             
                          minus                               
                         select empcode                      
                           from EAI_PIMPMAS_TEMP                 
                          where h_year  = substr(:v_date,1,4) 
                            and h_month = substr(:v_date,5,2)             
                            and c_date  = :v_date   )
        and c_date   =  :FGP_inter_ctrl->v_dt_create
        and seqno    =  :v_seqno
        and h_year   =  substr(:FGP_inter_ctrl->v_dt_create,1,4)
        and h_month  =  substr(:FGP_inter_ctrl->v_dt_create,5,2)
        and empbdate >= to_char(to_date(:FGP_inter_ctrl->v_dt_create,'YYYYMMDD') -15,'yyyymmdd') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update  /*+  opt_param('hash_join_enabled','false')  */\
 HPER.EAI_PIMPMAS_TEMP  set trans_gu='1' where (((((empcode in (select empcod\
e  from EAI_PIMPMAS_TEMP where ((h_year=substr(:b0,1,4) and h_month=substr(:b\
0,5,2)) and c_date=:b0) minus select empcode  from EAI_PIMPMAS_TEMP where ((h\
_year=substr(:b3,1,4) and h_month=substr(:b3,5,2)) and c_date=:b3)) and c_dat\
e=:b0) and seqno=:b7) and h_year=substr(:b0,1,4)) and h_month=substr(:b0,5,2)\
) and empbdate>=to_char((to_date(:b0,'YYYYMMDD')-15),'yyyymmdd'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1483;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)v_date;
     sqlstm.sqhstl[3] = (unsigned long )9;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)v_date;
     sqlstm.sqhstl[4] = (unsigned long )9;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)v_date;
     sqlstm.sqhstl[5] = (unsigned long )9;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[6] = (unsigned long )11;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[8] = (unsigned long )11;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[9] = (unsigned long )11;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[10] = (unsigned long )11;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
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


          
     printf("                      - 신규입사자 입력건수 : [%d] \n", v_cnt); 
                
     FGP_inter_ctrl->v_cnt_line = SQL_PROCESS_COUNT;
     hinsa_log_print(0, "바. PL_write_erp, erp_hap_ap04 테이블 -> EAI_PIMPMAS_TEMP에 완료...");
     
     /* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
     /* 사원코드 조회 : 은아 */
     /* EXEC SQL DECLARE cur_03 CURSOR FOR
        SELECT A.empcode
          FROM EAI_PIMPMAS_TEMP A
         WHERE c_date  = :FGP_inter_ctrl->v_dt_create
           and seqno   = :v_seqno
           and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
           and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

             
     /* EXEC SQL OPEN cur_03; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0041;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1542;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
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


   
     if (SQLCODE != SQL_OK)
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
   
     FL_count = 0;
     while(TRUE)
     {
          /* EXEC SQL FETCH cur_03 INTO :v_empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1573;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&v_empno;
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


          
          if (SQLCODE == SQL_NO_DATA)
            break;
          
          /* 사원코드에 맞는 count 가져와서 v_count에 담기 */ 
          /* exec sql 
          select count(*) into :v_count 
            from (select distinct m.empno, h.addeptcode deptcode, i.fincode
                    from pimpmas m, pihorga g, pihanno h, pycdept i                                         
                   where m.pstate < '60'                                     
                     and g.orgym  = to_char(sysdate,'yyyymm')                          
                     and m.empno  = g.empno                                           
                     and m.orgnum = g.orgnum                                          
                     and g.gubun  = '0'                                             
                     and g.adpayrayn = 'Y'   
                     and h.orgnum = m.orgnum
                     and h.empno = m.empno
                     and h.ancode = '233'
                     and h.addeptcode = g.deptcode
                     and i.orgnum = m.orgnum
                     and i.deptcode = h.addeptcode
                   union
                  select c.empno, c.jobdept deptcode, d.fincode
                    from pimpmas c, pycdept d
                   where c.deptcode <> c.jobdept
                     and c.orgnum = (select value1
                                       from pimvari
                                      where gubun = '00'
                                        and sgubun = '0001')
                     and c.orgnum = d.orgnum
                     and c.jobdept = d.deptcode) a
           where a.empno = :v_empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 20;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select count(*)  into :b0  from (select distinct m\
.empno ,h.addeptcode deptcode ,i.fincode  from pimpmas m ,pihorga g ,pihanno \
h ,pycdept i where (((((((((((m.pstate<'60' and g.orgym=to_char(sysdate,'yyyy\
mm')) and m.empno=g.empno) and m.orgnum=g.orgnum) and g.gubun='0') and g.adpa\
yrayn='Y') and h.orgnum=m.orgnum) and h.empno=m.empno) and h.ancode='233') an\
d h.addeptcode=g.deptcode) and i.orgnum=m.orgnum) and i.deptcode=h.addeptcode\
) union select c.empno ,c.jobdept deptcode ,d.fincode  from pimpmas c ,pycdep\
t d where (((c.deptcode<>c.jobdept and c.orgnum=(select value1  from pimvari \
where (gubun='00' and sgubun='0001'))) and c.orgnum=d.orgnum) and c.jobdept=d\
.deptcode)) a where a.empno=:b1";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1592;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&v_count;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&v_empno;
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


                              
          if  (v_count >= 1) 
          {
               /* EXEC SQL update EAI_PIMPMAS_TEMP set reference4 = 
                                  (select a.fincode
                                     from (select distinct m.empno, h.addeptcode deptcode, i.fincode
                                             from pimpmas m, pihorga g, pihanno h, pycdept i                                         
                                            where m.pstate     < '60'                                     
                                              and g.orgym      = to_char(sysdate,'yyyymm')                          
                                              and m.empno      = g.empno                                           
                                              and m.orgnum     = g.orgnum                                          
                                              and g.gubun      = '0'                                             
                                              and g.adpayrayn  = 'Y'   
                                              and h.orgnum     = m.orgnum
                                              and h.empno      = m.empno
                                              and h.ancode     = '233'
                                              and h.addeptcode = g.deptcode
                                              and i.orgnum     = m.orgnum
                                              and i.deptcode   = h.addeptcode
                                            union
                                           select a.empno, a.jobdept deptcode, b.fincode
                                             from pimpmas a, pycdept b
                                            where a.deptcode <> a.jobdept
                                              and a.orgnum = (select value1
                                                                from pimvari
                                                               where gubun = '00' and sgubun = '0001')
                                              and a.orgnum = b.orgnum
                                              and a.jobdept = b.deptcode) a
                                     where a.empno = :v_empno
                                       and rownum = 1 )
                        where empcode = :v_empno              
                          and c_date = :FGP_inter_ctrl->v_dt_create
                          and seqno = :v_seqno
                          and h_year = substr(:FGP_inter_ctrl->v_dt_create,1,4)
                          and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update EAI_PIMPMAS_TEMP  set reference4=(sele\
ct a.fincode  from (select distinct m.empno ,h.addeptcode deptcode ,i.fincode\
  from pimpmas m ,pihorga g ,pihanno h ,pycdept i where (((((((((((m.pstate<'\
60' and g.orgym=to_char(sysdate,'yyyymm')) and m.empno=g.empno) and m.orgnum=\
g.orgnum) and g.gubun='0') and g.adpayrayn='Y') and h.orgnum=m.orgnum) and h.\
empno=m.empno) and h.ancode='233') and h.addeptcode=g.deptcode) and i.orgnum=\
m.orgnum) and i.deptcode=h.addeptcode) union select a.empno ,a.jobdept deptco\
de ,b.fincode  from pimpmas a ,pycdept b where (((a.deptcode<>a.jobdept and a\
.orgnum=(select value1  from pimvari where (gubun='00' and sgubun='0001'))) a\
nd a.orgnum=b.orgnum) and a.jobdept=b.deptcode)) a where (a.empno=:b0 and row\
num=1)) where ((((empcode=:b0 and c_date=:b2) and seqno=:b3) and h_year=subst\
r(:b2,1,4)) and h_month=substr(:b2,5,2))";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1615;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&v_empno;
               sqlstm.sqhstl[0] = (unsigned long )7;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&v_empno;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
               sqlstm.sqhstl[2] = (unsigned long )11;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)&v_seqno;
               sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
               sqlstm.sqhstl[4] = (unsigned long )11;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
               sqlstm.sqhstl[5] = (unsigned long )11;
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


               
                if  ((SQLCODE != SQL_OK))
                {
                     STRINIT(&FL_Line);
                     sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
                     hinsa_log_print(0, FL_Line);
                     return (FAILURE);
                }
               
                FGP_inter_ctrl->v_cnt_line = SQL_PROCESS_COUNT;
                /*printf("                      - 겸직자[사번: %s]  부서정보 update : reference4. \n", v_empno.arr);
                hinsa_log_print(0, " - 겸직자[사번: %s]  부서정보 update 완료 : reference4.", v_empno.arr);*/
          }
      
          if  ( v_count >= 2 )
          {
               /* EXEC SQL 
               update EAI_PIMPMAS_TEMP set reference5 = 
                             (select a.fincode
                                from (select distinct m.empno, h.addeptcode deptcode, i.fincode  
                                        from pimpmas m, pihorga g, pihanno h, pycdept i                                         
                                       where m.pstate < '60'                                     
                                         and g.orgym  = to_char(sysdate,'yyyymm')                          
                                         and m.empno  = g.empno                                           
                                         and m.orgnum = g.orgnum                                          
                                         and g.gubun  = '0'                                             
                                         and g.adpayrayn = 'Y'   
                                         and h.orgnum = m.orgnum
                                         and h.empno = m.empno
                                         and h.ancode = '233'
                                         and h.addeptcode = g.deptcode
                                         and i.orgnum = m.orgnum
                                         and i.deptcode = h.addeptcode
                                       order by i.fincode desc) a
                                where a.empno = :v_empno
                                  and rownum = 1) 
                where empcode = :v_empno  
                  and c_date  = :FGP_inter_ctrl->v_dt_create
                  and seqno   = :v_seqno
                  and h_year  = substr(:FGP_inter_ctrl->v_dt_create,1,4)
                  and h_month = substr(:FGP_inter_ctrl->v_dt_create,5,2); */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 20;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update EAI_PIMPMAS_TEMP  set reference5=(sele\
ct a.fincode  from (select distinct m.empno ,h.addeptcode deptcode ,i.fincode\
  from pimpmas m ,pihorga g ,pihanno h ,pycdept i where (((((((((((m.pstate<'\
60' and g.orgym=to_char(sysdate,'yyyymm')) and m.empno=g.empno) and m.orgnum=\
g.orgnum) and g.gubun='0') and g.adpayrayn='Y') and h.orgnum=m.orgnum) and h.\
empno=m.empno) and h.ancode='233') and h.addeptcode=g.deptcode) and i.orgnum=\
m.orgnum) and i.deptcode=h.addeptcode) order by i.fincode desc  ) a where (a.\
empno=:b0 and rownum=1)) where ((((empcode=:b0 and c_date=:b2) and seqno=:b3)\
 and h_year=substr(:b2,1,4)) and h_month=substr(:b2,5,2))";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1654;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&v_empno;
               sqlstm.sqhstl[0] = (unsigned long )7;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&v_empno;
               sqlstm.sqhstl[1] = (unsigned long )7;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
               sqlstm.sqhstl[2] = (unsigned long )11;
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)&v_seqno;
               sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
               sqlstm.sqhstl[4] = (unsigned long )11;
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
               sqlstm.sqhstl[5] = (unsigned long )11;
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


     
          if  ((SQLCODE != SQL_OK))
          {
                STRINIT(&FL_Line);
                sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
                hinsa_log_print(0, FL_Line);
                return (FAILURE);
          }
   
          FGP_inter_ctrl->v_cnt_line = SQL_PROCESS_COUNT;
          hinsa_log_print(0, "겸직자 부서정보 update : reference5.");    
      }
       FL_count++;        
     }
     /* EXEC SQL CLOSE cur_03; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1693;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     /*** 2018.11.14 소속부서가 챕터이면서 CL이면 소속부서 직책/결재정보 인터페이스 : 윤진석M |이진석 이사***/
     /* EXEC SQL
     Update Eai_Pimpmas_Temp M
        Set (Payra, Title, Assign, Superempcode)
          = (Select Payra,
                    C.Codename,
                    'Y',
                    D.Superempcode
              From Pimpmas A, Pycdept B, Pyccode C,
                  (Select Y.Orgnum, Y.Deptcode, Empno Superempcode From Pimpmas X, Pycdept Y 
                    Where X.Orgnum=Y.Orgnum And X.deptcode=Y.Deptcode And Pstate<'80' And Payrayn='Y' ) D
             Where A.Orgnum=B.Orgnum And A.Deptcode=B.Deptcode 
               And Pstate<'80' And Payra='C12' And B.Tribegb='22'
               And M.Empcode = A.Empno
               And C.Codeid='I113' And C.Codeno=A.Payra
               And D.Orgnum=B.Orgnum And D.Deptcode=B.Extcode
               )
     Where H_Year=To_Char(Sysdate,'YYYY') And H_Month=To_Char(Sysdate,'MM') And C_Date=To_Char(Sysdate,'YYYYMMDD') 
       And M.Empcode In (Select Empno From Pimpmas A, Pycdept B
                          Where A.Orgnum=B.Orgnum And A.Deptcode=B.Deptcode And Pstate<'80' And Payra='C12' And B.Tribegb='22') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update Eai_Pimpmas_Temp M  set (Payra,Title,Assign,Supe\
rempcode)=(select Payra ,C.Codename ,'Y' ,D.Superempcode  from Pimpmas A ,Pyc\
dept B ,Pyccode C ,(select Y.Orgnum ,Y.Deptcode ,Empno Superempcode  from Pim\
pmas X ,Pycdept Y where (((X.Orgnum=Y.Orgnum and X.deptcode=Y.Deptcode) and P\
state<'80') and Payrayn='Y')) D where (((((((((A.Orgnum=B.Orgnum and A.Deptco\
de=B.Deptcode) and Pstate<'80') and Payra='C12') and B.Tribegb='22') and M.Em\
pcode=A.Empno) and C.Codeid='I113') and C.Codeno=A.Payra) and D.Orgnum=B.Orgn\
um) and D.Deptcode=B.Extcode)) where (((H_Year=To_Char(Sysdate,'YYYY') and H_\
Month=To_Char(Sysdate,'MM')) and C_Date=To_Char(Sysdate,'YYYYMMDD')) and M.Em\
pcode in (select Empno  from Pimpmas A ,Pycdept B where ((((A.Orgnum=B.Orgnum\
 and A.Deptcode=B.Deptcode) and Pstate<'80') and Payra='C12') and B.Tribegb='\
22')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1708;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }/* 2018.11.14 **********************************************************************************************/
     
     /* EXEC SQL 
     INSERT INTO EAI_PIMPMAS
               ( h_year,
                 h_month,
                 module_gu,
                 cd_data,
                 seqno,
                 seqln,
                 ifsys,
                 createddate,
                 empcode,
                 empname,
                 z_state,
                 regno,
                 defaultdept,
                 empbdate,
                 empedate,
                 email,
                 telno,
                 extno,
                 paycl,
                 rank,
                 payra,
                 title,
                 assign,
                 zipcode,
                 bankaccount,
                 bankgubun,
                 superempcode,
                 valid,
                 address,
                 descr,
                 reference1,
                 reference2,
                 reference3,
                 reference4,
                 reference5,
                 createdby,
                 lastupdateddate,
                 lastupdatedby,
                 sitecode,
                 reference6,
                 reference7,
                 reference8,
                 reference9,
                 reference10 )
         SELECT  h_year,
                 h_month,
                 module_gu,
                 cd_data,
                 seqno,
                 seqln,  /orownum seqln,o/                 
                 ifsys,
                 createddate,
                 empcode,
                 empname,
                 trans_gu,
                 regno,
                 defaultdept,
                 empbdate,
                 empedate,
                 email,
                 telno,
                 extno,
                 ' ' paycl,
                 rank,
                 payra,
                 title,
                 assign,
                 zipcode,
                 /o2015.02.16.hjku.. 회계팀 전송시에는 7자리 우편번호로 전송.. 8월까지.. SAP 정일권 차장 요청...
                 zipcode,
                 --2015.08.03.hjku.. 원래 데이타로 변경.. SAP 이진석 이사. 
                 case when length(zipcode)<=6 then substr(rpad(zipcode,6,' '),1,3)||'-'|| substr(rpad(zipcode,6,' '),4,3) else zipcode end zipcode, o/                      
                 bankaccount,
                 bankgubun,
                 superempcode,
                 valid,
                 address,
                 descr,
                 reference1,
                 reference2,
                 reference3,
                 reference4,
                 reference5,
                 createdby,
                 lastupdateddate,
                 lastupdatedby,
                 sitecode,
                 reference6,
                 reference7,
                 reference8,
                 reference9,
                 reference10
           FROM EAI_PIMPMAS_TEMP
          WHERE c_date   =  :FGP_inter_ctrl->v_dt_create
            and seqno    =  :v_seqno
            and h_year   =  substr(:FGP_inter_ctrl->v_dt_create,1,4)
            and h_month  =  substr(:FGP_inter_ctrl->v_dt_create,5,2)
            and trans_gu in ('1','2')   // k.j. **3.임시작업 
            ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 20;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into EAI_PIMPMAS (h_year,h_month,module_gu,cd_da\
ta,seqno,seqln,ifsys,createddate,empcode,empname,z_state,regno,defaultdept,em\
pbdate,empedate,email,telno,extno,paycl,rank,payra,title,assign,zipcode,banka\
ccount,bankgubun,superempcode,valid,address,descr,reference1,reference2,refer\
ence3,reference4,reference5,createdby,lastupdateddate,lastupdatedby,sitecode,\
reference6,reference7,reference8,reference9,reference10)select h_year ,h_mont\
h ,module_gu ,cd_data ,seqno ,seqln ,ifsys ,createddate ,empcode ,empname ,tr\
ans_gu ,regno ,defaultdept ,empbdate ,empedate ,email ,telno ,extno ,' ' payc\
l ,rank ,payra ,title ,assign ,zipcode ,bankaccount ,bankgubun ,superempcode \
,valid ,address ,descr ,reference1 ,reference2 ,reference3 ,reference4 ,refer\
ence5 ,createdby ,lastupdateddate ,lastupdatedby ,sitecode ,reference6 ,refer\
ence7 ,reference8 ,reference9 ,reference10  from EAI_PIMPMAS_TEMP where ((((c\
_date=:b0 and seqno=:b1) and h_year=substr(:b0,1,4)) and h_month=substr(:b0,5\
,2)) and trans_gu in ('1','2'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1723;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&v_seqno;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[2] = (unsigned long )11;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_inter_ctrl->v_dt_create);
     sqlstm.sqhstl[3] = (unsigned long )11;
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


                 
     if  ((SQLCODE != SQL_OK))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     return (SUCCESS);
}