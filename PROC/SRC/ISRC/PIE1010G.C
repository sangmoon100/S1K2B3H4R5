
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
    "pie1010g.pc"
};


static unsigned int sqlctx = 149619;


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
   unsigned char  *sqhstv[46];
   unsigned long  sqhstl[46];
            int   sqhsts[46];
            short *sqindv[46];
            int   sqinds[46];
   unsigned long  sqharm[46];
   unsigned long  *sqharc[46];
   unsigned short  sqadto[46];
   unsigned short  sqtdso[46];
} sqlstm = {12,46};

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
5,0,0,1,0,0,32,233,0,0,0,0,0,1,0,
20,0,0,2,0,0,32,258,0,0,0,0,0,1,0,
35,0,0,3,53,0,1,292,0,0,0,0,0,1,0,
50,0,0,4,0,0,32,297,0,0,0,0,0,1,0,
65,0,0,5,80,0,4,361,0,0,1,0,0,1,0,2,9,0,0,
84,0,0,6,80,0,4,386,0,0,1,0,0,1,0,2,9,0,0,
103,0,0,7,173,0,4,411,0,0,4,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
134,0,0,8,99,0,4,444,0,0,2,0,0,1,0,2,9,0,0,2,9,0,0,
157,0,0,9,404,0,3,478,0,0,6,6,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,0,0,1,9,0,0,1,
9,0,0,
196,0,0,10,457,0,3,543,0,0,6,6,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,0,0,1,9,0,0,
1,9,0,0,
235,0,0,11,245,0,5,592,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
258,0,0,12,71,0,5,612,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
281,0,0,13,61,0,2,628,0,0,1,1,0,1,0,1,9,0,0,
300,0,0,14,56,0,4,653,0,0,2,1,0,1,0,2,4,0,0,1,9,0,0,
323,0,0,15,383,0,5,713,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
346,0,0,16,746,0,5,842,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
369,0,0,17,0,0,17,1044,0,0,1,1,0,1,0,1,97,0,0,
388,0,0,17,0,0,45,1046,0,0,0,0,0,1,0,
403,0,0,17,0,0,13,1058,0,0,12,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
466,0,0,17,0,0,15,1074,0,0,0,0,0,1,0,
481,0,0,17,0,0,15,1081,0,0,0,0,0,1,0,
496,0,0,18,97,0,4,1353,0,0,2,1,0,1,0,2,4,0,0,1,9,0,0,
519,0,0,19,902,0,5,1390,0,0,46,46,0,1,0,1,9,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,9,0,0,1,9,0,0,
1,97,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,9,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,
718,0,0,20,67,0,5,1458,0,0,1,1,0,1,0,1,9,0,0,
737,0,0,21,78,0,5,1479,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
760,0,0,22,50,0,3,1500,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
801,0,0,23,0,0,29,1514,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/*======================== Program Header ==========================================================
     PROGRAM-NAME      : pie1010g.pc (계획인원현원생성), pihtopo테이블 생성
     PROGRM-Decription : 계획인원현원을 생성한다. (매월 정기작업)
     USAGE             :
     SYSTEM-NAME       : 종합인사정보시스템
     SUBSYSTEM-NAME    : 인사
     Programmer        : 전철호?
     Version           : 1.00
     Date              : 2003.03.31

    Update Contents
     Version      date(yy.mm.dd)     programmer      description            relevant doc.n
       1.00       2003.03.31         전철호          최초작성
       1.01       2004.02.19         이민용          자체 개선       Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.
       1.02       2004.06.17         이민용          자체 개선       직급체계변경에 따른 프로그램 수정
       2.00       2005.03.02         유효성          자체 개선       직급체계변경에 따른 계획인원생성부분 수정
    ** 참고사항 **
      - 계획/현원(pihtopo)테이블 사용하지 않는 필드 정리 필요.
      - 특정전임행정직 1급(pspe21) ~7급(pspe27) 사용안함
      - 특정전임행정직 1급(tspe21) ~7급(tspe27), 특정직특수직(tspe3), 특정직특정행정직(tspe4),
        특정직기타1(tspe5), 특정직소계(tspesum) 사용안함
      - 특정직관련 필드(pspe2,pspe3,pspe4,pspe5)는 사용하지 않는다.
      - 특정직은 pspe1 필드 하나로 사용한다.
      - 임시직관련 필드(pextr1 ~ 5, pextrsum)는 사용하지 않는다.

      - 하나로에선 특정직 사원도 정규사원에 포함하며 직급코드는 특정(93)을 사용한다.
      - 특정직이란 ?
        계약직이 정규직으로 바뀔때 사용하는 직급임.
     *) HR 인프라 고도화 Project(직책-> 직책, 직급 -> BAND(비공개))
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

#define   EMPNO          4
#define   YYMMDD         8
#define   YYMM           6
#define   STATE          1
#define   CODENO         2
#define   CODENAME      20
#define   PAYRA          3
#define   TPGUBUN        2
#define   KORNAME       12
#define   ORGNUM         3
#define   DEPTCODE       6
#define   UPCODE         3
#define   DEPTLEVEL      4
#define   BIGO          50
#define   QUERY       1024
#define   WRITETIME     15
#define   FAIL          -2

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     typedef struct HINSA_pihtopo_inter {
          /* varchar V_topoym   [YYMM   + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } V_topoym;
       /* 작업년월 */
          /* varchar V_beftopoym[YYMM   + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } V_beftopoym;
       /* 바로전 작업년월 */
          /* varchar V_orgnum   [ORGNUM + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } V_orgnum;
       /* 조직차수 */
          /* varchar V_manunit  [CODENO + 1]; */ 
struct { unsigned short len; unsigned char arr[3]; } V_manunit;
       /* 관리단위 (EO)???*/

          /* varchar V_deptcode [DEPTCODE  + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } V_deptcode;
    /* 부서코드 */
          /* varchar V_tpgubun  [CODENO    + 1]; */ 
struct { unsigned short len; unsigned char arr[3]; } V_tpgubun;
    /* 구분코드 */
          /* varchar V_sectcode [UPCODE    + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } V_sectcode;
    /* 부문코드 */
          /* varchar V_fieldcode[UPCODE    + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } V_fieldcode;
    /* 실단코드 */
          /* varchar V_boncode  [DEPTCODE  + 1]; */ 
struct { unsigned short len; unsigned char arr[7]; } V_boncode;
    /* 본부코드 */
          /* varchar V_tcretime [WRITETIME + 1]; */ 
struct { unsigned short len; unsigned char arr[16]; } V_tcretime;
    /* 계획인원생성일시 */
          /* varchar V_deptlevel[DEPTLEVEL + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } V_deptlevel;
    /* 부서등급(pycdept의 자리수) 1.02 */

          /* varchar V_empno    [EMPNO   + 1]; */ 
struct { unsigned short len; unsigned char arr[5]; } V_empno;
      /* 사원번호 */
          /* varchar V_korname  [KORNAME + 1]; */ 
struct { unsigned short len; unsigned char arr[13]; } V_korname;
      /* 성  명 */
          /* varchar V_paycl    [CODENO  + 1]; */ 
struct { unsigned short len; unsigned char arr[3]; } V_paycl;
      /* BAND   */
          /* varchar V_payra    [PAYRA   + 1]; */ 
struct { unsigned short len; unsigned char arr[4]; } V_payra;
      /* 직  책 */
          /* varchar V_nojeonyn [STATE   + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } V_nojeonyn;
      /* 노조전임여부 */
          /* varchar V_pstate   [CODENO  + 1]; */ 
struct { unsigned short len; unsigned char arr[3]; } V_pstate;
      /* 인사상태 */
          /* varchar V_pcretime [WRITETIME + 1]; */ 
struct { unsigned short len; unsigned char arr[16]; } V_pcretime;
    /* 현원생성일시 */
          /* varchar V_tpbigo   [BIGO    + 1]; */ 
struct { unsigned short len; unsigned char arr[51]; } V_tpbigo;
      /* 비고 */
          /* varchar V_today    [YYMMDD  + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } V_today;
      /* 시스템일자 */
          /* varchar V_query    [QUERY   + 1]; */ 
struct { unsigned short len; unsigned char arr[1025]; } V_query;
      /* 동적 SQL 문장 변수 */

          /* varchar V_cregubun  [CODENO  + 1]; */ 
struct { unsigned short len; unsigned char arr[3]; } V_cregubun;
     /* 생성구분 */
          /* varchar V_cregubunnm[CODENAME+ 1]; */ 
struct { unsigned short len; unsigned char arr[21]; } V_cregubunnm;
     /* 생성구분명 */
          /* varchar V_ipoyn     [STATE   + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } V_ipoyn;
     /* 임원현원포함여부 */
          /* varchar V_epoyn     [STATE   + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } V_epoyn;
     /* 교육파견현원포함여부 */
          /* varchar V_jpoyn     [STATE   + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } V_jpoyn;
     /* 정직현원포함여부 */
          /* varchar V_hpoyn     [STATE   + 1]; */ 
struct { unsigned short len; unsigned char arr[2]; } V_hpoyn;
     /* 휴직현원포함여부 */
          /* varchar V_tocredate [YYMMDD  + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } V_tocredate;
     /* 계획인원생성일자 */
          /* varchar V_pocredate [YYMMDD  + 1]; */ 
struct { unsigned short len; unsigned char arr[9]; } V_pocredate;
     /* 현원생성일자 */

          float V_pdir11;                        /* 임원 - 회장 */
          float V_pdir12;                        /* 임원 - 부회장 */
          float V_pdir21;                        /* 임원 - 사장               ->E3 */
          float V_pdir31;                        /* 임원 - 감사 */
          float V_pdir41;                        /* 임원 - 부사장             ->E2 */
          float V_pdir51;                        /* 임원 - 전무               ->E1 */
          float V_pdir61;                        /* 임원 - 상무 */
          float V_pdir6a;                        /* 임원 - 선임연구위원1*/
          float V_pdir71;                        /* 임원 - 이사               ->E0 */
          float V_pdir72;                        /* 임원 - 이사대우 */
          float V_pdir7a;                        /* 임원 - 수석부사장   2007.10. 변경 */
          float V_pdiretc;                       /* 임원 - 기타 */
          float V_pdirsum;                       /* 임원 - 소계 */
          float V_ppos1;                         /* 정규직 - SM2급 (수석부장) */
          float V_ppos2;                         /* 정규직 - SM1급 (부장) */
          float V_ppos3;                         /* 정규직 - M2급  (차장) */
          float V_ppos4;                         /* 정규직 - M1급  (선임과장)   */
          float V_ppos5;                         /* 정규직 - S2급  (과장) */
          float V_ppos6;                         /* 정규직 - S1급  (대리) */
          float V_ppos7;                         /* 정규직 - J3급  (사원) */
          float V_ppos8;                         /* 정규직 - J2급  (사원) */
          float V_ppos9;                         /* 정규직 - J1급  (사원) */
          float V_ppossum;                       /* 정규직 - 소계  */
          float V_pspe1;                         /* 특정직 - 특수직(92), 특정행정직(93), 고문(A1), 촉탁(A2), 용무(A3) */
          float V_pspesum;                       /* 특정직 소계 */
          float V_ptempsum;                      /* 협력사원 소계*/
          float V_pcontsum;                      /* 일반계약직(계약사원(Q 사번),게약직(P 사번)) */
          float V_psconsum;                      /* 전문계약직(J 사번)  */
          float V_pemptot;                       /* 정규직 총계 (정규직소계 + 특정직 소계) */
          float V_pimsitot;                      /* 임용직 총계 (협력사원 소계) */
          float V_ptotal;                        /* 현원 총계 */
          float V_p10;
          float V_p20;
          float V_p22;
          float V_p32;
          float V_p40;
          float V_p42; /* 1.02       2004.06.17         이민용          자체 개선       직급체계변경에 따른 프로그램 수정*/
          float V_p44; /*부장, 차장, 과장, 대리, 사원(대졸), 사원(전졸), 사원(고졸)->L2,L1,G4,G3,G2(대),G2(전),G2(고)*/
     } ts_pihtopo_inter;

     float V_exist_count;                   /* 자료존재확인 */
