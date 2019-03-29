
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
    "pkg3075g.pc"
};


static unsigned int sqlctx = 151683;


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
   unsigned char  *sqhstv[29];
   unsigned long  sqhstl[29];
            int   sqhsts[29];
            short *sqindv[29];
            int   sqinds[29];
   unsigned long  sqharm[29];
   unsigned long  *sqharc[29];
   unsigned short  sqadto[29];
   unsigned short  sqtdso[29];
} sqlstm = {12,29};

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

 static char *sq0010 = 
"select NVL(OVTMDATE,' ') ,NVL(A.EMPNO,' ') ,NVL(A.KORNAME,' ') ,NVL(A.PAYCL\
,' ') ,NVL(FRAPPTIME,'*') ,NVL(FRREALTIME,'*') ,NVL(TOREALTIME,'*') ,totpay ,\
substr(NVL(CONLTIME,'00000000'),1,8) ,CONLEMP ,NVL(RESTMM,0) ,NVL(SPRESTMM,0)\
 ,NVL(TJOBDUTY,' ') , case  when OVTMDATE<:b0 then hper.COMMONUTIL.GET_OLDBAS\
EPAY(a.EMPNO,c.YEARPAYNUM) else hper.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO,c.YEAR\
PAYNUM)  end   from PKHOTHIS A ,PKHYPHIS B ,PKCPBAS C ,PIMPMAS D where ((((((\
(OVTMDATE between :b1 and :b2 and A.EMPNO>=:b3) and A.EMPNO<=:b4) and TO_CHAR\
(C.YEARPAYNUM)=B.YEARPAYNUM) and A.EMPNO=B.EMPNO) and B.EMPNO=D.EMPNO) and UP\
PER(NVL(CONYN,' '))='Y') and A.WRITETIME='***') order by A.EMPNO,OVTMDATE    \
        ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,241,0,0,0,0,0,1,0,
20,0,0,2,88,0,4,244,0,0,1,0,0,1,0,2,97,0,0,
39,0,0,3,53,0,4,250,0,0,1,0,0,1,0,2,97,0,0,
58,0,0,4,72,0,4,256,0,0,3,1,0,1,0,1,97,0,0,2,97,0,0,2,97,0,0,
85,0,0,5,63,0,4,321,0,0,1,0,0,1,0,2,97,0,0,
104,0,0,6,47,0,4,357,0,0,1,0,0,1,0,2,4,0,0,
123,0,0,7,47,0,4,362,0,0,1,0,0,1,0,2,4,0,0,
142,0,0,8,291,0,5,367,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
173,0,0,9,280,0,5,410,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
204,0,0,10,699,0,9,469,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
239,0,0,10,0,0,15,478,0,0,0,0,0,1,0,
254,0,0,10,0,0,13,484,0,0,14,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,2,97,0,0,2,4,0,
0,
325,0,0,10,0,0,15,492,0,0,0,0,0,1,0,
340,0,0,11,117,0,4,1423,0,0,3,2,0,1,0,1,97,0,0,1,4,0,0,2,97,0,0,
367,0,0,12,81,0,4,1443,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
390,0,0,13,66,0,4,1464,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
413,0,0,14,265,0,4,1505,0,0,6,5,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,
452,0,0,15,44,0,4,1648,0,0,1,0,0,1,0,2,4,0,0,
471,0,0,16,44,0,4,1735,0,0,1,0,0,1,0,2,4,0,0,
490,0,0,17,433,0,5,1754,0,0,29,29,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
621,0,0,18,77,0,4,1857,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
648,0,0,19,247,0,4,1874,0,0,3,2,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,
675,0,0,20,467,0,4,1883,0,0,10,8,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,2,3,0,0,2,3,0,0,
730,0,0,21,63,0,4,1924,0,0,1,0,0,1,0,2,97,0,0,
749,0,0,22,50,0,3,1959,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
790,0,0,23,0,0,29,1969,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKG3075G(초과근무수당  계산 := notes 전송 data)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김승회
 Version        : 30.00
 Date           : 1999.01.05

SELECT : PKCHOLI, PKHOTHIS, PKCOTBAS, PKMPMAS, PKHYPHIS, PKCPBAS
UPDATE : PKHOTHIS

Update Contents
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 1.00     1997.02.13       김승회     최초개발본                  설계명세서
 30.00    1999.01.05       민정숙     시간당통상임금계산로직변경  하나로재개발
 30.01    1999.08.17       이랑교     notes에서 초과근무 등록후 수당계산
 30.05    1999.10.20       이랑교     근무시간중 휴식시간을 분으로 받아서
             총 초과근무시간 - 통상임금 * floor(휴식시간 /60)
 30.20    2001.08.09.      유효성     휴일근무시 식사시간 제외 추가       전(2001-3450)
                                      (pkhothis에 mealhh, mealamt,excephh,excepamt 추가) 
 30.21    2004.02.24       강륜종     Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드
 30.41    2004.08.25       강륜종     2003년 02월 1일부터 초과근무 야근식대 인상 : 3000 => 3500 
 30.50    2004.08.27.      강륜종(dsa200)야근식대 DB에서(PKCOTBAS) 읽어오도록 변경 
 30.60    2004.11.         강륜종(dsa2000)  Rexec대체 서비스를 위한 수정작업.  
 ============================================================================= */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

/*#define  SUCCESS     -1*/
#define  FAIL        -2
#define  FRTIME1  "2200"     /* 야간근무시작시간      */
#define  TOTIME1  "3000"     /* 야간근무종료시간(익일06:00)  */
#define  FRTIME2  "4600"     /* 야간근무시작시간(익일22:00)   */
#define  TOTIME2  "4800"     /* 야간근무종료시간(익일24:00)  */

/*** 함수 Prototype 선언  ***/

/*DB package에서 계산 jissi. 2014.11.05
double  get_tongpay(char *);
*/
int     Get_ConTerm(char *indate);
void    get_lastsaturday(char* yymm, char* lastsaturday);
void    get_dayname(char *indate,char *result);
void    get_lastday(char* yymm, char* result);
void    add_days(char* indate,int m, char* rdate);
double  calc_term(char *frdate,char *todate);
void    trail_spaces(char *dest);
float   get_hourterm_con(int a,int b);
float   get_hourterm(int a,int b);


/* log File 관련 */
void    CreateLog();
void    WriteLog(char *message);
/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 


/***  초과근무이력테이블(PKHOTHIS) 참조변수  ***/
     char    ovtmdate[9]      = "";  /* 근무일자     */
     char    empno[5]         = "";  /* 사번       */
     char    korname[13]      = "";  /* 성명       */
     char    paycl[4]         = "";  /* 직급       */
     double  paygr            = 0;   /* 호봉       */
     char    payra[4]         = "";  /* 직위       */
     char    orgnum[4]        = "";  /* 조직차수     */
     char    deptcode[7]      = "";  /* 부서코드     */
     char    otkind[3]        = "";  /* 초과근무구분     */
     char    daykind[2]       = "";  /* 근무일구분     */
     char    frapptime[5]     = "";  /* 근무예정시간From  */
     char    toapptime[5]     = "";  /* 근무예정시간To  */
     char    toappdate[9]     = "";  /* 근무예정일To     */
     char    ovtmdesc[31]     = "";  /* 근무내역     */
     char    frrealtime[13]   = "";  /* 실제개시시간     */
     char    torealtime[13]   = "";  /* 실제종료시간     */
     float   exthh            = 0;   /* 연장근로시간     */
     double  nighthh          = 0;   /* 야간근로시간     */
     double  holihh           = 0;   /* 휴일근로시간     */
     double  overhh           = 0;   /* 초과근무시간계  */
     float   ovtmhh           = 0;   /* 초과근무시간총계  */
     double  genext           = 0;   /* 일반연장근로시간  */
     double  holiext          = 0;   /* 휴일연장근로시간  */
     char    apptime[13]      = "";  /* 신청시각     */
     char    conyn[2]         = "";  /* 결재여부     */
     char    contime[13]      = "";  /* 결재일시     */
     char    conemp[5]        = "";  /* 결재자사번     */
     char    conlemp[5]       = "";  /* 최종결재자사번  */
     char    conltime[8+1]    = "";  /* 최종결재일     */
     char    giveyn[2]        = "";  /* 지급여부     */
     double  ovtmrate         = 0;   /* 초과근무비율     */
     double  extamt           = 0;   /* 연장근로수당     */
     double  nightamt         = 0;   /* 야간근로수당     */
     double  holiamt          = 0;   /* 휴일근로수당     */
     double  overamt          = 0;   /* 초과근무수당계  */
     double  ovtmamt          = 0;   /* 초과근무수당총계  */
     double  ovmcamt          = 0;
     char    tjobduty[3]      = "";  /* 담당직무      */
     char    dinner[2]        = "";  /* 석식장소     */