/* EXEC SQL END DECLARE SECTION; */ 


char  FG_today   [YYMMDD + 1];
char  FG_jobempno[EMPNO + 1];

float FG_imwon_cnt = 0;    /* 임원 카운트 */
float FG_po_cnt    = 0;    /* 현원 카운트 */
float FG_nojo_cnt  = 0;    /* 노조 카운트 */
float FG_hu_cnt    = 0;    /* 휴직자 카운트 */
float FG_jung_cnt  = 0;    /* 정직자 카운트 */
float FG_pa_cnt    = 0;    /* 파견/교육 카운트 */

int   FG_skip      = FALSE;

static ts_pihtopo_inter FG_pihtopo;
static ts_pihtopo_inter *FGP_pihtopo;

int  PL_get_pimvari1(void);
int  PL_get_pimvari2(void);
int  PL_get_pimvari3(void);
int  PL_get_pimvari4(void);
int  (*PL_pimvari[4])(void) = {PL_get_pimvari1, PL_get_pimvari2, PL_get_pimvari3, PL_get_pimvari4};

int  PL_get_environment(void);
int  PL_pihtopo_create(void);
int  PL_deptcode_delete(void);
int  PL_data_process(void);
int  PL_poinwon_create(void);
int  PL_toinwon_create(void);
void PL_init_count(void);
int  PL_poinwon_process(void);
void PL_poinwon_calc(void);
void PL_patpgubun_process(void);
int  PL_poinwon_write(void);
int  PL_update_pimvari(void);

/*=== ch.k.j 2005.10. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = "";
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0;

void main(int argc, char *argv[])
{
     char *FL_date;
     char FL_dir[255];
     char FL_Line[255];
     char FL_file[255];

     STRINIT(&FL_file);
     strcpy(FL_file,"pie1010g");

     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }

     hinsa_log_print(0,"계획/현원 인원 생성 프로그램 시작...");

     hinsa_db_connect();

     /******K.J  추가*******************/
     /* EXEC SQL DECLARE log_db DATABASE; */ 

     hinsa_log_db_connect();
     /*********************************/

     memset(&FG_pihtopo,0x00,sizeof(FG_pihtopo));
     FGP_pihtopo = &FG_pihtopo;

     /* 현원/계획인원 생성일자를 오늘일자로 등록한다... */
     FL_date = hinsa_sys_date(1);
     STRINIT(&FG_today);
     strcpy(FG_today, FL_date);
     STRINIT(&FG_jobempno);

     /* 작업년월을 시스템 년월로 읽어온다. */
     STRINIT(FGP_pihtopo->V_topoym);
     STR2VCTRIM(FGP_pihtopo->V_topoym,hinsa_copy(FL_date,1,6),YYMM);

     STRINIT(&FL_Line);
     sprintf(FL_Line, "생성년월 : %s", FGP_pihtopo->V_topoym.arr);
     hinsa_log_print(0, FL_Line);

     if  (argc < 2)
     {
          hinsa_log_print(0, "인사변수 초기화 작업...");
          STR2VCTRIM(FGP_pihtopo->V_cregubun, "11", CODENO);  /* 생성구분 11(현원생성)*/
          strcpy(FG_jobempno, "0000");

          if  (PL_get_environment() == FAILURE)
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


               hinsa_exit(0,"PL_get_environment Function 에러로 종료...");
               return;
          }
     }
     else
     {
          if  (argc < 3)
          {
               hinsa_log_print(0, "인수값 갯수가 잘못 되었습니다.");
               hinsa_log_print(0, "====================사용법 (HELP)==========================");
               hinsa_log_print(0, "pie1010g 작업자사번 생성구분 [작업년월] [조직차수] [관리단위] [임원현원포함여부]");
               hinsa_log_print(0, "         [교육파견현원포함여부] [정직현원포함여부] [휴직현언포함여부] [계획인원생성일] [현원생성일]");
               hinsa_log_print(0, "   생성구분 : 11 (인사마스터 기준 현원생성)");
               hinsa_log_print(0, "              12 (조직개편 기준 현원생성)");
               hinsa_log_print(0, "              20 (계획인원만 생성)");
               hinsa_log_print(0, "              30 (계획/현원인원 생성)");
               hinsa_exit(0,"계획/현원 인원 생성 프로그램 종료...");
               return;
          }

          if  (argc == 3)
          {
               if  (PL_get_environment() == FAILURE)
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


                    hinsa_exit(0,"PL_get_environment Function 에러로 종료...");
                    return;
               }
          }

          strcpy(FG_jobempno, argv[1]);                          /* 작업자사번(월초) 0000       */
          STR2VCTRIM(FGP_pihtopo->V_cregubun, argv[2], CODENO);  /* 생성구분         11(현원생성)*/

          if  (argc > 3)
          {    /*pie1010g 0000 30 200406 H08 E0 Y Y Y N 200406 200406*/
               STR2VCTRIM(FGP_pihtopo->V_topoym,   argv[3], YYMM);    /* 작업년월         200103     */
               STR2VCTRIM(FGP_pihtopo->V_orgnum,   argv[4], ORGNUM);  /* 조직차수         H05        */
               STR2VCTRIM(FGP_pihtopo->V_manunit,  argv[5], CODENO);  /* 관리단위         E0         */
               STR2VCTRIM(FGP_pihtopo->V_ipoyn,    argv[6], STATE);   /* 임원현원         Y          */
               STR2VCTRIM(FGP_pihtopo->V_epoyn,    argv[7], STATE);   /* 교육파견현원     Y          */
               STR2VCTRIM(FGP_pihtopo->V_jpoyn,    argv[8], STATE);   /* 정직현원         N          */
               STR2VCTRIM(FGP_pihtopo->V_hpoyn,    argv[9], STATE);   /* 휴직현원         N          */
               /*=== K.J Rexec대체 서비스를 위한 =============*/
               strcpy(log_writeman, argv[10]);
               strcpy(log_progid,   argv[11]);
               strcpy(log_rundate,  argv[12]);
          }
          if  (argc >= 10)
          {
               STR2VCTRIM(FGP_pihtopo->V_tocredate,argv[10], YYMMDD); /* 계획인원생성일   20011101   */
               STR2VCTRIM(FGP_pihtopo->V_pocredate,argv[11], YYMMDD); /* 현원생성일       20011101   */
               /*=== K.J Rexec대체 서비스를 위한 =============*/
               strcpy(log_writeman, argv[12]);
               strcpy(log_progid,   argv[13]);
               strcpy(log_rundate,  argv[14]);
          }
     }

     /* EXEC SQL LOCK TABLE pimpmas, pihtopo
                in EXCLUSIVE MODE NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE pimpmas , pihtopo in EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )35;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (PL_data_process() == FAILURE)
     {
          /* EXEC SQL ROLLBACK WORK RELEASE; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 0;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )50;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"PL_poinwon_create Function 에러로 종료...");
          return;
     }

     hinsa_log_print(0, "");
     STRINIT(&FL_Line);
     sprintf(FL_Line, "현원/계획 처리인원 : %6.0f", FG_po_cnt);
     hinsa_log_print(0, FL_Line);

     STRINIT(&FL_Line);
     sprintf(FL_Line, "임원 처리인원      : %6.0f", FG_imwon_cnt);
     hinsa_log_print(0, FL_Line);

     STRINIT(&FL_Line);
     sprintf(FL_Line, "노조 처리인원      : %6.0f", FG_nojo_cnt);
     hinsa_log_print(0, FL_Line);

     STRINIT(&FL_Line);
     sprintf(FL_Line, "정직자 처리인원    : %6.0f", FG_jung_cnt);
     hinsa_log_print(0, FL_Line);

     STRINIT(&FL_Line);
     sprintf(FL_Line, "휴직자 처리인원    : %6.0f", FG_hu_cnt);
     hinsa_log_print(0, FL_Line);

     STRINIT(&FL_Line);
     sprintf(FL_Line, "파견/교육 처리인원 : %6.0f", FG_pa_cnt);
     hinsa_log_print(0, FL_Line);

     sprintf(log_buff,"OK 계획/현원 인원 생성 프로그램 완료...");
     hinsa_log_print(0, log_buff);

     /*------------------ch.k.j 추가--------*/
     Write_batlog(seqno++, log_buff);
     hinsa_exit(0,"OK ====== [  작업성공 ] =====");
     /*---------------------------------------  */
     return;
}

/*==================================================================================================
  프로그램을 실행하기 위한 초기값을 읽어온다...
==================================================================================================*/
int PL_get_environment(void)
{
     int FL_i;

     for  (FL_i = 0; FL_i < 4; FL_i++)
     {
          if  (PL_pimvari[FL_i]() == FAILURE)     return(FAILURE);
     }
     return (SUCCESS);
}

/*==================================================================================================
  인사변수 테이블에서 해당 코드 값을 읽어온다...
==================================================================================================*/
int PL_get_pimvari1(void)
{
     char FL_Line[255];

     STRINIT(&FL_Line);

     hinsa_log_print(0,"인사변수 테이블에서 현조직차수를 읽어온다...");
     /* EXEC SQL
     SELECT UPPER(value1)  INTO :FGP_pihtopo->V_orgnum
       FROM pimvari
      WHERE gubun  = '00'
        AND sgubun = '0001'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select UPPER(value1) into :b0  from pimvari where (gubu\
n='00' and sgubun='0001')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )65;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_orgnum);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     sprintf(FL_Line, "현 조직차수 : %s", FGP_pihtopo->V_orgnum.arr);
     hinsa_log_print(0, FL_Line);
     return (SUCCESS);
}

int PL_get_pimvari2(void)
{
     char FL_Line[255];

     STRINIT(&FL_Line);

     hinsa_log_print(0,"인사변수 테이블에서 인원관리단위(팀)을 읽어온다...");
     /* EXEC SQL
     SELECT UPPER(value1)  INTO :FGP_pihtopo->V_manunit
       FROM pimvari
      WHERE gubun  = '50'
        AND sgubun = '0001'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select UPPER(value1) into :b0  from pimvari where (gubu\
n='50' and sgubun='0001')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )84;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_manunit);
     sqlstm.sqhstl[0] = (unsigned long )5;
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     sprintf(FL_Line, "인원관리단위 : %s", FGP_pihtopo->V_manunit.arr);
     hinsa_log_print(0, FL_Line);
     return (SUCCESS);
}

int PL_get_pimvari3(void)
{
     char FL_Line[255];

     STRINIT(&FL_Line);

     hinsa_log_print(0,"인사변수 테이블에서 임원,파견교육,정직자,휴직자현원포함여부를 읽어온다...");
     /* EXEC SQL
     SELECT  NVL(UPPER(value1),'N'),
             NVL(UPPER(value2),'N'),
             NVL(UPPER(value3),'N'),
             NVL(UPPER(value4),'N')
       INTO :FGP_pihtopo->V_ipoyn,
            :FGP_pihtopo->V_epoyn,
            :FGP_pihtopo->V_jpoyn,
            :FGP_pihtopo->V_hpoyn
       FROM  pimvari
      WHERE  gubun  = '50'
        AND  sgubun = '0003'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(UPPER(value1),'N') ,NVL(UPPER(value2),'N') ,\
NVL(UPPER(value3),'N') ,NVL(UPPER(value4),'N') into :b0,:b1,:b2,:b3  from pim\
vari where (gubun='50' and sgubun='0003')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )103;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_ipoyn);
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_epoyn);
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_pihtopo->V_jpoyn);
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_pihtopo->V_hpoyn);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     sprintf(FL_Line, "임원,파견교육,정직자,휴직자현원포함여부 : %s, %s, %s, %s",
     FGP_pihtopo->V_ipoyn.arr,FGP_pihtopo->V_epoyn.arr,FGP_pihtopo->V_jpoyn.arr,FGP_pihtopo->V_hpoyn.arr);
     hinsa_log_print(0, FL_Line);
     return (SUCCESS);
}

int PL_get_pimvari4(void)
{
     char FL_Line[255];

     STRINIT(&FL_Line);

     hinsa_log_print(0,"인사변수 테이블에서 현원,계획 생성일자를 읽어온다...");
     /* EXEC SQL
     SELECT  UPPER(value1),
             UPPER(value2)
       INTO  :FGP_pihtopo->V_tocredate,
             :FGP_pihtopo->V_pocredate
       FROM  pimvari
      WHERE  gubun  = '50'
        AND  sgubun = '0002'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select UPPER(value1) ,UPPER(value2) into :b0,:b1  from \
pimvari where (gubun='50' and sgubun='0002')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )134;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_tocredate);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_pocredate);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA) && (SQLCODE != SQL_NULL_COL))
     {
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     sprintf(FL_Line, "현원,계획 생성일자 : %s, %s", FGP_pihtopo->V_tocredate.arr, FGP_pihtopo->V_pocredate.arr);
     hinsa_log_print(0, FL_Line);
     return (SUCCESS);
}

/*==================================================================================================
  부서코드 테이블에서 현조직차수에 해당하는 부서정보를 pihtopo 테이블에 생성 년월에 해당하는
  데이타를 생성한다...
==================================================================================================*/
int PL_pihtopo_create(void)
{
     char FL_Line[255];

     STRINIT(&FL_Line);
     STRINIT(&FGP_pihtopo->V_tcretime);
     STR2VCTRIM(FGP_pihtopo->V_tcretime,hinsa_sys_date(4),WRITETIME);

     hinsa_log_print(0,"계획/인원 테이블에 생성[PL_pihtopo_create] 함수 실행...");
     /* EXEC SQL
     INSERT INTO pihtopo
                ( topoym,
                  orgnum,
                  deptcode,
                  tpgubun,
                  deptlevel,
                  sectcode,
                  fieldcode,
                  boncode,
                  tcretime,
                  writetime,
                  writeemp )
           SELECT :FGP_pihtopo->V_topoym,
                  orgnum,
                  deptcode,
                  '10',
                  NVL(deptlevel, 'ZZ'),                  /o 부서등급 o/
                  LTRIM(RTRIM(NVL(sectcode, 'ZZZ'))),    /o 부문코드 o/
                  LTRIM(RTRIM(NVL(fieldcode, 'ZZZ'))),   /o 실단코드 o/
                  NVL(boncode, 'ZZZZZZ'),                /o 본부코드 o/
                  :FGP_pihtopo->V_tcretime,
                  :FGP_pihtopo->V_tcretime,
                  :FG_jobempno
             FROM pycdept
            WHERE orgnum = :FGP_pihtopo->V_orgnum
              AND NVL(SUBSTR(deptlevel, 1, 1), '*') <= SUBSTR(:FGP_pihtopo->V_manunit, 1, 1)
              AND existon   = '1'
              AND chanmode != '3'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pihtopo (topoym,orgnum,deptcode,tpgubun,dep\
tlevel,sectcode,fieldcode,boncode,tcretime,writetime,writeemp)select :b0 ,org\
num ,deptcode ,'10' ,NVL(deptlevel,'ZZ') ,LTRIM(RTRIM(NVL(sectcode,'ZZZ'))) ,\
LTRIM(RTRIM(NVL(fieldcode,'ZZZ'))) ,NVL(boncode,'ZZZZZZ') ,:b1 ,:b1 ,:b3  fro\
m pycdept where (((orgnum=:b4 and NVL(SUBSTR(deptlevel,1,1),'*')<=SUBSTR(:b5,\
1,1)) and existon='1') and chanmode<>'3')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )157;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_tcretime);
     sqlstm.sqhstl[1] = (unsigned long )18;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_pihtopo->V_tcretime);
     sqlstm.sqhstl[2] = (unsigned long )18;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)FG_jobempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_pihtopo->V_orgnum);
     sqlstm.sqhstl[4] = (unsigned long )6;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_pihtopo->V_manunit);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     sprintf(FL_Line,"계획/인원 테이블에 생성[PL_pihtopo_create] 생성된 건수 : %d 건", SQL_PROCESS_COUNT);
     hinsa_log_print(0,FL_Line);
     return (SUCCESS);
}

/*==================================================================================================
  패쉐된 조직을 삭제한다...
==================================================================================================*/
int PL_deptcode_delete(void)
{
     char FL_Line[255];

     /*
       1. 부서가 추가된 조직을 현원/계획 테이블에 추가한다.
       2. 계획/현원 테이블의 본부코드를 부서코드 테이블에 있는 본부코드로 변경한다.
          - 부서코드의 실제조직여부가    = 실제조직(1) and
                       부서변동구분이   != 패쉐(3)    and
                       관리단위첫자리가 <= 인사변수(gubun=50 and sgubun = 0001)에 등록된 관리단위 첫자리와 같은 경우.
       3. 패쇄 조직이 있는지 확인한 다음 계획/인원 테입블에 패쇄된 조직의 본부코드에 '******'를 등록한다.
          - 현조직차수와 계획/현원 테이블의 조직차수와 다른것이 있는지 확인한다...
       4. 계획/인원 테이블의 본부코드가 '******' 자료를 삭제한다...
     */

     hinsa_log_print(0,"패쇄조직[PL_deptcode_delete] 함수에서 추가된 조직 추가 수행...");
     STRINIT(&FGP_pihtopo->V_tcretime);
     STR2VCTRIM(FGP_pihtopo->V_tcretime,hinsa_sys_date(4),WRITETIME);

     /* EXEC SQL
     INSERT INTO pihtopo
                 ( topoym,
                   orgnum,
                   deptcode,
                   tpgubun,
                   deptlevel,
                   sectcode,
                   fieldcode,
                   boncode,
                   tcretime,
                   writetime,
                   writeemp )
            SELECT :FGP_pihtopo->V_topoym,
                   A.orgnum,
                   A.deptcode,
                   '10',
                   NVL(A.deptlevel, 'ZZ'),
                   NVL(A.sectcode, 'ZZZ'),
                   NVL(A.fieldcode, 'ZZZ'),
                   NVL(A.boncode, 'ZZZZZZ'),
                   :FGP_pihtopo->V_tcretime,
                   :FGP_pihtopo->V_tcretime,
                   :FG_jobempno
              FROM pycdept A
             WHERE A.orgnum    = :FGP_pihtopo->V_orgnum
               AND A.existon   = '1'
               AND A.chanmode != '3'
               AND NOT EXISTS (SELECT deptcode FROM pihtopo
                                WHERE topoym   = :FGP_pihtopo->V_topoym
                                  AND orgnum   = A.orgnum
                                  AND deptcode = A.deptcode); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pihtopo (topoym,orgnum,deptcode,tpgubun,dep\
tlevel,sectcode,fieldcode,boncode,tcretime,writetime,writeemp)select :b0 ,A.o\
rgnum ,A.deptcode ,'10' ,NVL(A.deptlevel,'ZZ') ,NVL(A.sectcode,'ZZZ') ,NVL(A.\
fieldcode,'ZZZ') ,NVL(A.boncode,'ZZZZZZ') ,:b1 ,:b1 ,:b3  from pycdept A wher\
e (((A.orgnum=:b4 and A.existon='1') and A.chanmode<>'3') and  not exists (se\
lect deptcode  from pihtopo where ((topoym=:b0 and orgnum=A.orgnum) and deptc\
ode=A.deptcode)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )196;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_tcretime);
     sqlstm.sqhstl[1] = (unsigned long )18;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_pihtopo->V_tcretime);
     sqlstm.sqhstl[2] = (unsigned long )18;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)FG_jobempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_pihtopo->V_orgnum);
     sqlstm.sqhstl[4] = (unsigned long )6;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
     sqlstm.sqhstl[5] = (unsigned long )9;
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     STRINIT(&FL_Line);
     sprintf(FL_Line,"계획/인원 테이블에 생성[PL_pihtopo_create] 추가된 건수 : %d 건", SQL_PROCESS_COUNT);
     hinsa_log_print(0,FL_Line);

     STRINIT(&FL_Line);
     hinsa_log_print(0,"패쇄조직[PL_deptcode_delete] 함수 수행...");
     hinsa_log_print(0,"패쇄조직[PL_deptcode_delete] 함수 1번 프로세스  수행...");

     /* EXEC SQL
     UPDATE pihtopo A
        set boncode = ( SELECT NVL(boncode, 'ZZZZZZ')
                          FROM pycdept B
                         WHERE B.orgnum    = A.orgnum
                           AND B.deptcode  = A.deptcode
                           AND B.existon   = '1'
                           AND B.chanmode != '3'
                           AND NVL(SUBSTR(B.deptlevel,1,1), '*') <= SUBSTR(:FGP_pihtopo->V_manunit,1,1) )
      WHERE A.topoym = :FGP_pihtopo->V_topoym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihtopo A  set boncode=(select NVL(boncode,'ZZZZ\
ZZ')  from pycdept B where ((((B.orgnum=A.orgnum and B.deptcode=A.deptcode) a\
nd B.existon='1') and B.chanmode<>'3') and NVL(SUBSTR(B.deptlevel,1,1),'*')<=\
SUBSTR(:b0,1,1))) where A.topoym=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )235;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_manunit);
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     hinsa_log_print(0,"패쇄조직[PL_deptcode_delete] 함수 2번 프로세스  수행...");
     /* EXEC SQL
     UPDATE pihtopo
        SET boncode = '******'
      WHERE topoym  = :FGP_pihtopo->V_topoym
        AND orgnum != :FGP_pihtopo->V_orgnum; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihtopo  set boncode='******' where (topoym=:b0 \
and orgnum<>:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )258;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_orgnum);
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
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     hinsa_log_print(0,"패쇄조직[PL_deptcode_delete] 함수 3번 프로세스  수행...");

     /* EXEC SQL
     DELETE FROM pihtopo
      WHERE topoym  = :FGP_pihtopo->V_topoym
        AND boncode = '******'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from pihtopo  where (topoym=:b0 and boncode='**\
****')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )281;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     return (SUCCESS);
}

/*==================================================================================================
  생성구분 (V_cregubun)에 따라 해당 작업을 실행한다...
==================================================================================================*/
int PL_data_process(void)
{
     char FL_Line[255];

     hinsa_log_print(0,"생성구분별 작업[PL_data_process] 함수 수행...");
     V_exist_count = 0;

     /* EXEC SQL
     SELECT COUNT(*)  INTO :V_exist_count
       FROM pihtopo
      WHERE topoym = :FGP_pihtopo->V_topoym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from pihtopo where topoym=:b\
1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )300;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&V_exist_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     if  (V_exist_count <= 0)
     {
          if  (PL_pihtopo_create() == FAILURE)     return (FAILURE);
     }
     else
     {
          if  (PL_deptcode_delete() == FAILURE)     return (FAILURE);
     }

     /* 현원 생성 */
     if  ((strcmp(FGP_pihtopo->V_cregubun.arr, "11") == 0) || (strcmp(FGP_pihtopo->V_cregubun.arr, "12") == 0))
     {
          if (PL_poinwon_create() == FAILURE)     return (FAILURE);
     }

     /* 계획인원 생성 */
     if  (strcmp(FGP_pihtopo->V_cregubun.arr, "20") == 0)
     {
          if (PL_toinwon_create() == FAILURE)     return (FAILURE);
     }

     /* 계획/현원인원 생성 */
     if  (strcmp(FGP_pihtopo->V_cregubun.arr, "30") == 0)
     {
          if (PL_poinwon_create() == FAILURE)     return (FAILURE);

          if (PL_toinwon_create() == FAILURE)     return (FAILURE);
     }

     if  (PL_update_pimvari() == FAILURE)     return (FAILURE);

     return (SUCCESS);
}

/*==================================================================================================
  현원을 생성한다...
==================================================================================================*/
int PL_poinwon_create(void)
{
     char FL_Line[255];

     /*생성년월의 현원 데이타를 0또는 Space로 값을 채운다. 이때 계획인원은 기존에 등록된 자료로 둔다.*/

     hinsa_log_print(0,"현원 생성[PL_poinwon_create] UPDATE 수행...");
     STRINIT(&FGP_pihtopo->V_tcretime);
     STR2VCTRIM(FGP_pihtopo->V_tcretime,hinsa_sys_date(4),WRITETIME);

     /* EXEC SQL
     UPDATE  pihtopo
        set  pdir11   = 0,
             pdir12   = 0,
             pdir21   = 0,
             pdir31   = 0,
             pdir41   = 0,
             pdir51   = 0,
             pdir61   = 0,
             pdir6a   = 0,
             pdir71   = 0,
             pdir72   = 0,
             pdir7a   = 0,
             pdiretc  = 0,
             pdirsum  = 0,
             ppos1    = 0,
             ppos2    = 0,
             ppos3    = 0,
             ppos4    = 0,
             ppos5    = 0,
             ppos6    = 0,
             ppos7    = 0,
             ppos8    = 0,
             ppos9    = 0,
             ppossum  = 0,
             pspe1    = 0,
             pspesum  = 0,
             ptempsum = 0,
             pcontsum = 0,
             psconsum = 0,
             pemptot  = 0,
             pimsitot = 0,
             ptotal   = 0,
             p10      = 0,
             p20      = 0,
             P22      = 0,
             P32      = 0,
             P40      = 0,
             P42      = 0,
             P44      = 0,
             pcretime = :FGP_pihtopo->V_tcretime,
             tpbigo   = ''
       WHERE topoym = :FGP_pihtopo->V_topoym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihtopo  set pdir11=0,pdir12=0,pdir21=0,pdir31=0\
,pdir41=0,pdir51=0,pdir61=0,pdir6a=0,pdir71=0,pdir72=0,pdir7a=0,pdiretc=0,pdi\
rsum=0,ppos1=0,ppos2=0,ppos3=0,ppos4=0,ppos5=0,ppos6=0,ppos7=0,ppos8=0,ppos9=\
0,ppossum=0,pspe1=0,pspesum=0,ptempsum=0,pcontsum=0,psconsum=0,pemptot=0,pims\
itot=0,ptotal=0,p10=0,p20=0,P22=0,P32=0,P40=0,P42=0,P44=0,pcretime=:b0,tpbigo\
='' where topoym=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )323;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_tcretime);
     sqlstm.sqhstl[0] = (unsigned long )18;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }
     sprintf(FL_Line,"현원 생성[PL_poinwon_create] UPDATE된 건수 : %d 건", SQL_PROCESS_COUNT);
     hinsa_log_print(0,FL_Line);

     if  (PL_poinwon_process() == FAILURE)     return (FAILURE);

     return (SUCCESS);
}

/*==================================================================================================
  계획인원을 생성한다...
==================================================================================================*/
int PL_toinwon_create(void)
{
     char FL_Line[255];

     /*
        생성년월(topoym)이 '999999'인 데이타는 계획인원 조정 프로그램에서 등록된 마스터
        계획인원이다.

        계획인원 마스터를 현 생성년월의 계획인원에 등록한다...
     */
     hinsa_log_print(0,"계획인원 생성[PL_toinwon_create] 함수 수행...");
     STRINIT(&FGP_pihtopo->V_tcretime);
     STR2VCTRIM(FGP_pihtopo->V_tcretime,hinsa_sys_date(4),WRITETIME);

     printf("계획인원 생성 시작\n");

   /**  2.00       2005.03.02         유효성          자체 개선       직급체계변경에 따른 계획인원생성부분 수정
     EXEC SQL
     UPDATE pihtopo A
        SET     (tdirect,
                 tpos1,
                 tpos2,
                 tpos3,
                 tpos4,
                 tpos5,
                 tpos6,
                 tpos7,
                 tpos8,
                 tpos9,
                 tpossum,
                 tspe1,
                 tspesum,
                 temptot,
                 ttempsum,
                 timsitot,
                 tcontsum,
                 ttotal,
                 tcretime )
        =(SELECT NVL(tdirect,0),        정규직(계획인원) - 모든임원
                 NVL(tpos1,0),          정규직(계획인원) - SM2급 (수석부장)
                 NVL(tpos2,0),          정규직(계획인원) - SM1급 (부장)
                 NVL(tpos3,0),          정규직(계획인원) - M2급  (차장)
                 NVL(tpos4,0),          정규직(계획인원) - M1급  (선임과장)
                 NVL(tpos5,0),          정규직(계획인원) - S2급  (과장)
                 NVL(tpos6,0),          정규직(계획인원) - S1급  (대리)
                 NVL(tpos7,0),          정규직(계획인원) - J3급  (사원)
                 NVL(tpos8,0),          정규직(계획인원) - J2급  (사원)
                 NVL(tpos9,0),          정규직(계획인원) - J1급  (사원)
                 NVL(tpossum,0),        정규직(계획인원) - 소계
                 NVL(tspe1,0),          특정직(계획인원) - 특수직(92), 특정행정직(93), 고문(A1), 촉탁(A2), 용무(A3)
                 NVL(tspesum,0),        특정직(계획인원) 소계
                 NVL(temptot,0),        정규직(계획인원) 총계 (정규직소계 + 특정직 소계)
                 NVL(ttempsum,0),       협력사원(계획인원) 소계
                 NVL(timsitot,0),       임용직(계획인원) 총계 (협력사원 소계)
                 NVL(tcontsum,0),       일반계약직(계획인원) - 계약사원(Q 사번),계약직(P 사번))
                 NVL(ttotal,0),         계획인원 총계
                 :FGP_pihtopo->V_tcretime
            FROM pihtopo B
           WHERE B.topoym    = '999999'
             AND A.orgnum    = B.orgnum
             AND A.deptcode  = B.deptcode
             AND A.boncode   = B.boncode
             AND A.deptlevel = B.deptlevel
             AND A.tpgubun   = B.tpgubun )
      WHERE A.topoym = :FGP_pihtopo->V_topoym;
   **/

     /* EXEC SQL
     UPDATE pihtopo A
        set    (tdirect,
                tpos1,
                tpos2,
                tpos3,
                tpos4,
                tpos5,
                tpos6,
                tpos7,
                tpos8,
                tpos9,
                t10,
                t20,
                t22,
                t32,
                t40,
                t42,
                t44,
                tpossum,
                tspe1,
                tspesum,
                temptot,
                ttempsum,
                timsitot,
                tcontsum,
                ttotal,
                tcretime )
       =(SELECT NVL(tdirect,0),       /o 정규직(계획인원) - 모든임원 o/
                NVL(tpos1,0),         /o 정규직(계획인원) - SM2급 (수석부장) o/
                NVL(tpos2,0),         /o 정규직(계획인원) - SM1급 (부장) o/
                NVL(tpos3,0),         /o 정규직(계획인원) - M2급  (차장) o/
                NVL(tpos4,0),         /o 정규직(계획인원) - M1급  (선임과장) o/
                NVL(tpos5,0),         /o 정규직(계획인원) - S2급  (과장) o/
                NVL(tpos6,0),         /o 정규직(계획인원) - S1급  (대리) o/
                NVL(tpos7,0),         /o 정규직(계획인원) - J3급  (사원) o/
                NVL(tpos8,0),         /o 정규직(계획인원) - J2급  (사원) o/
                NVL(tpos9,0),         /o 정규직(계획인원) - J1급  (사원) o/
                NVL(t10,  0),
                NVL(t20,  0),
                NVL(t22,  0),
                NVL(t32,  0),
                NVL(t40,  0),
                NVL(t42,  0),
                NVL(t44,  0),
                NVL(tpossum,0),       /o 정규직(계획인원) - 소계  o/
                NVL(tspe1,0),         /o 특정직(계획인원) - 특수직(92), 특정행정직(93), 고문(A1), 촉탁(A2), 용무(A3) o/
                NVL(tspesum,0),       /o 특정직(계획인원) 소계 o/
                NVL(temptot,0),       /o 정규직(계획인원) 총계 (정규직소계 + 특정직 소계) o/
                NVL(ttempsum,0),      /o 파견직(계획인원) 소계o/
                NVL(timsitot,0),      /o 임용직(계획인원) 총계 (협력사원 소계) o/
                NVL(tcontsum,0),      /o 계약직(계획인원) - 계약사원(J 사번),계약사원(Q 사번),계약직(P 사번)) o/
                NVL(ttotal,0),        /o 계획인원 총계 o/
                :FGP_pihtopo->V_tcretime
           FROM pihtopo B
          WHERE B.topoym    = '999999'
            AND A.orgnum    = B.orgnum
            AND A.deptcode  = B.deptcode
            AND A.boncode   = B.boncode
            AND A.deptlevel = B.deptlevel
            AND A.tpgubun   = B.tpgubun )
      WHERE A.topoym = :FGP_pihtopo->V_topoym; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihtopo A  set (tdirect,tpos1,tpos2,tpos3,tpos4,\
tpos5,tpos6,tpos7,tpos8,tpos9,t10,t20,t22,t32,t40,t42,t44,tpossum,tspe1,tspes\
um,temptot,ttempsum,timsitot,tcontsum,ttotal,tcretime)=(select NVL(tdirect,0)\
 ,NVL(tpos1,0) ,NVL(tpos2,0) ,NVL(tpos3,0) ,NVL(tpos4,0) ,NVL(tpos5,0) ,NVL(t\
pos6,0) ,NVL(tpos7,0) ,NVL(tpos8,0) ,NVL(tpos9,0) ,NVL(t10,0) ,NVL(t20,0) ,NV\
L(t22,0) ,NVL(t32,0) ,NVL(t40,0) ,NVL(t42,0) ,NVL(t44,0) ,NVL(tpossum,0) ,NVL\
(tspe1,0) ,NVL(tspesum,0) ,NVL(temptot,0) ,NVL(ttempsum,0) ,NVL(timsitot,0) ,\
NVL(tcontsum,0) ,NVL(ttotal,0) ,:b0  from pihtopo B where (((((B.topoym='9999\
99' and A.orgnum=B.orgnum) and A.deptcode=B.deptcode) and A.boncode=B.boncode\
) and A.deptlevel=B.deptlevel) and A.tpgubun=B.tpgubun)) where A.topoym=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )346;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_tcretime);
     sqlstm.sqhstl[0] = (unsigned long )18;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     printf("계획인원 생성 끝\n");

     STRINIT(&FL_Line);
     sprintf(FL_Line,"계획인원 생성[PL_toinwon_create] 수정된 건수 : %d 건", SQL_PROCESS_COUNT);
     hinsa_log_print(0,FL_Line);

     return (SUCCESS);
}

/*==================================================================================================
  인원 카운트 초기값으로 대치...
==================================================================================================*/
void PL_init_count(void)
{
     FGP_pihtopo->V_pdir11   = 0;
     FGP_pihtopo->V_pdir12   = 0;
     FGP_pihtopo->V_pdir21   = 0;
     FGP_pihtopo->V_pdir31   = 0;
     FGP_pihtopo->V_pdir41   = 0;
     FGP_pihtopo->V_pdir51   = 0;
     FGP_pihtopo->V_pdir61   = 0;
     FGP_pihtopo->V_pdir6a   = 0;
     FGP_pihtopo->V_pdir71   = 0;
     FGP_pihtopo->V_pdir72   = 0;
     FGP_pihtopo->V_pdir7a   = 0;
     FGP_pihtopo->V_pdiretc  = 0;
     FGP_pihtopo->V_pdirsum  = 0;
     FGP_pihtopo->V_ppos1    = 0;
     FGP_pihtopo->V_ppos2    = 0;
     FGP_pihtopo->V_ppos3    = 0;
     FGP_pihtopo->V_ppos4    = 0;
     FGP_pihtopo->V_ppos5    = 0;
     FGP_pihtopo->V_ppos6    = 0;
     FGP_pihtopo->V_ppos7    = 0;
     FGP_pihtopo->V_ppos8    = 0;
     FGP_pihtopo->V_ppos9    = 0;
     FGP_pihtopo->V_ppossum  = 0;
     FGP_pihtopo->V_pspe1    = 0;
     FGP_pihtopo->V_pspesum  = 0;
     FGP_pihtopo->V_ptempsum = 0;
     FGP_pihtopo->V_pcontsum = 0;
     FGP_pihtopo->V_psconsum = 0;
     FGP_pihtopo->V_pemptot  = 0;
     FGP_pihtopo->V_pimsitot = 0;
     FGP_pihtopo->V_ptotal   = 0;
     /* 1.02       2004.06.17         이민용          자체 개선       직급체계변경에 따른 프로그램 수정*/
     FGP_pihtopo->V_p10      = 0;
     FGP_pihtopo->V_p20      = 0;
     FGP_pihtopo->V_p22      = 0;
     FGP_pihtopo->V_p32      = 0;
     FGP_pihtopo->V_p40      = 0;
     FGP_pihtopo->V_p42      = 0;
     FGP_pihtopo->V_p44      = 0;
}


/*==================================================================================================
  현원을 계산하여 등록한다...
==================================================================================================*/
int PL_poinwon_process(void)
{
     char FL_Line[255];
     char FL_sql[4096];

     /*
        생성구분이 = '12' 이면 조직개편에서 현원을 생성하고 생성구분이 = '11'이면 인사마스터에서
        현원을 생성한다...
     */

     if  (strcmp(FGP_pihtopo->V_cregubun.arr,"12") == 0)
     {
          hinsa_log_print(0,"현원(조직개편) 생성[PL_poinwon_process] 함수 수행...");
          STRINIT(&FL_sql);

          strcpy(FL_sql,"SELECT A.empno,                   \
                                A.korname,                 \
                                NVL(A.dporgnum,'ZZZ'),     \
                                NVL(A.dpdeptcode,'ZZZZZ'), \
                                UPPER(A.paycl),            \
                                UPPER(A.dppayra),          \
                                UPPER(A.nojeonyn),         \
                                A.pstate,                  \
                                NVL(B.deptlevel, 'ZZ'),    \
                                LTRIM(RTRIM(NVL(B.sectcode, 'ZZZ'))),  \
                                LTRIM(RTRIM(NVL(B.fieldcode, 'ZZZ'))), \
                                NVL(B.boncode, 'ZZZZZZ')   \
                           FROM pitremd A, pycdept B       \
                          WHERE A.remddate = (SELECT value1 FROM pimvari \
                                               WHERE gubun  = 'C7'       \
                                                 AND sgubun = '0001')    \
                            AND A.orgnum   = B.orgnum(+)   \
                            AND A.deptcode = B.deptcode(+) \
                          ORDER BY A.empno ");
     }
     else
     {
          hinsa_log_print(0,"현원(인사마스터) 생성[PL_poinwon_process] 함수 수행...");
         /*sprintf(FL_sql,"SELECT A.empno, A.korname,NVL(A.orgnum,'ZZZ'), NVL(A.deptcode,'ZZZZZ'),                  \
                                  UPPER(A.paycl), UPPER(A.payra), UPPER(A.nojeonyn),A.pstate,NVL(B.deptlevel, 'ZZ'),\
                                  LTRIM(RTRIM(NVL(B.sectcode, 'ZZZ'))),  LTRIM(RTRIM(NVL(B.fieldcode, 'ZZZ'))), NVL(B.boncode, 'ZZZZZZ')   \
                             FROM pimpmas A, pycdept B       \
                            WHERE SUBSTR(A.empdate,1,6) <= '%s' AND A.deptcode = B.deptcode(+) AND A.orgnum   = B.orgnum(+)  AND SUBSTR(A.empno,1,1) <> 'I'  \
                              AND (nvl(A.pstateyn, ' ') not in ('N', 'n')) AND ((A.pstate < '80') OR  (A.pstate > '80' AND NVL(SUBSTR(A.retdate,1,6), '999999') > '%s')) ORDER BY A.empno ",*/
         /*2018.12.18 스쿼드 구성원의 통계생성을 위해 수정. : 트라이브조직 구성원은 근무부서 기준으로 통계 생성*/
          sprintf(FL_sql,"SELECT A.empno,                   \
                                 A.korname,                 \
                                 NVL(A.orgnum,'ZZZ'),       \
                                 Case When (X.Tribegb='2' And Y.Tribegb='2') Then A.Jobdept Else A.Deptcode End,\
                                 UPPER(A.paycl),            \
                                 Case When (X.Tribegb='2' And Y.Tribegb='2') Then A.Jobpayra Else A.payra End,\
                                 UPPER(A.nojeonyn),         \
                                 A.pstate,                  \
                                 Case When (X.Tribegb='2' And Y.Tribegb='2') Then Nvl(X.deptlevel,'ZZ') Else Nvl(Y.deptlevel,'ZZ') End,\
                                 Case When (X.Tribegb='2' And Y.Tribegb='2') Then LTRIM(RTRIM(NVL(X.sectcode, 'ZZZ'))) Else LTRIM(RTRIM(NVL(Y.sectcode, 'ZZZ'))) End,\
                                 Case When (X.Tribegb='2' And Y.Tribegb='2') Then LTRIM(RTRIM(NVL(X.fieldcode, 'ZZZ'))) Else LTRIM(RTRIM(NVL(Y.fieldcode, 'ZZZ'))) End,\
                                 Case When (X.Tribegb='2' And Y.Tribegb='2') Then Nvl(X.boncode,'ZZZZZ') Else Nvl(Y.boncode,'ZZZZZ') End \
                            FROM pimpmas A, \
                                (Select Deptcode, deptlevel, sectcode, fieldcode, boncode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) X,\
                                (Select Deptcode, deptlevel, sectcode, fieldcode, boncode, Substr(Tribegb,1,1) Tribegb From Pycdept Where Orgnum = Func_Orgnum) Y \
                           WHERE SUBSTR(A.empdate,1,6) <= '%s' \
                             AND A.Deptcode = X.deptcode  \
                             AND A.jobdept  = Y.deptcode  \
                             AND A.orgnum   = Func_Orgnum \
                             AND SUBSTR(A.empno,1,1) <> 'I'  \
                             AND (nvl(A.pstateyn, ' ') not in ('N', 'n')) \
                             AND ((A.pstate < '80')         \
                              OR  (A.pstate > '80' AND NVL(SUBSTR(A.retdate,1,6), '999999') > '%s')) \
                           ORDER BY A.empno ",
                  FGP_pihtopo->V_topoym.arr, FGP_pihtopo->V_topoym.arr);
     }

     /* EXEC SQL PREPARE S FROM :FL_sql; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )369;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)FL_sql;
     sqlstm.sqhstl[0] = (unsigned long )4096;
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


     /* EXEC SQL DECLARE cur_01 CURSOR FOR S; */ 

     /* EXEC SQL OPEN cur_01; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 6;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )388;
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
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     while(TRUE)
     {
          /* EXEC SQL FETCH cur_01 INTO
                  :FGP_pihtopo->V_empno,
                  :FGP_pihtopo->V_korname,
                  :FGP_pihtopo->V_orgnum,
                  :FGP_pihtopo->V_deptcode,
                  :FGP_pihtopo->V_paycl,
                  :FGP_pihtopo->V_payra,
                  :FGP_pihtopo->V_nojeonyn,
                  :FGP_pihtopo->V_pstate,
                  :FGP_pihtopo->V_deptlevel,
                  :FGP_pihtopo->V_sectcode,
                  :FGP_pihtopo->V_fieldcode,
                  :FGP_pihtopo->V_boncode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 12;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )403;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_empno);
          sqlstm.sqhstl[0] = (unsigned long )7;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_korname);
          sqlstm.sqhstl[1] = (unsigned long )15;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_pihtopo->V_orgnum);
          sqlstm.sqhstl[2] = (unsigned long )6;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_pihtopo->V_deptcode);
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_pihtopo->V_paycl);
          sqlstm.sqhstl[4] = (unsigned long )5;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_pihtopo->V_payra);
          sqlstm.sqhstl[5] = (unsigned long )6;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_pihtopo->V_nojeonyn);
          sqlstm.sqhstl[6] = (unsigned long )4;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_pihtopo->V_pstate);
          sqlstm.sqhstl[7] = (unsigned long )5;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&(FGP_pihtopo->V_deptlevel);
          sqlstm.sqhstl[8] = (unsigned long )7;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&(FGP_pihtopo->V_sectcode);
          sqlstm.sqhstl[9] = (unsigned long )6;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&(FGP_pihtopo->V_fieldcode);
          sqlstm.sqhstl[10] = (unsigned long )6;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&(FGP_pihtopo->V_boncode);
          sqlstm.sqhstl[11] = (unsigned long )9;
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



          if  (SQLCODE == SQL_NO_DATA)
          {
               /* EXEC SQL CLOSE cur_01; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 12;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )466;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_log_print(0, "커서(cur_01) 데이타가 더 이상 없음...");
               break;
          }

          if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NULL_COL))
          {
               /* EXEC SQL CLOSE cur_01; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 12;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )481;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               STRINIT(&FL_Line);
               sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
               hinsa_log_print(0, FL_Line);
               return (FAILURE);
          }

          PL_init_count();
          FG_skip = FALSE;

          FG_po_cnt++;
          PL_poinwon_calc();

          /*STRINIT(FL_Line);
          sprintf(FL_Line, "사번 : %s  %s  처리중...", FGP_pihtopo->V_empno.arr, FGP_pihtopo->V_korname.arr);
          hinsa_log_print(0, FL_Line); */

          if  (FG_skip == FALSE)
          {
               if  (PL_poinwon_write() == FAILURE)     return (FAILURE);
               if  ((strcmp(FGP_pihtopo->V_tpgubun.arr, "20") == 0) || (strcmp(FGP_pihtopo->V_tpgubun.arr, "30") == 0))
               {
                    STR2VCTRIM(FGP_pihtopo->V_tpgubun, "10", TPGUBUN);
                    if (PL_poinwon_write() == FAILURE)     return (FAILURE);
               }
          }
     }

     return (SUCCESS);
}

/*==================================================================================================
  현원을 판단한다...
==================================================================================================*/
void PL_poinwon_calc(void)
{
     char FL_Line[255];

     if  ((strncmp(FGP_pihtopo->V_paycl.arr, "0", 1) == 0) || (strncmp(FGP_pihtopo->V_paycl.arr, "A", 1) == 0))  /* 임원일 경우 */
     {
          FG_imwon_cnt++;
          if  (strcmp(FGP_pihtopo->V_ipoyn.arr, "Y") != 0)  /* 임원포함여부가 N일겨우 현원에 포함을 시키지 않는다.. */
          {
               FG_skip = TRUE;
               return;
          }
     }

     if  (strcmp(FGP_pihtopo->V_nojeonyn.arr, "Y") == 0) /* 노조전임일 경우 노조전임 카운트 아닐경우 계획/현원 카운트.*/
     {
          FG_nojo_cnt++;
          STR2VCTRIM(FGP_pihtopo->V_tpgubun, "30", TPGUBUN);
     }
     else
          STR2VCTRIM(FGP_pihtopo->V_tpgubun, "10", TPGUBUN);

     if  (((strncmp(FGP_pihtopo->V_pstate.arr, "2", 1) == 0) && (strcmp(FGP_pihtopo->V_pstate.arr, "22") >= 0)) ||
           (strncmp(FGP_pihtopo->V_pstate.arr, "3", 1) == 0))
     {
          PL_patpgubun_process();
          if  (strcmp(FGP_pihtopo->V_epoyn.arr, "Y") != 0)  /* 퍄견/교육 현원 포함여부가 N일경우 현원에 포함을 시키지 않는다.. */
          {
               FG_skip = TRUE;
               return;
          }
     }
     else if  (strncmp(FGP_pihtopo->V_pstate.arr, "6", 1) == 0)       /* 정직자일 경우 */
     {
          FG_jung_cnt++;
          if  (strcmp(FGP_pihtopo->V_jpoyn.arr, "Y") != 0)  /* 정직자 현원 포함여부가 N일경우 현원에 포함을 시키지 않는다.. */
          {
                FG_skip = TRUE;
                return;
          }
     }
     else if  (strncmp(FGP_pihtopo->V_pstate.arr, "7", 1) == 0)       /* 휴직자일 경우 */
     {
          FG_hu_cnt++;
          if  (strcmp(FGP_pihtopo->V_hpoyn.arr, "Y") != 0)
          {
                FG_skip = TRUE;
                return;
          }
     }

     if  (strcmp(FGP_pihtopo->V_manunit.arr, "C0") == 0)                /* 본부단위 */
          VC2VC(FGP_pihtopo->V_deptcode, FGP_pihtopo->V_boncode);

     /* BAND/직책별로 현원을 계산한다. */
     if  ((strncmp(FGP_pihtopo->V_paycl.arr, "0", 1) == 0) || (strncmp(FGP_pihtopo->V_paycl.arr, "A", 1) == 0))  /* 임원 */
     {
          FGP_pihtopo->V_pdirsum++;                                    /* 임원 소계 */
          if  (strcmp(FGP_pihtopo->V_paycl.arr, "01") == 0)        /* 회장 */
               FGP_pihtopo->V_pdir11++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "02") == 0)        /* 부회장 */
               FGP_pihtopo->V_pdir12++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "03") == 0)        /* 사장 */
               FGP_pihtopo->V_pdir21++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "04") == 0)        /* 감사 */
               FGP_pihtopo->V_pdir31++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "05") == 0)        /* 부사장 */
               FGP_pihtopo->V_pdir41++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "06") == 0)        /* 전무 */
               FGP_pihtopo->V_pdir51++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "07") == 0)        /* 상무 */
               FGP_pihtopo->V_pdir61++;
          /* 선임연구원필드 고문 필드로 사용(선임연구위원필드는 하나로에서 사용 안함) */
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "0A") == 0)        /* 고문 */
               FGP_pihtopo->V_pdir6a++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "08") == 0)        /* 이사 */
               FGP_pihtopo->V_pdir71++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "09") == 0)        /* 이사대우 */
               FGP_pihtopo->V_pdir72++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "0B") == 0)        /* 수석부사장 2007.10. */
               FGP_pihtopo->V_pdir7a++;
   /* 2008.08.14        jissi          자체 개선       HR인프라고도화 프로젝트에 따른 프로그램 수정*/
          //else if  (strcmp(FGP_pihtopo->V_paycl.arr, "01") == 0)        /* 회장 */
          //     FGP_pihtopo->V_pdir11++;
          //else if  (strcmp(FGP_pihtopo->V_paycl.arr, "02") == 0)        /* 부회장 */
          //     FGP_pihtopo->V_pdir12++;
          //2017.03.20.hjku.. 사장, 부사장 집계 정리.. 김진호M 요청
          //else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A21") == 0)         /* E3 */
          //     FGP_pihtopo->V_pdir21++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A20") == 0)         /* 사장-E4-D */
               FGP_pihtopo->V_pdir21++;
          //else if  (strcmp(FGP_pihtopo->V_paycl.arr, "04") == 0)        /* 감사 */
          //     FGP_pihtopo->V_pdir31++;
          //2017.03.20.hjku.. 사장, 부사장 집계 정리.. 김진호M 요청
          //else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A31") == 0)         /* 부사장 */
          //     FGP_pihtopo->V_pdir41++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A21") == 0)         /* 부사장-E3-C */
               FGP_pihtopo->V_pdir41++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A41") == 0)         /* 전무-E2-B */
               FGP_pihtopo->V_pdir51++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A51") == 0)         /* 상무-E1-A */
               FGP_pihtopo->V_pdir61++;
          //else if  (strcmp(FGP_pihtopo->V_paycl.arr, "0A") == 0)        /* 고문 */
          //     FGP_pihtopo->V_pdir6a++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A61") == 0)         /* SE */
               FGP_pihtopo->V_pdir71++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "A55") == 0)          /* 전문임원 */
               FGP_pihtopo->V_pdir72++;
          //else if  (strcmp(FGP_pihtopo->V_paycl.arr, "0B") == 0)        /* 수석부사장 2007.10. */
          //     FGP_pihtopo->V_pdir7a++;
          else
          {
               FGP_pihtopo->V_pdiretc++;                                  /* 임원 기타 소계 */
               STRINIT(&FL_Line);
               sprintf(FL_Line, "가.BAND필드가 없는 사번 : %s  %s", FGP_pihtopo->V_empno.arr, FGP_pihtopo->V_korname.arr);
               hinsa_log_print(0, FL_Line);
          }
     }
     else if  (((strcmp(FGP_pihtopo->V_paycl.arr, "10")  >= 0) && (strcmp(FGP_pihtopo->V_paycl.arr, "90")  < 0)) ||
               ((strcmp(FGP_pihtopo->V_paycl.arr, "C11") >= 0) && (strcmp(FGP_pihtopo->V_paycl.arr, "D40") < 0)))
     {
          FGP_pihtopo->V_ppossum++;                                    /* 정규직 소계 */
          if  (strcmp(FGP_pihtopo->V_paycl.arr, "10") == 0)             /* SM2급 */
               FGP_pihtopo->V_ppos1++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "20") == 0)        /* SM1급 */
               FGP_pihtopo->V_ppos2++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "21") == 0)        /* M2급 */
               FGP_pihtopo->V_ppos3++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "23") == 0)        /* M1급 */
               FGP_pihtopo->V_ppos4++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "31") == 0)        /* S2급 */
               FGP_pihtopo->V_ppos5++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "33") == 0)        /* S1급 */
               FGP_pihtopo->V_ppos6++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "41") == 0)        /* J3급 */
               FGP_pihtopo->V_ppos7++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "43") == 0)        /* J2급 */
               FGP_pihtopo->V_ppos8++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "45") == 0)        /* J1급 */
               FGP_pihtopo->V_ppos9++;
         /* 1.02       2004.06.17         이민용          자체 개선       직급체계변경에 따른 프로그램 수정*/
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "10") == 0)        /* 부장 */
               FGP_pihtopo->V_p10++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "20") == 0) /* 차장 */
               FGP_pihtopo->V_p20++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "22") == 0) /* 과장 */
               FGP_pihtopo->V_p22++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "32") == 0) /* 대리 */
               FGP_pihtopo->V_p32++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "40") == 0) /* 사원(대졸) */
               FGP_pihtopo->V_p40++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "42") == 0) /* 사원(전졸) */
               FGP_pihtopo->V_p42++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "44") == 0) /* 사원(고졸) */
               FGP_pihtopo->V_p44++;
          /* 2008.08.14        jissi          자체 개선       HR인프라고도화 프로젝트에 따른 프로그램 수정*/
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "C11") == 0) /* L2 */
               FGP_pihtopo->V_p10++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "C21") == 0) /* L1 */
               FGP_pihtopo->V_p20++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D11") == 0) /* G4 */
               FGP_pihtopo->V_p22++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D21") == 0) /* G2 */
               FGP_pihtopo->V_p32++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D31") == 0) /* G3(대졸) */
               FGP_pihtopo->V_p40++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D33") == 0) /* G3(전졸) */
               FGP_pihtopo->V_p42++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D35") == 0) /* G3(고졸) */
               FGP_pihtopo->V_p44++;
          /* 2018.12.27       Lee Sangmoon   자체 개선       BAND 신설에 따른 프로그램 수정*/
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "C31") == 0) /* M2(직책자) */
               FGP_pihtopo->V_p10++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "C33") == 0) /* M2(일반) */
               FGP_pihtopo->V_p20++;
          else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D10") == 0) /* M1 */
               FGP_pihtopo->V_p22++;
          else
          {
               STRINIT(&FL_Line);
               sprintf(FL_Line, "나.BAND필드가 없는 사번 : %s  %s", FGP_pihtopo->V_empno.arr, FGP_pihtopo->V_korname.arr);
               hinsa_log_print(0, FL_Line);
          }
     }
     /* 특정직(93)으로 통합 : 특수직(92), 특정행정직(93), 고문(A1), 촉탁(A2), 용무(A3)
        특수직 : pspe3 특정행정직 : pspe4, 고문 : psxtr1, pextrsum, 촉탁 : psxtr2, pextrsum,
        용무 : psxtr3, pextrsum */
     else if  (strcmp(FGP_pihtopo->V_paycl.arr, "93") == 0)
          FGP_pihtopo->V_pspe1++;
     else if  ((strcmp(FGP_pihtopo->V_paycl.arr, "E1") == 0) || (strcmp(FGP_pihtopo->V_paycl.arr, "E0") == 0))  /* 계약 */
          FGP_pihtopo->V_pcontsum++;
     else if  (strcmp(FGP_pihtopo->V_paycl.arr, "H1") == 0)        /* 협력 */
          FGP_pihtopo->V_ptempsum++;
     else if  (strcmp(FGP_pihtopo->V_paycl.arr, "C1") == 0)        /* 전문계약직 */
          FGP_pihtopo->V_psconsum++;
     /* 2008.08.14        jissi          자체 개선       HR인프라고도화 프로젝트에 따른 프로그램 수정*/
     else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D41") == 0)
          FGP_pihtopo->V_pspe1++;
     else if  ((strcmp(FGP_pihtopo->V_paycl.arr, "H11") == 0) || (strcmp(FGP_pihtopo->V_paycl.arr, "H51") == 0))  /* 계약 */
          FGP_pihtopo->V_pcontsum++;
     else if  (strcmp(FGP_pihtopo->V_paycl.arr, "K11") == 0)        /* 파견직 */
          FGP_pihtopo->V_ptempsum++;
     else if  (strcmp(FGP_pihtopo->V_paycl.arr, "H10") == 0)        /* 전문계약직 */
          FGP_pihtopo->V_psconsum++;
     else if  (strcmp(FGP_pihtopo->V_paycl.arr, "D92") == 0)      /* Expert 계약에 포함 - 2019.02.14 Lee Sangmoon*/
          FGP_pihtopo->V_pcontsum++;
     else
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "다.BAND필드가 없는 사번 : %s  %s", FGP_pihtopo->V_empno.arr, FGP_pihtopo->V_korname.arr);
          hinsa_log_print(0, FL_Line);
     }
     /* 특정직소계 실제는 특정직(pspe1)만 존재*/
     FGP_pihtopo->V_pspesum  = FGP_pihtopo->V_pspe1;
     /* 2017.03.09.hjku.. 무기계약직도 정규직으로 계산.. 김진호M 요청
     FGP_pihtopo->V_pemptot  = (FGP_pihtopo->V_ppossum + FGP_pihtopo->V_pspesum);     정규직총계 */
     FGP_pihtopo->V_pemptot  = (FGP_pihtopo->V_ppossum + FGP_pihtopo->V_pspesum +
                                FGP_pihtopo->V_psconsum);    /* 정규직총계 */
     FGP_pihtopo->V_pimsitot = FGP_pihtopo->V_ptempsum;                              /* 임용직총계 */

     /*2017.03.09.hjku.. 무기계약직도 정규직으로 한산되어 제외.. 김진호M 요청
     FGP_pihtopo->V_ptotal   = (FGP_pihtopo->V_pdirsum  + FGP_pihtopo->V_pemptot  +
                                FGP_pihtopo->V_pimsitot + FGP_pihtopo->V_pcontsum +
                                FGP_pihtopo->V_psconsum);                             현원총계 */
     FGP_pihtopo->V_ptotal   = (FGP_pihtopo->V_pdirsum  + FGP_pihtopo->V_pemptot  +
                                FGP_pihtopo->V_pimsitot + FGP_pihtopo->V_pcontsum); /* 현원총계 */
     return;
}