/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.00    1999.01.05       민정숙     시간당통상임금계산로직변경  하나로재개발
 ============================================================================= */
     double  totpay           = 0;
     double  tongpay          = 0;
   /*  double  basicamt  = 0;
     double  infoamt     = 0;
     double  dutyamt     = 0;  */
   
     double  t_nighthh        = 0;   /* 야간근로시간     */
     float   t_genexthh       = 0;   /* 일반연장근로시간  */
     double  t_holihh         = 0;   /* 휴일근로시간     */
     double  t_holiexthh      = 0;   /* 휴일연장근로시간  */
     double  t_extamt         = 0;   /* 연장근로수당     */
     double  t_nightamt       = 0;   /* 야간근로수당     */
     double  t_holiamt        = 0;   /* 휴일근로수당     */
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.01    1999.08.17       이랑교     notes에서 초과근무 등록후 수당계산
 ============================================================================= */
     double  t_restmm         = 0;   /* 초과근무제외시간  */
     double  t_restamt        = 0;   /* 초과근무제외수당  */
     double  t_sprestmm       = 0;   /* 근무시간에 휴식한 제외시간  */
     double  t_sprestamt      = 0;   /* 근무시간에 휴식한 제외수당  */
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                   relevant doc.no  
 30.20    2001.08.09.      유효성     휴일근무시 식사시간 제외 추가  전(2001-3450)
============================================================================= */  
     double  t_mealhh        = 0;    /* 식사시간제외시간           */
     double  t_excephh       = 0;    /* 9시간이상시 제외시간   */
     double  t_mealamt       = 0;    /* 식사시간제외수당             */
     double  t_excepamt      = 0;    /* 9시간이상시 제외수당   */
   
     double  s_totdd;
     float   s_exthh;
     double  s_nighthh;
     double  s_holihh;
     double  s_tothh;
     float   s_genext;
     double  s_holiext;
     double  s_extamt; 
     double  s_nightamt;
     double  s_holiamt;
     double  s_ovtmamt;
     double  s_ovmcamt;
     float   s_ovtmhh;
   
     char    workmm[7]         = "";   /* 작업년월  */
     char    frworkdate[9]     = "";   /* 작업년월일 fr  */
     char    toworkdate[9]     = "";   /* 작업년월일 to  */
     char    frempno[5]        = "";   /* 사번FROM     */
     char    toempno[5]        = "";   /* 사번TO     */
     char    jobempno[5]       = "";   /* 작업자사번     */
     char    comchdate[9]      = "";   /* 통상임금기준변경일 2014.11 jissi */
     
     char    t_paycl[4]      = "";  
     char    workmon[6+1];
     long    s_count         = 0;
     long    f_count         = 0;
     double  total_amt       = 0;
     char    bgntime[5]      ="";    /* 석식시작 시간*/
     char    endtime[5]      ="" ;   /* 석식end 시간*/
           
     double  ovminamt        = 0;    /* 기준통상임금(최저) 적용 (2008.02.18 추가)     */   
     double  y_manrate       = 0;    /* 일반직 관리수수료율  (2008.03.20 추가),통상임금 계산시 사용     */              

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


/****************************************************************************** 
  Other Variables
******************************************************************************/ 
/*char  logdir[100] = "/hper/insa/cron/ovtmlog/";*/
char  logfile[40];
char  logfile_fullname[140];
int   id;
char  dir[80];
char  LSaturday[8+1]  = "";
char  mm[3] = "";

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 

/***** Log Filspeciale Pointer *****/
FILE *fp;  


void main(int argc,char *argv[])
{
     int   flag;
     char  FL_file[255];
     char  curdatetime[20+1]="";
     
     /*dsa2000 Rexec 대체 파라미터 추가...*/
     if  (argc != 5) {  /*/hper/insa/HINSA/proc/bin/Kbin/pkg3075g 0000 zzzz HINT pkg3075g */
          printf("[Usage] : pkg3075g 1.사번fr 2.사번to 3.작업자사번 4.프로그램ID \n");
          exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkg3075g");
     
     hinsa_get_filename(1, FL_file);
     /*if (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }*/
     
     strcpy(frempno,argv[1]);
     strcpy(toempno,argv[2]);
     strcpy(jobempno,argv[3]);
     
     memset(dir,0x00,sizeof(dir));
     memset(log_buff,0x00,sizeof(log_buff));
     
     /* Dsa2000  2004.02.24.  **********************************/
     /* DB_connect(id,0); */
     hinsa_log_print(0,"초과근무수당 계산 시작...[pkg3075g]"); 
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     
     /* EXEC SQL LOCK TABLE PKHOTHIS
       IN EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE PKHOTHIS IN EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


           
     /* EXEC SQL
     SELECT to_char(add_months(to_date(FIXMON, 'YYYYMM'),1), 'YYYYMM') 
       INTO  :workmon
       FROM PKCOTBAS ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(add_months(to_date(FIXMON,'YYYYMM'),1),'\
YYYYMM') into :b0  from PKCOTBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmon;
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



     /* 통상임금기준변경일 2014.11 jissi */   
     /* EXEC SQL
     SELECT  value1 
       INTO  :comchdate
       FROM PKCVARI
      WHERE gubun ='CM'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select value1 into :b0  from PKCVARI where gubun='CM'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )39;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)comchdate;
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

  
     
     /* EXEC SQL
     SELECT  :workmon||'01',  to_char(sysdate, 'YYYYMMDD')
       INTO  :frworkdate,:toworkdate
       FROM  DUAL ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (:b0||'01') ,to_char(sysdate,'YYYYMMDD') into :b\
1,:b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )58;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmon;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frworkdate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toworkdate;
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

      
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[3]);
     strcpy(log_progid,   argv[4]);
     strcpy(log_rundate,  toworkdate);  /*파라미터에서 안받고 시스템 시간 받음(cron으로 실행하므로)*/
     \
     /*jissi 테스트용
     strcpy(frworkdate, "20141101")  ;  
     strcpy(toworkdate, "20141130")  ;  
     */   
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     sprintf(frworkdate,"%.8s",frworkdate);
     sprintf(toworkdate,"%.8s",toworkdate);
     
     CreateLog();
     
     sprintf(log_buff, "작업년월일fr ~ to : %s ~ %s\n", frworkdate, toworkdate);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
           
     sprintf(log_buff, "사번fr ~ to : %s ~ %s\n", argv[1], argv[2]);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
     sprintf(log_buff, "작업자사번 : %s\n", argv[3]);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
     sprintf(log_buff, "  ");
     
     if  (clear_records() != SUCCESS)
     {
          fclose(fp);
          sprintf(log_buff, "= 작업실패 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          hinsa_exit(0," 작업실패. !!!\n");
     }
     
     s_count = f_count = total_amt =  0;
     
     flag =  process_records();
     
     printf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count);
     sprintf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff);  /*dsa2000 Rexec 대체*/
     
     printf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count);
     sprintf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
     printf(log_buff," 총수당액 : %10.0f 원\n",total_amt);
     sprintf(log_buff," 총수당액 : %10.0f 원\n",total_amt);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
     /*** 종료시간 Print dsa2000 Add ***************************/
     /* EXEC SQL  
     SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
       INTO :curdatetime
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0  fr\
om DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )85;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curdatetime;
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


     
     sprintf(log_buff, "종료시간 : %.14s \n ",curdatetime);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); 
     /*********************************************************/
     
     if  (flag != SUCCESS)
     {
          sprintf(log_buff,"작업이 실패했습니다.\n");
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          error_quit("작업이 실패했습니다.\n");
     }
     else
     {
          sprintf(log_buff,"작업이 성공적으로 완료되었습니다.\n");
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK 작업이 성공적으로 완료되었습니다.\n");
     }
     
     fclose(fp);
}

/*****************************************************************************
  계산 전 해당항목을 Clear하는 함수.  
 *****************************************************************************/ 
clear_records()
{
     ovminamt  = 0; /* 통상임금이 시간당 최저 임금보다 낮을 경우 최저임금으로 계산 */
     y_manrate = 0;/* 일반직 통상임금 계산시 관리수수료율 사용 */
     
     /* EXEC SQL
     SELECT  nvl(OVMINAMT,0) 
       INTO  :ovminamt
       FROM  PKCOTBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(OVMINAMT,0) into :b0  from PKCOTBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )104;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&ovminamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
     SELECT  nvl(Y_MANRATE,0) 
       INTO  :y_manrate
       FROM  PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select nvl(Y_MANRATE,0) into :b0  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )123;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&y_manrate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
     UPDATE  PKHOTHIS
        SET
             EXTHH      = 0,
             NIGHTHH    = 0,
             HOLIHH     = 0,
             OVTMHH     = 0,
             OVMCAMT    = 0,
             GENEXT     = 0,
             HOLIEXT    = 0,
             EXTAMT     = 0,
             NIGHTAMT   = 0,
             HOLIAMT    = 0,
             OVTMAMT    = 0,
             RESTAMT    = 0,
             SPRESTAMT  = 0,
             WRITETIME  = '***',
             MEALHH     = 0,
             MEALAMT    = 0,
             EXCEPHH    = 0,
             EXCEPAMT   = 0                
      WHERE  OVTMDATE BETWEEN  :frworkdate AND :toworkdate
        AND  EMPNO BETWEEN  :frempno and :toempno
        AND  PAYCL IS null; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS  set EXTHH=0,NIGHTHH=0,HOLIHH=0,OVTMHH=\
0,OVMCAMT=0,GENEXT=0,HOLIEXT=0,EXTAMT=0,NIGHTAMT=0,HOLIAMT=0,OVTMAMT=0,RESTAM\
T=0,SPRESTAMT=0,WRITETIME='***',MEALHH=0,MEALAMT=0,EXCEPHH=0,EXCEPAMT=0 where\
 ((OVTMDATE between :b0 and :b1 and EMPNO between :b2 and :b3) and PAYCL is n\
ull )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )142;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frworkdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toworkdate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
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

    /* Dsa2000 2003.12.05  deptcode is null */
     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0)) 
     {
          sprintf(log_buff,"ERROR_CODE : %d, 자료 Clear Error. \n", sqlca.sqlcode);
          WriteLog(log_buff);
          return(FAIL);
     }
     else
          return(SUCCESS);
}
/*****************************************************************************
  대상자료를 추출하는 함수.
 *****************************************************************************/