/*==================================================================================================
  파견 or 교육 인원수를 판단한다.
==================================================================================================*/
void PL_patpgubun_process(void)
{
     char FL_Line[255];

     V_exist_count = 0;

     /* EXEC SQL
     SELECT COUNT(value1)  INTO :V_exist_count
       FROM pimvari
      WHERE gubun   = '50'
        AND sgubun  > '1000'
        AND  value1 = :FGP_pihtopo->V_deptcode; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 12;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(value1) into :b0  from pimvari where ((gub\
un='50' and sgubun>'1000') and value1=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )496;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&V_exist_count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_deptcode);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "사번 : %s  %s   Oracle 에러 : %s", FGP_pihtopo->V_empno.arr, FGP_pihtopo->V_korname.arr, SQLERRM);
          hinsa_log_print(0, FL_Line);
          return;
     }

     if  (V_exist_count > 0)  /* 파견/교육별도 부서이면 */
     {
          FG_pa_cnt++;
          STR2VCTRIM(FGP_pihtopo->V_tpgubun, "20", TPGUBUN);
     }
     else
          STR2VCTRIM(FGP_pihtopo->V_tpgubun, "10", TPGUBUN);

     return;
}

/*==================================================================================================
   계획/현원 데이타를 수정한다...
==================================================================================================*/
int PL_poinwon_write(void)
{
     char FL_Line[255];

     STRINIT(&FGP_pihtopo->V_pcretime);
     STR2VCTRIM(FGP_pihtopo->V_pcretime,hinsa_sys_date(4),WRITETIME);

     /* 1.02       2004.06.17         이민용          자체 개선       직급체계변경에 따른 프로그램 수정*/
     /* EXEC SQL
     UPDATE pihtopo
        SET boncode   = :FGP_pihtopo->V_boncode,
            pdir11    = pdir11   + :FGP_pihtopo->V_pdir11,           /o 임원 - 회장 o/
            pdir12    = pdir12   + :FGP_pihtopo->V_pdir12,           /o 임원 - 부회장 o/
            pdir21    = pdir21   + :FGP_pihtopo->V_pdir21,           /o 임원 - 사장 o/
            pdir31    = pdir31   + :FGP_pihtopo->V_pdir31,           /o 임원 - 감사 o/
            pdir41    = pdir41   + :FGP_pihtopo->V_pdir41,           /o 임원 - 부사장 o/
            pdir51    = pdir51   + :FGP_pihtopo->V_pdir51,           /o 임원 - 전무 o/
            pdir61    = pdir61   + :FGP_pihtopo->V_pdir61,           /o 임원 - 상무 o/
            pdir6a    = pdir6a   + :FGP_pihtopo->V_pdir6a,           /o 임원 - 선임연구위원1 o/
            pdir71    = pdir71   + :FGP_pihtopo->V_pdir71,           /o 임원 - 이사 o/
            pdir72    = pdir72   + :FGP_pihtopo->V_pdir72,           /o 임원 - 전문임원 2012.02.03 변경o/
            pdir7a    = pdir7a   + :FGP_pihtopo->V_pdir7a,           /o 임원 - t수석부사장  2007.10.변경 o/
            pdiretc   = pdiretc  + :FGP_pihtopo->V_pdiretc,          /o 임원 - 기타 o/
            pdirsum   = pdirsum  + :FGP_pihtopo->V_pdirsum,          /o 임원 - 소계 o/
            ppos1     = ppos1    + :FGP_pihtopo->V_ppos1,            /o 정규직 - SM2급 (수석부장) o/
            ppos2     = ppos2    + :FGP_pihtopo->V_ppos2,            /o 정규직 - SM1급 (부장) o/
            ppos3     = ppos3    + :FGP_pihtopo->V_ppos3,            /o 정규직 - M2급  (차장) o/
            ppos4     = ppos4    + :FGP_pihtopo->V_ppos4,            /o 정규직 - M1급  (선임과장) o/
            ppos5     = ppos5    + :FGP_pihtopo->V_ppos5,            /o 정규직 - S2급  (과장) o/
            ppos6     = ppos6    + :FGP_pihtopo->V_ppos6,            /o 정규직 - S1급  (대리) o/
            ppos7     = ppos7    + :FGP_pihtopo->V_ppos7,            /o 정규직 - J3급  (사원) o/
            ppos8     = ppos8    + :FGP_pihtopo->V_ppos8,            /o 정규직 - J2급  (사원) o/
            ppos9     = ppos9    + :FGP_pihtopo->V_ppos9,            /o 정규직 - J1급  (사원) o/
            ppossum   = ppossum  + :FGP_pihtopo->V_ppossum,          /o 정규직 - 소계  o/
            pspe1     = pspe1    + :FGP_pihtopo->V_pspe1,            /o 특정직 - 특수직(92), 특정행정직(93), 고문(A1), 촉탁(A2), 용무(A3) o/
            pspesum   = pspesum  + :FGP_pihtopo->V_pspesum,          /o 특정직 소계 o/
            pemptot   = pemptot  + :FGP_pihtopo->V_pemptot,          /o 정규직 총계 (정규직소계 + 특정직 소계) o/
            ptempsum  = ptempsum + :FGP_pihtopo->V_ptempsum,         /o 협력사원 소계o/
            pimsitot  = pimsitot + :FGP_pihtopo->V_pimsitot,         /o 임용직 총계 (협력사원 소계) o/
            pcontsum  = pcontsum + :FGP_pihtopo->V_pcontsum,         /o 일반계약직(계약사원(Q 사번),게약직(P 사번)) o/
            psconsum  = psconsum + :FGP_pihtopo->V_psconsum,         /o 전문계약직(J 사번)  o/
            ptotal    = ptotal   + :FGP_pihtopo->V_ptotal,           /o 현원 총계 o/
            pcretime  = :FGP_pihtopo->V_pcretime,
            writetime = :FGP_pihtopo->V_pcretime,
            writeemp  = :FG_jobempno,
            p10       = p10 + :FGP_pihtopo->V_p10,
            p20       = p20 + :FGP_pihtopo->V_p20,
            p22       = p22 + :FGP_pihtopo->V_p22,
            p32       = p32 + :FGP_pihtopo->V_p32,
            p40       = p40 + :FGP_pihtopo->V_p40,
            p42       = p42 + :FGP_pihtopo->V_p42,
            p44       = p44 + :FGP_pihtopo->V_p44
      WHERE topoym    = :FGP_pihtopo->V_topoym
        AND orgnum    = :FGP_pihtopo->V_orgnum
        AND deptcode  = :FGP_pihtopo->V_deptcode
        AND tpgubun   = :FGP_pihtopo->V_tpgubun; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 46;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pihtopo  set boncode=:b0,pdir11=(pdir11+:b1),pdi\
r12=(pdir12+:b2),pdir21=(pdir21+:b3),pdir31=(pdir31+:b4),pdir41=(pdir41+:b5),\
pdir51=(pdir51+:b6),pdir61=(pdir61+:b7),pdir6a=(pdir6a+:b8),pdir71=(pdir71+:b\
9),pdir72=(pdir72+:b10),pdir7a=(pdir7a+:b11),pdiretc=(pdiretc+:b12),pdirsum=(\
pdirsum+:b13),ppos1=(ppos1+:b14),ppos2=(ppos2+:b15),ppos3=(ppos3+:b16),ppos4=\
(ppos4+:b17),ppos5=(ppos5+:b18),ppos6=(ppos6+:b19),ppos7=(ppos7+:b20),ppos8=(\
ppos8+:b21),ppos9=(ppos9+:b22),ppossum=(ppossum+:b23),pspe1=(pspe1+:b24),pspe\
sum=(pspesum+:b25),pemptot=(pemptot+:b26),ptempsum=(ptempsum+:b27),pimsitot=(\
pimsitot+:b28),pcontsum=(pcontsum+:b29),psconsum=(psconsum+:b30),ptotal=(ptot\
al+:b31),pcretime=:b32,writetime=:b32,writeemp=:b34,p10=(p10+:b35),p20=(p20+:\
b36),p22=(p22+:b37),p32=(p32+:b38),p40=(p40+:b39),p42=(p42+:b40),p44=(p44+:b4\
1) where (((topoym=:b42 and orgnum=:b43) and deptcode=:b44) and tpgubun=:b45)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )519;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_boncode);
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_pdir11);
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&(FGP_pihtopo->V_pdir12);
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&(FGP_pihtopo->V_pdir21);
     sqlstm.sqhstl[3] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&(FGP_pihtopo->V_pdir31);
     sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&(FGP_pihtopo->V_pdir41);
     sqlstm.sqhstl[5] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&(FGP_pihtopo->V_pdir51);
     sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&(FGP_pihtopo->V_pdir61);
     sqlstm.sqhstl[7] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&(FGP_pihtopo->V_pdir6a);
     sqlstm.sqhstl[8] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&(FGP_pihtopo->V_pdir71);
     sqlstm.sqhstl[9] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&(FGP_pihtopo->V_pdir72);
     sqlstm.sqhstl[10] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&(FGP_pihtopo->V_pdir7a);
     sqlstm.sqhstl[11] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&(FGP_pihtopo->V_pdiretc);
     sqlstm.sqhstl[12] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&(FGP_pihtopo->V_pdirsum);
     sqlstm.sqhstl[13] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&(FGP_pihtopo->V_ppos1);
     sqlstm.sqhstl[14] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&(FGP_pihtopo->V_ppos2);
     sqlstm.sqhstl[15] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&(FGP_pihtopo->V_ppos3);
     sqlstm.sqhstl[16] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&(FGP_pihtopo->V_ppos4);
     sqlstm.sqhstl[17] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&(FGP_pihtopo->V_ppos5);
     sqlstm.sqhstl[18] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&(FGP_pihtopo->V_ppos6);
     sqlstm.sqhstl[19] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&(FGP_pihtopo->V_ppos7);
     sqlstm.sqhstl[20] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&(FGP_pihtopo->V_ppos8);
     sqlstm.sqhstl[21] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&(FGP_pihtopo->V_ppos9);
     sqlstm.sqhstl[22] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&(FGP_pihtopo->V_ppossum);
     sqlstm.sqhstl[23] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&(FGP_pihtopo->V_pspe1);
     sqlstm.sqhstl[24] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)&(FGP_pihtopo->V_pspesum);
     sqlstm.sqhstl[25] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)&(FGP_pihtopo->V_pemptot);
     sqlstm.sqhstl[26] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&(FGP_pihtopo->V_ptempsum);
     sqlstm.sqhstl[27] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)&(FGP_pihtopo->V_pimsitot);
     sqlstm.sqhstl[28] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&(FGP_pihtopo->V_pcontsum);
     sqlstm.sqhstl[29] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&(FGP_pihtopo->V_psconsum);
     sqlstm.sqhstl[30] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)&(FGP_pihtopo->V_ptotal);
     sqlstm.sqhstl[31] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)&(FGP_pihtopo->V_pcretime);
     sqlstm.sqhstl[32] = (unsigned long )18;
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&(FGP_pihtopo->V_pcretime);
     sqlstm.sqhstl[33] = (unsigned long )18;
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)FG_jobempno;
     sqlstm.sqhstl[34] = (unsigned long )5;
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)&(FGP_pihtopo->V_p10);
     sqlstm.sqhstl[35] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)&(FGP_pihtopo->V_p20);
     sqlstm.sqhstl[36] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)&(FGP_pihtopo->V_p22);
     sqlstm.sqhstl[37] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
     sqlstm.sqhstv[38] = (unsigned char  *)&(FGP_pihtopo->V_p32);
     sqlstm.sqhstl[38] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[38] = (         int  )0;
     sqlstm.sqindv[38] = (         short *)0;
     sqlstm.sqinds[38] = (         int  )0;
     sqlstm.sqharm[38] = (unsigned long )0;
     sqlstm.sqadto[38] = (unsigned short )0;
     sqlstm.sqtdso[38] = (unsigned short )0;
     sqlstm.sqhstv[39] = (unsigned char  *)&(FGP_pihtopo->V_p40);
     sqlstm.sqhstl[39] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[39] = (         int  )0;
     sqlstm.sqindv[39] = (         short *)0;
     sqlstm.sqinds[39] = (         int  )0;
     sqlstm.sqharm[39] = (unsigned long )0;
     sqlstm.sqadto[39] = (unsigned short )0;
     sqlstm.sqtdso[39] = (unsigned short )0;
     sqlstm.sqhstv[40] = (unsigned char  *)&(FGP_pihtopo->V_p42);
     sqlstm.sqhstl[40] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[40] = (         int  )0;
     sqlstm.sqindv[40] = (         short *)0;
     sqlstm.sqinds[40] = (         int  )0;
     sqlstm.sqharm[40] = (unsigned long )0;
     sqlstm.sqadto[40] = (unsigned short )0;
     sqlstm.sqtdso[40] = (unsigned short )0;
     sqlstm.sqhstv[41] = (unsigned char  *)&(FGP_pihtopo->V_p44);
     sqlstm.sqhstl[41] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[41] = (         int  )0;
     sqlstm.sqindv[41] = (         short *)0;
     sqlstm.sqinds[41] = (         int  )0;
     sqlstm.sqharm[41] = (unsigned long )0;
     sqlstm.sqadto[41] = (unsigned short )0;
     sqlstm.sqtdso[41] = (unsigned short )0;
     sqlstm.sqhstv[42] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
     sqlstm.sqhstl[42] = (unsigned long )9;
     sqlstm.sqhsts[42] = (         int  )0;
     sqlstm.sqindv[42] = (         short *)0;
     sqlstm.sqinds[42] = (         int  )0;
     sqlstm.sqharm[42] = (unsigned long )0;
     sqlstm.sqadto[42] = (unsigned short )0;
     sqlstm.sqtdso[42] = (unsigned short )0;
     sqlstm.sqhstv[43] = (unsigned char  *)&(FGP_pihtopo->V_orgnum);
     sqlstm.sqhstl[43] = (unsigned long )6;
     sqlstm.sqhsts[43] = (         int  )0;
     sqlstm.sqindv[43] = (         short *)0;
     sqlstm.sqinds[43] = (         int  )0;
     sqlstm.sqharm[43] = (unsigned long )0;
     sqlstm.sqadto[43] = (unsigned short )0;
     sqlstm.sqtdso[43] = (unsigned short )0;
     sqlstm.sqhstv[44] = (unsigned char  *)&(FGP_pihtopo->V_deptcode);
     sqlstm.sqhstl[44] = (unsigned long )9;
     sqlstm.sqhsts[44] = (         int  )0;
     sqlstm.sqindv[44] = (         short *)0;
     sqlstm.sqinds[44] = (         int  )0;
     sqlstm.sqharm[44] = (unsigned long )0;
     sqlstm.sqadto[44] = (unsigned short )0;
     sqlstm.sqtdso[44] = (unsigned short )0;
     sqlstm.sqhstv[45] = (unsigned char  *)&(FGP_pihtopo->V_tpgubun);
     sqlstm.sqhstl[45] = (unsigned long )5;
     sqlstm.sqhsts[45] = (         int  )0;
     sqlstm.sqindv[45] = (         short *)0;
     sqlstm.sqinds[45] = (         int  )0;
     sqlstm.sqharm[45] = (unsigned long )0;
     sqlstm.sqadto[45] = (unsigned short )0;
     sqlstm.sqtdso[45] = (unsigned short )0;
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
          STRINIT(&FL_Line);
          sprintf(FL_Line, "부서 : %s  %s   Oracle 에러 : %s", FGP_pihtopo->V_deptcode.arr, SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     return (SUCCESS);
}


/*==================================================================================================
   인사변수 데이타를 수정한다.
==================================================================================================*/
int PL_update_pimvari(void)
{
     char FL_Line[255];

     /* EXEC SQL
     UPDATE pimvari        /o 최종작업년월 o/
        SET value2 = :FGP_pihtopo->V_topoym
      WHERE gubun  = '50'
        AND sgubun = '0001'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 46;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimvari  set value2=:b0 where (gubun='50' and sg\
ubun='0001')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )718;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_topoym);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     if  ((strcmp(FGP_pihtopo->V_cregubun.arr, "11") == 0) || (strcmp(FGP_pihtopo->V_cregubun.arr, "12") == 0) ||
          (strcmp(FGP_pihtopo->V_cregubun.arr, "30") == 0))
          STR2VCTRIM(FGP_pihtopo->V_pocredate,FG_today,YYMMDD);

     if  ((strcmp(FGP_pihtopo->V_cregubun.arr, "20") == 0) || (strcmp(FGP_pihtopo->V_cregubun.arr, "30") == 0))
          STR2VCTRIM(FGP_pihtopo->V_tocredate,FG_today,YYMMDD);

     /* EXEC SQL
     UPDATE pimvari
        SET value1 = :FGP_pihtopo->V_tocredate,       /o 계획인원생성일 o/
            value2 = :FGP_pihtopo->V_pocredate        /o 현원생성일 o/
      WHERE gubun  = '50'
        AND sgubun = '0002'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 46;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pimvari  set value1=:b0,value2=:b1 where (gubun=\
'50' and sgubun='0002')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )737;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&(FGP_pihtopo->V_tocredate);
     sqlstm.sqhstl[0] = (unsigned long )11;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&(FGP_pihtopo->V_pocredate);
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



     if  ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
     {
          STRINIT(&FL_Line);
          sprintf(FL_Line, "Oracle 에러 : %s", SQLERRM);
          hinsa_log_print(0, FL_Line);
          return (FAILURE);
     }

     return (SUCCESS);
}

/*=== K.J 2005.10. Rexec대체 서비스를 위한 ====================*/
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
     sqlstm.arrsiz = 46;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )760;
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



     if  ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
     {
          printf("ERROR_CODE : %d, pybatlog Insert Error. \n", sqlca.sqlcode);
          return(FAIL);
     }

     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 46;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )801;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}
/**********<< PROGRAM END >>********************************/