process_records()
{
     char  t_date[11]   = "";
     char  maxcondate[8+1] = "";
     int   holicnt = 0;
     
     /* EXEC    SQL
     UPDATE  PKHOTHIS A
        SET  (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCODE )=
             (SELECT B.PAYCL,B.PAYGR,B.PAYRA,B.ORGNUM,B.DEPTCODE
                FROM   PKMPMAS B
               WHERE A.EMPNO = B.EMPNO
             )
      WHERE  OVTMDATE BETWEEN  :frworkdate AND :toworkdate
        AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  UPPER(NVL(CONYN,' ')) = 'Y'
        AND  WRITETIME  = '***'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS A  set (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCO\
DE)=(select B.PAYCL ,B.PAYGR ,B.PAYRA ,B.ORGNUM ,B.DEPTCODE  from PKMPMAS B w\
here A.EMPNO=B.EMPNO) where (((OVTMDATE between :b0 and :b1 and (A.EMPNO>=:b2\
 and A.EMPNO<=:b3)) and UPPER(NVL(CONYN,' '))='Y') and WRITETIME='***')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )173;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frworkdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toworkdate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)frempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)toempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
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


           
     if  ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0)) 
     {
           sprintf(log_buff,"ERROR_CODE : %d, 인사자료 SETTING Error. \n", sqlca.sqlcode);
           WriteLog(log_buff);
     }
     
     /*
     EXEC SQL DECLARE cursor1 CURSOR FOR
     SELECT  NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
             NVL(A.KORNAME,' '),NVL(A.PAYCL,' '),
             NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
             NVL(TOREALTIME,'*'), totpay,
             substr(NVL(CONLTIME,'00000000'),1,8),CONLEMP,
             NVL(RESTMM,0),NVL(SPRESTMM,0),NVL(TJOBDUTY, ' '),
             case when OVTMDATE < :comchdate                         *2014.11.17이후 초과근무수당 계산할 때 통상임금이 총연봉 18분할에서 고정식교비포함 12분할로* 
                  then hper.COMMONUTIL.GET_OLDBASEPAY(a.EMPNO)
                  else hper.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO) end   *DB package에서 계산 jissi. 2014.11.05* 
       FROM  PKHOTHIS A, PKHYPHIS B, PKCPBAS C, PIMPMAS D
      WHERE  OVTMDATE BETWEEN :frworkdate AND :toworkdate 
        AND  A.EMPNO >= :frempno AND A.EMPNO <= :toempno 
        AND  TO_CHAR(C.YEARPAYNUM) =  B.YEARPAYNUM 
        AND  A.EMPNO = B.EMPNO 
        AND  B.EMPNO = D.EMPNO
        AND  UPPER(NVL(CONYN,' ')) = 'Y' 
        AND  A.WRITETIME = '***'
      ORDER  BY A.EMPNO, OVTMDATE;
     */
     /* EXEC SQL DECLARE cursor1 CURSOR FOR
     SELECT  NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
             NVL(A.KORNAME,' '),NVL(A.PAYCL,' '),
             NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
             NVL(TOREALTIME,'*'), totpay,
             substr(NVL(CONLTIME,'00000000'),1,8),CONLEMP,
             NVL(RESTMM,0),NVL(SPRESTMM,0),NVL(TJOBDUTY, ' '),
             case when OVTMDATE < :comchdate                                     /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                  then hper.COMMONUTIL.GET_OLDBASEPAY(a.EMPNO,c.YEARPAYNUM)
                  else hper.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO,c.YEARPAYNUM) end  /oDB package에서 계산 jissi. 2016.12.14o/
       FROM  PKHOTHIS A, PKHYPHIS B, PKCPBAS C, PIMPMAS D
      WHERE  OVTMDATE BETWEEN :frworkdate AND :toworkdate 
        AND  A.EMPNO >= :frempno AND A.EMPNO <= :toempno 
        AND  TO_CHAR(C.YEARPAYNUM) =  B.YEARPAYNUM 
        AND  A.EMPNO = B.EMPNO 
        AND  B.EMPNO = D.EMPNO
        AND  UPPER(NVL(CONYN,' ')) = 'Y' 
        AND  A.WRITETIME = '***'
      ORDER  BY A.EMPNO, OVTMDATE; */ 

     
     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 5;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0010;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )204;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)comchdate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frworkdate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toworkdate;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)frempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)toempno;
     sqlstm.sqhstl[4] = (unsigned long )5;
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


     
     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405)) 
     {
        
          sprintf(log_buff,"In the Select ERROR_CODE : %d, Cursor1 Open Error\n", sqlca.sqlcode);
          WriteLog(log_buff);
                   
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 5;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )239;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }
     
     while(1) 
     {
          /* EXEC SQL FETCH cursor1
          INTO :ovtmdate, :empno, :korname, :paycl, 
          	   :frapptime,:frrealtime, :torealtime, :totpay,
               :conltime, :conlemp,
               :t_restmm,:t_sprestmm ,:tjobduty, :tongpay; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 14;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )254;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)ovtmdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
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
          sqlstm.sqhstv[2] = (unsigned char  *)korname;
          sqlstm.sqhstl[2] = (unsigned long )13;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)paycl;
          sqlstm.sqhstl[3] = (unsigned long )4;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)frapptime;
          sqlstm.sqhstl[4] = (unsigned long )5;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)frrealtime;
          sqlstm.sqhstl[5] = (unsigned long )13;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)torealtime;
          sqlstm.sqhstl[6] = (unsigned long )13;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&totpay;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)conltime;
          sqlstm.sqhstl[8] = (unsigned long )9;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)conlemp;
          sqlstm.sqhstl[9] = (unsigned long )5;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&t_restmm;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)tjobduty;
          sqlstm.sqhstl[12] = (unsigned long )3;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&tongpay;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
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
               /* EXEC SQL CLOSE cursor1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 14;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )325;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }
          
          trail_spaces(frapptime);
          trail_spaces(frrealtime);
          trail_spaces(torealtime);
          trail_spaces(paycl);
          
          /*하절기 동절기 식사시간 세팅 :  동절기 근무제 폐지 2008.11 kth. 동절기 근무제 부활(2006.11.) dsa2000.    동절기 근무제 폐지(2004.11.) */
          strncpy(mm,frrealtime+4,2) ; 
          strcpy(bgntime, "1800")  ;  
          strcpy(endtime, "1900")  ;      
               
                          
/*     if ((strcmp( mm, "11") == 0 ) ||
            (strcmp( mm, "12") == 0 ) ||
            (strcmp( mm, "01") == 0 ) ||
            (strcmp( mm, "02") == 0 ))
       {
             strcpy(bgntime, "1700")  ;  
              strcpy(endtime, "1800")  ;
          }  
     else     
          {
              strcpy(bgntime, "1800")  ;  
              strcpy(endtime, "1900")  ;
          }                                  
*/          


                /*=================================================
                  결재일범위(3일 )를    벗어난     결재'Y'자료를
                             'N'로 변경한다.
                  변경조건 :  근무일 + 3 + 휴일일수 < 결재일
                 *=================================================*

                 holicnt =  Get_ConTerm(ovtmdate);
                 add_days(ovtmdate,holicnt,maxcondate );

                 if (strcmp (empno,"0222") ==0 )
                     printf("\n holicnt %d,ovtmdate[%s],maxcondate[%s]",
                            holicnt,ovtmdate,maxcondate);

                 if (strcmp( conltime,maxcondate  ) > 0 )
                 {
                     EXEC SQL
                     UPDATE PKHOTHIS
                     SET    CONYN     = 'N',
                            VALIDDESC = '결재일범위 초과 '||:maxcondate,
                            WRITEMAN = :jobempno,
                            WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
                     WHERE  EMPNO = :empno
                     AND    OVTMDATE = :ovtmdate
                     AND    NVL(FRAPPTIME,'*')  = :frapptime
                     AND    NVL(FRREALTIME,'*') = :frrealtime;

* debug               printf("\n 사번[%s],초과근무일[%s],최종결재일[%s][%d]",
                 empno ,ovtmdate,conltime,strcmp( conltime,maxcondate));
                 *

                     sprintf(buff,"\n 사번[%s],초과근무일[%s],최종결재일[%s] ,최종결재자[%s]",
                                    empno ,ovtmdate,conltime,conlemp);
                     WriteLog(buff);
                     continue;              
                 }

                 *=================================================* 
                 AFTERYN : Y면 사후등록 */
                 
          sprintf(log_buff,"   ");
          WriteLog(log_buff);
          
          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

/*
printf("\n debug empno[%s],[%s],[%s]",empno ,frrealtime,torealtime); 
*/

                
          if ( (get_nighthh(frrealtime,torealtime)    == SUCCESS) &&
               (get_genexthh(frrealtime,torealtime)   == SUCCESS) &&
               (process_holihh(frrealtime,torealtime) == SUCCESS) &&
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                relevant doc.no  
 30.20    2001.08.09.      유효성       휴일근무시 식사시간 제외 추가 
============================================================================= */
               (get_mealhh(frrealtime, torealtime) == SUCCESS) &&
               (get_excepthh(frrealtime, torealtime)== SUCCESS) ) 
          
          {
               if  (update_record() != SUCCESS) 
               {
                    sprintf(log_buff," 수당 수정 불가자 =>사번 : %s, 성명 : %s \n ",  empno,korname);
                    WriteLog(log_buff);
                   
                    strncpy(t_date,ovtmdate,4);
                    t_date[4] = '-';
                    strncpy(t_date+5,ovtmdate+4,2);
                    t_date[7] = '-';
                    strncpy(t_date+8,ovtmdate+6,2);
                    t_date[10] = '\0';
                  
               /*infra       sprintf(log_buff," 초과근무일자 : %s,  직급 : %s \n", t_date,paycl); */
                    sprintf(log_buff," 초과근무일자 : %s,  BAND : %s \n", t_date,paycl);                                
                                        WriteLog(log_buff);
               }
               s_count++;
          }
          else 
          {
               f_count++;
               sprintf(log_buff," 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname);
                                WriteLog(log_buff);
                                
               strncpy(t_date,ovtmdate,4);
               t_date[4] = '-';
               strncpy(t_date+5,ovtmdate+4,2);
               t_date[7] = '-';
               strncpy(t_date+8,ovtmdate+6,2);
               t_date[10] = '\0';
               
               /* printf(" 초과근무일자 : %s \n",t_date); */
               sprintf(log_buff," 초과근무일자 : %s \n",t_date);
               WriteLog(log_buff);
          }
     }
}

/*****************************************************************************
  야간근로시간을 실제근무시작시간과 실제근무종료시간으로 부터 
  구하는 함수.
******************************************************************************/
get_nighthh(char *frtime, char *totime)
{
     int   dd       = 0;
     int   tmp      = 0;
     char  stime[5] = "";
     char  etime[5] = "";
     char  t_str[5] = "";
     int   btime1 = 0;
     int   btime2 = 0;
     int   btime3 = 0;
     int   btime4 = 0;     
     int   istime = 0;
     int   ietime = 0;
     
     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     istime = atoi(stime);
     ietime = atoi(etime);
     btime1 = atoi(FRTIME1);
     btime2 = atoi(TOTIME1);
     btime3 = atoi(FRTIME2);
     btime4 = atoi(TOTIME2);
     
     dd = check_datetime(frtime,totime);
     if  (dd == FAIL)
          return(FAIL);
     
     if  (dd == 1) 
     {
          strncpy(t_str,totime+8,4);
          tmp   = atoi(t_str);
          ietime  = tmp + 2400;
     }
     else if ((dd == 0) && (strcmp(stime,"0000") >= 0) && 
              (strcmp(stime,"0800") < 0)) 
     { 
          strncpy(t_str,frtime+8,4);
          tmp   = atoi(t_str);
          istime   = tmp + 2400;
          
          strncpy(t_str,totime+8,4);
          tmp = atoi(t_str);
          ietime = tmp + 2400;
     }
     
     if ( (istime >= btime1) && (istime <= btime2) && 
          (ietime > btime2) )  
     {
           t_nighthh = get_hourterm(istime,btime2);
     } 
     else if ((ietime >= btime1) &&
              (ietime <= btime2) &&
              (istime < btime1)) 
     {
          t_nighthh = get_hourterm(btime1,ietime);
     }
     else if ((istime >= btime1) && (istime <= btime2) && 
              (ietime <= btime2) && (ietime >  istime))  {
          t_nighthh = get_hourterm(istime,ietime);
     }
     else if ((istime <= btime1) && (ietime >= btime2) &&
              (ietime >  istime)) 
     {
          t_nighthh = get_hourterm(btime1,btime2);
     }
     else 
     {
          t_nighthh = 0;
     }
     
     if ((ietime >= btime3) && (ietime <= btime4))
          t_nighthh += get_hourterm(btime3,ietime);
     
     return(SUCCESS);
}
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no  
 30.20    2001.08.09.      유효성       휴일근무시 식사시간 제외 추가 
============================================================================= */  
/*****************************************************************************
  실제근무시작시간과 실제근무종료시간으로 부터 
  식사시간을 구하는 함수.
******************************************************************************/
get_mealhh(char *frtime, char *totime)
{
     int     dd       = 0;
     int     tmp      = 0;
     char    stime[5] = "";
     char    etime[5] = "";
     char    t_str[5] = "";
     char    str[8+1] = "";
     int     btime1 = 0;
     int     btime2 = 0;
     int     istime = 0;
     int     ietime = 0;
     int     daykind = 0 ;
     double  t_mealmm = 0 ;  
     
     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     istime = atoi(stime);
     ietime = atoi(etime);  
     
     
     strncpy(str,frtime,8);
     daykind   = get_daykind(str);        
              
     dd = check_datetime(frtime,totime);            
        
     
     if  (dd == FAIL) 
          return(FAIL);
     
     if ((daykind == 1)  && (dd == 0) ) /*평일이고 하루면 그냥 return*/           
          return (SUCCESS) ;         
   
     if (dd == 1) 
     {
         strncpy(t_str,totime+8,4);
         tmp     = atoi(t_str);
         ietime  = tmp + 2400;
     }
          
   
   /* 아침, 점심, 저녁 식사시간을 차례로 계산 */ 
   /*아침*/
     if  (daykind == 4 ) 
     {
                  
          btime1 = 800 ;
          btime2 = 900 ;
          
          if ((istime >= btime1) && (istime <= btime2) && 
              (ietime > btime2) )    
          {                   
               t_mealmm  = get_minterm(istime, btime2) ;     
          } 
          else if ((ietime >= btime1) && 
                   (ietime <= btime2) &&
                   (istime < btime1)) 
          {     
               t_mealmm  = get_minterm(btime1,ietime);         
          }
          else if ((istime >= btime1) && (istime <= btime2) && 
                   (ietime <= btime2) && (ietime >  istime))  
          {
               t_mealmm = get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime)) 
          {
                t_mealmm = get_minterm(btime1,btime2);
          }
          else 
          {
               t_mealmm = 0;
          }
          
          /*점심*/
          btime1 = 1200 ;
          btime2 = 1300 ;
          
          if ((istime >= btime1) && (istime <= btime2) && 
               (ietime > btime2) )  
          {         
                t_mealmm +=  get_minterm(istime,btime2);
          } 
          else if ((ietime >= btime1) && 
                   (ietime <= btime2) &&
                   (istime < btime1)) 
          {     
               t_mealmm  += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) && 
                   (ietime <= btime2) && (ietime >  istime))  
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime)) 
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else 
          {
               t_mealmm += 0;
          }
     }
             
          /*저녁*/
     btime1 = atoi(bgntime) ;
     btime2 = atoi(endtime) ;
      
      
     if ((istime >= btime1) && (istime <= btime2) && 
          (ietime > btime2) )  
     {         
          t_mealmm += get_minterm(istime,btime2);
     } 
     else if ((ietime >= btime1) && 
              (ietime <= btime2) &&
              (istime < btime1))
     {     
        t_mealmm += get_minterm(btime1,ietime);
     }
     else if ((istime >= btime1) && (istime <= btime2) && 
              (ietime <= btime2) && (ietime >  istime))  
     {
          t_mealmm += get_minterm(istime,ietime);
     }
     else if ((istime <= btime1) && (ietime >= btime2) &&
              (ietime >  istime)) {
           t_mealmm += get_minterm(btime1,btime2);
     }
     else 
     {
          t_mealmm += 0;
     }  
         
            
          /*다음날 아침*/  
         
     if ((dd == 1) && (strcmp(etime,"0800") > 0))
     {     
          btime1 = 800 + 2400 ;
          btime2 = 900 + 2400 ;
          
          if ( (istime >= btime1) && (istime <= btime2) && 
               (ietime > btime2) )    
          {                   
                t_mealmm += get_minterm(istime, btime2) ;              
          } 
          else if ((ietime >= btime1) && 
                   (ietime <= btime2) &&
                   (istime < btime1)) 
          {
               t_mealmm += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) && 
                   (ietime <= btime2) && (ietime >  istime))  
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime)) 
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else 
          {
               t_mealmm += 0;
          }
         
     
          /* 다음날 점심*/  
            
          btime1 = 1200 + 2400 ;
          btime2 = 1300 + 2400 ;
          
          if ((istime >= btime1) && (istime <= btime2) && 
              (ietime > btime2) )  
          {                   
               t_mealmm  +=  get_minterm(istime,btime2);     
          } 
          else if ((ietime >= btime1) && 
                   (ietime <= btime2) &&
                   (istime < btime1)) 
          {     
               t_mealmm  += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) && 
                   (ietime <= btime2) && (ietime >  istime))  
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime)) 
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else 
          {
               t_mealmm += 0;
          }
              
     /*다음날 저녁*/
     
          btime1 = atoi(bgntime) + 2400;
          btime2 = atoi(endtime) + 2400;
     
     
          if ((istime >= btime1) && (istime <= btime2) && 
               (ietime > btime2) )  
          {                   
               t_mealmm  += get_minterm(istime,btime2);       
          } 
          else if ((ietime >= btime1) && 
                   (ietime <= btime2) &&
                   (istime < btime1)) 
          {     
                t_mealmm += get_minterm(btime1,ietime);
          }
          else if ((istime >= btime1) && (istime <= btime2) && 
                   (ietime <= btime2) && (ietime >  istime))  
          {
               t_mealmm += get_minterm(istime,ietime);
          }
          else if ((istime <= btime1) && (ietime >= btime2) &&
                   (ietime >  istime)) 
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else 
          {
               t_mealmm += 0;
          }
        
     }  
            
     t_mealhh = floor(t_mealmm / 60) ;          
               
     return(SUCCESS);
}

/****************************************************************************
       19:00(18:00)~08:00 9시간이상근무시 1시간 제외하는 함수
 ****************************************************************************/
get_excepthh(char *frtime, char* totime)
{
     char ba[20];
     char bb[20];
     int term = 0 ;  
     int tmp = 0 ;
     
     char str[8+1] ="";
     
     int dd;
     sprintf(ba,"%s",frtime+8);
     sprintf(bb,"%s",totime+8);
     
     dd = check_datetime(frtime,totime);
     
     if  (dd == 0)
          return(SUCCESS);
           
     if  (dd == 1) 
     {
          if  (strcmp(ba, endtime) < 0 )        
               strcpy(ba, endtime)  ;
           
          if  (strcmp(bb, "0800") > 0 )
               strcpy(bb,  "0800") ;
          
          tmp = atoi(bb) + 2400 ;   
            
          tmp = (int)(get_minterm(atoi(ba), tmp) / 60)  ;

          /*2014.05.20.hjku. 휴식초과가 한시간 미만일 경우 9시간 근무한 대상자에 대해 제외시간 처리.. 홍원영M          
           if  (tmp >= 9 ) 
                t_excephh = 1 ;    
          */
                
          if  (( tmp >= 9 ) &&(floor(t_restmm/60)<1)) 
                t_excephh = 1 ;                                        
     }   
         
     return (SUCCESS) ;         
}


/****************************************************************************
        시작시간과 종료시간 사이의 간격을 시간단위로 구하는 함수.
 ****************************************************************************/
float get_hourterm(int a,int b)
{
     int mm1,mm2;  
     int hh1,hh2;
     int result;
     
     hh1 = (int) (a/100);
     hh2 = (int) (b/100);
     mm1 = a - (hh1*100);
     mm2 = b - (hh2*100);
     
     mm1 = hh1 * 60 + mm1;
     mm2 = hh2 * 60 + mm2;
     mm2 = mm2 - mm1;
     
     /*근무시간 오등록으로 음수가 나올 경우 check 2015.10.13 jissi*/  
     if  (mm2 < 0) 
          mm2 = 0;
          
     result = (int)(mm2/60);
   
   //printf("\nDEGUG 연장근무시간 :a[%d],b[%d],genexthh[%d]",a,b,result);  
     return(result);
}
/****************************************************************************
        시작시간과 종료시간 사이의 간격을 분단위로 구하는 함수.
 ****************************************************************************/
get_minterm(int a,int b)
{
     int mm1,mm2;  
     int hh1,hh2;
     
     hh1 = (int) (a/100);
     hh2 = (int) (b/100);
     mm1 = a - (hh1*100);
     mm2 = b - (hh2*100);
     
     mm1 = hh1 * 60 + mm1;
     mm2 = hh2 * 60 + mm2;
     mm2 = mm2 - mm1;
     return(mm2);
}


/****************************************************************************
       실제근무시작시간과 실제근무종료시간을 시간간격을 구하는 함수. 
 ****************************************************************************/
float get_ovtmhh(char *a, char* b)
{
     char  ba[20];
     char  bb[20];
     int   daykind1  = 0;
     int   daykind2  = 0;
     char  str[8+1]  = "";
     int   i,j,dd;
     int   tmp       = 0;
     
     sprintf(ba,"%s",a+8,4);
     sprintf(bb,"%s",b+8,4);
     i = atoi(ba);
     j = atoi(bb);
     
     strncpy(str,a,8);
     daykind1 = get_daykind(str);
     
     strncpy(str,b,8);
     daykind2 = get_daykind(str);  
     
     dd = check_datetime(a,b);
     
     //if ((strcmp(paycl,"E1") == 0 )||(strcmp(paycl,"H1") == 0 ))E1,H1 을 담당직무 비서 09,기사 15로 변경함. KTH
     if ((strcmp(tjobduty,"09") == 0 )||(strcmp(tjobduty,"15") == 0 ))
     {
          if  ((dd == 1)&&(daykind1!=4)) 
          {
               j  = j + 2400;  
               
               if ((strcmp(bb,"0600") > 0)&&(strcmp(bb,"0830") <= 0)&&(daykind2!=4)) 
               {
                    /*return(get_hourterm_con(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0)) 
                         return(get_hourterm_con(atoi("1800"),j)); 
                    else  
                         return(get_hourterm_con(i,j));
               }
               else 
               {
                    /*return(get_hourterm(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0)) 
                         return(get_hourterm(atoi("1800"),j)); 
                    else  
                         return(get_hourterm(i,j));
               }
          }
          else if  ((dd == 1)&&(daykind1==4))  
          {
               j  = j + 2400;  
               
               if ((strcmp(bb,"0600") > 0)&&(strcmp(bb,"0830") <= 0)&&(daykind2!=4)) {
                    return(get_hourterm_con(i,j));        
               }
               else
               {      
                    return(get_hourterm(i,j));
               }
          }
          else if ((dd==0)&&(daykind1!=4))
          {
               if(((strcmp(ba,"0600") > 0)&&(strcmp(ba,"0830") <  0))||
                  ((strcmp(bb,"0600") > 0)&&(strcmp(bb,"0830")<= 0))) 
               {
                    /*return(get_hourterm_con(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0)) 
                         return(get_hourterm_con(atoi("1800"),j)); 
                    else  
                         return(get_hourterm_con(i,j));
               }
               else 
               {
                    /*return(get_hourterm(i,j));
                      평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0)) 
                         return(get_hourterm(atoi("1800"),j)); 
                    else  
                         return(get_hourterm(i,j));
               }           
          }
          else 
          {
               return(get_hourterm(i,j));
          }
     }
     else 
     {
          if (daykind1!=4)
          {	
               if  (dd == 0)
               {	
                    /*return(get_hourterm(i,j));
                    평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0)) 
                         return(get_hourterm(atoi("1800"),j)); 
                    else  
                         return(get_hourterm(i,j)); 
               }
               else if (dd == 1) 
               {
                    j = j + 2400; 
                    
                    /*return(get_hourterm(i,j));
                    평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                    if ((strcmp(ba,"0900") >= 0) && (strcmp(ba,"1800") <= 0)) 
                         return(get_hourterm(atoi("1800"),j)); 
                    else  
                         return(get_hourterm(i,j)); 
               }
               else 
                    return(0);
          }
          else
          {
               if  (dd == 0)
                    return(get_hourterm(i,j));
               else if (dd == 1) 
               {
                    j = j + 2400; 
                    return(get_hourterm(i,j));
               }
               else 
                    return(0);
          }		
     }
} 
  
/****************************************************************************
  실제근무시간의 유효성을 Check 하는 함수.
****************************************************************************/
check_datetime(char *frtime,char *totime)
{
     int  len = 0;
     int  dd;
     char t_yy[3] = "";
     char t_mm[3] = "";
     char t_dd[3] = "";
     char frstr[9] = "";
     char tostr[9] = "";
     
     len = strlen(frtime);
     if  (len != 12) 
     {
          sprintf(log_buff,"실제시작시간값이 유효하지 않습니다.\n");
          WriteLog(log_buff);
          return(FAIL);
     }
     
     len  = strlen(totime);
     if  (len != 12) 
     {
          sprintf(log_buff,"실제종료시간값이 유효하지 않습니다.\n");
          WriteLog(log_buff);
          return(FAIL);
     }
     
     strncpy(frstr,frtime,8);
     strncpy(tostr,totime,8);
     dd = calc_term(frstr,tostr);
     if  (dd == FAIL)
          return(FAIL);
     
     if ((dd < 0) || (dd >= 2)) 
     {
          sprintf(log_buff,"시작일과 종료일의 간격이 유효하지 않습니다.\n");
          WriteLog(log_buff);
          return(FAIL);
     }
     
     return(dd);
}

/****************************************************************************
        E1,H1평일 오전 시작시간과 종료시간 사이의 간격을 시간단위로 구하는 함수.
 ****************************************************************************/
float get_hourterm_con(int a,int b)
{
     int mm1,mm2;  
     int hh1,hh2;
     float result;
     int hh, qq;
     
     hh1 = (int) (a/100);
     hh2 = (int) (b/100);
     mm1 = a - (hh1*100);
     mm2 = b - (hh2*100);
     
     mm1 = hh1 * 60 + mm1;
     mm2 = hh2 * 60 + mm2;
   
   /*
     mm2 = mm2 - mm1-1;
     
     result = round((float)mm2/60);
   */  
     mm2 = mm2 - mm1;

     /*근무시간 오등록으로 음수가 나올 경우 check 2015.10.13 jissi*/  
     if  (mm2 < 0) 
          mm2 = 0;
     
     hh = ((int)mm2/60);
     qq = ((int)(mm2 -hh*60)/15);
     
     result = hh + 0.25 * qq; /* 15분 단위로 계산 */
     
     return(result);
}

/***************************************************************************
  일반연장시간을 처리하는 함수.
****************************************************************************/
get_genexthh(char *frtime,char *totime)
{
     int   tmp   = 0;
     int   dd   = 0;
   /*  int   daykind  = 0;*/
     int   daykind1  = 0;
     int   daykind2  = 0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   str[8+1]   = "";
   
     dd = check_datetime(frtime,totime);  
        
     if (dd == FAIL) return(FAIL);
   
     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     strncpy(str,frtime,8);
     
   /*  daykind   = get_daykind(str);*/
   
     strncpy(str,frtime,8);
     daykind1 = get_daykind(str);
     
     strncpy(str,totime,8);
     daykind2 = get_daykind(str);  
     
     /* 2008.05.08. 추가 E1,H1 평일 오전 0600~0830 사이 초과 근무수당 15분단위로 연장근무로 인정(인력팀 정정명씨 통해서.)
        2008.10.14  수정 E1,H1을 09,15 tjobduty 담당직무로 변경 */
     if (daykind1 != 4) 
     {
   /*     dd = check_datetime(frtime,totime);
        if (dd == FAIL)
          return(FAIL);*/
          if ((dd==1) && (strcmp(etime,"0800") > 0)) 
          { /*다음날은 휴일 */
               tmp      = atoi("0800");
               tmp     = tmp + 2400;
               /*t_genexthh = get_hourterm(atoi(stime),tmp);
                 평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
               if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0)) 
                    t_genexthh = get_hourterm(atoi("1800"),tmp); 
               else  
                    t_genexthh = get_hourterm(atoi(stime),tmp);
                    
               t_holihh   = get_hourterm(atoi("0800"),atoi(etime));
               if  (t_holihh > 8)
                    t_holiexthh = t_holihh - 8;
          }
          else 
          {
               if (dd == 1) 
               {
                    //if (((strcmp(paycl,"E1") == 0 )||(strcmp(paycl,"H1") == 0 )) 09 비서 ,15 기사 tjobduty 담당직무로 변경
                    if (((strcmp(tjobduty,"09") == 0 )||(strcmp(tjobduty,"15") == 0 )) &&
                       ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0))) 
                    {
                         /*tmp      = atoi("0600");  */
                         tmp     = atoi(etime);
                         tmp     = tmp + 2400;            
                         
                         /*t_genexthh = get_hourterm_con(atoi(stime),tmp);
                           평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                         if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0)) 
                              t_genexthh = get_hourterm_con(atoi("1800"),tmp); 
                         else  
                              t_genexthh = get_hourterm_con(atoi(stime),tmp);          
                    }
                    else
                    {          
                         tmp   = atoi(etime);
                         tmp   = tmp + 2400;
                         /*t_genexthh = get_hourterm(atoi(stime),tmp);
                           평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                         if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0)) 
                              t_genexthh = get_hourterm(atoi("1800"),tmp); 
                         else  
                              t_genexthh = get_hourterm(atoi(stime),tmp);
                    }
               }
               else 
               {
                    //if((strcmp(paycl,"E1") == 0 )||(strcmp(paycl,"H1") == 0 )){ //09 비서,15 기사 담당직무로 변경 
                    if ((strcmp(tjobduty,"09") == 0 )||(strcmp(tjobduty,"15") == 0 ))
                    {
                         if (((strcmp(stime,"0600") > 0)&&(strcmp(stime,"0830") < 0))||
                             ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0))) 
                         {
                              /*t_genexthh = get_hourterm_con(atoi(stime),atoi(etime));
                                평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                              if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0)) 
                                   t_genexthh = get_hourterm_con(atoi("1800"),atoi(etime));
                              else
                                   t_genexthh = get_hourterm_con(atoi(stime),atoi(etime));
                         }
                         else 
                         {
                              /*t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                                평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                              if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0)) 
                                   t_genexthh = get_hourterm(atoi("1800"),atoi(etime));
                              else
                                   t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                         }                 
                    }
                    else
                    {          
                         /*t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                           평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                         if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0)) 
                     	        t_genexthh = get_hourterm(atoi("1800"),atoi(etime));
                         else
                              t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                    }
               }
          }
          return(SUCCESS);
     }
     else 
     {
          t_genexthh = 0;
          
          return(SUCCESS);
     }
}

/*****************************************************************************
  기준월의 마지막 토요일을 구하는 함수.
 *****************************************************************************/
void get_lastsaturday(char* yymm, char* lastsaturday)
{
     char  t_date[8+1]  = "";
     char  t_dayname[20]  = "";
     
     get_lastday(yymm,t_date);
     while(1)
     {
          get_dayname(t_date,t_dayname);
          if  (strcmp(t_dayname,"SATURDAY") == 0)
               break;
          add_days(t_date,-1,t_date);
     }
     sprintf(lastsaturday,"%.8s",t_date);
}

/*****************************************************************************
  기준일+M 일을 구하는 함수.
 *****************************************************************************/
void add_days(char* indate,int m, char* rdate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t_date[8+1]  = "";
          double  t_adddays;
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(t_date,"%s",indate);
     t_adddays = m;
     
     /* EXEC SQL
     SELECT   TO_CHAR(TO_DATE(TO_CHAR(TO_DATE(:t_date,'YYYYMMDD')+
              :t_adddays,'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD')
       INTO  :t_date
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(TO_CHAR((TO_DATE(:b0,'YYYYMMDD')\
+:b1),'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )340;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&t_adddays;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)t_date;
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


     
     sprintf(rdate,"%s",t_date);
}

/*****************************************************************************
  기준월의 마지막일을 구하는 함수.
 *****************************************************************************/
void get_lastday(char* yymm, char* result)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  basedate[9] = "";
     /* EXEC SQL END DECLARE SECTION; */ 

     
     sprintf(basedate,"%.6s01",yymm);
     
     /* EXEC SQL
     SELECT  TO_CHAR(LAST_DAY(TO_DATE(:basedate,'YYYYMMDD')),'YYYYMMDD')
       INTO  :basedate
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMMDD')),'YYYYM\
MDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )367;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)basedate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)basedate;
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


     
     basedate[8] = '\0';
     sprintf(result,"%s",basedate);
}

/****************************************************************************
       요일명을 구하는 함수.
 ***************************************************************************/
void get_dayname(char *indate,char *result)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char idate[8+1]   = "";
          char ddname[20] = "";
     /* EXEC SQL END   DECLARE SECTION; */ 

     int count;
     
     strcpy(idate,indate);
     /* EXEC SQL 
     SELECT  TO_CHAR(TO_DATE(:idate,'YYYYMMDD'),'DAY')
       INTO  :ddname
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(:b0,'YYYYMMDD'),'DAY') into :b1 \
 from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )390;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)idate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)ddname;
     sqlstm.sqhstl[1] = (unsigned long )20;
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


     
     count = 0;
     while (ddname[count] != ' ')
          count++;
     ddname[count] = '\0';
     
     sprintf(result,"%s",ddname);
}

/****************************************************************************
  근무일의 종류를 결정하는 함수.
  1 -> 평일, 2 -> 휴무토요일, 3 -> 근무토요일, 4 -> 휴일
 ****************************************************************************/
get_daykind(char *indate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

        char day[8+1];
        int  count;
     /* EXEC SQL END   DECLARE SECTION; */ 

     
     char dayname[100];
     int i = 0;
     
     get_dayname(indate,dayname);
     if  (strcmp(dayname,"SUNDAY") == 0)
          return(4);
     
     sprintf(day,"%s",indate);
     count = 0;
     /*2015.10.06 jissi 휴일/평일적용 특이자 체크 추가
     EXEC     SQL 
     SELECT   COUNT(*) 
       INTO  :count
       FROM   PKCHOLI
      WHERE   HOLIDATE = :day;
     */    
     
     /* EXEC   SQL 
     SELECT COUNT(*) 
       INTO :count
       FROM
           (
            SELECT   HOLIDATE     
              FROM   PKCHOLI         
             WHERE   HOLIDATE = :day  
            UNION 	
            SELECT   DUTYDATE
              FROM   PKHOLIEMP
             WHERE   DUTYDATE = :day
               AND   EMPNO    = :empno
               AND   DUKIND   = '49'     /o휴일적용o/
            MINUS             
            SELECT   DUTYDATE
              FROM   PKHOLIEMP
             WHERE   DUTYDATE = :day
               AND   EMPNO    = :empno
               AND   DUKIND   = '00'     /o평일적용o/	
           ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from (select HOLIDATE  from \
PKCHOLI where HOLIDATE=:b1 union select DUTYDATE  from PKHOLIEMP where ((DUTY\
DATE=:b1 and EMPNO=:b3) and DUKIND='49') minus select DUTYDATE  from PKHOLIEM\
P where ((DUTYDATE=:b1 and EMPNO=:b3) and DUKIND='00')) ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )413;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&count;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)day;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)day;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)empno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)day;
     sqlstm.sqhstl[4] = (unsigned long )9;
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


     /*printf("DEBUG count[%d],day[%s],empno[%s]\n",count,day,empno);*/
     if  (count >= 1)
     {
          i = 4;
          return(i);
     }

/*2004.8.4. 유효성 수정 : 주5일근무에따라 토요일도 휴일로 친다.. */
/*  if (strcmp(dayname,"SATURDAY") == 0)
  {
     if (strcmp(indate,LSaturday) == 0)
       i = 3;
     else
       i = 2;
  }
*/
     if  (strcmp(dayname,"SATURDAY") == 0) 
          i = 4;      
     else
          i = 1;

     return(i);
}
 /************************************************************************
  휴일근로시간과 휴일연장근로시간을 구하는 함수.
 *************************************************************************/
process_holihh(char *frtime, char *totime)
{
     char stime[5] = "";
     char etime[5] = "";
     char str[9]   = "";
     int tmp = 0;
     int dd  = 0;
     int daykind = 0;
     double  a,b;
     
     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     strncpy(str,frtime,8);
     
     daykind    = get_daykind(str);
     if  (daykind == 4) 
     {
          dd = check_datetime(frtime,totime);
          if  (dd == FAIL)
               return(FAIL);
          if ((dd==1) && (strcmp(etime,"0800") > 0) ) 
          {
               tmp    = atoi("0800");
               tmp   = tmp + 2400;
               a = get_hourterm(atoi(stime),tmp);
               b = get_hourterm(atoi("0800"),atoi(etime));
               
               t_holihh = a + b;
     
/**2001.08.10. 유효성 수정
익일 0800 이후까지 근무시 분단위 계산 보정 */
/*추가 start */                        
               tmp  =  get_minterm(atoi(stime), atoi(etime) + 2400 ) ; 
                        
               if  (tmp - (t_holihh*60) >= 60)
               {
                    a += 1 ;
                    t_holihh = a + b;
               }
/*추가 end */          
               if  (a > 8)
                    t_holiexthh = a - 8;
               if  (b > 8)
                    t_holiexthh = t_holiexthh + (b - 8);
          }
          else 
          {
               if  (dd == 1) 
               {
                    tmp      = atoi(etime);
                    tmp      = tmp + 2400;
                    t_holihh = get_hourterm(atoi(stime),tmp);
               }
               else
                    t_holihh = get_hourterm(atoi(stime), atoi(etime));
               if  (t_holihh > 8)
                    t_holiexthh = t_holihh - 8;
          }
     }

     return(SUCCESS);
}
/****************************************************************************
   계산된 근무시간을 DB에 저장하는 Procedure.
 ****************************************************************************/
update_record()
{
     char  dname[100+1]  = "";
     /*double  tongpay;  */
     int  daykind;
     double  ovtmnightamt;         /*dsa2000*/
     char  t_date[8+1]  = "";
     char  t_chkdate[5]  = ""; /* 야근 식대 처리 부분 저녁근무시 체크 2009.05.21 kth */
   
     /*tongpay = get_tongpay(paycl); */
     
     /*tongpay =  ceil(totpay/23/226);*/
   
     /*==========================================================================
        DB package에서 계산 jissi. 2014.11.05 루틴에서 제외 
        2008.06.03 시간당 최저 통상임금 적용 일반직 사원 관리수수료 제외      
     if  (strncmp(empno,"Y",1)==0) 
     {
          tongpay = ceil(totpay/18/226); *  통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11  2010.05.11 kth (1-y_manrate/100)) 없앰.*
     }
     else 
     {
          tongpay = ceil(totpay/18/226);
     }  
     
     if(tongpay<ovminamt) tongpay = ovminamt;
     ===========================================================================*/
     
     /*tongpay = ceil(totpay/12/226);
     if(tongpay<ovminamt) tongpay = ovminamt;*/
     
     /* EXEC SQL
          SELECT OVTMNIGHTAMT 
            INTO :ovtmnightamt
            FROM PKCOTBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 14;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select OVTMNIGHTAMT into :b0  from PKCOTBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )452;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&ovtmnightamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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


            
     /*2016.08.24 jissi HR팀 홍원영M 요청 SR-1608-0885
       휴일근로시간이 1시간인 경우 기존처럼 식사제외시간을 제외하지 않고 0으로 반영
       ※단, 일반연장근로는 제외함. */
     /* printf("\n debug t_mealhh[%f] t_holihh[%f] t_genexthh[%f] t_holiexthh[%f]\n ",t_mealhh,t_holihh,t_genexthh,t_holiexthh); */      
     if ((t_holihh == 1) && (t_genexthh == 0) && (t_holiexthh == 0)) 
          t_mealhh = 0;     
     /* printf("\n debug t_mealhh[%f] t_holihh[%f] t_genexthh[%f] t_holiexthh[%f]\n ",t_mealhh,t_holihh,t_genexthh,t_holiexthh); */ 
       
     t_extamt   = (t_genexthh  * tongpay * 1.5) +
                  (t_holiexthh * tongpay * 0.5);
     t_nightamt = t_nighthh    * tongpay * 0.5;
     t_holiamt  = t_holihh     * tongpay * 1.5;
     t_mealamt  = t_mealhh     * tongpay * 1.5 ;     
     t_excepamt = t_excephh    * tongpay * 1.5 ;
   
     t_extamt   = ceil(t_extamt);
     t_nightamt = ceil(t_nightamt);
     t_holiamt  = ceil(t_holiamt);
     t_mealamt  = floor(t_mealamt);
     t_excepamt = floor(t_excepamt);
     
     ovtmhh     = get_ovtmhh(frrealtime,torealtime);
   
     /* ==============================================
        초과근무에서 휴식시간분만큼을 제외하는 로직 추가
     if (t_holihh > 0)
         t_restamt  = floor(floor(t_restmm/60)  * tongpay * 1.5);
     else if (t_nighthh > 0)
         t_restamt  = floor(floor(t_restmm/60)  * tongpay * 0.5);
     * ============================================== */
   
     t_restamt  = floor(floor(t_restmm/60)  * tongpay * 1.5);
     
     
     /* ==============================================
        일상근무에서 휴식시간분만큼을 제외하는 로직 추가
     * ============================================== */        
     t_sprestamt  = floor(floor(t_sprestmm/60) * tongpay );
   
     total_amt  = total_amt + (t_extamt + t_nightamt + t_holiamt)
                  - t_restamt -t_sprestamt - t_mealamt - t_excepamt ;
                        
     if  (total_amt <= 0 )
          sprintf(log_buff,"\n 오류자료입니다. 사번[%s],성명[%s],초과근무일[%s]", empno,korname,ovtmdate);
     WriteLog(log_buff);
           /****Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체*/
           
     /*printf("\n 오류자료입니다. 사번[%s],성명[%s],초과근무일[%s]", empno,korname,ovtmdate);*/                     
   
     /* 야근식대처리부분 */  
     sprintf(t_date,"%.8s",ovtmdate);
     daykind    = get_daykind(t_date);
     switch (daykind)
     {
          case 2 :
          case 3 :
          case 4 :
               ovmcamt = 0;
               break;
          case 1 :       
          /* ================================================
             전산처리요청 : 이갑수 대리
             신청일       : 1998-06-08
             작업내용     : 98.06.17 부터 수요일에도 야근식대 지급
             작업자       : 김승회
             
          get_dayname(t_date,dname);
          if (strcmp(dname,"WEDNESDAY")   == 0)
          {
             if (strcmp(ovtmdate,"19980617") <  0)
               ovmcamt = 0;
             else
               ovmcamt = 3000;
   
          }
          else
             ovmcamt = 3000;  
              ================================================  */
   /* 강륜종 2004년 08월 25일부터 초과근무 야근식대 인상 : 3000 => 3500원으로 (늦게 반영)*/
   /*       ovmcamt = 3500;          */
   
   /* dsa2000 2004.08.27. 야근식대 DB에서(PKCOTBAS) 읽어오도록 변경 -초과근무기준관리에서 변경 가능 */
               /* EXEC SQL
               SELECT OVTMNIGHTAMT 
                 INTO :ovtmnightamt
                 FROM PKCOTBAS; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 14;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "select OVTMNIGHTAMT into :b0  from PKCOTBAS ";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )471;
               sqlstm.selerr = (unsigned short)0;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&ovtmnightamt;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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


               
               ovmcamt = ovtmnightamt;
   /* dsa2000 end ===============================================================================*/
     }
   /* 야근 식대 처리 오전근무 초과는 식대 금액 제외 kth 20090521*/  
     strncpy(t_chkdate,frrealtime+8,4);      
     if ( strcmp(t_chkdate,"1800") >= 0 )
     {
          ovmcamt = ovtmnightamt;
     }
     else 
     { 
          ovmcamt = 0;      
     }       
   
     /* EXEC SQL
     UPDATE  PKHOTHIS
        SET
             EXTHH      = (:t_genexthh + :t_holiexthh),
             NIGHTHH    = :t_nighthh,
             HOLIHH     = :t_holihh,
             GENEXT     = :t_genexthh,
             HOLIEXT    = :t_holiexthh,
             OVTMHH     = :ovtmhh,
             OVMCAMT    = :ovmcamt,
             EXTAMT     = :t_extamt,
             NIGHTAMT   = :t_nightamt,
             HOLIAMT    = :t_holiamt,
             OVTMAMT    = (:t_extamt + :t_nightamt + :t_holiamt - :t_restamt - :t_sprestamt - :t_mealamt - :t_excepamt),
             RESTAMT    = :t_restamt,
             SPRESTAMT  = :t_sprestamt,
             MEALHH     = :t_mealhh, 
             MEALAMT    = :t_mealamt ,
             EXCEPHH    = :t_excephh,
             EXCEPAMT   = :t_excepamt,                 
             WRITEMAN   = :jobempno,
             WRITETIME  = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
      WHERE  EMPNO = :empno 
        AND  OVTMDATE = :ovtmdate 
        AND  NVL(FRAPPTIME,'*') = :frapptime 
        AND  NVL(FRREALTIME,'*') = :frrealtime ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS  set EXTHH=(:b0+:b1),NIGHTHH=:b2,HOLIHH\
=:b3,GENEXT=:b0,HOLIEXT=:b1,OVTMHH=:b6,OVMCAMT=:b7,EXTAMT=:b8,NIGHTAMT=:b9,HO\
LIAMT=:b10,OVTMAMT=((((((:b8+:b9)+:b10)-:b14)-:b15)-:b16)-:b17),RESTAMT=:b14,\
SPRESTAMT=:b15,MEALHH=:b20,MEALAMT=:b16,EXCEPHH=:b22,EXCEPAMT=:b17,WRITEMAN=:\
b24,WRITETIME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') where (((EMPNO=:b25 and OVT\
MDATE=:b26) and NVL(FRAPPTIME,'*')=:b27) and NVL(FRREALTIME,'*')=:b28)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )490;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&t_genexthh;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&t_holiexthh;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&t_nighthh;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&t_holihh;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&t_genexthh;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&t_holiexthh;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&ovtmhh;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&ovmcamt;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&t_extamt;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&t_nightamt;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&t_holiamt;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&t_extamt;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&t_nightamt;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&t_holiamt;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&t_restamt;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&t_sprestamt;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&t_mealamt;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&t_excepamt;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&t_restamt;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&t_sprestamt;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&t_mealhh;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&t_mealamt;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&t_excephh;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&t_excepamt;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[24] = (unsigned long )5;
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)empno;
     sqlstm.sqhstl[25] = (unsigned long )5;
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)ovtmdate;
     sqlstm.sqhstl[26] = (unsigned long )9;
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)frapptime;
     sqlstm.sqhstl[27] = (unsigned long )5;
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)frrealtime;
     sqlstm.sqhstl[28] = (unsigned long )13;
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
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
          sprintf(log_buff,"in the result UPDATE ERROR ERROR_CODE : %d \n", sqlca.sqlcode);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          return(FAIL);
     }
     else
          return(SUCCESS);
}

/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.00    1999.01.05       민정숙     시간당통상임금계산로직변경  하나로재개발
 ============================================================================= */
/****************************************************************************
   개인별 통상임금을 구하는 함수.
 ***************************************************************************/
double  get_tongpay(char *paycl)
{
     double baseamt = 0;
   
   /*infra   if (strlen(paycl) != 2) */
     if  (strlen(paycl) != 3)
          return(FAIL);
   
   /* infra  if ((strcmp(paycl,"10") >= 0) && (strcmp(paycl,"99") <= 0))  */
     if ((strcmp(paycl,"C11") >= 0) && (strcmp(paycl,"D41") <= 0)) 
     {
          baseamt = ceil(totpay/18/226);  /*  통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 */
          return(baseamt);
     }
     return(baseamt);
}


/****************************************************************************
  trail_spaces function.
 ****************************************************************************/
void trail_spaces(char *dest)
{
     int len,i,flag;
     
     len = strlen(dest);
     
     i    = 0;
     flag = 0;
     while (i < len) 
     {
          if  (*(dest+i) == ' ') 
          {
               flag = 1;
               break;
          }
          else
               i++;
     }
     
     if  (flag)
          *(dest+i) = '\0';
     else
          *(dest+len) = '\0';
}
/****************************************************************************
  calc_term function.
 ****************************************************************************/
double  calc_term(char *frdate,char *todate)
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  t1_date[9] = "";
          char  t2_date[9] = "";
          double  term;
     /* EXEC SQL END   DECLARE SECTION; */ 

   
     strncpy(t1_date,frdate,8);
     strncpy(t2_date,todate,8);
     /* EXEC SQL
     SELECT  TO_DATE(:t2_date,'YYYYMMDD') - TO_DATE(:t1_date,'YYYYMMDD')
       INTO  :term   
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD')\
) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )621;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)t2_date;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)t1_date;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&term;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
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


   
     if  (sqlca.sqlcode != 0)
          return(FAIL);
     else
          return(term);
}

int Get_ConTerm(char *indate)
{
     int holicnt = 0;
     int weekcnt = 0;
     int daycnt  = 0;
     
     /* exec sql
     select  count(holidate) holicnt
       into  :holicnt
       from  pkcholi
      where  to_date(holidate,'YYYYMMDD') >= (TO_DATE(:indate,'YYYYMMDD')  +1)
        and  to_date(holidate,'YYYYMMDD') <= (TO_DATE(:indate,'YYYYMMDD')  +3)
        and  to_char(to_date(holidate,'yyyymmdd'),'d') not in ( '1', '7'); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(holidate) holicnt into :b0  from pkcholi w\
here ((to_date(holidate,'YYYYMMDD')>=(TO_DATE(:b1,'YYYYMMDD')+1) and to_date(\
holidate,'YYYYMMDD')<=(TO_DATE(:b1,'YYYYMMDD')+3)) and to_char(to_date(holida\
te,'yyyymmdd'),'d') not  in ('1','7'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )648;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&holicnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)indate;
     sqlstm.sqhstl[1] = (unsigned long )0;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)indate;
     sqlstm.sqhstl[2] = (unsigned long )0;
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


     
     
     /* EXEC SQL
     SELECT
             DECODE( TO_CHAR( To_DATE(SUBSTR(:indate,1,6)||'01','YYYYMMDD'),'D'),'1',
                            ( TO_CHAR( TO_DATE(substr(:indate,1,6),'YYYYMM') ,'d') - 1 ) +
                              CEIL(TO_CHAR( TO_DATE(:indate,'YYYYMMDD') ,'dd') / 7     ) ,
                     DECODE( FLOOR(TO_CHAR( To_DATE(:indate,'YYYYMMDD'),'D')/
                                   TO_CHAR( To_DATE(SUBSTR(:indate,1,6)||'01','YYYYMMDD'),'D')
                                   ) , 0,
                                   CEIL(TO_CHAR( To_DATE(:indate,'YYYYMMDD'),'DD') / 7)+1 ,
                                   CEIL(TO_CHAR( To_DATE(:indate,'YYYYMMDD'),'DD') / 7)
                           )
                   )WEEKCNT,
             TO_CHAR( To_DATE(:indate,'YYYYMMDD'),'D') DAYCNT
       INTO  :weekcnt ,: daycnt
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select DECODE(TO_CHAR(To_DATE((SUBSTR(:b0,1,6)||'01'),'\
YYYYMMDD'),'D'),'1',((TO_CHAR(TO_DATE(substr(:b0,1,6),'YYYYMM'),'d')-1)+CEIL(\
(TO_CHAR(TO_DATE(:b0,'YYYYMMDD'),'dd')/7))),DECODE(FLOOR((TO_CHAR(To_DATE(:b0\
,'YYYYMMDD'),'D')/TO_CHAR(To_DATE((SUBSTR(:b0,1,6)||'01'),'YYYYMMDD'),'D'))),\
0,(CEIL((TO_CHAR(To_DATE(:b0,'YYYYMMDD'),'DD')/7))+1),CEIL((TO_CHAR(To_DATE(:\
b0,'YYYYMMDD'),'DD')/7)))) WEEKCNT ,TO_CHAR(To_DATE(:b0,'YYYYMMDD'),'D') DAYC\
NT into :b8,:b9  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )675;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)indate;
     sqlstm.sqhstl[0] = (unsigned long )0;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)indate;
     sqlstm.sqhstl[1] = (unsigned long )0;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)indate;
     sqlstm.sqhstl[2] = (unsigned long )0;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)indate;
     sqlstm.sqhstl[3] = (unsigned long )0;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)indate;
     sqlstm.sqhstl[4] = (unsigned long )0;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)indate;
     sqlstm.sqhstl[5] = (unsigned long )0;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)indate;
     sqlstm.sqhstl[6] = (unsigned long )0;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)indate;
     sqlstm.sqhstl[7] = (unsigned long )0;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&weekcnt;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&daycnt;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
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


     
     if ((((daycnt ==4) || (daycnt ==5) ) || (daycnt ==6) ) )
     {
          if  ((( weekcnt ==1) ||( weekcnt ==3 ) ) || ( weekcnt ==5 ) ) /* 휴토 */
               holicnt = holicnt + 2;
          else if  ( daycnt == 6  )
               holicnt = holicnt + 1;   /*근무토 6*/
          else
               holicnt = holicnt + 0;   /*근무토 4,5*/
     }
     
     if  (daycnt == 7 )              /*토요일이면 다음날은 꼭 일요일이므로 */
          holicnt = holicnt + 1 ;
     
     holicnt = 3 + holicnt;
     return ( holicnt) ;
}

void CreateLog()
{
     char  curdatetime[20+1]="";
     char  *logdir;
     logdir = hinsa_home();
     /*printf("logdir : %s", logdir);*/
     strcat(logdir,"/log/proc/pkg3075g/");        

     /* EXEC SQL
     SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
       INTO   :curdatetime
       FROM   DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0  fr\
om DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )730;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curdatetime;
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



  /* 로그파일명을 세팅 */
     sprintf(logfile_fullname, "%sovtm%.12s.log", logdir, curdatetime);
     /* 로그파일 오픈 */
     fp = fopen(logfile_fullname, "w+");
     
     if  (fp == NULL) 
     {
          printf("로그파일오픈(%s) 에러\n", logfile_fullname);
          exit(1);
     }
     
     sprintf(log_buff, "초과근무 cron program [pkg3075g] 을 실행합니다. \n ");
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
     
     sprintf(log_buff, "실행시간 : %.14s \n ",curdatetime);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
}


void WriteLog(char *message)
{
     fprintf(fp, "%s", message);
}


/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )749;
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



     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0)) 
     {  
          printf("ERROR_CODE : %d, pybatlog Insert Error. \n", sqlca.sqlcode);     
          return(FAILURE);
     }                        
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 29;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )790;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}