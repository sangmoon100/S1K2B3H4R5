
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
    "pkq1050g.pc"
};


static unsigned int sqlctx = 153843;


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
   unsigned char  *sqhstv[118];
   unsigned long  sqhstl[118];
            int   sqhsts[118];
            short *sqindv[118];
            int   sqinds[118];
   unsigned long  sqharm[118];
   unsigned long  *sqharc[118];
   unsigned short  sqadto[118];
   unsigned short  sqtdso[118];
} sqlstm = {12,118};

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

 static char *sq0001 = 
"select NVL(TAXPAYFR,0) ,NVL(TAXPAYTO,0) ,NVL(TAXRATE,0) ,NVL(YEARDED,0)  fr\
om PKCPTAX where TAXNUM=:b0           ";

 static char *sq0005 = 
" empno<=:b1)           ";

 static char *sq0007 = 
"select SEQ ,YLOANSUM  from PKMYSRENT where ((WORKYY=(select workyy  from pk\
cpbas ) and EMPNO=:b0) and NVL(YRENTCOST,0)>0) order by SEQ            ";

 static char *sq0009 = 
"select SEQ ,MRENTCOST  from PKMYSRENT where ((WORKYY=(select workyy  from p\
kcpbas ) and EMPNO=:b0) and NVL(MRENTCOST,0)>0) order by SEQ            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,113,0,9,669,0,0,1,1,0,1,0,1,97,0,0,
24,0,0,1,0,0,13,680,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
55,0,0,1,0,0,15,694,0,0,0,0,0,1,0,
70,0,0,2,37,0,4,724,0,0,1,0,0,1,0,2,97,0,0,
89,0,0,3,1995,0,4,735,0,0,111,1,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,1,97,0,0,
548,0,0,4,938,0,5,865,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
571,0,0,5,2059,0,9,997,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
594,0,0,5,0,0,13,1010,0,0,118,0,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
1081,0,0,5,0,0,15,1051,0,0,0,0,0,1,0,
1096,0,0,6,107,0,5,2436,0,0,1,1,0,1,0,1,97,0,0,
1115,0,0,7,146,0,9,2452,0,0,1,1,0,1,0,1,97,0,0,
1134,0,0,7,0,0,13,2465,0,0,2,0,0,1,0,2,4,0,0,2,4,0,0,
1157,0,0,7,0,0,15,2477,0,0,0,0,0,1,0,
1172,0,0,8,108,0,5,2484,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,4,0,0,
1199,0,0,9,147,0,9,2508,0,0,1,1,0,1,0,1,97,0,0,
1218,0,0,9,0,0,13,2522,0,0,2,0,0,1,0,2,4,0,0,2,4,0,0,
1241,0,0,9,0,0,15,2534,0,0,0,0,0,1,0,
1256,0,0,10,112,0,5,2544,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,4,0,0,
1283,0,0,11,1696,0,5,2568,0,0,111,111,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
1742,0,0,12,50,0,3,2709,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
1783,0,0,13,0,0,29,2719,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ------------------------------------------------------------------------
 PROGRAM-NAME   : 연말정산 계산 (pkq1050g)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 연말정산
 PROGRAMMER     : 이 랑교
 VERSION        : 10.01
 DATE           : 1998.12.15
UPDATE CONTENTS
---------------------------------------------------------------------------
  버전    수정일       수정자   관련근거       수정내용
---------------------------------------------------------------------------
   1.00   1997.02.16   이인환   설계명세서     최초개발본
  10.01   1998.12.15   이랑교   전1998.12.
  30.09   1999.12.02   이랑교   소득세법변경   근로소득공제 기준변경.
                                               신용카드세액공제 추가
  30.10   2000.01.22   윤형식                  주택자금 이자 이익분 인정상여(cogbonsum)처리
                                               floor() 및 실수결과치 --> rint()로 변경
  40.10   2000.12.22   유효성                  지정기부금 한도액 수정 및 신용카드 계산 변경
                                               장기주택저당 차입 이자 상환 추가
                                               
  40.20   2001.12.17   유효성                  소득세법 개정     
                                                -근로소득공제 확대(인정상여 근로소득공제허용)
                                                -의료비공제한도 확대
                                                -신용카드공제한도 확대
                                                -장애자전용보험 소득공제신설
                                                -연금저축제도 신설
                                                -연금보험료 신설(국민연금)
                                                -장기증권저축제도 신설     
         
         2002.12.13    박수향                  소득세법 개정 
                                                -경로우대,장애인 공제액확대
                                                -근로소득공제한도 확대
                                                -장애인 특수교육비 신설
                                                -특례지정기부금 50%, 장학금 전액공제
                                                -유치원교육비,영유아교육비 통합->취학전아동교육비
                                                -장기증권저축세 5%(2002), 7%(2001)
                                                -투자조합출자자 2002년, 2000~2001년 각각  투자금액 15%,30%                       
  40.30  2002.12.16   유효성                  근로소득세액 공제액 계산시 인정상여도 포함하여 공제액 계산으로 소득세법 개정
         2003.12.     강륜종(dsa2000)         신용카드 공제에 직불카드와 지로납부 추가
                                              외국인 추가공제 추가(자녀교육비& 월세)
  41.01  2004.11.     강륜종(dsa2000)         Rexec대체 서비스를 위한 수정작업.                                             
  41.02  2004.12.     DSA2000                 2004년 귀속 세법에 맞게 ...  
                                              외국인 과세특례 신설에 따른 사항                                                                
  41.03  2007.12.     유재승                  소수자추가공제 폐지 -> 다자녀추가공제 신설.
                                              신용카드와 의료비 중복공제 배제 적용.
                                              정치기부금 주민세 포함 10만원한도로 세액공제.
-------------------------------------------------------------------------------------------
============================================================================= 
★ PKMYSMAS 와 PKHYSHIS 테이블에서는 아래와 같이 사용.
NPENAMT IS '연금저축_개인'  NPENAMT2 IS '연금저축_회사
PENAMT1 IS '개인연금_개인'  PENAMT2 IS '개인연금_회사'
        
★ PKHRYHIS에서는 개인과 회사에 해당하는 칼럼을 반대로 사용하고 있다.
NPENAMT IS '연금저축_회사'; NPENAMT2 IS '연금저축_개인';
PENAMT1 IS '개인연금_회사'; PENAMT2 IS '개인연금_개인'; 
============================================================================= */
/*
 30.10   1999.12.16   이랑교   전전근무지 항목추가
 BCORPNAME1                               VARCHAR2(30)
 BCORPNO1                                 VARCHAR2(12)
 BPAYSUM1                                 NUMBER(12)
 BBONSUM1                                 NUMBER(12)
 BMEDAMT1                                 NUMBER(12)
 BHIREAMT1                                NUMBER(12)
 BINTAX1                                  NUMBER(12)
 BJUTAX1                                  NUMBER(12)
 BNONGTAX1                                NUMBER(12)
 30.11   2004.02.19   강륜종              Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드. 
------------------------------------------------------------------------- */

/*============================================================================= 
★ 2007년 연말정산 관련 수정반영해야 할 부분에 주석 설정. (검색단어 : '2007년')        
★ 해당 수정사항 반영 후 주석제거 요망
2007.11.16 유재승
============================================================================= */




#include <stdio.h>
#include <math.h>
/* Dsa2000  추가.. 2004.02.24.*/
#include <stdlib.h>
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"
#include "hinsa_macro.h"
/* Dsa2000  추가..End.......*/

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char    frempno[5];
     char    toempno[5];
     char    TAXNUM[3];                /*  세율차수                 */
     double  INDEDBASIC ;              /*  근로소득공제기본액       */
     double  INDEDORATE ;              /*  근로소득공제초과율       */
     double  INDEDLIMIT ;              /*  근로소득공제한계액       */
     double  INDEDORATE2 ;             /*  근로소득공제초과율2       */
     double  INDEDLIMIT2 ;             /*  근로소득공제한계액2       */
     double  BASDED     ;              /*  기본공제액               */
     double  APPDED     ;              /*  추가공제액               */
     double  FEWDED1    ;              /*  소수공제자추가공제1 -> 다자녀추가공제 2인         */
     double  FEWDED2    ;              /*  소수공제자추가공제2 -> 다자녀추가공제 2인이상     */
     double  STDDED     ;              /*  표준공제                 */
     double  INSDEDLIMIT;              /*  보장성보험공제한도       */
     double  MEDDEDLIMIT;              /*  의료비공제한도           */
     double  MEDORATE   ;              /*  의료비공제초과율         */
     double  KINEDULIMIT;              /*  유치원교육비인당한도액   */
     double  CJKEDULIMIT;              /*  초중고교육비 인당한도액  */
     double  UNIEDULIMIT;              /*  대학교육비인당한도액     */
     double  BROEDUNO   ;              /*  형제교육비한도인원       */
     double  HSRATE     ;              /*  주택자금공제율           */
     double  HSDEDLIMIT ;              /*  주택자금한도액           */
     double  HSDEDLIMIT2;              /*  주택자금한도액2  dsa2000 */
     double  HSDEDLIMIT3;              /*  주택자금한도액3  dsa2000 */
     double  GIVDEDRATE ;              /*  기부금공제한도율         */
     double  PENRATE    ;              /*  개인연금공제율           */
     double  PENDEDLIMIT;              /*  개인연금한도액           */
     double  INVESTRATE;               /*  투자조합공제율           */
     double  INVESTDEDRATE;            /*  투자조합공제한도율       */
     double  INVESTLIMIT;              /*  투자조합공제한도액       */ /* 계산치 */
     double  TAXDEDBASIC;              /*  근로소득세액공제기본액   */
     double  TAXDEDBRATE;              /*  근로소득세액공제기본율   */
     double  TAXDEDORATE;              /*  근로소득세액공제초과율   */
     double  TAXDEDLIMIT;              /*  근로소득세액공제한계액   */
     double  PRODEDRATE ;              /*  재형저축공제율           */
     double  HSINTRATE  ;              /*  주택자금세액공제율       */
     double  FORILIMIT;                /*  국외근로소득세액공제 한도 */
     double  CREDEDLIMIT;              /* 신용카드한도액 */
     double  CREDEDRATE ;              /* 신용카드한도율 */
     double  CREORATE   ;              /* 신용카드초과율 */
     double  CREDEDLRATE;              /* 신용카드지급율 */        
     double  INDEDLIMIT3;              /* 근로소득공제한도액4      PARKSH 20021213 */
     double  INDEDORATE3;              /*  근로소득공제초과율3        */
     double  OBSDEDLIMIT;              /*장애인전용보험료*/
     double  OBSDEDADD;                /*장애인 추가공제 dsa2000 2005.12. 추가..*/
     double  NPENDEDLIMIT;             /*  연금 저축 한도액                 */ 
     double  JUTAXRATE  ;              /*  주민세율                 */
     double  NONGRATE   ;              /*  농특세율                 */        
     double  OBSEDULIMIT;              /*  장애인특수교육비  PARKSH 20021213 추가 */
     double  SPGIVDEDRATE;             /* 특례지정기부금공제한도율 PARKSH 20021213 추가 */
     double  OINVESTRATE;              /* 전투자조합공제율  parksh 20021213 추가 */
     double  OINVESTDEDRATE;           /* 전투자조합한도율  parksh 20021213 추가 */
     double  OINVESTLIMIT;             /* 전투자조합한도액   parksh 20021213 추가 */
     double  INDEDLIMIT4;              /* 근로소득공제한도액4      PARKSH 20021213 */
     double  INDEDORATE4;              /* 근로소득공제초과율4      PARKSH 20021213 */
     double  APPOLDDED;                /* 경로우대,장애인 PARKSH 20021213 */ 
     double  HSDEDLIMIT4;              /*  주택자금한도액4  KTH 2010.01 */
     
     
     double  TAXDEDSECT1;              /* 2014.12.19 하은영 근로소득세액공제 총급여한계액1           */ 
     double  TAXDEDSLIMIT1;            /* 2014.12.19 하은영 근로소득세액공제한계액1                  */
     double  TAXDEDSECT2;              /* 2014.12.19 하은영 근로소득세액공제 총급여한계액2           */
     double  TAXDEDSLIMIT2;            /* 2014.12.19 하은영 근로소득세액공제한계액2                  */
     double  APPDEDLIMIT;              /* 2014.12.19 하은영 부녀자조건-총급여기준액                  */
     double  NPENRATE;                 /* 2014.12.19 하은영 연금세액공제율                           */
     double  SPECIALRATE1;             /* 2014.12.19 하은영 특별세액공제율1(연금,보장성보험)         */
     double  SPECIALRATE2;             /* 2014.12.19 하은영 특별세액공제율2(의료비,교육비,기부금)    */
     double  GIVESLIMIT;               /* 2014.12.19 하은영 기부금세액공제초과분                     */
     double  GIVESRATE;                /* 2014.12.19 하은영 기부한도초과분공제율                     */
     double  HOUSERENTLIMIT1;          /* 2014.12.19 하은영 월세세액공제대상자총급여기준             */
     double  HOUSERENTLIMIT2;          /* 2014.12.19 하은영 월세세액공제한도액                       */
     double  HOUSERENTRATE;            /* 2014.12.19 하은영 월세세액공제율                           */
     double  INVESTRATE4;              /* 2014.12.19 하은영 투자조합출자분(2014년이후)_10%공제       */
     double  INVESTRATE5;              /* 2014.12.19 하은영 투자조합출자분(2014년이후)_50%공제       */
     double  INVESTRATE6;              /* 2014.12.19 하은영 투자조합출자분(2014년이후)_30%공제       */
     double  INVESTDEDRATE3;           /* 2014.12.19 하은영 투자조합출자분(2014년이후)공제한도       */
     double  LONGFUNDLIMIT1;           /* 2014.12.19 하은영 장기집합투자증권저축공제한도             */
     double  LONGFUNDLIMIT2;           /* 2014.12.19 하은영 장기집합투자증권저축공제요건             */
     double  LONGFUNDRATE;             /* 2014.12.19 하은영 장기집합투자증권저축공제율               */
     double  CARDUPRATE1;              /* 2014.12.19 하은영 신용카드 외 사용증가분 추가공제대상률    */
     double  CARDUPRATE2;              /* 2014.12.19 하은영 신용카드 외 사용증가분 추가공제율        */
     double  YLOANBASLIMIT;            /* 2014.12.19 하은영 개인간차입금공제대상자총급여기준         */
     
     double  TAXDEDSECT3;              /* 2015.05.06 eyha 근로소득세액공제 총급여한계액3             */
     double  TAXDEDSLIMIT3;            /* 2015.05.06 eyha 근로소득세액공제한계액3                    */
     double  INFANTDED;                /* 2015.05.06 eyha 6세이하 2자녀이상 세액공제                 */
     double  ADDBABYDED;               /* 2015.05.06 eyha 출산.입양 세액공제                         */
     double  NPENRATE2;                /* 2015.05.06 eyha 연금저축 세액공제율2                       */
     double  NPENLIMIT;                /* 2015.05.06 eyha 연금저축 총급여한도                        */
     
                                                                                                 
     char    workyy[5];
     char    writeman[5];
     char    tempdate[9];
     char    empno[5];               /*  사번                */
     double  mpaysum;                /*  (주) 급여총액       */
     double  mbonsum;                /*  (주) 급여총액       */
     double  mnotax;                 /*  (주) 비과세         */
     double  bpaysum;                /*  (종) 급여총액       */
     double  bbonsum;                /*  (종) 상여총액       */
     double  bnotax;                 /*  (종) 비과세         */
     double  mcogbonsum;             /*  (주) 인정상여       */
     double  bcogbonsum;             /*  (종) 인정상여       */
     double  bpaysum1;               /*  (종1) 급여총액      */
     double  bbonsum1;               /*  (종1) 상여총액      */
     double  foritaxgross;           /*  국외근로과세총액 */
     double  foritaxgross1;              /*  국외근로소득 */
     double  taxgross;               /*  과세급여총액        */
     double  notax;                  /*  비과세급여총액      */
     double  laborded;               /*  근로소득공제        */
     double  laboramt;               /*  근로소득금액        */
     double  laborlimit;             /*  근로소득금액한계_단계별 */     
     double  mate;                   /*  배우자유뮤          */
     double  fami16no;               /*  6세이하 가족수      */
     double  fami720no;              /*  7~20세 가족수       */
     double  fami6064no;             /*  60~64세 가족수      */
     double  fami65no;               /*  65세 이상 가족수    */
     double  familyno;               /*  총 가족수           */
     double  selfded ;               /*  본인공제            */
     double  mateded ;               /*  배우자 공제         */
     double  famided ;               /*  부양가족공제        */
     double  basicded;               /*  기본공제            */
     double  obstacleno;             /*  장애자수            */
     double  childno;                /*  자녀 양육수         */
     double  manychildno;            /*  다자녀추가공제 수   */
     double  woman;                  /*  부녀자 여부         */
     double  oldded;                 /*  경로우대공제        */
     double  obsded;                 /*  장애자 공제         */
     double  womanded;               /*  부녀자 공제         */
     double  childded;               /*  자녀양육공제        */
     double  appendded;              /*  추가공제            */
     double  fewno;                  /*  소수추가공제        */
     double  fewded;                 /*  소수추가공제 -> 다자녀추가공제로 변경 사용 2007.12 */
     double  medamt;                 /*  의료 보험료         */
     double  bmedamt;                /*  (종) 의료 보험료    */
     double  bmedamt1;               /*  (종1) 의료 보험료   */
     double  medded;                 /*  의료 보험료공제     */
     double  hireamt;                /*  고용 보험료         */
     double  bhireamt;               /*  (종) 고용 보험료    */
     double  bhireamt1;              /*  (종1) 고용 보험료   */
     double  hireded;                /*  고용보험료 공제     */
     double  guaramt;                /*  보장성 보험료       */
     double  guarded;                /*  보장성보험료 공제   */
     double  insded;                 /*  보험료 공제         */
     double  ghosamt;                /*  일반 의료비         */
     double  ohosamt;                /*  경로의료비          */
     double  nhosamt;                /*  장애자의료비        */
     double  hosamt;                 /*  의료비              */
     double  hosded;                 /*  의료비공제          */
     double  seduamt;                /*  본인학자금          */
     double  seduded;                /*  본인학자금공제      */
     double  keduno;                 /*  유치원수            */
     double  keduamt;                /*  유치원학자금        */
     double  keduded;                /*  유치원학자금공제    */
     double  keduno1;                /*  영유아수            */
     double  keduamt1;               /*  영유아학자금        */
     double  keduded1;               /*  영유아학자금공제    */
     double  ceduno;                 /*  초중고학생수        */
     double  ceduamt;                /*  초중고학자금        */
     double  ceduded;                /*  초중고학자금공제    */
     double  ueduno;                 /*  대학생수            */
     double  ueduamt;                /*  대학생학자금        */
     double  ueduded;                /*  대학생학자금공제    */
     double  eduded;                 /*  학자금공제          */
     double  houseamt;               /*  주택자금(대출기관)  */
     double  houseamt3;              /*  주택자금(거주자)            */
     double  houseintamt;            /*  주택자금(장기주택저당 차입 이자상환)   10년이상*/
     double  houseintamt2;           /*  주택자금(장기주택저당 차입 이자상환)   15년 이상*/
     double  houseded;               /*  주택자금공제(대출기관) */
     double  houseded3;              /*  주택자금공제(거주자)        */
     double  agiveamt;               /*  전액기부금          */
     double  agiveded;               /*  전액기부금          */
     double  politaxded;             /*  정치자금 기부금     */
     double  pgiveamt;               /*  일반기부금          */
     double  sgiveamt;               /*  사립학교기부금      */
     double  pgiveded;               /*  지정기부금공제_종교      */
     double  pgiveded2;              /*  지정기부금공제_종교외    */
     double  pgiveded_curr;          /*  지정기부금공제(당해년도)_종교      2013.12.6.hjku */
     double  pgiveded2_curr;         /*  지정기부금공제(당해년도)_종교외    2013.12.6.hjku */
     double  pgiveded;               /*  일반기부금공제      */
     double  pgiveded2;              /*  일반기부금공제      */          
     double  giveded;                /*  기부금공제          */
     double  specialded;             /*  특별공제            */
     double  standded;               /*  표준공제            */
     double  chagamamt;              /*  차감소득금액        */     
     double  penamt1;                /*  개인연금(회사)      */
     double  penamt2;                /*  개인연금(개인)      */
     double  bpenamt;                /*  (종)개인연금        */
     double  pended;                 /*  개인연금공제        */
     double  investamt;              /*  투자조합출자소득    */
     double  investded;              /*  투자조합공제        */  
     
     double  creditamt;              /*  신용카드신청금      */
     double  creditamt_med;          /*  신용카드 의료기관 사용액 2007.12 추가 */
     double  creditdedamt;           /*  신용카드신청금 공제금(법인)     */
     double  credittotamt;           /*  신용카드신청금 총신청금         */
     double  creditded;              /*  신용카드공제        */
     double  DEBITDEDRATE;           /* 직불카드 공제율  dsa2000   2003.12. */ 
     double  GIRODEDRATE;            /* 지로납부 공제율  dsa2000   2003.12.  */ 
     double  FOREDEDRATE;            /* 외국인 추가공제율 (자녀교육비&월세)   dsa2000   2003.12. */        
     double  debitamt;               /*  직불카드 사용금액  */
     double  giroamt;                /*  지로납부금액       */
     double  cashamt;                /*  현금영수증 사용액  2005.11 추가 */ 
     double  foreignamt;             /*  외국인 추가공제(자녀교육비&월세) 지출금액 */
     double  foreignded;             /*  외국인 추가공제금액 */
     char    juminid[15];            /*  주민번호 */
     double  totcreditamt;           /*  신용카드 공제가능 총금액  */
     
     double  mcresum ;
     double  bcresum;
     double  incomeded;              /*  종합소득공제계      */
     double  taxlevel;               /*  과세표준            */
     double  calctax;                /*  산출세액            */
/**** 40.30  2002.12.16   유효성  근로소득세액 공제액 계산시 인정상여도 포함하여 공제액 계산으로 소득세법 개정 ***/
/* new_calctax 삭제
     double  new_calctax ;               새로운 산출세액(근로소득세액공제 재계산을 위한)  */
     double  incomtded;              /*  근로소득세액공제    */
     double  propamt1;               /*  재형저축(회사)      */
     double  propamt2;               /*  재형저축(개인)      */
     double  bpropamt;               /*  (종) 재형저축       */
     double  propded;                /*  재형저축공제        */
     double  hloanamt;               /*  주택차입금 공제     */
     double  hloanded;               /*  주택차입금 공제     */
     double  foriamt;                /*  외국납부공제        */
     double  forided;                /*  외국납부공제        */
     double  etctamt;                /*  기타세액감면        */
     double  etctded;                /*  기타세액감면        */
     double  tdedsum;                /*  세액감면 총액       */
     double  dintax;                 /*  결정소득세          */
     double  djutax;                 /*  결정주민세          */
     double  dnongtax;               /*  결정농특세          */
     double  dnongcalctax;           /*  결정농특세1         */     
     double  mintax;                 /*  (주) 소득세         */
     double  mjutax;                 /*  (주) 주민세         */
     double  mnongtax;               /*  (주) 농특세         */
     double  bintax;                 /*  (종) 소득세         */
     double  bjutax;                 /*  (종) 주민세         */
     double  bnongtax;               /*  (종) 농특세         */
     double  bintax1;                /*  (종1) 소득세        */
     double  bjutax1;                /*  (종1) 주민세        */
     double  bnongtax1;              /*  (종1) 농특세         */
     double  intax;                  /*  (주+종) 소득세      */
     double  jutax;                  /*  (주+종) 주민세      */
     double  nongtax;                /*  (주+종) 농특세      */
     double  yintax;                 /*  차감소득세          */
     double  yjutax;                 /*  차감주민세          */
     double  ynongtax;               /*  차감농특세          */
     double  ycalctax;               /*  차감정산액          */
     
     double  obsguaramt;
     double  obsguarded;
     double  anuamt;
     double  banuamt;
     double  banuamt1;  
     double  anuded;            
     double  npenamt;
     double  npenamt2 ;
     double  npended;
    
     double  obseduno ;      /*  장애인수         parksh 20021213 */
     double  obseduamt;      /*  장애인특수교육금액     parksh 20021213 */
     double  obseduded;      /*  장애인특수교육비공제 parksh 20021213 */
     double  spgivamt ;      /*  특례지정기부금   parksh 20021213 */
     double  spgivded ;      /*  특레지정기부금공제   parksh 20021213 */   
     double  oinvestamt;     /*  투자조합공제      parksh 20021213 */
     double  oinvestded;     /*  투자조합공제      parksh 20021213 */
     double  tinvestded;     /*  투자조합공제액 합 PARKSH 20021213 추가 */
  
     double  APPOLDDED2;     /* 경로우대70세이상 공제액  Dsa2000 추가  2004.12. Start*/
     double  fami70no;       /* 경로우대 70세이상 수*/
     double  shosamt;        /*  본인 의료비        */
     double  specaddno;      /* 특별공제(결혼.장례.이사소득공제 건수)*/
     double  SPECADDLIMIT;   /* 특별공제(결혼.장례.이사소득공제 한도액)*/
     double  specaddded;     /* 특별공제(결혼.장례.이사소득공제 개인별 공제액)*/
     double  poliamt;        /* 정치기부금 */
     double  polided;        /* 정치자금 세액공제액 */
     double  POLILIMIT;      /* 정치자금 세액공제 한도   Dsa2000 추가  2004.12. End..*/    
     double  costockamt;     /* 우리사주출연금 공제 출연금  dsa2000  2006.12.*/  
     double  costockded;     /* 우리사주출연금 공제금       dsa2000  2006.12.*/  
     double  COSTOCKLIMIT;   /* 우리사주출연금 공제한도     dsa2000  2006.12.*/  
     double  costocktax;     /* 우리사주 인출과세액         dsa2000  2007.01.*/  
  
     /*double  STKDEDRATE ;                주식저축세액공제율       */
     /*double  STKDEDLIMIT;                주식저축세액한도액       */
     /*double  LSTKDEDRATE;            2004년 귀속 장기증권저축세액공제 삭제*/
     /*double  OLSTKDEDRATE;            전년도장기증권저축세액공제율 PARKSH 20021213 =>2004년 귀속 장기증권저축세액공제 삭제*/       
     /*double  stkamt;                   주식저축공제        */
     /*double  stkded;                   주식저축공제        */
     /*double  lstkamt ;     2004년 귀속 장기증권저축세액공제 삭제
     double  lstkded;                
     double  olstkamt ;       전년도장기증권저축       20021213 parksh */
    /*double  olstkded ;       전년도장기증권저축 공제  20021213 parksh */
    /*double  tlstkded ;       장기증권저축 공제  20021213 parksh */
     double babyno;          /* 출산 입양자수                   2008.12 KTH */
     double babyded;         /* 출산입양 공제액                 2008.12 KTH */
     double fundamt1;        /* 펀드 1년차 불입액               2008.12 KTH */    
     double fundamt2;        /* 펀드 2년차 불입액               2008.12 KTH */
     double fundamt3;        /* 펀드 3년차 불입액               2008.12 KTH */
     double fundded;         /* 펀드  공제액                    2008.12 KTH */
     double longmtamt;       /* 노인 장기요양 보험금            2008.12 KTH */
     double longmtded;       /* 노인 장기요양 보험공제금        2008.12 KTH */
     double pgiveamt2;       /* 지정기부금 종교단체 아닌 기부금 2008.12 KTH */
     double houseamt2;       /* 주택 마련 저축불입액            2008.12 KTH */
     double houseded2;       /* 주택 마련저축 공제액            2008.12 KTH */
     double houseintded;     /* 주택 임차 차입금 원리금 상환공제액 15미만 2008.12 KTH */
     double houseintded2;    /* 주택 임차 차입금 원리금 상환공제액 15-29 미만 2012.02 KTH */
     double houseintded3;    /* 주택 임차 차입금 원리금 상환공제액 30년 이상  2012.02 KTH */     
     double GIVDEDRATE2;     /* 종교단체 외에 한도율    20%     2008.12 KTH */
     double GIVDEDRATE3;     /* 종교단체 외에 한도율    30%     2008.12 KTH */
     double APPBABYDED;      /* 출산 입양자 공제액              2008.12 KTH */
     double FUNDRATE1;       /* 펀드 1년차 공제율               2008.12 KTH */    
     double FUNDRATE2;       /* 펀드 2년차 공제율        1      2008.12 KTH */    
     double FUNDRATE3;       /* 펀드 3년차 불입액               2008.12 KTH */    
     double LONGMTRATE;      /* 노인 장기요양 보험율            2008.12 KTH */
     double INDEDBRATE;      /*  기본 공제율 80% 2010.01 KTH                */
     double houseintamt3;    /*  주택자금(장기주택저당 차입 이자상환)   30년 이상 2010.01 KTH*/
     double houserentamt;    /* 월세액 추가 2011.01 KTH */
     double houserentded;    /* 월세액 공제 2011.01 KTH */
     double housvsubamt;     /* 청약 저축 2011.01 KTH */
     double housvsubded;     /* 청약 저축 공제금  2011.01 KTH */
     double housvempamt;     /* 근로자 주택 마련 저축  2011.01 KTH */        
     double housvempded;     /* 근로자 주택 마련 저축 공제금  2011.01 KTH */
     double housvcomamt;     /* 주택 청약 종합 저축 2011.01 KTH */        
     double housvcomded;     /* 주택 청약 종합 저축 공제금  2011.01 KTH */
     double houseded4;       /* 청약,주택청약,장마,근로자 주택마련 합계  2011.01 KTH */
     double tmpgive;         
     
     
     
     double  nagiveamt          = 0;
     double  nspgivamt          = 0;
     double  npgiveamt          = 0;  /* kth 2012.02.13 이월지정기부금 종교단체*/
     double  npgiveamt2         = 0;  /* kth 2012.02.13 이월지정기부금 종교단체외(전체)*/          
     double  npgiveamt2_2010    = 0;  /* kth 2012.02.13 이월지정기부금 종교단체외(2010년)*/          
     double  npgiveamt2_else    = 0;  /* kth 2012.02.13 이월지정기부금 종교단체외(2011년)*/  
     double  npgiveded          = 0;     /* 이월지정기부금 종교단체 공제금           2012.12 hjku */
     double  npgiveded2         = 0;     /* 이월지정기부금 종교단체외 공제금         2012.12 hjku */
                                                                                     
     double TMARKETDEDRATE      = 0;     /* 전통시장공제한도율                       2012.12 hjku */
     double TMARKETEXLIMIT      = 0;     /* 전통시장공제초과한도금액                 2012.12 hjku */
     double INVESTRATE2         = 0;     /* 투자조합출자소득공제율(2012년이후)       2012.12 hjku */
     double INVESTDEDRATE2      = 0;     /* 투자조합출자소득공제한도율               2012.12 hjku */
     double HSDEDLIMIT5         = 0;     /* 고정비거치식 한도금액                    2012.12 hjku */
     double HSDEDLIMIT6         = 0;     /* 기타대출한도금액                         2012.12 hjku */
     double tmarketamt          = 0;     /* 전통시장공제금액                         2012.12 hjku */
     double houseintamt4        = 0;     /* 고정비거치식공제금액                     2012.12 hjku */
     double houseintamt5        = 0;     /* 기타대출공제금액                         2012.12 hjku */
     double houseintded4        = 0;     /* 고정비거치식공제금                       2012.12 hjku */
     double houseintded5        = 0;     /* 기타대출공제금                           2012.12 hjku */
     double investamt2          = 0;     /* 투자조합출자소득공제금액(2012년이후)     2012.12 hjku */
                                
     double SPARENTDEDADD       = 0;     /*  한부모 소득공제금액                     2013.11 hjku */
     double HSRATE2             = 0;     /*  주택자금 월세액 공제율                  2013.11 hjku */
     double TRAFFICDEDRATE      = 0;     /*  대중교통공제한도율                      2013.11 hjku */
     double TRAFFICEXLIMIT      = 0;     /*  대중교통공제 초과 한도금액              2013.11 hjku */
     double SPDEDLIMIT          = 0;     /*  특별공제 종합한도금액                   2013.11 hjku */
     double INVESTRATE3         = 0;     /*  투자조합출자소득공제율(2013년이후)      2013.11 hjku */
     double HSRENTINTRATE       = 0;     /*  목돈 안드는 전세 이자상환액 공제율      2013.11 hjku */
     double HSRENTINTLIMIT      = 0;     /*  목돈 안드는 전세 이자상환액 한도금액    2013.11 hjku */
     double sparent             = 0;     /*  한부모 공제                             2013.11 hjku */
     double sparentded          = 0;     /*  한부모 공제금액                         2013.11 hjku */
     double obshosded           = 0;     /*  의료비공제_장애인                       2013.11 hjku */
     double trafficamt          = 0;     /*  대중교통사용분                          2013.11 hjku */
     double splimitovded        = 0;     /*  소득공제 종합한도 초과금액              2013.11 hjku */
     double investamt3          = 0;     /*  투자조합출자(2013년이후)_10%            2013.11 hjku */
     double investamt4          = 0;     /*  투자조합출자(2013년이후)_30%            2013.11 hjku */
     double investded2          = 0;     /*  투자조합출자소득공제금액(2013년이후)    2013.11 hjku */
     double hsrentinamt         = 0;     /*  목돈 안드는 전세 이자상환액             2013.11 hjku */
     double hsrentinded         = 0;     /*  목돈 안드는 전세 이자상환액 공제금액    2013.11 hjku */
     double nepgiveded          = 0;     /*  지정기부공제(종교단체_기부금명세)       2013.11 hjku */
     double nepgiveded2         = 0;     /*  지정기부공제(종교단체외_기부금명세)     2013.11 hjku */
                                                                                     
     double yseq                = 0;     /*  거주자간 순번                           2013.11 hjku */
     double yloansum            = 0;     /*  거주자간 원리금상환액계                 2013.11 hjku */
     double yloanded            = 0;     /*  거주자간 공제금액                       2013.11 hjku */
     
     double  mseq               = 0;     /*  월세액 순번                             2013.11 hjku */
     double  mrentcost          = 0;     /*  월세액                                  2013.11 hjku */
     double  mrentcostded       = 0;     /*  월세액 공제금액                         2013.11 hjku */     
                                   
     double  nagiveded          = 0;     /* 2014.12.19 하은영   이월 법정기부금(특별소득공제)              */                           
     double  ngiveded           = 0;     /* 2014.12.19 하은영   기부금(이월분) 특별소득공제                */                           
     double  investamt5         = 0;     /* 2014.12.19 하은영   투자조합출자분(2014년이후)_10%공제         */                           
     double  investamt6         = 0;     /* 2014.12.19 하은영   투자조합출자분(2014년이후)_50%공제         */                           
     double  investamt7         = 0;     /* 2014.12.19 하은영   투자조합출자분(2014년이후)_30%공제         */                           
     double  investded3         = 0;     /* 2014.12.19 하은영   투자조합출자공제금(2014년)                 */                           
     double  longfundamt        = 0;     /* 2014.12.19 하은영   장기집합투자증권저축 납입액                */                           
     double  longfundded        = 0;     /* 2014.12.19 하은영   장기집합투자증권저축 공제금                */                           
     double  childtaxded        = 0;     /* 2014.12.19 하은영   자녀세액공제                               */                           
     double  npendtaxded        = 0;     /* 2014.12.19 하은영   연금계좌_연금저축_세액공제                 */                           
     double  guartaxded         = 0;     /* 2014.12.19 하은영   특별세액공제_보장성보험                    */                           
     double  hostaxded          = 0;     /* 2014.12.19 하은영   특별세액공제_의료비                        */                           
     double  edutaxded          = 0;     /* 2014.12.19 하은영   특별세액공제_교육비                        */                           
     double  polided1           = 0;     /* 2014.12.19 하은영   정치자금10만원이이하                       */                           
     double  polided2           = 0;     /* 2014.12.19 하은영   정치자금10만원이초과                       */                           
     double  politaxded1        = 0;     /* 2014.12.19 하은영   특별세액공제_정치자금10만원이하            */                           
     double  politaxded2        = 0;     /* 2014.12.19 하은영   특별세액공제_정치자금10만원이상            */                           
     double  agivetaxded        = 0;     /* 2014.12.19 하은영   특별세액공제_법정기부금                    */                           
     double  pgivetaxded        = 0;     /* 2014.12.19 하은영   특별세액공제_지정기부금                    */                           
     double  taxdedsum          = 0;     /* 2014.12.19 하은영   특별세액공제_계                            */                            
     double  houserenttaxded    = 0;     /* 2014.12.19 하은영   세액공제_월세                              */                            
     double  creditaddamt1      = 0;     /* 2014.12.19 하은영   전년도 본인신용카드 사용액                 */                            
     double  creditaddamt2      = 0;     /* 2014.12.19 하은영   당해년도 본인신용카드 사용액               */                            
     double  creditaddamt3      = 0;     /* 2014.12.19 하은영   전년도 추가공제율 사용분                   */                            
     double  creditaddamt4      = 0;     /* 2014.12.19 하은영   당해년도 추가공제율 사용분                 */
                                 
     double  incomtdedlimit          = 0;  /* 2014.12.22 하은영 근로소득세액공제 한도  변수            */
     double  investded3_splimitovded = 0;  /* 2014.12.22 하은영 투자 한도  변수                        */     
     double  creditdedadd            = 0;  /* 2014.12.10 하은영 추가공제율 사용분 계산 변수            */
     double  tdedsum_calc            = 0;  /* 2014.12.10 하은영 산식적용 변수                          */
     double  givetaxsum1             = 0;  /* 2014.12.10 하은영 기부금 산식적용 변수                   */
     double  givetaxsum2             = 0;  /* 2014.12.10 하은영 기부금 산식적용 변수                   */
     double  givetaxsum3             = 0;  /* 2014.12.10 하은영 기부금 산식적용 변수                   */
     double  givetaxsum4             = 0;  /* 2014.12.10 하은영 기부금 산식적용 변수                   */
     double  givetaxsum5             = 0;  /* 2014.12.10 하은영 기부금 산식적용 변수                   */
     double  givetaxsum6             = 0;  /* 2014.12.10 하은영 기부금 산식적용 변수                   */
     double  dnongtaxlevel           = 0;  /* 2014.12.10 하은영 농특세 변수                            */
     double  calctaxlimit            = 0;  /* 2014.12.10 하은영 산출세액 비교 변수                     */

     double  infanttaxded            = 0;  /* 2015.05.06 eyha 6세이하 2자녀이상 세액공제              */
     double  addbabytaxded           = 0;  /* 2015.05.06 eyha 출산입양 세액공제                       */
     double  obsguartaxded           = 0;  /* 2015.05.06 eyha 장애인전용보장성보험 세액공제           */
     

    
                                                                                                       
     struct
     {    double taxfr   ;
          double taxto   ;
          double taxrate ;
          double yearded ;
     } taxtbl[10];

/* EXEC SQL END   DECLARE SECTION; */ 

/* EXEC SQL INCLUDE sqlca;
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


FILE    *fp = stdout;
int     i=0;
int     id;
int     taxtblcnt=0;
char    dir[80];

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
char    log_rundate[16]     = ""; 
char    log_progid[16]      = "";
char    log_writeman[5]     = "";
char    log_buff[100]       = "";
int     seqno = 0; 
char    log_subdate[9]      = "";

void main(argc,argv)
int argc;
char *argv[];
{
     char FL_file[255];
     
           /*dsa2000 Rexec 대체 파라미터 추가...*/
     /* 2014.05.30 하은영 시작사번, 종료사번을 추가하여 해당 사번만 계산되도록 수정 */      
     if  (argc != 7) {  /* /hper8/HINSA/proc/bin/Kbin/pkq1050g 20131217 0000 zzzz D029 pkq1050g 2006120400000 */
          printf("[Usage] : pkq1050g 1.지급일자 2.사번fr 3.사번to 4.작업사번 5.프로그램ID 6.시작시간  \n");
          exit(1);
     }
      
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq1050g");
     
     hinsa_get_filename(1, FL_file);
     printf("[DEBUG] filename =%s\n",FL_file);
     
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(writeman,"%s",argv[4]);
       
       /* Dsa2000  2004.02.24.  **********************************/  /* DB_connect(id,0); */
     hinsa_log_print(0,"연말정산 계산 시작..."); 
     hinsa_db_connect();  /*DB Connect 실시..*/
     
     /*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
     /* 2014.05.30 하은영 시작사번, 종료사번을 추가하여 해당 사번만 계산되도록 수정 */ 
     strcpy(log_subdate,  argv[1]);
     strcpy(frempno,      argv[2]);
     strcpy(toempno,      argv[3]);
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
        
     Calc_Yearend();
           
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "ERROR ====== [작업 실패] =====\n");  /*dsa2000 Rexec 대체*/
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          Write_batlog(seqno++, "OK ====== [연말정산 세액계산 작업성공] =====\n");  /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [연말정산 세액계산 작업성공] =====\n");        
     }
}

err_print(errcode,str)
int errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
}

/* PKCYSBAS 에서 읽어오는 변수값은 제외하고 Clear */
ClearVar()
{
      memset(empno,'\0',sizeof(empno));
      taxgross   =foritaxgross =mate      =familyno  =fami65no =0;
      mcogbonsum =bcogbonsum   =0;
      obstacleno =childno      =woman     =manychildno=0;
      medamt     =bmedamt      =bmedamt1  =0;
      hireamt    =bhireamt     =bhireamt1 =0;
      guaramt    =0;
      ghosamt    =ohosamt      =nhosamt   =hosamt     =0;
      keduno     =ueduno       = 0;
      seduamt    =keduamt      =ceduno    =ceduamt   = ueduamt  =0;
      houseamt   =houseintamt  =houseamt  = poliamt = agiveamt     =pgiveamt  = sgiveamt =0;
      penamt1    =penamt2      =bpenamt   = 0;
      propamt1   =propamt2     =bpropamt  = hloanamt =0;
      foriamt    =etctamt   =0;
      creditamt  = creditdedamt= credittotamt=creditamt_med=0;
      mcresum    = bcresum  =0;
      mintax     =mjutax       =bintax    = bjutax   =0;
      mnongtax   =bnongtax     =0;  
      investamt  = 0;
      keduno1    =keduamt1     = 0;
      bintax1    = bjutax1     = bnongtax1=0;   /*new_calctax = 0;*/
      obsguaramt = anuamt     = banuamt    = banuamt1 = 0;
      npenamt    = npenamt2   = 0;
      obseduno   = obseduamt  = spgivamt   = oinvestamt   = 0;  /*parksh 20021213 추가*/
      debitamt   = giroamt    = foreignamt = foreignded = totcreditamt = 0;  /* dsa2000 추가  2003.12.*/
      memset(juminid,'\0',sizeof(juminid));                                  /* Dsa2000 추가  2003.12.*/
      fami70no   = specaddno  = specaddded   = polided = houseintamt2  = 0;   /* Dsa2000 추가  2004.12.*/
      cashamt    = 0;                                                        /* Dsa2000 추가  2005.11.*/
      costockamt = costockded = costocktax = 0;                              /* Dsa2000 추가  2006.12.*/
      babyno = babyded = fundamt1 = fundamt2 = fundamt3 = fundded =0 ;       /* KTH 추가  2008.12.*/
      longmtamt = longmtded = pgiveamt2 = houseamt2 =  houseintded=houseintamt3 = houserentamt =0 ; /* KTH 추가  2008.12.houseintamt3 KTH 2010.01 houserentamt KTH 20110125 추가*/             
      houserentded = housvsubamt =housvsubded =housvempamt = housvempded =housvcomamt =housvcomded= 0;
      tmarketamt = houseintamt4 = houseintamt5 = houseintded4 = houseintded5 = investamt2 =0; /* hjku 2012.12. 추가 */  
      hsrentinamt= hsrentinded  = nepgiveded   = nepgiveded2  = chagamamt    = laborlimit = 0;
      nagiveamt= npgiveamt2 = npgiveamt = npgiveamt2_2010 = npgiveamt2_else =0;       
      
      nagiveded = npgiveded = npgiveded2 = ngiveded =  0;                  /*2014.12.22 하은영 추가 */ 
      investamt5 = investamt6 = investamt7 = investded3 = longfundamt = longfundded = 0;                   
      childtaxded = npendtaxded = guartaxded = hostaxded = edutaxded = 0;
      polided1 = polided2 = politaxded1 = politaxded2 = agivetaxded = pgivetaxded = taxdedsum =0;
      houserenttaxded = creditaddamt1 = creditaddamt2 = creditaddamt3 = creditaddamt4 = 0;
      infanttaxded = addbabytaxded = obsguartaxded = 0;                      /*2015.05.06 eyha */
      
}                  
                   
/*  연세율표를 읽어 배열에 저장한다 */
ReadTax()          
{                  
     int i=0;

     /* EXEC SQL DECLARE ctax CURSOR FOR
     SELECT  NVL(TAXPAYFR,0),NVL(TAXPAYTO,0),NVL(TAXRATE,0),
             NVL(YEARDED,0)
       FROM  PKCPTAX
      WHERE  TAXNUM = :TAXNUM; */ 


     /* EXEC    SQL OPEN ctax; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0001;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)TAXNUM;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "연세율표  fetch Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"연세율표  fetch Error");
          exit(1);
     }

     while(1)
     {
          /* EXEC SQL FETCH ctax INTO
          :taxtbl[i].taxfr,     :taxtbl[i].taxto,
          :taxtbl[i].taxrate,   :taxtbl[i].yearded; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )24;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&(taxtbl[i].taxfr);
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&(taxtbl[i].taxto);
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&(taxtbl[i].taxrate);
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&(taxtbl[i].yearded);
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
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




          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
               Write_batlog(seqno++, "연말정산 기초자료   read Error");  /*dsa2000 Rexec 대체*/
               err_print(sqlca.sqlcode,"연말정산 기초자료 read Error");
               exit(1);
          }

          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close ctax; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )55;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               taxtblcnt = i;
               break;
          }
          i++;
     }
}

double GetTax(double taxlevel)
{
     int i;
     double res;
     
     if  (taxlevel <= 0 )
          return 0 ;

     for (i=0 ;i <taxtblcnt ; ++i)
     {
          if ((taxtbl[i].taxfr < taxlevel) && (taxtbl[i].taxto >= taxlevel))
          {
               res = taxlevel * taxtbl[i].taxrate / 100;
               res = floor(res - taxtbl[i].yearded);
               return res;
          }

     }
}

ReadPkcysbas()
{
     /* EXEC    SQL
     SELECT  WORKYY
     INTO    :workyy
     FROM    PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select WORKYY into :b0  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )70;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workyy;
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


     if  (sqlca.sqlcode != 0)
     {       
          Write_batlog(seqno++, "연말정산기준일 read ERROR");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"연말정산기준일 read ERROR");
          exit(1);
     }

     /* EXEC    SQL
     SELECT  TAXNUM,         INDEDBASIC,     INDEDORATE,  INDEDLIMIT,
             BASDED,         APPDED,       
             FEWDED1,        FEWDED2,        STDDED,         INSDEDLIMIT,
             MEDDEDLIMIT,    MEDORATE,       KINEDULIMIT,    CJKEDULIMIT,    UNIEDULIMIT,
             BROEDUNO,       HSRATE,         HSDEDLIMIT,     GIVDEDRATE,     PENRATE,      
             PENDEDLIMIT,    TAXDEDBASIC,    TAXDEDBRATE,    TAXDEDORATE,    TAXDEDLIMIT,  
             PRODEDRATE,     HSINTRATE,      JUTAXRATE,      NONGRATE,       INVESTRATE,  
             INVESTDEDRATE,                  INDEDORATE2,    INDEDLIMIT2,
             CREDEDLIMIT,    CREDEDRATE ,    CREORATE  ,     CREDEDLRATE,
             INDEDLIMIT3,    INDEDORATE3,    OBSDEDLIMIT,    NPENDEDLIMIT,   /oLSTKDEDRATE , o/
             INDEDLIMIT4,    INDEDORATE4,    APPOLDDED,                      /oOLSTKDEDRATE, o/
             OBSEDULIMIT,    OINVESTRATE,    OINVESTDEDRATE, SPGIVDEDRATE,
             HSDEDLIMIT2,    DEBITDEDRATE,   GIRODEDRATE,    FOREDEDRATE,              /o Dsa2000 추가  2003.12.o/
             APPOLDDED2,     SPECADDLIMIT,   POLILIMIT ,     HSDEDLIMIT3,              /o Dsa2000 추가  2004.12.o/
             OBSDEDADD,      COSTOCKLIMIT,   GIVDEDRATE2,    APPBABYDED,               /o Dsa2000 추가  2005.12.o/ 
             FUNDRATE1,      FUNDRATE2,      FUNDRATE3,      LONGMTRATE,               /o KTH 추가      2008.12.o/                          
             HSDEDLIMIT4,    INDEDBRATE,     GIVDEDRATE3,
             TMARKETDEDRATE, TMARKETEXLIMIT, INVESTRATE2,    INVESTDEDRATE2, HSDEDLIMIT5, HSDEDLIMIT6, /o hjku 추가 2012.12 o/
             SPARENTDEDADD,  HSRATE2, TRAFFICDEDRATE, TRAFFICEXLIMIT, SPDEDLIMIT, INVESTRATE3, HSRENTINTRATE, HSRENTINTLIMIT,  /o hjku 추가 2013.12 o/
             TAXDEDSECT1, TAXDEDSLIMIT1, TAXDEDSECT2, TAXDEDSLIMIT2, APPDEDLIMIT,          /o2014.12.19 하은영 o/
             NPENRATE, SPECIALRATE1, SPECIALRATE2, GIVESLIMIT, GIVESRATE,                  /o2014.12.19 하은영 o/
             HOUSERENTLIMIT1, HOUSERENTLIMIT2, HOUSERENTRATE, INVESTRATE4,                 /o2014.12.19 하은영 o/
             INVESTRATE5, INVESTRATE6, INVESTDEDRATE3, LONGFUNDLIMIT1, LONGFUNDLIMIT2,     /o2014.12.19 하은영 o/
             LONGFUNDRATE, CARDUPRATE1, CARDUPRATE2, YLOANBASLIMIT,                        /o2014.12.19 하은영 o/
             0 TAXDEDSECT3, 0 TAXDEDSLIMIT3, INFANTDED, ADDBABYDED, NPENRATE2, NPENLIMIT       /o2015.05.06 eyha   o/             
       INTO  :TAXNUM,        :INDEDBASIC,    :INDEDORATE,    :INDEDLIMIT,
             :BASDED,        :APPDED,      
             :FEWDED1,       :FEWDED2,       :STDDED,        :INSDEDLIMIT,
             :MEDDEDLIMIT,   :MEDORATE,      :KINEDULIMIT,   :CJKEDULIMIT,   :UNIEDULIMIT,
             :BROEDUNO,      :HSRATE,        :HSDEDLIMIT,    :GIVDEDRATE,    :PENRATE,     
             :PENDEDLIMIT,   :TAXDEDBASIC,   :TAXDEDBRATE,   :TAXDEDORATE,   :TAXDEDLIMIT, 
             :PRODEDRATE,    :HSINTRATE,     :JUTAXRATE,     :NONGRATE,      :INVESTRATE, 
             :INVESTDEDRATE,                 :INDEDORATE2,   :INDEDLIMIT2,
             :CREDEDLIMIT,   :CREDEDRATE,    :CREORATE   ,   :CREDEDLRATE,
             :INDEDLIMIT3,   :INDEDORATE3,   :OBSDEDLIMIT,   :NPENDEDLIMIT,  /o:LSTKDEDRATE, o/
             :INDEDLIMIT4,   :INDEDORATE4,   :APPOLDDED,                     /o:OLSTKDEDRATE,o/            /o parksh 20021213 추가 o/
             :OBSEDULIMIT,   :OINVESTRATE,   :OINVESTDEDRATE,:SPGIVDEDRATE, 
             :HSDEDLIMIT2,   :DEBITDEDRATE,  :GIRODEDRATE,   :FOREDEDRATE,          /o Dsa2000 추가  2003.12.o/
             :APPOLDDED2,    :SPECADDLIMIT,  :POLILIMIT,     :HSDEDLIMIT3,          /o Dsa2000 추가  2004.12.o/
             :OBSDEDADD,     :COSTOCKLIMIT,  :GIVDEDRATE2,   :APPBABYDED,           /o Dsa2000 추가  2005.12.  2006.12.o/ 
             :FUNDRATE1,     :FUNDRATE2,     :FUNDRATE3,     :LONGMTRATE,            /o KTH 추가      2008.12.o/ 
             :HSDEDLIMIT4,   :INDEDBRATE,    :GIVDEDRATE3,
             :TMARKETDEDRATE,:TMARKETEXLIMIT,:INVESTRATE2,   :INVESTDEDRATE2,:HSDEDLIMIT5, :HSDEDLIMIT6, /o hjku 추가 2012.12 o/                                                      
             :SPARENTDEDADD, :HSRATE2, :TRAFFICDEDRATE, :TRAFFICEXLIMIT, :SPDEDLIMIT, :INVESTRATE3, :HSRENTINTRATE, :HSRENTINTLIMIT,  /o hjku 추가 2013.12 o/                                                      
             :TAXDEDSECT1,   :TAXDEDSLIMIT1, :TAXDEDSECT2,   :TAXDEDSLIMIT2, :APPDEDLIMIT,          /o2014.12.19 하은영 o/
             :NPENRATE,      :SPECIALRATE1, :SPECIALRATE2, :GIVESLIMIT, :GIVESRATE,                 /o2014.12.19 하은영 o/
             :HOUSERENTLIMIT1, :HOUSERENTLIMIT2, :HOUSERENTRATE, :INVESTRATE4,                      /o2014.12.19 하은영 o/
             :INVESTRATE5, :INVESTRATE6, :INVESTDEDRATE3, :LONGFUNDLIMIT1, :LONGFUNDLIMIT2,         /o2014.12.19 하은영 o/
             :LONGFUNDRATE, :CARDUPRATE1, :CARDUPRATE2, :YLOANBASLIMIT,                             /o2014.12.19 하은영 o/             
             :TAXDEDSECT3, :TAXDEDSLIMIT3, :INFANTDED, :ADDBABYDED, :NPENRATE2, :NPENLIMIT          /o2015.05.06 eyha   o/             
       FROM  PKCYSBAS  
      WHERE  WORKYY = :workyy; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 111;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select TAXNUM ,INDEDBASIC ,INDEDORATE ,INDEDLIMIT ,BASDED ,APPDED ,F\
EWDED1 ,FEWDED2 ,STDDED ,INSDEDLIMIT ,MEDDEDLIMIT ,MEDORATE ,KINEDULIMIT ,CJ\
KEDULIMIT ,UNIEDULIMIT ,BROEDUNO ,HSRATE ,HSDEDLIMIT ,GIVDEDRATE ,PENRATE ,P\
ENDEDLIMIT ,TAXDEDBASIC ,TAXDEDBRATE ,TAXDEDORATE ,TAXDEDLIMIT ,PRODEDRATE ,\
HSINTRATE ,JUTAXRATE ,NONGRATE ,INVESTRATE ,INVESTDEDRATE ,INDEDORATE2 ,INDE\
DLIMIT2 ,CREDEDLIMIT ,CREDEDRATE ,CREORATE ,CREDEDLRATE ,INDEDLIMIT3 ,INDEDO\
RATE3 ,OBSDEDLIMIT ,NPENDEDLIMIT ,INDEDLIMIT4 ,INDEDORATE4 ,APPOLDDED ,OBSED\
ULIMIT ,OINVESTRATE ,OINVESTDEDRATE ,SPGIVDEDRATE ,HSDEDLIMIT2 ,DEBITDEDRATE\
 ,GIRODEDRATE ,FOREDEDRATE ,APPOLDDED2 ,SPECADDLIMIT ,POLILIMIT ,HSDEDLIMIT3\
 ,OBSDEDADD ,COSTOCKLIMIT ,GIVDEDRATE2 ,APPBABYDED ,FUNDRATE1 ,FUNDRATE2 ,FU\
NDRATE3 ,LONGMTRATE ,HSDEDLIMIT4 ,INDEDBRATE ,GIVDEDRATE3 ,TMARKETDEDRATE ,T\
MARKETEXLIMIT ,INVESTRATE2 ,INVESTDEDRATE2 ,HSDEDLIMIT5 ,HSDEDLIMIT6 ,SPAREN\
TDEDADD ,HSRATE2 ,TRAFFICDEDRATE ,TRAFFICEXLIMIT ,SPDEDLIMIT ,INVESTRATE3 ,H\
SRENTINTRATE ,HSRENTINTLIMIT ,TAXDEDSECT1 ,T");
     sqlstm.stmt = "AXDEDSLIMIT1 ,TAXDEDSECT2 ,TAXDEDSLIMIT2 ,APPDEDLIMIT ,\
NPENRATE ,SPECIALRATE1 ,SPECIALRATE2 ,GIVESLIMIT ,GIVESRATE ,HOUSERENTLIMIT1 \
,HOUSERENTLIMIT2 ,HOUSERENTRATE ,INVESTRATE4 ,INVESTRATE5 ,INVESTRATE6 ,INVES\
TDEDRATE3 ,LONGFUNDLIMIT1 ,LONGFUNDLIMIT2 ,LONGFUNDRATE ,CARDUPRATE1 ,CARDUPR\
ATE2 ,YLOANBASLIMIT ,0 TAXDEDSECT3 ,0 TAXDEDSLIMIT3 ,INFANTDED ,ADDBABYDED ,N\
PENRATE2 ,NPENLIMIT into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b\
12,:b13,:b14,:b15,:b16,:b17,:b18,:b19,:b20,:b21,:b22,:b23,:b24,:b25,:b26,:b27\
,:b28,:b29,:b30,:b31,:b32,:b33,:b34,:b35,:b36,:b37,:b38,:b39,:b40,:b41,:b42,:\
b43,:b44,:b45,:b46,:b47,:b48,:b49,:b50,:b51,:b52,:b53,:b54,:b55,:b56,:b57,:b5\
8,:b59,:b60,:b61,:b62,:b63,:b64,:b65,:b66,:b67,:b68,:b69,:b70,:b71,:b72,:b73,\
:b74,:b75,:b76,:b77,:b78,:b79,:b80,:b81,:b82,:b83,:b84,:b85,:b86,:b87,:b88,:b\
89,:b90,:b91,:b92,:b93,:b94,:b95,:b96,:b97,:b98,:b99,:b100,:b101,:b102,:b103,\
:b104,:b105,:b106,:b107,:b108,:b109  from PKCYSBAS where WORKYY=:b110";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )89;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)TAXNUM;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&INDEDBASIC;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&INDEDORATE;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&INDEDLIMIT;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&BASDED;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&APPDED;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&FEWDED1;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&FEWDED2;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&STDDED;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&INSDEDLIMIT;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&MEDDEDLIMIT;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&MEDORATE;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&KINEDULIMIT;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&CJKEDULIMIT;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&UNIEDULIMIT;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&BROEDUNO;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&HSRATE;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&HSDEDLIMIT;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&GIVDEDRATE;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&PENRATE;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&PENDEDLIMIT;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&TAXDEDBASIC;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&TAXDEDBRATE;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&TAXDEDORATE;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&TAXDEDLIMIT;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)&PRODEDRATE;
     sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)&HSINTRATE;
     sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&JUTAXRATE;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)&NONGRATE;
     sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&INVESTRATE;
     sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&INVESTDEDRATE;
     sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)&INDEDORATE2;
     sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)&INDEDLIMIT2;
     sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&CREDEDLIMIT;
     sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)&CREDEDRATE;
     sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)&CREORATE;
     sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[35] = (         int  )0;
     sqlstm.sqindv[35] = (         short *)0;
     sqlstm.sqinds[35] = (         int  )0;
     sqlstm.sqharm[35] = (unsigned long )0;
     sqlstm.sqadto[35] = (unsigned short )0;
     sqlstm.sqtdso[35] = (unsigned short )0;
     sqlstm.sqhstv[36] = (unsigned char  *)&CREDEDLRATE;
     sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[36] = (         int  )0;
     sqlstm.sqindv[36] = (         short *)0;
     sqlstm.sqinds[36] = (         int  )0;
     sqlstm.sqharm[36] = (unsigned long )0;
     sqlstm.sqadto[36] = (unsigned short )0;
     sqlstm.sqtdso[36] = (unsigned short )0;
     sqlstm.sqhstv[37] = (unsigned char  *)&INDEDLIMIT3;
     sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
     sqlstm.sqhstv[38] = (unsigned char  *)&INDEDORATE3;
     sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[38] = (         int  )0;
     sqlstm.sqindv[38] = (         short *)0;
     sqlstm.sqinds[38] = (         int  )0;
     sqlstm.sqharm[38] = (unsigned long )0;
     sqlstm.sqadto[38] = (unsigned short )0;
     sqlstm.sqtdso[38] = (unsigned short )0;
     sqlstm.sqhstv[39] = (unsigned char  *)&OBSDEDLIMIT;
     sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[39] = (         int  )0;
     sqlstm.sqindv[39] = (         short *)0;
     sqlstm.sqinds[39] = (         int  )0;
     sqlstm.sqharm[39] = (unsigned long )0;
     sqlstm.sqadto[39] = (unsigned short )0;
     sqlstm.sqtdso[39] = (unsigned short )0;
     sqlstm.sqhstv[40] = (unsigned char  *)&NPENDEDLIMIT;
     sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[40] = (         int  )0;
     sqlstm.sqindv[40] = (         short *)0;
     sqlstm.sqinds[40] = (         int  )0;
     sqlstm.sqharm[40] = (unsigned long )0;
     sqlstm.sqadto[40] = (unsigned short )0;
     sqlstm.sqtdso[40] = (unsigned short )0;
     sqlstm.sqhstv[41] = (unsigned char  *)&INDEDLIMIT4;
     sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[41] = (         int  )0;
     sqlstm.sqindv[41] = (         short *)0;
     sqlstm.sqinds[41] = (         int  )0;
     sqlstm.sqharm[41] = (unsigned long )0;
     sqlstm.sqadto[41] = (unsigned short )0;
     sqlstm.sqtdso[41] = (unsigned short )0;
     sqlstm.sqhstv[42] = (unsigned char  *)&INDEDORATE4;
     sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[42] = (         int  )0;
     sqlstm.sqindv[42] = (         short *)0;
     sqlstm.sqinds[42] = (         int  )0;
     sqlstm.sqharm[42] = (unsigned long )0;
     sqlstm.sqadto[42] = (unsigned short )0;
     sqlstm.sqtdso[42] = (unsigned short )0;
     sqlstm.sqhstv[43] = (unsigned char  *)&APPOLDDED;
     sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[43] = (         int  )0;
     sqlstm.sqindv[43] = (         short *)0;
     sqlstm.sqinds[43] = (         int  )0;
     sqlstm.sqharm[43] = (unsigned long )0;
     sqlstm.sqadto[43] = (unsigned short )0;
     sqlstm.sqtdso[43] = (unsigned short )0;
     sqlstm.sqhstv[44] = (unsigned char  *)&OBSEDULIMIT;
     sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[44] = (         int  )0;
     sqlstm.sqindv[44] = (         short *)0;
     sqlstm.sqinds[44] = (         int  )0;
     sqlstm.sqharm[44] = (unsigned long )0;
     sqlstm.sqadto[44] = (unsigned short )0;
     sqlstm.sqtdso[44] = (unsigned short )0;
     sqlstm.sqhstv[45] = (unsigned char  *)&OINVESTRATE;
     sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[45] = (         int  )0;
     sqlstm.sqindv[45] = (         short *)0;
     sqlstm.sqinds[45] = (         int  )0;
     sqlstm.sqharm[45] = (unsigned long )0;
     sqlstm.sqadto[45] = (unsigned short )0;
     sqlstm.sqtdso[45] = (unsigned short )0;
     sqlstm.sqhstv[46] = (unsigned char  *)&OINVESTDEDRATE;
     sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[46] = (         int  )0;
     sqlstm.sqindv[46] = (         short *)0;
     sqlstm.sqinds[46] = (         int  )0;
     sqlstm.sqharm[46] = (unsigned long )0;
     sqlstm.sqadto[46] = (unsigned short )0;
     sqlstm.sqtdso[46] = (unsigned short )0;
     sqlstm.sqhstv[47] = (unsigned char  *)&SPGIVDEDRATE;
     sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[47] = (         int  )0;
     sqlstm.sqindv[47] = (         short *)0;
     sqlstm.sqinds[47] = (         int  )0;
     sqlstm.sqharm[47] = (unsigned long )0;
     sqlstm.sqadto[47] = (unsigned short )0;
     sqlstm.sqtdso[47] = (unsigned short )0;
     sqlstm.sqhstv[48] = (unsigned char  *)&HSDEDLIMIT2;
     sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[48] = (         int  )0;
     sqlstm.sqindv[48] = (         short *)0;
     sqlstm.sqinds[48] = (         int  )0;
     sqlstm.sqharm[48] = (unsigned long )0;
     sqlstm.sqadto[48] = (unsigned short )0;
     sqlstm.sqtdso[48] = (unsigned short )0;
     sqlstm.sqhstv[49] = (unsigned char  *)&DEBITDEDRATE;
     sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[49] = (         int  )0;
     sqlstm.sqindv[49] = (         short *)0;
     sqlstm.sqinds[49] = (         int  )0;
     sqlstm.sqharm[49] = (unsigned long )0;
     sqlstm.sqadto[49] = (unsigned short )0;
     sqlstm.sqtdso[49] = (unsigned short )0;
     sqlstm.sqhstv[50] = (unsigned char  *)&GIRODEDRATE;
     sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[50] = (         int  )0;
     sqlstm.sqindv[50] = (         short *)0;
     sqlstm.sqinds[50] = (         int  )0;
     sqlstm.sqharm[50] = (unsigned long )0;
     sqlstm.sqadto[50] = (unsigned short )0;
     sqlstm.sqtdso[50] = (unsigned short )0;
     sqlstm.sqhstv[51] = (unsigned char  *)&FOREDEDRATE;
     sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[51] = (         int  )0;
     sqlstm.sqindv[51] = (         short *)0;
     sqlstm.sqinds[51] = (         int  )0;
     sqlstm.sqharm[51] = (unsigned long )0;
     sqlstm.sqadto[51] = (unsigned short )0;
     sqlstm.sqtdso[51] = (unsigned short )0;
     sqlstm.sqhstv[52] = (unsigned char  *)&APPOLDDED2;
     sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[52] = (         int  )0;
     sqlstm.sqindv[52] = (         short *)0;
     sqlstm.sqinds[52] = (         int  )0;
     sqlstm.sqharm[52] = (unsigned long )0;
     sqlstm.sqadto[52] = (unsigned short )0;
     sqlstm.sqtdso[52] = (unsigned short )0;
     sqlstm.sqhstv[53] = (unsigned char  *)&SPECADDLIMIT;
     sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[53] = (         int  )0;
     sqlstm.sqindv[53] = (         short *)0;
     sqlstm.sqinds[53] = (         int  )0;
     sqlstm.sqharm[53] = (unsigned long )0;
     sqlstm.sqadto[53] = (unsigned short )0;
     sqlstm.sqtdso[53] = (unsigned short )0;
     sqlstm.sqhstv[54] = (unsigned char  *)&POLILIMIT;
     sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[54] = (         int  )0;
     sqlstm.sqindv[54] = (         short *)0;
     sqlstm.sqinds[54] = (         int  )0;
     sqlstm.sqharm[54] = (unsigned long )0;
     sqlstm.sqadto[54] = (unsigned short )0;
     sqlstm.sqtdso[54] = (unsigned short )0;
     sqlstm.sqhstv[55] = (unsigned char  *)&HSDEDLIMIT3;
     sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[55] = (         int  )0;
     sqlstm.sqindv[55] = (         short *)0;
     sqlstm.sqinds[55] = (         int  )0;
     sqlstm.sqharm[55] = (unsigned long )0;
     sqlstm.sqadto[55] = (unsigned short )0;
     sqlstm.sqtdso[55] = (unsigned short )0;
     sqlstm.sqhstv[56] = (unsigned char  *)&OBSDEDADD;
     sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[56] = (         int  )0;
     sqlstm.sqindv[56] = (         short *)0;
     sqlstm.sqinds[56] = (         int  )0;
     sqlstm.sqharm[56] = (unsigned long )0;
     sqlstm.sqadto[56] = (unsigned short )0;
     sqlstm.sqtdso[56] = (unsigned short )0;
     sqlstm.sqhstv[57] = (unsigned char  *)&COSTOCKLIMIT;
     sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[57] = (         int  )0;
     sqlstm.sqindv[57] = (         short *)0;
     sqlstm.sqinds[57] = (         int  )0;
     sqlstm.sqharm[57] = (unsigned long )0;
     sqlstm.sqadto[57] = (unsigned short )0;
     sqlstm.sqtdso[57] = (unsigned short )0;
     sqlstm.sqhstv[58] = (unsigned char  *)&GIVDEDRATE2;
     sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[58] = (         int  )0;
     sqlstm.sqindv[58] = (         short *)0;
     sqlstm.sqinds[58] = (         int  )0;
     sqlstm.sqharm[58] = (unsigned long )0;
     sqlstm.sqadto[58] = (unsigned short )0;
     sqlstm.sqtdso[58] = (unsigned short )0;
     sqlstm.sqhstv[59] = (unsigned char  *)&APPBABYDED;
     sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[59] = (         int  )0;
     sqlstm.sqindv[59] = (         short *)0;
     sqlstm.sqinds[59] = (         int  )0;
     sqlstm.sqharm[59] = (unsigned long )0;
     sqlstm.sqadto[59] = (unsigned short )0;
     sqlstm.sqtdso[59] = (unsigned short )0;
     sqlstm.sqhstv[60] = (unsigned char  *)&FUNDRATE1;
     sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[60] = (         int  )0;
     sqlstm.sqindv[60] = (         short *)0;
     sqlstm.sqinds[60] = (         int  )0;
     sqlstm.sqharm[60] = (unsigned long )0;
     sqlstm.sqadto[60] = (unsigned short )0;
     sqlstm.sqtdso[60] = (unsigned short )0;
     sqlstm.sqhstv[61] = (unsigned char  *)&FUNDRATE2;
     sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[61] = (         int  )0;
     sqlstm.sqindv[61] = (         short *)0;
     sqlstm.sqinds[61] = (         int  )0;
     sqlstm.sqharm[61] = (unsigned long )0;
     sqlstm.sqadto[61] = (unsigned short )0;
     sqlstm.sqtdso[61] = (unsigned short )0;
     sqlstm.sqhstv[62] = (unsigned char  *)&FUNDRATE3;
     sqlstm.sqhstl[62] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[62] = (         int  )0;
     sqlstm.sqindv[62] = (         short *)0;
     sqlstm.sqinds[62] = (         int  )0;
     sqlstm.sqharm[62] = (unsigned long )0;
     sqlstm.sqadto[62] = (unsigned short )0;
     sqlstm.sqtdso[62] = (unsigned short )0;
     sqlstm.sqhstv[63] = (unsigned char  *)&LONGMTRATE;
     sqlstm.sqhstl[63] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[63] = (         int  )0;
     sqlstm.sqindv[63] = (         short *)0;
     sqlstm.sqinds[63] = (         int  )0;
     sqlstm.sqharm[63] = (unsigned long )0;
     sqlstm.sqadto[63] = (unsigned short )0;
     sqlstm.sqtdso[63] = (unsigned short )0;
     sqlstm.sqhstv[64] = (unsigned char  *)&HSDEDLIMIT4;
     sqlstm.sqhstl[64] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[64] = (         int  )0;
     sqlstm.sqindv[64] = (         short *)0;
     sqlstm.sqinds[64] = (         int  )0;
     sqlstm.sqharm[64] = (unsigned long )0;
     sqlstm.sqadto[64] = (unsigned short )0;
     sqlstm.sqtdso[64] = (unsigned short )0;
     sqlstm.sqhstv[65] = (unsigned char  *)&INDEDBRATE;
     sqlstm.sqhstl[65] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[65] = (         int  )0;
     sqlstm.sqindv[65] = (         short *)0;
     sqlstm.sqinds[65] = (         int  )0;
     sqlstm.sqharm[65] = (unsigned long )0;
     sqlstm.sqadto[65] = (unsigned short )0;
     sqlstm.sqtdso[65] = (unsigned short )0;
     sqlstm.sqhstv[66] = (unsigned char  *)&GIVDEDRATE3;
     sqlstm.sqhstl[66] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[66] = (         int  )0;
     sqlstm.sqindv[66] = (         short *)0;
     sqlstm.sqinds[66] = (         int  )0;
     sqlstm.sqharm[66] = (unsigned long )0;
     sqlstm.sqadto[66] = (unsigned short )0;
     sqlstm.sqtdso[66] = (unsigned short )0;
     sqlstm.sqhstv[67] = (unsigned char  *)&TMARKETDEDRATE;
     sqlstm.sqhstl[67] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[67] = (         int  )0;
     sqlstm.sqindv[67] = (         short *)0;
     sqlstm.sqinds[67] = (         int  )0;
     sqlstm.sqharm[67] = (unsigned long )0;
     sqlstm.sqadto[67] = (unsigned short )0;
     sqlstm.sqtdso[67] = (unsigned short )0;
     sqlstm.sqhstv[68] = (unsigned char  *)&TMARKETEXLIMIT;
     sqlstm.sqhstl[68] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[68] = (         int  )0;
     sqlstm.sqindv[68] = (         short *)0;
     sqlstm.sqinds[68] = (         int  )0;
     sqlstm.sqharm[68] = (unsigned long )0;
     sqlstm.sqadto[68] = (unsigned short )0;
     sqlstm.sqtdso[68] = (unsigned short )0;
     sqlstm.sqhstv[69] = (unsigned char  *)&INVESTRATE2;
     sqlstm.sqhstl[69] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[69] = (         int  )0;
     sqlstm.sqindv[69] = (         short *)0;
     sqlstm.sqinds[69] = (         int  )0;
     sqlstm.sqharm[69] = (unsigned long )0;
     sqlstm.sqadto[69] = (unsigned short )0;
     sqlstm.sqtdso[69] = (unsigned short )0;
     sqlstm.sqhstv[70] = (unsigned char  *)&INVESTDEDRATE2;
     sqlstm.sqhstl[70] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[70] = (         int  )0;
     sqlstm.sqindv[70] = (         short *)0;
     sqlstm.sqinds[70] = (         int  )0;
     sqlstm.sqharm[70] = (unsigned long )0;
     sqlstm.sqadto[70] = (unsigned short )0;
     sqlstm.sqtdso[70] = (unsigned short )0;
     sqlstm.sqhstv[71] = (unsigned char  *)&HSDEDLIMIT5;
     sqlstm.sqhstl[71] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[71] = (         int  )0;
     sqlstm.sqindv[71] = (         short *)0;
     sqlstm.sqinds[71] = (         int  )0;
     sqlstm.sqharm[71] = (unsigned long )0;
     sqlstm.sqadto[71] = (unsigned short )0;
     sqlstm.sqtdso[71] = (unsigned short )0;
     sqlstm.sqhstv[72] = (unsigned char  *)&HSDEDLIMIT6;
     sqlstm.sqhstl[72] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[72] = (         int  )0;
     sqlstm.sqindv[72] = (         short *)0;
     sqlstm.sqinds[72] = (         int  )0;
     sqlstm.sqharm[72] = (unsigned long )0;
     sqlstm.sqadto[72] = (unsigned short )0;
     sqlstm.sqtdso[72] = (unsigned short )0;
     sqlstm.sqhstv[73] = (unsigned char  *)&SPARENTDEDADD;
     sqlstm.sqhstl[73] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[73] = (         int  )0;
     sqlstm.sqindv[73] = (         short *)0;
     sqlstm.sqinds[73] = (         int  )0;
     sqlstm.sqharm[73] = (unsigned long )0;
     sqlstm.sqadto[73] = (unsigned short )0;
     sqlstm.sqtdso[73] = (unsigned short )0;
     sqlstm.sqhstv[74] = (unsigned char  *)&HSRATE2;
     sqlstm.sqhstl[74] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[74] = (         int  )0;
     sqlstm.sqindv[74] = (         short *)0;
     sqlstm.sqinds[74] = (         int  )0;
     sqlstm.sqharm[74] = (unsigned long )0;
     sqlstm.sqadto[74] = (unsigned short )0;
     sqlstm.sqtdso[74] = (unsigned short )0;
     sqlstm.sqhstv[75] = (unsigned char  *)&TRAFFICDEDRATE;
     sqlstm.sqhstl[75] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[75] = (         int  )0;
     sqlstm.sqindv[75] = (         short *)0;
     sqlstm.sqinds[75] = (         int  )0;
     sqlstm.sqharm[75] = (unsigned long )0;
     sqlstm.sqadto[75] = (unsigned short )0;
     sqlstm.sqtdso[75] = (unsigned short )0;
     sqlstm.sqhstv[76] = (unsigned char  *)&TRAFFICEXLIMIT;
     sqlstm.sqhstl[76] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[76] = (         int  )0;
     sqlstm.sqindv[76] = (         short *)0;
     sqlstm.sqinds[76] = (         int  )0;
     sqlstm.sqharm[76] = (unsigned long )0;
     sqlstm.sqadto[76] = (unsigned short )0;
     sqlstm.sqtdso[76] = (unsigned short )0;
     sqlstm.sqhstv[77] = (unsigned char  *)&SPDEDLIMIT;
     sqlstm.sqhstl[77] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[77] = (         int  )0;
     sqlstm.sqindv[77] = (         short *)0;
     sqlstm.sqinds[77] = (         int  )0;
     sqlstm.sqharm[77] = (unsigned long )0;
     sqlstm.sqadto[77] = (unsigned short )0;
     sqlstm.sqtdso[77] = (unsigned short )0;
     sqlstm.sqhstv[78] = (unsigned char  *)&INVESTRATE3;
     sqlstm.sqhstl[78] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[78] = (         int  )0;
     sqlstm.sqindv[78] = (         short *)0;
     sqlstm.sqinds[78] = (         int  )0;
     sqlstm.sqharm[78] = (unsigned long )0;
     sqlstm.sqadto[78] = (unsigned short )0;
     sqlstm.sqtdso[78] = (unsigned short )0;
     sqlstm.sqhstv[79] = (unsigned char  *)&HSRENTINTRATE;
     sqlstm.sqhstl[79] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[79] = (         int  )0;
     sqlstm.sqindv[79] = (         short *)0;
     sqlstm.sqinds[79] = (         int  )0;
     sqlstm.sqharm[79] = (unsigned long )0;
     sqlstm.sqadto[79] = (unsigned short )0;
     sqlstm.sqtdso[79] = (unsigned short )0;
     sqlstm.sqhstv[80] = (unsigned char  *)&HSRENTINTLIMIT;
     sqlstm.sqhstl[80] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[80] = (         int  )0;
     sqlstm.sqindv[80] = (         short *)0;
     sqlstm.sqinds[80] = (         int  )0;
     sqlstm.sqharm[80] = (unsigned long )0;
     sqlstm.sqadto[80] = (unsigned short )0;
     sqlstm.sqtdso[80] = (unsigned short )0;
     sqlstm.sqhstv[81] = (unsigned char  *)&TAXDEDSECT1;
     sqlstm.sqhstl[81] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[81] = (         int  )0;
     sqlstm.sqindv[81] = (         short *)0;
     sqlstm.sqinds[81] = (         int  )0;
     sqlstm.sqharm[81] = (unsigned long )0;
     sqlstm.sqadto[81] = (unsigned short )0;
     sqlstm.sqtdso[81] = (unsigned short )0;
     sqlstm.sqhstv[82] = (unsigned char  *)&TAXDEDSLIMIT1;
     sqlstm.sqhstl[82] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[82] = (         int  )0;
     sqlstm.sqindv[82] = (         short *)0;
     sqlstm.sqinds[82] = (         int  )0;
     sqlstm.sqharm[82] = (unsigned long )0;
     sqlstm.sqadto[82] = (unsigned short )0;
     sqlstm.sqtdso[82] = (unsigned short )0;
     sqlstm.sqhstv[83] = (unsigned char  *)&TAXDEDSECT2;
     sqlstm.sqhstl[83] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[83] = (         int  )0;
     sqlstm.sqindv[83] = (         short *)0;
     sqlstm.sqinds[83] = (         int  )0;
     sqlstm.sqharm[83] = (unsigned long )0;
     sqlstm.sqadto[83] = (unsigned short )0;
     sqlstm.sqtdso[83] = (unsigned short )0;
     sqlstm.sqhstv[84] = (unsigned char  *)&TAXDEDSLIMIT2;
     sqlstm.sqhstl[84] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[84] = (         int  )0;
     sqlstm.sqindv[84] = (         short *)0;
     sqlstm.sqinds[84] = (         int  )0;
     sqlstm.sqharm[84] = (unsigned long )0;
     sqlstm.sqadto[84] = (unsigned short )0;
     sqlstm.sqtdso[84] = (unsigned short )0;
     sqlstm.sqhstv[85] = (unsigned char  *)&APPDEDLIMIT;
     sqlstm.sqhstl[85] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[85] = (         int  )0;
     sqlstm.sqindv[85] = (         short *)0;
     sqlstm.sqinds[85] = (         int  )0;
     sqlstm.sqharm[85] = (unsigned long )0;
     sqlstm.sqadto[85] = (unsigned short )0;
     sqlstm.sqtdso[85] = (unsigned short )0;
     sqlstm.sqhstv[86] = (unsigned char  *)&NPENRATE;
     sqlstm.sqhstl[86] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[86] = (         int  )0;
     sqlstm.sqindv[86] = (         short *)0;
     sqlstm.sqinds[86] = (         int  )0;
     sqlstm.sqharm[86] = (unsigned long )0;
     sqlstm.sqadto[86] = (unsigned short )0;
     sqlstm.sqtdso[86] = (unsigned short )0;
     sqlstm.sqhstv[87] = (unsigned char  *)&SPECIALRATE1;
     sqlstm.sqhstl[87] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[87] = (         int  )0;
     sqlstm.sqindv[87] = (         short *)0;
     sqlstm.sqinds[87] = (         int  )0;
     sqlstm.sqharm[87] = (unsigned long )0;
     sqlstm.sqadto[87] = (unsigned short )0;
     sqlstm.sqtdso[87] = (unsigned short )0;
     sqlstm.sqhstv[88] = (unsigned char  *)&SPECIALRATE2;
     sqlstm.sqhstl[88] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[88] = (         int  )0;
     sqlstm.sqindv[88] = (         short *)0;
     sqlstm.sqinds[88] = (         int  )0;
     sqlstm.sqharm[88] = (unsigned long )0;
     sqlstm.sqadto[88] = (unsigned short )0;
     sqlstm.sqtdso[88] = (unsigned short )0;
     sqlstm.sqhstv[89] = (unsigned char  *)&GIVESLIMIT;
     sqlstm.sqhstl[89] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[89] = (         int  )0;
     sqlstm.sqindv[89] = (         short *)0;
     sqlstm.sqinds[89] = (         int  )0;
     sqlstm.sqharm[89] = (unsigned long )0;
     sqlstm.sqadto[89] = (unsigned short )0;
     sqlstm.sqtdso[89] = (unsigned short )0;
     sqlstm.sqhstv[90] = (unsigned char  *)&GIVESRATE;
     sqlstm.sqhstl[90] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[90] = (         int  )0;
     sqlstm.sqindv[90] = (         short *)0;
     sqlstm.sqinds[90] = (         int  )0;
     sqlstm.sqharm[90] = (unsigned long )0;
     sqlstm.sqadto[90] = (unsigned short )0;
     sqlstm.sqtdso[90] = (unsigned short )0;
     sqlstm.sqhstv[91] = (unsigned char  *)&HOUSERENTLIMIT1;
     sqlstm.sqhstl[91] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[91] = (         int  )0;
     sqlstm.sqindv[91] = (         short *)0;
     sqlstm.sqinds[91] = (         int  )0;
     sqlstm.sqharm[91] = (unsigned long )0;
     sqlstm.sqadto[91] = (unsigned short )0;
     sqlstm.sqtdso[91] = (unsigned short )0;
     sqlstm.sqhstv[92] = (unsigned char  *)&HOUSERENTLIMIT2;
     sqlstm.sqhstl[92] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[92] = (         int  )0;
     sqlstm.sqindv[92] = (         short *)0;
     sqlstm.sqinds[92] = (         int  )0;
     sqlstm.sqharm[92] = (unsigned long )0;
     sqlstm.sqadto[92] = (unsigned short )0;
     sqlstm.sqtdso[92] = (unsigned short )0;
     sqlstm.sqhstv[93] = (unsigned char  *)&HOUSERENTRATE;
     sqlstm.sqhstl[93] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[93] = (         int  )0;
     sqlstm.sqindv[93] = (         short *)0;
     sqlstm.sqinds[93] = (         int  )0;
     sqlstm.sqharm[93] = (unsigned long )0;
     sqlstm.sqadto[93] = (unsigned short )0;
     sqlstm.sqtdso[93] = (unsigned short )0;
     sqlstm.sqhstv[94] = (unsigned char  *)&INVESTRATE4;
     sqlstm.sqhstl[94] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[94] = (         int  )0;
     sqlstm.sqindv[94] = (         short *)0;
     sqlstm.sqinds[94] = (         int  )0;
     sqlstm.sqharm[94] = (unsigned long )0;
     sqlstm.sqadto[94] = (unsigned short )0;
     sqlstm.sqtdso[94] = (unsigned short )0;
     sqlstm.sqhstv[95] = (unsigned char  *)&INVESTRATE5;
     sqlstm.sqhstl[95] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[95] = (         int  )0;
     sqlstm.sqindv[95] = (         short *)0;
     sqlstm.sqinds[95] = (         int  )0;
     sqlstm.sqharm[95] = (unsigned long )0;
     sqlstm.sqadto[95] = (unsigned short )0;
     sqlstm.sqtdso[95] = (unsigned short )0;
     sqlstm.sqhstv[96] = (unsigned char  *)&INVESTRATE6;
     sqlstm.sqhstl[96] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[96] = (         int  )0;
     sqlstm.sqindv[96] = (         short *)0;
     sqlstm.sqinds[96] = (         int  )0;
     sqlstm.sqharm[96] = (unsigned long )0;
     sqlstm.sqadto[96] = (unsigned short )0;
     sqlstm.sqtdso[96] = (unsigned short )0;
     sqlstm.sqhstv[97] = (unsigned char  *)&INVESTDEDRATE3;
     sqlstm.sqhstl[97] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[97] = (         int  )0;
     sqlstm.sqindv[97] = (         short *)0;
     sqlstm.sqinds[97] = (         int  )0;
     sqlstm.sqharm[97] = (unsigned long )0;
     sqlstm.sqadto[97] = (unsigned short )0;
     sqlstm.sqtdso[97] = (unsigned short )0;
     sqlstm.sqhstv[98] = (unsigned char  *)&LONGFUNDLIMIT1;
     sqlstm.sqhstl[98] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[98] = (         int  )0;
     sqlstm.sqindv[98] = (         short *)0;
     sqlstm.sqinds[98] = (         int  )0;
     sqlstm.sqharm[98] = (unsigned long )0;
     sqlstm.sqadto[98] = (unsigned short )0;
     sqlstm.sqtdso[98] = (unsigned short )0;
     sqlstm.sqhstv[99] = (unsigned char  *)&LONGFUNDLIMIT2;
     sqlstm.sqhstl[99] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[99] = (         int  )0;
     sqlstm.sqindv[99] = (         short *)0;
     sqlstm.sqinds[99] = (         int  )0;
     sqlstm.sqharm[99] = (unsigned long )0;
     sqlstm.sqadto[99] = (unsigned short )0;
     sqlstm.sqtdso[99] = (unsigned short )0;
     sqlstm.sqhstv[100] = (unsigned char  *)&LONGFUNDRATE;
     sqlstm.sqhstl[100] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[100] = (         int  )0;
     sqlstm.sqindv[100] = (         short *)0;
     sqlstm.sqinds[100] = (         int  )0;
     sqlstm.sqharm[100] = (unsigned long )0;
     sqlstm.sqadto[100] = (unsigned short )0;
     sqlstm.sqtdso[100] = (unsigned short )0;
     sqlstm.sqhstv[101] = (unsigned char  *)&CARDUPRATE1;
     sqlstm.sqhstl[101] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[101] = (         int  )0;
     sqlstm.sqindv[101] = (         short *)0;
     sqlstm.sqinds[101] = (         int  )0;
     sqlstm.sqharm[101] = (unsigned long )0;
     sqlstm.sqadto[101] = (unsigned short )0;
     sqlstm.sqtdso[101] = (unsigned short )0;
     sqlstm.sqhstv[102] = (unsigned char  *)&CARDUPRATE2;
     sqlstm.sqhstl[102] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[102] = (         int  )0;
     sqlstm.sqindv[102] = (         short *)0;
     sqlstm.sqinds[102] = (         int  )0;
     sqlstm.sqharm[102] = (unsigned long )0;
     sqlstm.sqadto[102] = (unsigned short )0;
     sqlstm.sqtdso[102] = (unsigned short )0;
     sqlstm.sqhstv[103] = (unsigned char  *)&YLOANBASLIMIT;
     sqlstm.sqhstl[103] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[103] = (         int  )0;
     sqlstm.sqindv[103] = (         short *)0;
     sqlstm.sqinds[103] = (         int  )0;
     sqlstm.sqharm[103] = (unsigned long )0;
     sqlstm.sqadto[103] = (unsigned short )0;
     sqlstm.sqtdso[103] = (unsigned short )0;
     sqlstm.sqhstv[104] = (unsigned char  *)&TAXDEDSECT3;
     sqlstm.sqhstl[104] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[104] = (         int  )0;
     sqlstm.sqindv[104] = (         short *)0;
     sqlstm.sqinds[104] = (         int  )0;
     sqlstm.sqharm[104] = (unsigned long )0;
     sqlstm.sqadto[104] = (unsigned short )0;
     sqlstm.sqtdso[104] = (unsigned short )0;
     sqlstm.sqhstv[105] = (unsigned char  *)&TAXDEDSLIMIT3;
     sqlstm.sqhstl[105] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[105] = (         int  )0;
     sqlstm.sqindv[105] = (         short *)0;
     sqlstm.sqinds[105] = (         int  )0;
     sqlstm.sqharm[105] = (unsigned long )0;
     sqlstm.sqadto[105] = (unsigned short )0;
     sqlstm.sqtdso[105] = (unsigned short )0;
     sqlstm.sqhstv[106] = (unsigned char  *)&INFANTDED;
     sqlstm.sqhstl[106] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[106] = (         int  )0;
     sqlstm.sqindv[106] = (         short *)0;
     sqlstm.sqinds[106] = (         int  )0;
     sqlstm.sqharm[106] = (unsigned long )0;
     sqlstm.sqadto[106] = (unsigned short )0;
     sqlstm.sqtdso[106] = (unsigned short )0;
     sqlstm.sqhstv[107] = (unsigned char  *)&ADDBABYDED;
     sqlstm.sqhstl[107] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[107] = (         int  )0;
     sqlstm.sqindv[107] = (         short *)0;
     sqlstm.sqinds[107] = (         int  )0;
     sqlstm.sqharm[107] = (unsigned long )0;
     sqlstm.sqadto[107] = (unsigned short )0;
     sqlstm.sqtdso[107] = (unsigned short )0;
     sqlstm.sqhstv[108] = (unsigned char  *)&NPENRATE2;
     sqlstm.sqhstl[108] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[108] = (         int  )0;
     sqlstm.sqindv[108] = (         short *)0;
     sqlstm.sqinds[108] = (         int  )0;
     sqlstm.sqharm[108] = (unsigned long )0;
     sqlstm.sqadto[108] = (unsigned short )0;
     sqlstm.sqtdso[108] = (unsigned short )0;
     sqlstm.sqhstv[109] = (unsigned char  *)&NPENLIMIT;
     sqlstm.sqhstl[109] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[109] = (         int  )0;
     sqlstm.sqindv[109] = (         short *)0;
     sqlstm.sqinds[109] = (         int  )0;
     sqlstm.sqharm[109] = (unsigned long )0;
     sqlstm.sqadto[109] = (unsigned short )0;
     sqlstm.sqtdso[109] = (unsigned short )0;
     sqlstm.sqhstv[110] = (unsigned char  *)workyy;
     sqlstm.sqhstl[110] = (unsigned long )5;
     sqlstm.sqhsts[110] = (         int  )0;
     sqlstm.sqindv[110] = (         short *)0;
     sqlstm.sqinds[110] = (         int  )0;
     sqlstm.sqharm[110] = (unsigned long )0;
     sqlstm.sqadto[110] = (unsigned short )0;
     sqlstm.sqtdso[110] = (unsigned short )0;
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
           Write_batlog(seqno++, "연말정산기준 read ERROR");  /*dsa2000 Rexec 대체*/
           err_print(sqlca.sqlcode,"연말정산기준 read ERROR");
           exit(1);
      }
}


Calc_Yearend()
{
     double  TmpValue;
     double  giveapp;
     double  creditded1;     /* 2012.12. hjku.신용카드등 사용분 공제액  */
     double  creditded2;     /* 2012.12. hjku.직불카드 사용분 공제액    */
     double  creditded3;     /* 2012.12. hjku.전통시장 사용분 공제액    */
     double  creditded4;     /* 2013.11. hjku.대중교통 사용분 공제액    */
     double  crededlimit1;   /* 2012.12. hjku.총급여 중 기준금액 초과분 */     
     double  crededlimit2;   /* 2012.12. hjku.공제가능금액              */     
     double  creditdedmax;   /* 2013.12. hjku.신용카드 최대 공제가능금액*/          
     double  pgivededlimit1; /* 2012.12. hjku. 지정기부 전체공제 한도   */     
     double  pgivededlimit2; /* 2012.12. hjku. 종교단체기부 한도        */     
     double  givededlimit1;  /* 2012.12. hjku. 기부금 전체공제 한도     */     
     double  pgivededamt;    /* 2012.12. hjku. 소득금액_지정기부금용    */     
     double  housededsum;    /* 주택자금공제합계       2012.12 hjku     */     
     double  houseintmaxded; /* 장기주택저당차입금이자상환공제한도  15년미만       2012.12 hjku */      
     double  houseintmaxded2;/* 장기주택저당차입금이자상환공제한도  30년미만       2012.12 hjku */      
     double  houseintmaxded3;/* 장기주택저당차입금이자상환공제한도  30년이상       2012.12 hjku */      
     double  houseintmaxded4;/* 장기주택저당차입금이자상환공제한도  고정금리.비거치식       2012.12 hjku */      
     double  houseintmaxded5;/* 장기주택저당차입금이자상환공제한도  기타대출       2012.12 hjku */      
     double  creamt1;
     double  medappded_A;  
     double  medappded_B;        
     double  med_dedamt;
     double  addpgiveded;             /* 지정기부금 추가공제액 2008 */
     double  t_houseamt;              /*  주택자금(장기주택저당 차입 이자상환) 계산  변수 */
     double  t_houseamt2;             /*  주택자금(장기주택저당 차입 이자상환) 계산  변수 */    
/*     double  npgiveded          = 0;   kth 2012.02.13 이월지정기부금 종교단체 공제금 임시 */                                 
/*     double  npgiveded2         = 0;   kth 2012.02.13 이월지정기부금 종교단체 공제금이외 임시 */ 
     double  giveded_2013       = 0;  /* 2013.12.8 해당년도 지정기부금 종교단체 공제금 임시 */                                 
     double  giveded2_2013      = 0;  /* 2013.12.8 해당년도 지정기부금 종교단체외 공제금 임시 */      
     double  maxpgiveamt        = 0;  /* kth 2012.02.13 이월지정기부금 종교단체 공제금 한도 */ 
     double  maxpgiveamt2       = 0;  /* kth 2012.02.13 이월지정기부금 종교단체 공제금이외 한도 */ 
     double  maxpgiveded        = 0;  /* kth 2012.02.13 이월지정기부금 종교단체 공제금 */ 
     double  totlimitded        = 0;  /* 소득공제 종합한도 적용대상 항목 계 2013.12.hjku */     
     
                                    
     ReadPkcysbas();
     ReadTax();

  /*dsa2000  2007.01. 우리사주 인출시 과세액 반영 추가...*/
  /*우리사주인출이력(PSDOHIS)의 WDSTAMT1 칼럼에 우리사주 시스템에서 과세금액 계산되어짐 (계산 시점 체크해야함)*/
  /*2007년 연말정산 우리사주 인출과세액은 엑셀자료 받아서 UPDATE D022*/
  /*
  EXEC SQL 
  update PKMRYMAS M  
     Set COSTOCKTAX = (Select sum(nvl(WDSTAMT1,0)) from PSDOHIS
                              Where Substr(reqdate,1,4) = :workyy 
                   And M.empno = empno             
                              Group by empno ) 
         Where Empno in (Select empno from PSDOHIS 
                          Where Substr(reqdate,1,4) = :workyy  
                            AND nvl(WDSTAMT1,0) <> 0   )
          and (empno >= :frempno and empno <= :toempno ) ;
                             
        
         
  if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
  {  
   Write_batlog(seqno++, " 우리사주 인출시 과세액 setting Error");  
   err_print(sqlca.sqlcode," 우리사주 인출시 과세액 setting Error");
   exit(1);
  }                             
  */
        /*******************************************************/
        /*우리사주인출 과세액 합산 추가 COSTOCKTAX, 2007.01.*/
     /* EXEC SQL
     UPDATE  PKMYSMAS
        SET  TAXGROSS = NVL(MPAYSUM,0)    + NVL(MBONSUM,0)     +
                        NVL(BPAYSUM,0)    + NVL(BBONSUM,0)     +
                        NVL(BPAYSUM1,0)   + NVL(BBONSUM1,0)    +
                        NVL(MGITASODK,0)  + NVL(FORITAXGROSS,0)+
                        NVL(MCOGBONSUM,0) + NVL(BCOGBONSUM,0)  +
                        nvl(COSTOCKTAX,0) + nvl(BCOSTOCKTAX,0) +
                        nvl(BCOSTOCKTAX1,0)+ nvl(BMSTOCKTAX,0) +
                        /o 2014.06.18 하은영 (주)주식매수, (주)퇴직소득금액, (종)퇴직소득금액, (종1)퇴직소득금액 추가  o/
                        nvl(MSTOCKSUM,0)+ nvl(MLIMITOVERSUM,0) + nvl(BLIMITOVERSUM,0) + nvl(BLIMITOVERSUM1,0) + 
                        nvl(BMSTOCKTAX1,0),
             NOTAX    = NVL(MNOTAX,0)          + NVL(BNOTAX,0)    +
                        NVL(INDEPENDNOTAX,0)   + BINDEPENDNOTAX   + 
                        NVL(BINDEPENDNOTAX1,0) + OVTMNOTAX        +
                        NVL(BOVTMNOTAX,0)      + BOVTMNOTAX1      +
                        NVL(KEDUNOTAX,0)       + BKEDUNOTAX       +
                        NVL(BKEDUNOTAX1,0)     + FOREIGNNOTAX     +
                        NVL(BFOREIGNNOTAX,0)   + BFOREIGNNOTAX1   +
                        NVL(COSTOCKNOTAX,0)    + BCOSTOCKNOTAX    +
                        NVL(BCOSTOCKNOTAX1,0)  + COSTOCK75NOTAX   +
                        NVL(BCOSTOCK75NOTAX,0) + BCOSTOCK75NOTAX1 + 
                        NVL(COSTOCK50NOTAX,0)  + BCOSTOCK50NOTAX  + 
                        NVL(BCOSTOCK50NOTAX1,0)+ MSTOCKTNOTAX     +
                        NVL(BMSTOCKNOTAX,0)    + BMSTOCKNOTAX1                 
     where (empno >= :frempno and empno <= :toempno ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 111;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMYSMAS  set TAXGROSS=((((((((((((((((((NVL(MPA\
YSUM,0)+NVL(MBONSUM,0))+NVL(BPAYSUM,0))+NVL(BBONSUM,0))+NVL(BPAYSUM1,0))+NVL(\
BBONSUM1,0))+NVL(MGITASODK,0))+NVL(FORITAXGROSS,0))+NVL(MCOGBONSUM,0))+NVL(BC\
OGBONSUM,0))+nvl(COSTOCKTAX,0))+nvl(BCOSTOCKTAX,0))+nvl(BCOSTOCKTAX1,0))+nvl(\
BMSTOCKTAX,0))+nvl(MSTOCKSUM,0))+nvl(MLIMITOVERSUM,0))+nvl(BLIMITOVERSUM,0))+\
nvl(BLIMITOVERSUM1,0))+nvl(BMSTOCKTAX1,0)),NOTAX=(((((((((((((((((((((((((NVL\
(MNOTAX,0)+NVL(BNOTAX,0))+NVL(INDEPENDNOTAX,0))+BINDEPENDNOTAX)+NVL(BINDEPEND\
NOTAX1,0))+OVTMNOTAX)+NVL(BOVTMNOTAX,0))+BOVTMNOTAX1)+NVL(KEDUNOTAX,0))+BKEDU\
NOTAX)+NVL(BKEDUNOTAX1,0))+FOREIGNNOTAX)+NVL(BFOREIGNNOTAX,0))+BFOREIGNNOTAX1\
)+NVL(COSTOCKNOTAX,0))+BCOSTOCKNOTAX)+NVL(BCOSTOCKNOTAX1,0))+COSTOCK75NOTAX)+\
NVL(BCOSTOCK75NOTAX,0))+BCOSTOCK75NOTAX1)+NVL(COSTOCK50NOTAX,0))+BCOSTOCK50NO\
TAX)+NVL(BCOSTOCK50NOTAX1,0))+MSTOCKTNOTAX)+NVL(BMSTOCKNOTAX,0))+BMSTOCKNOTAX\
1) where (empno>=:b0 and empno<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )548;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
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


             
     if ( sqlca.sqlcode != 0)
     {       
          Write_batlog(seqno++, "4. 급여총액 setting Error");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"4. 급여총액 setting Error");
          exit(1);
     }
        
        /*삭제
         dsa2000   2004.12  외국인 과세특례 신설에 따른 사항            
                    총근로소득의 30%를 추가로 비과세 처리한다. 
                    (2004년 외국인의 전근무지 내역이 없어서 계산에서 제외시킴.)                 
     EXEC SQL
     UPDATE PKMYSMAS
        SET MPAYSUM    = (MPAYSUM+NOTAX) - floor((MPAYSUM+NOTAX) * 30 / 100),
            MBONSUM    = MBONSUM    - floor(MBONSUM    * 30 / 100),
            MCOGBONSUM = MCOGBONSUM - floor(MCOGBONSUM * 30 / 100),
            MGITASODK  = MGITASODK  - floor(MGITASODK  * 30 / 100),         
            BPAYSUM    = (BPAYSUM+BNOTAX)    - floor((BPAYSUM+BNOTAX)    * 30 / 100),
            BBONSUM    = BBONSUM    - floor(BBONSUM    * 30 / 100),
            BCOGBONSUM = BCOGBONSUM - floor(BCOGBONSUM * 30 / 100),
            TAXGROSS   = (MPAYSUM+NOTAX)    - floor((MPAYSUM+NOTAX) * 30 / 100) +
                         MBONSUM    - floor(MBONSUM    * 30 / 100) +
                         MCOGBONSUM - floor(MCOGBONSUM * 30 / 100) +
                         MGITASODK  - floor(MGITASODK  * 30 / 100) +
                         (BPAYSUM+BNOTAX)    - floor((BPAYSUM+BNOTAX)    * 30 / 100) +
                         BBONSUM    - floor(BBONSUM    * 30 / 100) +
                         BCOGBONSUM - floor(BCOGBONSUM * 30 / 100) ,
            MNOTAX     = floor((MPAYSUM+NOTAX)    * 30 / 100) +
                         floor(MBONSUM    * 30 / 100) +
                         floor(MCOGBONSUM * 30 / 100) +
                         floor(MGITASODK  * 30 / 100) +
                         NVL(MNOTAX,0)                ,
            BNOTAX     = floor((BPAYSUM+BNOTAX)    * 30 / 100) +
                         floor(BBONSUM    * 30 / 100) +
                         floor(BCOGBONSUM * 30 / 100) ,
            NOTAX      = floor((MPAYSUM+NOTAX)    * 30 / 100) +
                         floor(MBONSUM    * 30 / 100) +
                         floor(MCOGBONSUM * 30 / 100) +
                         floor(MGITASODK  * 30 / 100) +  
                         NVL(MNOTAX,0)                +                      
                         floor((BPAYSUM+BNOTAX)    * 30 / 100) +
                         floor(BBONSUM    * 30 / 100) +
                         floor(BCOGBONSUM * 30 / 100) 
     WHERE  SUBSTR(JUMINID,8,1) in ('5','6')
       and (empno >= :frempno and empno <= :toempno ) ;
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {  
          Write_batlog(seqno++, " 외국인 과세금액 setting Error"); 
          err_print(sqlca.sqlcode," 외국인 과세금액 Setting Error");
          exit(1);
     }  
     */
     
     /**** 임시 :  20071231 퇴직자 삭제... 2008년 삭제
     EXEC SQL  
     delete from pkmysmas
       where empno in ('1346','1831','J041','J049','P407','P433','P463');****/
       
      /****if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {  
      Write_batlog(seqno++, " Delete Error");  dsa2000 Rexec 대체
      err_print(sqlca.sqlcode," Delete Error");
      exit(1);
     }*/  
     
     /*-------------------------------------------------------------*/  
     /* EXEC SQL DECLARE c1 CURSOR FOR
     SELECT  EMPNO, NVL(TAXGROSS,0),
             NVL(FORITAXGROSS,0),  /o 국외근로소득 추가 ADD ITEM 1998.12.15o/
             NVL(MCOGBONSUM,0), NVL(BCOGBONSUM,0),   NVL(MATE,0),         NVL(FAMILYNO,0),
             NVL(FAMI65NO,0),   NVL(OBSTACLENO,0),   NVL(CHILDNO,0),      NVL(WOMAN,0),
             NVL(MEDAMT,0),     NVL(BMEDAMT,0),      NVL(BMEDAMT1,0),     
             NVL(HIREAMT,0),    NVL(BHIREAMT,0),     NVL(BHIREAMT1,0),    
             NVL(GUARAMT,0),    NVL(GHOSAMT,0),      NVL(OHOSAMT,0),      NVL(NHOSAMT,0),
             NVL(KEDUNO,0),     NVL(UEDUNO,0),                            
             NVL(SEDUAMT,0),    NVL(KEDUAMT,0),      NVL(CEDUNO,0),       NVL(CEDUAMT,0), NVL(UEDUAMT,0),
             NVL(HOUSEAMT,0),   NVL(AGIVEAMT,0),     NVL(PGIVEAMT,0),     NVL(SGIVEAMT,0),
             NVL(PENAMT1,0),    NVL(PENAMT2,0),      NVL(BPENAMT,0),      
             NVL(PROPAMT1,0),   NVL(PROPAMT2,0),     NVL(BPROPAMT,0),     NVL(HLOANAMT,0),
             NVL(FORIAMT,0),    NVL(ETCTAMT,0),                           
             NVL(MINTAX,0),     NVL(MJUTAX,0),       NVL(BINTAX,0),       NVL(BJUTAX,0),
             NVL(MNONGTAX,0),   NVL(BNONGTAX,0),     NVL(KEDUNO1,0),      NVL(KEDUAMT1,0),
             NVL(INVESTAMT,0),
             NVL(CREDITAMT,0),  NVL(CREDITDEDAMT,0), NVL(CREDITTOTAMT,0), NVL(MCRESUM,0), NVL(BCRESUM,0),
             NVL(BINTAX1,0),    NVL(BJUTAX1,0) ,     NVL(BNONGTAX1,0),    NVL(HOUSEINTAMT,0), /o2001.1.4. 장기주택저당 차입 이자상환 추가o/
             NVL(OBSGUARAMT,0), NVL(ANUAMT,0),       NVL(BANUAMT,0),      NVL(BANUAMT1,0),    /o2001.12.17   유효성 추가(장애자보험료, 연금보험료, 연금저축, 장기주식저축)o/
             NVL(NPENAMT,0),    NVL(NPENAMT2,0),   /oNVL(LSTKAMT,0),      NVL(OLSTKAMT, 0),      Dsa200  2004.12 삭제o/ 
             NVL(OBSEDUAMT, 0), NVL(OINVESTAMT, 0),  NVL(SPGIVAMT, 0),    NVL(OBSEDUNO, 0),   /o2002.12 박수향 추가(전년도장기증권저축, 장애인특수교육비, 2000~2001투자조합출자소득,특레지정기부금)o/
             DEBITAMT,          GIROAMT,             FOREIGNAMT,          FOREIGNDED,     JUMINID,  /o Dsa2000 추가  2003.12.o/
             POLIAMT,           FAMI70NO,            SPECADDNO,           SPECADDDED,               /o Dsa2000 추가  2004.12.o/
             SHOSAMT,           NVL(HOUSEINTAMT2,0),                                                /o Dsa2000 추가  2004.12.o/
             CASHAMT,           COSTOCKAMT,                                                         /o Dsa2000 추가  2005.11. 2006.12.o/ 
             NVL(MANYCHILDNO,0),NVL(BABYNO,0),       NVL(FUNDAMT1,0),     NVL(FUNDAMT2,0),            /o  NVL(CREDITAMT_MED,0) //다자녀추가공제수, 신용카드 의료기관 사용액 추가 2007.12  KTH 2008.12 의료기관사용액 주석o/
             NVL(FUNDAMT3,0),   NVL(PGIVEAMT2,0),    NVL(HOUSEAMT2,0),    NVL(HOUSEINTAMT3,0),      /oHOUSEINTAMT3  주택자금(장기주택저당 차입 이자상환)   30년 이상 2010.01 KTHo/
             NVL(HOUSERENTAMT,0),NVL(HOUSERENTDED,0),NVL(HOUSVSUBAMT,0),  NVL(HOUSVEMPAMT,0), 
             NVL(HOUSVCOMAMT,0),NVL(HOUSEAMT3,0),
             NVL(TMARKETAMT ,0),NVL(HOUSEINTAMT4,0), NVL(HOUSEINTAMT5,0), NVL(INVESTAMT2  ,0),       /oHJKU 2012.12 추가o/             
             NVL(SPARENT ,0),     NVL(TRAFFICAMT,0),   NVL(INVESTAMT3,0),   NVL(INVESTAMT4,0),  NVL(HSRENTINAMT  ,0),      /o 2013.11 HJKU 추가o/
             NVL(INVESTAMT5,0), NVL(INVESTAMT6,0), NVL(INVESTAMT7,0), NVL(LONGFUNDAMT,0),                                  /o2014.12.22 하은여 추가 o/
             NVL(CREDITADDAMT1,0), NVL(CREDITADDAMT2,0), NVL(CREDITADDAMT3,0), NVL(CREDITADDAMT4,0),                       /o2014.12.22 하은여 추가 o/
             NVL(NAGIVEAMT,0), NVL(NPGIVEAMT2,0), NVL(NPGIVEAMT,0), NVL(NPGIVEAMT2_2010,0), NVL(NPGIVEAMT2_ELSE,0)         /o2014.12.22 하은여 추가 o/     
       FROM  PKMYSMAS
       where (empno >= :frempno and empno <= :toempno ) ; */ 

   
     /* EXEC    SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 111;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlbuft((void **)0,
       "select EMPNO ,NVL(TAXGROSS,0) ,NVL(FORITAXGROSS,0) ,NVL(MCOGBONSUM,0\
) ,NVL(BCOGBONSUM,0) ,NVL(MATE,0) ,NVL(FAMILYNO,0) ,NVL(FAMI65NO,0) ,NVL(OBS\
TACLENO,0) ,NVL(CHILDNO,0) ,NVL(WOMAN,0) ,NVL(MEDAMT,0) ,NVL(BMEDAMT,0) ,NVL\
(BMEDAMT1,0) ,NVL(HIREAMT,0) ,NVL(BHIREAMT,0) ,NVL(BHIREAMT1,0) ,NVL(GUARAMT\
,0) ,NVL(GHOSAMT,0) ,NVL(OHOSAMT,0) ,NVL(NHOSAMT,0) ,NVL(KEDUNO,0) ,NVL(UEDU\
NO,0) ,NVL(SEDUAMT,0) ,NVL(KEDUAMT,0) ,NVL(CEDUNO,0) ,NVL(CEDUAMT,0) ,NVL(UE\
DUAMT,0) ,NVL(HOUSEAMT,0) ,NVL(AGIVEAMT,0) ,NVL(PGIVEAMT,0) ,NVL(SGIVEAMT,0)\
 ,NVL(PENAMT1,0) ,NVL(PENAMT2,0) ,NVL(BPENAMT,0) ,NVL(PROPAMT1,0) ,NVL(PROPA\
MT2,0) ,NVL(BPROPAMT,0) ,NVL(HLOANAMT,0) ,NVL(FORIAMT,0) ,NVL(ETCTAMT,0) ,NV\
L(MINTAX,0) ,NVL(MJUTAX,0) ,NVL(BINTAX,0) ,NVL(BJUTAX,0) ,NVL(MNONGTAX,0) ,N\
VL(BNONGTAX,0) ,NVL(KEDUNO1,0) ,NVL(KEDUAMT1,0) ,NVL(INVESTAMT,0) ,NVL(CREDI\
TAMT,0) ,NVL(CREDITDEDAMT,0) ,NVL(CREDITTOTAMT,0) ,NVL(MCRESUM,0) ,NVL(BCRES\
UM,0) ,NVL(BINTAX1,0) ,NVL(BJUTAX1,0) ,NVL(BNONGTAX1,0) ,NVL(HOUSEINTAMT,0) \
,NVL(OBSGUARAMT,0) ,NVL(ANUAMT,0) ,NVL(BANUA");
     sqlbuft((void **)0,
       "MT,0) ,NVL(BANUAMT1,0) ,NVL(NPENAMT,0) ,NVL(NPENAMT2,0) ,NVL(OBSEDUA\
MT,0) ,NVL(OINVESTAMT,0) ,NVL(SPGIVAMT,0) ,NVL(OBSEDUNO,0) ,DEBITAMT ,GIROAM\
T ,FOREIGNAMT ,FOREIGNDED ,JUMINID ,POLIAMT ,FAMI70NO ,SPECADDNO ,SPECADDDED\
 ,SHOSAMT ,NVL(HOUSEINTAMT2,0) ,CASHAMT ,COSTOCKAMT ,NVL(MANYCHILDNO,0) ,NVL\
(BABYNO,0) ,NVL(FUNDAMT1,0) ,NVL(FUNDAMT2,0) ,NVL(FUNDAMT3,0) ,NVL(PGIVEAMT2\
,0) ,NVL(HOUSEAMT2,0) ,NVL(HOUSEINTAMT3,0) ,NVL(HOUSERENTAMT,0) ,NVL(HOUSERE\
NTDED,0) ,NVL(HOUSVSUBAMT,0) ,NVL(HOUSVEMPAMT,0) ,NVL(HOUSVCOMAMT,0) ,NVL(HO\
USEAMT3,0) ,NVL(TMARKETAMT,0) ,NVL(HOUSEINTAMT4,0) ,NVL(HOUSEINTAMT5,0) ,NVL\
(INVESTAMT2,0) ,NVL(SPARENT,0) ,NVL(TRAFFICAMT,0) ,NVL(INVESTAMT3,0) ,NVL(IN\
VESTAMT4,0) ,NVL(HSRENTINAMT,0) ,NVL(INVESTAMT5,0) ,NVL(INVESTAMT6,0) ,NVL(I\
NVESTAMT7,0) ,NVL(LONGFUNDAMT,0) ,NVL(CREDITADDAMT1,0) ,NVL(CREDITADDAMT2,0)\
 ,NVL(CREDITADDAMT3,0) ,NVL(CREDITADDAMT4,0) ,NVL(NAGIVEAMT,0) ,NVL(NPGIVEAM\
T2,0) ,NVL(NPGIVEAMT,0) ,NVL(NPGIVEAMT2_2010,0) ,NVL(NPGIVEAMT2_ELSE,0)  fro\
m PKMYSMAS where (empno>=:b0 and");
     sqlstm.stmt = sq0005;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )571;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)toempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
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


   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "연말정산 기초자료 fetch Error1");  /*dsa2000 Rexec 대체*/
          err_print(sqlca.sqlcode,"연말정산 기초자료 fetch Error1");
          exit(1);
     }
     
     while(1)
     {
          ClearVar();
   
          /* EXEC SQL FETCH c1 INTO
          :empno,     :taxgross,
          :foritaxgross,  /o 국외근로소득 추가 add item 1998.12.15o/
          :mcogbonsum,   :bcogbonsum,   :mate,         :familyno,    :fami65no,
          :obstacleno,   :childno,      :woman,        :medamt,      :bmedamt,  :bmedamt1,
          :hireamt,      :bhireamt,     :bhireamt1,    :guaramt,     
          :ghosamt,      :ohosamt,      :nhosamt,      :keduno,      :ueduno,
          :seduamt,      :keduamt,      :ceduno,       :ceduamt,     :ueduamt,
          :houseamt,     :agiveamt,     :pgiveamt,     :sgiveamt,    
          :penamt1,      :penamt2,      :bpenamt,                    
          :propamt1,     :propamt2,     :bpropamt,     :hloanamt,    :foriamt,  :etctamt,
          :mintax,       :mjutax,       :bintax,       :bjutax,      :mnongtax, :bnongtax,
          :keduno1,      :keduamt1,     :investamt,                  
          :creditamt,    :creditdedamt, :credittotamt, :mcresum,     :bcresum,
          :bintax1,      :bjutax1 ,     :bnongtax1 ,   :houseintamt,                      /o 전전근무지 추가 add item 1999.12.16o/               
          :obsguaramt,   :anuamt,       :banuamt,      :banuamt1,
          :npenamt,      :npenamt2,     /o:lstkamt, :olstkamt, o/ 
          :obseduamt,    :oinvestamt,   :spgivamt,     :obseduno,                           /o parksh 20021213 추가  o/
          :debitamt,     :giroamt,      :foreignamt,   :foreignded,  :juminid,               /o Dsa2000 추가  2003.12.o/
          :poliamt,      :fami70no,     :specaddno,    :specaddded,  
          :shosamt,      :houseintamt2, /o Dsa2000 추가  2004.12.o/
          :cashamt,      :costockamt,                              /o Dsa2000 추가  2005.11.  2006.12.o/ 
          :manychildno , :babyno,       :fundamt1,     :fundamt2,     /o KTH 추가  2008.12.  2008.12.o/ /o :creditamt_med;다자녀추가공제, 신용카드 의료기관 사용액 추가 2007.12KTH 2008.12 의료기관사용액 주석 o/ 
          :fundamt3,     :pgiveamt2,    :houseamt2,    :houseintamt3,:houserentamt,:houserentded,      /o KTH 추가  2008.12.  2008.12.houserentamt KTH 20110125 추가o/                                                                    
          :housvsubamt,  :housvempamt,  :housvcomamt,  :houseamt3,
          :tmarketamt,   :houseintamt4, :houseintamt5, :investamt2,
          :sparent,      :trafficamt,   :investamt3,   :investamt4,  :hsrentinamt,      /o 2013.11 HJKU 추가o/
          :investamt5,   :investamt6,   :investamt7,   :longfundamt,                    /o2014.12.22 하은영 추가 o/
          :creditaddamt1,:creditaddamt2,:creditaddamt3, :creditaddamt4,                 /o2014.12.22 하은영 추가 o/
          :nagiveamt,    :npgiveamt2,   :npgiveamt, :npgiveamt2_2010, :npgiveamt2_else; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 118;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )594;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)empno;
          sqlstm.sqhstl[0] = (unsigned long )5;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&taxgross;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&foritaxgross;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&mcogbonsum;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&bcogbonsum;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&mate;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&familyno;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&fami65no;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&obstacleno;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&childno;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&woman;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&medamt;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&bmedamt;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&bmedamt1;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&hireamt;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&bhireamt;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&bhireamt1;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&guaramt;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&ghosamt;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&ohosamt;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&nhosamt;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&keduno;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&ueduno;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&seduamt;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&keduamt;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&ceduno;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&ceduamt;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&ueduamt;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&houseamt;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)&agiveamt;
          sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&pgiveamt;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&sgiveamt;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&penamt1;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&penamt2;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&bpenamt;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&propamt1;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&propamt2;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&bpropamt;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&hloanamt;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&foriamt;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&etctamt;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&mintax;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&mjutax;
          sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[42] = (         int  )0;
          sqlstm.sqindv[42] = (         short *)0;
          sqlstm.sqinds[42] = (         int  )0;
          sqlstm.sqharm[42] = (unsigned long )0;
          sqlstm.sqadto[42] = (unsigned short )0;
          sqlstm.sqtdso[42] = (unsigned short )0;
          sqlstm.sqhstv[43] = (unsigned char  *)&bintax;
          sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[43] = (         int  )0;
          sqlstm.sqindv[43] = (         short *)0;
          sqlstm.sqinds[43] = (         int  )0;
          sqlstm.sqharm[43] = (unsigned long )0;
          sqlstm.sqadto[43] = (unsigned short )0;
          sqlstm.sqtdso[43] = (unsigned short )0;
          sqlstm.sqhstv[44] = (unsigned char  *)&bjutax;
          sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)&mnongtax;
          sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)&bnongtax;
          sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
          sqlstm.sqhstv[47] = (unsigned char  *)&keduno1;
          sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[47] = (         int  )0;
          sqlstm.sqindv[47] = (         short *)0;
          sqlstm.sqinds[47] = (         int  )0;
          sqlstm.sqharm[47] = (unsigned long )0;
          sqlstm.sqadto[47] = (unsigned short )0;
          sqlstm.sqtdso[47] = (unsigned short )0;
          sqlstm.sqhstv[48] = (unsigned char  *)&keduamt1;
          sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[48] = (         int  )0;
          sqlstm.sqindv[48] = (         short *)0;
          sqlstm.sqinds[48] = (         int  )0;
          sqlstm.sqharm[48] = (unsigned long )0;
          sqlstm.sqadto[48] = (unsigned short )0;
          sqlstm.sqtdso[48] = (unsigned short )0;
          sqlstm.sqhstv[49] = (unsigned char  *)&investamt;
          sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[49] = (         int  )0;
          sqlstm.sqindv[49] = (         short *)0;
          sqlstm.sqinds[49] = (         int  )0;
          sqlstm.sqharm[49] = (unsigned long )0;
          sqlstm.sqadto[49] = (unsigned short )0;
          sqlstm.sqtdso[49] = (unsigned short )0;
          sqlstm.sqhstv[50] = (unsigned char  *)&creditamt;
          sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[50] = (         int  )0;
          sqlstm.sqindv[50] = (         short *)0;
          sqlstm.sqinds[50] = (         int  )0;
          sqlstm.sqharm[50] = (unsigned long )0;
          sqlstm.sqadto[50] = (unsigned short )0;
          sqlstm.sqtdso[50] = (unsigned short )0;
          sqlstm.sqhstv[51] = (unsigned char  *)&creditdedamt;
          sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[51] = (         int  )0;
          sqlstm.sqindv[51] = (         short *)0;
          sqlstm.sqinds[51] = (         int  )0;
          sqlstm.sqharm[51] = (unsigned long )0;
          sqlstm.sqadto[51] = (unsigned short )0;
          sqlstm.sqtdso[51] = (unsigned short )0;
          sqlstm.sqhstv[52] = (unsigned char  *)&credittotamt;
          sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[52] = (         int  )0;
          sqlstm.sqindv[52] = (         short *)0;
          sqlstm.sqinds[52] = (         int  )0;
          sqlstm.sqharm[52] = (unsigned long )0;
          sqlstm.sqadto[52] = (unsigned short )0;
          sqlstm.sqtdso[52] = (unsigned short )0;
          sqlstm.sqhstv[53] = (unsigned char  *)&mcresum;
          sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[53] = (         int  )0;
          sqlstm.sqindv[53] = (         short *)0;
          sqlstm.sqinds[53] = (         int  )0;
          sqlstm.sqharm[53] = (unsigned long )0;
          sqlstm.sqadto[53] = (unsigned short )0;
          sqlstm.sqtdso[53] = (unsigned short )0;
          sqlstm.sqhstv[54] = (unsigned char  *)&bcresum;
          sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[54] = (         int  )0;
          sqlstm.sqindv[54] = (         short *)0;
          sqlstm.sqinds[54] = (         int  )0;
          sqlstm.sqharm[54] = (unsigned long )0;
          sqlstm.sqadto[54] = (unsigned short )0;
          sqlstm.sqtdso[54] = (unsigned short )0;
          sqlstm.sqhstv[55] = (unsigned char  *)&bintax1;
          sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[55] = (         int  )0;
          sqlstm.sqindv[55] = (         short *)0;
          sqlstm.sqinds[55] = (         int  )0;
          sqlstm.sqharm[55] = (unsigned long )0;
          sqlstm.sqadto[55] = (unsigned short )0;
          sqlstm.sqtdso[55] = (unsigned short )0;
          sqlstm.sqhstv[56] = (unsigned char  *)&bjutax1;
          sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[56] = (         int  )0;
          sqlstm.sqindv[56] = (         short *)0;
          sqlstm.sqinds[56] = (         int  )0;
          sqlstm.sqharm[56] = (unsigned long )0;
          sqlstm.sqadto[56] = (unsigned short )0;
          sqlstm.sqtdso[56] = (unsigned short )0;
          sqlstm.sqhstv[57] = (unsigned char  *)&bnongtax1;
          sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[57] = (         int  )0;
          sqlstm.sqindv[57] = (         short *)0;
          sqlstm.sqinds[57] = (         int  )0;
          sqlstm.sqharm[57] = (unsigned long )0;
          sqlstm.sqadto[57] = (unsigned short )0;
          sqlstm.sqtdso[57] = (unsigned short )0;
          sqlstm.sqhstv[58] = (unsigned char  *)&houseintamt;
          sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[58] = (         int  )0;
          sqlstm.sqindv[58] = (         short *)0;
          sqlstm.sqinds[58] = (         int  )0;
          sqlstm.sqharm[58] = (unsigned long )0;
          sqlstm.sqadto[58] = (unsigned short )0;
          sqlstm.sqtdso[58] = (unsigned short )0;
          sqlstm.sqhstv[59] = (unsigned char  *)&obsguaramt;
          sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[59] = (         int  )0;
          sqlstm.sqindv[59] = (         short *)0;
          sqlstm.sqinds[59] = (         int  )0;
          sqlstm.sqharm[59] = (unsigned long )0;
          sqlstm.sqadto[59] = (unsigned short )0;
          sqlstm.sqtdso[59] = (unsigned short )0;
          sqlstm.sqhstv[60] = (unsigned char  *)&anuamt;
          sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[60] = (         int  )0;
          sqlstm.sqindv[60] = (         short *)0;
          sqlstm.sqinds[60] = (         int  )0;
          sqlstm.sqharm[60] = (unsigned long )0;
          sqlstm.sqadto[60] = (unsigned short )0;
          sqlstm.sqtdso[60] = (unsigned short )0;
          sqlstm.sqhstv[61] = (unsigned char  *)&banuamt;
          sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[61] = (         int  )0;
          sqlstm.sqindv[61] = (         short *)0;
          sqlstm.sqinds[61] = (         int  )0;
          sqlstm.sqharm[61] = (unsigned long )0;
          sqlstm.sqadto[61] = (unsigned short )0;
          sqlstm.sqtdso[61] = (unsigned short )0;
          sqlstm.sqhstv[62] = (unsigned char  *)&banuamt1;
          sqlstm.sqhstl[62] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[62] = (         int  )0;
          sqlstm.sqindv[62] = (         short *)0;
          sqlstm.sqinds[62] = (         int  )0;
          sqlstm.sqharm[62] = (unsigned long )0;
          sqlstm.sqadto[62] = (unsigned short )0;
          sqlstm.sqtdso[62] = (unsigned short )0;
          sqlstm.sqhstv[63] = (unsigned char  *)&npenamt;
          sqlstm.sqhstl[63] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[63] = (         int  )0;
          sqlstm.sqindv[63] = (         short *)0;
          sqlstm.sqinds[63] = (         int  )0;
          sqlstm.sqharm[63] = (unsigned long )0;
          sqlstm.sqadto[63] = (unsigned short )0;
          sqlstm.sqtdso[63] = (unsigned short )0;
          sqlstm.sqhstv[64] = (unsigned char  *)&npenamt2;
          sqlstm.sqhstl[64] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[64] = (         int  )0;
          sqlstm.sqindv[64] = (         short *)0;
          sqlstm.sqinds[64] = (         int  )0;
          sqlstm.sqharm[64] = (unsigned long )0;
          sqlstm.sqadto[64] = (unsigned short )0;
          sqlstm.sqtdso[64] = (unsigned short )0;
          sqlstm.sqhstv[65] = (unsigned char  *)&obseduamt;
          sqlstm.sqhstl[65] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[65] = (         int  )0;
          sqlstm.sqindv[65] = (         short *)0;
          sqlstm.sqinds[65] = (         int  )0;
          sqlstm.sqharm[65] = (unsigned long )0;
          sqlstm.sqadto[65] = (unsigned short )0;
          sqlstm.sqtdso[65] = (unsigned short )0;
          sqlstm.sqhstv[66] = (unsigned char  *)&oinvestamt;
          sqlstm.sqhstl[66] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[66] = (         int  )0;
          sqlstm.sqindv[66] = (         short *)0;
          sqlstm.sqinds[66] = (         int  )0;
          sqlstm.sqharm[66] = (unsigned long )0;
          sqlstm.sqadto[66] = (unsigned short )0;
          sqlstm.sqtdso[66] = (unsigned short )0;
          sqlstm.sqhstv[67] = (unsigned char  *)&spgivamt;
          sqlstm.sqhstl[67] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[67] = (         int  )0;
          sqlstm.sqindv[67] = (         short *)0;
          sqlstm.sqinds[67] = (         int  )0;
          sqlstm.sqharm[67] = (unsigned long )0;
          sqlstm.sqadto[67] = (unsigned short )0;
          sqlstm.sqtdso[67] = (unsigned short )0;
          sqlstm.sqhstv[68] = (unsigned char  *)&obseduno;
          sqlstm.sqhstl[68] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[68] = (         int  )0;
          sqlstm.sqindv[68] = (         short *)0;
          sqlstm.sqinds[68] = (         int  )0;
          sqlstm.sqharm[68] = (unsigned long )0;
          sqlstm.sqadto[68] = (unsigned short )0;
          sqlstm.sqtdso[68] = (unsigned short )0;
          sqlstm.sqhstv[69] = (unsigned char  *)&debitamt;
          sqlstm.sqhstl[69] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[69] = (         int  )0;
          sqlstm.sqindv[69] = (         short *)0;
          sqlstm.sqinds[69] = (         int  )0;
          sqlstm.sqharm[69] = (unsigned long )0;
          sqlstm.sqadto[69] = (unsigned short )0;
          sqlstm.sqtdso[69] = (unsigned short )0;
          sqlstm.sqhstv[70] = (unsigned char  *)&giroamt;
          sqlstm.sqhstl[70] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[70] = (         int  )0;
          sqlstm.sqindv[70] = (         short *)0;
          sqlstm.sqinds[70] = (         int  )0;
          sqlstm.sqharm[70] = (unsigned long )0;
          sqlstm.sqadto[70] = (unsigned short )0;
          sqlstm.sqtdso[70] = (unsigned short )0;
          sqlstm.sqhstv[71] = (unsigned char  *)&foreignamt;
          sqlstm.sqhstl[71] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[71] = (         int  )0;
          sqlstm.sqindv[71] = (         short *)0;
          sqlstm.sqinds[71] = (         int  )0;
          sqlstm.sqharm[71] = (unsigned long )0;
          sqlstm.sqadto[71] = (unsigned short )0;
          sqlstm.sqtdso[71] = (unsigned short )0;
          sqlstm.sqhstv[72] = (unsigned char  *)&foreignded;
          sqlstm.sqhstl[72] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[72] = (         int  )0;
          sqlstm.sqindv[72] = (         short *)0;
          sqlstm.sqinds[72] = (         int  )0;
          sqlstm.sqharm[72] = (unsigned long )0;
          sqlstm.sqadto[72] = (unsigned short )0;
          sqlstm.sqtdso[72] = (unsigned short )0;
          sqlstm.sqhstv[73] = (unsigned char  *)juminid;
          sqlstm.sqhstl[73] = (unsigned long )15;
          sqlstm.sqhsts[73] = (         int  )0;
          sqlstm.sqindv[73] = (         short *)0;
          sqlstm.sqinds[73] = (         int  )0;
          sqlstm.sqharm[73] = (unsigned long )0;
          sqlstm.sqadto[73] = (unsigned short )0;
          sqlstm.sqtdso[73] = (unsigned short )0;
          sqlstm.sqhstv[74] = (unsigned char  *)&poliamt;
          sqlstm.sqhstl[74] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[74] = (         int  )0;
          sqlstm.sqindv[74] = (         short *)0;
          sqlstm.sqinds[74] = (         int  )0;
          sqlstm.sqharm[74] = (unsigned long )0;
          sqlstm.sqadto[74] = (unsigned short )0;
          sqlstm.sqtdso[74] = (unsigned short )0;
          sqlstm.sqhstv[75] = (unsigned char  *)&fami70no;
          sqlstm.sqhstl[75] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[75] = (         int  )0;
          sqlstm.sqindv[75] = (         short *)0;
          sqlstm.sqinds[75] = (         int  )0;
          sqlstm.sqharm[75] = (unsigned long )0;
          sqlstm.sqadto[75] = (unsigned short )0;
          sqlstm.sqtdso[75] = (unsigned short )0;
          sqlstm.sqhstv[76] = (unsigned char  *)&specaddno;
          sqlstm.sqhstl[76] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[76] = (         int  )0;
          sqlstm.sqindv[76] = (         short *)0;
          sqlstm.sqinds[76] = (         int  )0;
          sqlstm.sqharm[76] = (unsigned long )0;
          sqlstm.sqadto[76] = (unsigned short )0;
          sqlstm.sqtdso[76] = (unsigned short )0;
          sqlstm.sqhstv[77] = (unsigned char  *)&specaddded;
          sqlstm.sqhstl[77] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[77] = (         int  )0;
          sqlstm.sqindv[77] = (         short *)0;
          sqlstm.sqinds[77] = (         int  )0;
          sqlstm.sqharm[77] = (unsigned long )0;
          sqlstm.sqadto[77] = (unsigned short )0;
          sqlstm.sqtdso[77] = (unsigned short )0;
          sqlstm.sqhstv[78] = (unsigned char  *)&shosamt;
          sqlstm.sqhstl[78] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[78] = (         int  )0;
          sqlstm.sqindv[78] = (         short *)0;
          sqlstm.sqinds[78] = (         int  )0;
          sqlstm.sqharm[78] = (unsigned long )0;
          sqlstm.sqadto[78] = (unsigned short )0;
          sqlstm.sqtdso[78] = (unsigned short )0;
          sqlstm.sqhstv[79] = (unsigned char  *)&houseintamt2;
          sqlstm.sqhstl[79] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[79] = (         int  )0;
          sqlstm.sqindv[79] = (         short *)0;
          sqlstm.sqinds[79] = (         int  )0;
          sqlstm.sqharm[79] = (unsigned long )0;
          sqlstm.sqadto[79] = (unsigned short )0;
          sqlstm.sqtdso[79] = (unsigned short )0;
          sqlstm.sqhstv[80] = (unsigned char  *)&cashamt;
          sqlstm.sqhstl[80] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[80] = (         int  )0;
          sqlstm.sqindv[80] = (         short *)0;
          sqlstm.sqinds[80] = (         int  )0;
          sqlstm.sqharm[80] = (unsigned long )0;
          sqlstm.sqadto[80] = (unsigned short )0;
          sqlstm.sqtdso[80] = (unsigned short )0;
          sqlstm.sqhstv[81] = (unsigned char  *)&costockamt;
          sqlstm.sqhstl[81] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[81] = (         int  )0;
          sqlstm.sqindv[81] = (         short *)0;
          sqlstm.sqinds[81] = (         int  )0;
          sqlstm.sqharm[81] = (unsigned long )0;
          sqlstm.sqadto[81] = (unsigned short )0;
          sqlstm.sqtdso[81] = (unsigned short )0;
          sqlstm.sqhstv[82] = (unsigned char  *)&manychildno;
          sqlstm.sqhstl[82] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[82] = (         int  )0;
          sqlstm.sqindv[82] = (         short *)0;
          sqlstm.sqinds[82] = (         int  )0;
          sqlstm.sqharm[82] = (unsigned long )0;
          sqlstm.sqadto[82] = (unsigned short )0;
          sqlstm.sqtdso[82] = (unsigned short )0;
          sqlstm.sqhstv[83] = (unsigned char  *)&babyno;
          sqlstm.sqhstl[83] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[83] = (         int  )0;
          sqlstm.sqindv[83] = (         short *)0;
          sqlstm.sqinds[83] = (         int  )0;
          sqlstm.sqharm[83] = (unsigned long )0;
          sqlstm.sqadto[83] = (unsigned short )0;
          sqlstm.sqtdso[83] = (unsigned short )0;
          sqlstm.sqhstv[84] = (unsigned char  *)&fundamt1;
          sqlstm.sqhstl[84] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[84] = (         int  )0;
          sqlstm.sqindv[84] = (         short *)0;
          sqlstm.sqinds[84] = (         int  )0;
          sqlstm.sqharm[84] = (unsigned long )0;
          sqlstm.sqadto[84] = (unsigned short )0;
          sqlstm.sqtdso[84] = (unsigned short )0;
          sqlstm.sqhstv[85] = (unsigned char  *)&fundamt2;
          sqlstm.sqhstl[85] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[85] = (         int  )0;
          sqlstm.sqindv[85] = (         short *)0;
          sqlstm.sqinds[85] = (         int  )0;
          sqlstm.sqharm[85] = (unsigned long )0;
          sqlstm.sqadto[85] = (unsigned short )0;
          sqlstm.sqtdso[85] = (unsigned short )0;
          sqlstm.sqhstv[86] = (unsigned char  *)&fundamt3;
          sqlstm.sqhstl[86] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[86] = (         int  )0;
          sqlstm.sqindv[86] = (         short *)0;
          sqlstm.sqinds[86] = (         int  )0;
          sqlstm.sqharm[86] = (unsigned long )0;
          sqlstm.sqadto[86] = (unsigned short )0;
          sqlstm.sqtdso[86] = (unsigned short )0;
          sqlstm.sqhstv[87] = (unsigned char  *)&pgiveamt2;
          sqlstm.sqhstl[87] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[87] = (         int  )0;
          sqlstm.sqindv[87] = (         short *)0;
          sqlstm.sqinds[87] = (         int  )0;
          sqlstm.sqharm[87] = (unsigned long )0;
          sqlstm.sqadto[87] = (unsigned short )0;
          sqlstm.sqtdso[87] = (unsigned short )0;
          sqlstm.sqhstv[88] = (unsigned char  *)&houseamt2;
          sqlstm.sqhstl[88] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[88] = (         int  )0;
          sqlstm.sqindv[88] = (         short *)0;
          sqlstm.sqinds[88] = (         int  )0;
          sqlstm.sqharm[88] = (unsigned long )0;
          sqlstm.sqadto[88] = (unsigned short )0;
          sqlstm.sqtdso[88] = (unsigned short )0;
          sqlstm.sqhstv[89] = (unsigned char  *)&houseintamt3;
          sqlstm.sqhstl[89] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[89] = (         int  )0;
          sqlstm.sqindv[89] = (         short *)0;
          sqlstm.sqinds[89] = (         int  )0;
          sqlstm.sqharm[89] = (unsigned long )0;
          sqlstm.sqadto[89] = (unsigned short )0;
          sqlstm.sqtdso[89] = (unsigned short )0;
          sqlstm.sqhstv[90] = (unsigned char  *)&houserentamt;
          sqlstm.sqhstl[90] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[90] = (         int  )0;
          sqlstm.sqindv[90] = (         short *)0;
          sqlstm.sqinds[90] = (         int  )0;
          sqlstm.sqharm[90] = (unsigned long )0;
          sqlstm.sqadto[90] = (unsigned short )0;
          sqlstm.sqtdso[90] = (unsigned short )0;
          sqlstm.sqhstv[91] = (unsigned char  *)&houserentded;
          sqlstm.sqhstl[91] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[91] = (         int  )0;
          sqlstm.sqindv[91] = (         short *)0;
          sqlstm.sqinds[91] = (         int  )0;
          sqlstm.sqharm[91] = (unsigned long )0;
          sqlstm.sqadto[91] = (unsigned short )0;
          sqlstm.sqtdso[91] = (unsigned short )0;
          sqlstm.sqhstv[92] = (unsigned char  *)&housvsubamt;
          sqlstm.sqhstl[92] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[92] = (         int  )0;
          sqlstm.sqindv[92] = (         short *)0;
          sqlstm.sqinds[92] = (         int  )0;
          sqlstm.sqharm[92] = (unsigned long )0;
          sqlstm.sqadto[92] = (unsigned short )0;
          sqlstm.sqtdso[92] = (unsigned short )0;
          sqlstm.sqhstv[93] = (unsigned char  *)&housvempamt;
          sqlstm.sqhstl[93] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[93] = (         int  )0;
          sqlstm.sqindv[93] = (         short *)0;
          sqlstm.sqinds[93] = (         int  )0;
          sqlstm.sqharm[93] = (unsigned long )0;
          sqlstm.sqadto[93] = (unsigned short )0;
          sqlstm.sqtdso[93] = (unsigned short )0;
          sqlstm.sqhstv[94] = (unsigned char  *)&housvcomamt;
          sqlstm.sqhstl[94] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[94] = (         int  )0;
          sqlstm.sqindv[94] = (         short *)0;
          sqlstm.sqinds[94] = (         int  )0;
          sqlstm.sqharm[94] = (unsigned long )0;
          sqlstm.sqadto[94] = (unsigned short )0;
          sqlstm.sqtdso[94] = (unsigned short )0;
          sqlstm.sqhstv[95] = (unsigned char  *)&houseamt3;
          sqlstm.sqhstl[95] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[95] = (         int  )0;
          sqlstm.sqindv[95] = (         short *)0;
          sqlstm.sqinds[95] = (         int  )0;
          sqlstm.sqharm[95] = (unsigned long )0;
          sqlstm.sqadto[95] = (unsigned short )0;
          sqlstm.sqtdso[95] = (unsigned short )0;
          sqlstm.sqhstv[96] = (unsigned char  *)&tmarketamt;
          sqlstm.sqhstl[96] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[96] = (         int  )0;
          sqlstm.sqindv[96] = (         short *)0;
          sqlstm.sqinds[96] = (         int  )0;
          sqlstm.sqharm[96] = (unsigned long )0;
          sqlstm.sqadto[96] = (unsigned short )0;
          sqlstm.sqtdso[96] = (unsigned short )0;
          sqlstm.sqhstv[97] = (unsigned char  *)&houseintamt4;
          sqlstm.sqhstl[97] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[97] = (         int  )0;
          sqlstm.sqindv[97] = (         short *)0;
          sqlstm.sqinds[97] = (         int  )0;
          sqlstm.sqharm[97] = (unsigned long )0;
          sqlstm.sqadto[97] = (unsigned short )0;
          sqlstm.sqtdso[97] = (unsigned short )0;
          sqlstm.sqhstv[98] = (unsigned char  *)&houseintamt5;
          sqlstm.sqhstl[98] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[98] = (         int  )0;
          sqlstm.sqindv[98] = (         short *)0;
          sqlstm.sqinds[98] = (         int  )0;
          sqlstm.sqharm[98] = (unsigned long )0;
          sqlstm.sqadto[98] = (unsigned short )0;
          sqlstm.sqtdso[98] = (unsigned short )0;
          sqlstm.sqhstv[99] = (unsigned char  *)&investamt2;
          sqlstm.sqhstl[99] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[99] = (         int  )0;
          sqlstm.sqindv[99] = (         short *)0;
          sqlstm.sqinds[99] = (         int  )0;
          sqlstm.sqharm[99] = (unsigned long )0;
          sqlstm.sqadto[99] = (unsigned short )0;
          sqlstm.sqtdso[99] = (unsigned short )0;
          sqlstm.sqhstv[100] = (unsigned char  *)&sparent;
          sqlstm.sqhstl[100] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[100] = (         int  )0;
          sqlstm.sqindv[100] = (         short *)0;
          sqlstm.sqinds[100] = (         int  )0;
          sqlstm.sqharm[100] = (unsigned long )0;
          sqlstm.sqadto[100] = (unsigned short )0;
          sqlstm.sqtdso[100] = (unsigned short )0;
          sqlstm.sqhstv[101] = (unsigned char  *)&trafficamt;
          sqlstm.sqhstl[101] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[101] = (         int  )0;
          sqlstm.sqindv[101] = (         short *)0;
          sqlstm.sqinds[101] = (         int  )0;
          sqlstm.sqharm[101] = (unsigned long )0;
          sqlstm.sqadto[101] = (unsigned short )0;
          sqlstm.sqtdso[101] = (unsigned short )0;
          sqlstm.sqhstv[102] = (unsigned char  *)&investamt3;
          sqlstm.sqhstl[102] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[102] = (         int  )0;
          sqlstm.sqindv[102] = (         short *)0;
          sqlstm.sqinds[102] = (         int  )0;
          sqlstm.sqharm[102] = (unsigned long )0;
          sqlstm.sqadto[102] = (unsigned short )0;
          sqlstm.sqtdso[102] = (unsigned short )0;
          sqlstm.sqhstv[103] = (unsigned char  *)&investamt4;
          sqlstm.sqhstl[103] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[103] = (         int  )0;
          sqlstm.sqindv[103] = (         short *)0;
          sqlstm.sqinds[103] = (         int  )0;
          sqlstm.sqharm[103] = (unsigned long )0;
          sqlstm.sqadto[103] = (unsigned short )0;
          sqlstm.sqtdso[103] = (unsigned short )0;
          sqlstm.sqhstv[104] = (unsigned char  *)&hsrentinamt;
          sqlstm.sqhstl[104] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[104] = (         int  )0;
          sqlstm.sqindv[104] = (         short *)0;
          sqlstm.sqinds[104] = (         int  )0;
          sqlstm.sqharm[104] = (unsigned long )0;
          sqlstm.sqadto[104] = (unsigned short )0;
          sqlstm.sqtdso[104] = (unsigned short )0;
          sqlstm.sqhstv[105] = (unsigned char  *)&investamt5;
          sqlstm.sqhstl[105] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[105] = (         int  )0;
          sqlstm.sqindv[105] = (         short *)0;
          sqlstm.sqinds[105] = (         int  )0;
          sqlstm.sqharm[105] = (unsigned long )0;
          sqlstm.sqadto[105] = (unsigned short )0;
          sqlstm.sqtdso[105] = (unsigned short )0;
          sqlstm.sqhstv[106] = (unsigned char  *)&investamt6;
          sqlstm.sqhstl[106] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[106] = (         int  )0;
          sqlstm.sqindv[106] = (         short *)0;
          sqlstm.sqinds[106] = (         int  )0;
          sqlstm.sqharm[106] = (unsigned long )0;
          sqlstm.sqadto[106] = (unsigned short )0;
          sqlstm.sqtdso[106] = (unsigned short )0;
          sqlstm.sqhstv[107] = (unsigned char  *)&investamt7;
          sqlstm.sqhstl[107] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[107] = (         int  )0;
          sqlstm.sqindv[107] = (         short *)0;
          sqlstm.sqinds[107] = (         int  )0;
          sqlstm.sqharm[107] = (unsigned long )0;
          sqlstm.sqadto[107] = (unsigned short )0;
          sqlstm.sqtdso[107] = (unsigned short )0;
          sqlstm.sqhstv[108] = (unsigned char  *)&longfundamt;
          sqlstm.sqhstl[108] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[108] = (         int  )0;
          sqlstm.sqindv[108] = (         short *)0;
          sqlstm.sqinds[108] = (         int  )0;
          sqlstm.sqharm[108] = (unsigned long )0;
          sqlstm.sqadto[108] = (unsigned short )0;
          sqlstm.sqtdso[108] = (unsigned short )0;
          sqlstm.sqhstv[109] = (unsigned char  *)&creditaddamt1;
          sqlstm.sqhstl[109] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[109] = (         int  )0;
          sqlstm.sqindv[109] = (         short *)0;
          sqlstm.sqinds[109] = (         int  )0;
          sqlstm.sqharm[109] = (unsigned long )0;
          sqlstm.sqadto[109] = (unsigned short )0;
          sqlstm.sqtdso[109] = (unsigned short )0;
          sqlstm.sqhstv[110] = (unsigned char  *)&creditaddamt2;
          sqlstm.sqhstl[110] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[110] = (         int  )0;
          sqlstm.sqindv[110] = (         short *)0;
          sqlstm.sqinds[110] = (         int  )0;
          sqlstm.sqharm[110] = (unsigned long )0;
          sqlstm.sqadto[110] = (unsigned short )0;
          sqlstm.sqtdso[110] = (unsigned short )0;
          sqlstm.sqhstv[111] = (unsigned char  *)&creditaddamt3;
          sqlstm.sqhstl[111] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[111] = (         int  )0;
          sqlstm.sqindv[111] = (         short *)0;
          sqlstm.sqinds[111] = (         int  )0;
          sqlstm.sqharm[111] = (unsigned long )0;
          sqlstm.sqadto[111] = (unsigned short )0;
          sqlstm.sqtdso[111] = (unsigned short )0;
          sqlstm.sqhstv[112] = (unsigned char  *)&creditaddamt4;
          sqlstm.sqhstl[112] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[112] = (         int  )0;
          sqlstm.sqindv[112] = (         short *)0;
          sqlstm.sqinds[112] = (         int  )0;
          sqlstm.sqharm[112] = (unsigned long )0;
          sqlstm.sqadto[112] = (unsigned short )0;
          sqlstm.sqtdso[112] = (unsigned short )0;
          sqlstm.sqhstv[113] = (unsigned char  *)&nagiveamt;
          sqlstm.sqhstl[113] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[113] = (         int  )0;
          sqlstm.sqindv[113] = (         short *)0;
          sqlstm.sqinds[113] = (         int  )0;
          sqlstm.sqharm[113] = (unsigned long )0;
          sqlstm.sqadto[113] = (unsigned short )0;
          sqlstm.sqtdso[113] = (unsigned short )0;
          sqlstm.sqhstv[114] = (unsigned char  *)&npgiveamt2;
          sqlstm.sqhstl[114] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[114] = (         int  )0;
          sqlstm.sqindv[114] = (         short *)0;
          sqlstm.sqinds[114] = (         int  )0;
          sqlstm.sqharm[114] = (unsigned long )0;
          sqlstm.sqadto[114] = (unsigned short )0;
          sqlstm.sqtdso[114] = (unsigned short )0;
          sqlstm.sqhstv[115] = (unsigned char  *)&npgiveamt;
          sqlstm.sqhstl[115] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[115] = (         int  )0;
          sqlstm.sqindv[115] = (         short *)0;
          sqlstm.sqinds[115] = (         int  )0;
          sqlstm.sqharm[115] = (unsigned long )0;
          sqlstm.sqadto[115] = (unsigned short )0;
          sqlstm.sqtdso[115] = (unsigned short )0;
          sqlstm.sqhstv[116] = (unsigned char  *)&npgiveamt2_2010;
          sqlstm.sqhstl[116] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[116] = (         int  )0;
          sqlstm.sqindv[116] = (         short *)0;
          sqlstm.sqinds[116] = (         int  )0;
          sqlstm.sqharm[116] = (unsigned long )0;
          sqlstm.sqadto[116] = (unsigned short )0;
          sqlstm.sqtdso[116] = (unsigned short )0;
          sqlstm.sqhstv[117] = (unsigned char  *)&npgiveamt2_else;
          sqlstm.sqhstl[117] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[117] = (         int  )0;
          sqlstm.sqindv[117] = (         short *)0;
          sqlstm.sqinds[117] = (         int  )0;
          sqlstm.sqharm[117] = (unsigned long )0;
          sqlstm.sqadto[117] = (unsigned short )0;
          sqlstm.sqtdso[117] = (unsigned short )0;
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

 /*2014.12.22 하은영 추가 */          

          
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {       
               Write_batlog(seqno++, "연말정산 기초자료 read Error");  /*dsa2000 Rexec 대체*/
               err_print(sqlca.sqlcode,"연말정산 기초자료 read Error");
               exit(1);
          }
   
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 118;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1081;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
   
      
   /* -------------------------------------------------------------------------
     40.20   2001.12.17   유효성                  근로소득계산시 인정상여 포함으로 변경                                               
   ------------------------------------------------------------------------*/
          if  (taxgross  <= INDEDBASIC)                               /* 2010.01.18 근로 소득금액 400만원 체크 추가 */
          {    
                   laborded = trunc(taxgross   * INDEDBRATE /100) ;               
          }     
          else if ((taxgross > INDEDBASIC) && (taxgross <= INDEDLIMIT2))
               laborded = trunc( INDEDBASIC  * INDEDBRATE /100  +
                               ( taxgross - INDEDBASIC )*INDEDORATE / 100 );
          else if ((taxgross > INDEDLIMIT2) && (taxgross <= INDEDLIMIT3))
               laborded = trunc(INDEDBASIC * INDEDBRATE /100  +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +                        
                               (taxgross -  INDEDLIMIT2)*INDEDORATE2 / 100);
                              
          else if (taxgross > INDEDLIMIT3 && (taxgross <= INDEDLIMIT4))  /*parksh 20021213수정 */
               laborded = trunc(INDEDBASIC * INDEDBRATE /100  +
                               (INDEDLIMIT2-INDEDBASIC) * INDEDORATE /100 +
                               (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                               (taxgross  - INDEDLIMIT3) * INDEDORATE3/100 );
                         
          else if (taxgross > INDEDLIMIT4)                              /*parksh 20021213 추가 근로소득공제4*/ 
               laborded = trunc(INDEDBASIC * INDEDBRATE /100 +
                               (INDEDLIMIT2 - INDEDBASIC)*INDEDORATE / 100 +
                               (INDEDLIMIT3-INDEDLIMIT2) * INDEDORATE2 /100 +
                               (INDEDLIMIT4-INDEDLIMIT3) * INDEDORATE3 /100 +
                               (taxgross  - INDEDLIMIT4) * INDEDORATE4/100 );
   
          laboramt  = trunc(taxgross - laborded);
          
   
          /*  국외근로소득공제  ADD 1998.12.15 LEERK */
          foritaxgross1 = foritaxgross -  ( laborded * foritaxgross / taxgross );
   
   
/* 인적공제 START ===============================================================================*/
/***************************  추가공제  *******************************/
          /*  본인공제  */
          selfded = BASDED;
          
          /*  배우자 공제  */
          mateded = mate * BASDED;
   
          /*  부양가족공제  */
          famided = familyno * BASDED;
          
          /*  기본공제  */
          basicded= selfded + mateded + famided;
      
/***************************  추가공제  *******************************/
          /*  경로우대공제  */
          /* oldded  = fami65no * APPOLDDED;    parksh 20021213 APPDED->APPOLDDED 2010.01 kth 70세이상 100만원으로 변겅 주석*/
          oldded  =  fami70no * APPOLDDED2;  /*2004.12. dsa2000  경로우대70이상 추가공제 oldded 2010.01 kth 70세이상 100만원으로 변겅 주석 */
   
          /*  장애자 공제  */
          /*obsded  = obstacleno * APPOLDDED;    parksh 20021213 APPDED->APPOLDDED */
          obsded  = obstacleno * OBSDEDADD;     /*2005년 100 => 200만원으로 인상*/
           
          /*  부녀자 공제  */
          womanded= woman * APPDED;
   
          /* 2014.12.22 하은영 자녀양육 폐지  */
          /*  자녀양육비 공제      100만원으로 인상(2004.12.DSA2000)    childded= childno * APPDED;*/
          //childded= childno * APPOLDDED;
          childded = 0;
          
          /* 2014.12.22 하은영 출산 입양자 폐지  */
          /*  출산 입양자 공제 */
          //babyded= babyno * APPBABYDED;
          babyded = 0;
          
          /*  한부모공제 2013신설  100만원  부녀자공제 중복공제 배제 */
          sparentded  = sparent * SPARENTDEDADD;
          if (sparentded > 0)  
          {
              woman    = 0;
              womanded = 0;
          }
                    
          /*  추가공제  */
          appendded = oldded + obsded + womanded + childded + babyded + sparentded;
                          
          /* 2007년 다자녀추가공제 신설
             기본공제대상자인 자녀(아들,딸) 2인일 경우 50만원,
             2인 이상일경우 50만원 + 2인 초과인원당 100만원 추가공제
             ex) 기본공제 자녀 3인일 경우 50만원 + 100만원 = 150만원 공제 */
                 
          /*2014.12.22 하은영 다자녀공제를 자녀세액공제로 함에 따라서 삭제 */
          /*if  (manychildno == 2)
          {
               fewded = FEWDED1;
          }
          else if (manychildno > 2)
          {
               fewded = FEWDED1 + ((manychildno - 2) * FEWDED2);
          }
          else
          {
               fewded = 0;
          }   */     
     
          //2014.12.22 하은영 다자녀공제를 자녀세액공제로 함에 따라서 삭제 
          //laborlimit = fmax((laboramt - basicded - appendded - fewded), 0);   
          laborlimit = fmax((laboramt - basicded - appendded), 0);   
                            
/* 특별 공제 START ===============================================================================*/
/***************************  국민연금보험료공제  *******************************/
          /* 2015.02.05 하은영 국민연금이 마이너스인 사원이 있어 비교처리
          anuded = anuamt + banuamt+ banuamt1 ;  */
          anuded = fmax(anuamt + banuamt+ banuamt1, 0) ;  
          laborlimit = fmax(( laborlimit - anuded), 0);             


/***************************  보험료  *******************************/                                            
          /*  의료보험료 공제     */
          medded = medamt + bmedamt + bmedamt1;
          laborlimit = fmax(( laborlimit - medded), 0);
          
                         
          /*  고용보험료 공제     */
          hireded= hireamt + bhireamt+ bhireamt1;
          laborlimit = fmax(( laborlimit - hireded), 0);
                        
   
/***************************  주택자금  *******************************/          
          /* -------------------------------------------------------------------------
            40.10   2001.01.04   유효성          장기주택저당차입 이자상환 추가
            40.11   2003.12.18   강륜종(dsa2000) 장기주택저당차입 이자상환 한도액 추가..
                                          ①주택마련저축  ②주택임차 차입금상환 ③장기주택저당차입금
                                          주택자금 공제시 ①+② 만 공제시에는 한도가 300만원까지
                                                       ①+②+③ 공제시에는 한도가 600만원까지
                    2004.12.     dsa2000    ①+②+③ 모두 공제시에는 10년이상시 600,  
                                                                    15년이상시 1000으로 한도변경
          ------------------------------------------------------------------------- */       
          /* 2007년 연말정산 개정법 : 기존 장기주택저당차입금 대상이 기한연장(15년이상) 경우까지 확대적용
             시스템 로직변경 해당 없음 */
                   
          /* ===================================================================================================== */
          /*  주택공제  2008년 변경                                                                                */
          /* 주택공제① : 원리금상환액 * 40% 까지 공제   [단, Max300만원]                                          */
          /* 주택공제② : 2011년이전 차입금이자상환액1 전액(15년미만).            [단, (차입금이자상환액1+원리금상환액) Max 600만원]  또는  */
          /*              2011년이전 차입금이자상환액2 전액(30년미만).            [단, (차입금이자상환액2+원리금상환액) Max1000만원]        */
          /*              2011년이전 차입금이자상환액3 전액(30년이상).            [단, (차입금이자상환액3+원리금상환액) Max1500만원]        */
          /*              2012년이후 차입금이자상환액4 전액(고정금리,비거치상환). [단, (차입금이자상환액3+원리금상환액) Max1500만원]        */
          /*              2012년이후 차입금이자상환액5 전액(기타대출).            [단, (차입금이자상환액3+원리금상환액)  Max500만원]        */
          /* 주택공제③ : 주택마련저축액 * 40% 까지 공제                                                           */
          /*             [단, if (주택마련저축공제액+원리금상환공제액) > 300만원 then 300만원-원리금상환공제액]    */
          /*             [단, (원리금상환공제액 + 차입금이자상환액1 + 주택마련저축공제액) Max 600만원]             */
          /*             [단, (원리금상환공제액 + 차입금이자상환액2 + 주택마련저축공제액) Max1000만원]             */
          /* ===================================================================================================== */
                              
          /* 주택임차원리금상환액_대출기관 */
          houseded   = floor(houseamt  * HSRATE / 100);          
          if ( houseded  > HSDEDLIMIT ) houseded = HSDEDLIMIT;
            
          if (houseded < 0) houseded=0;
           
          houseded   = fmin( laborlimit, houseded);                                                                                 
          laborlimit = fmax((laborlimit - houseded), 0);                              
                     
          /* 주택임차원리금상환액_거주자 */           
          houseded3   = floor(houseamt3 * HSRATE / 100);         
          if ( (houseded3 + houseded) > HSDEDLIMIT ) houseded3 = HSDEDLIMIT-houseded;           
          
          if (houseded3 < 0) houseded3=0;
          
          houseded3  = fmin( laborlimit, houseded3);                                                                                 
          laborlimit = fmax((laborlimit - houseded3), 0);                              
                    
          /* 월세액 */                               
          houserentded   = 0;         
                    
          /* 청약 저축 */
          /* 주택공제③ : 주택마련저축 소득공제 40%)*/    
          housvsubamt = fmin(housvsubamt,1200000);  /*hjku 2013.01 한도추가*/              
          housvsubded = floor( housvsubamt * HSRATE / 100 );  
          if (housvsubded >= 480000) housvsubded = 480000;
                                        
          if  ((houseded  + houseded3 +houserentded + housvsubded) > HSDEDLIMIT )
              housvsubded = HSDEDLIMIT - houseded - houseded3  - houserentded; /* 한도 -주택임차차임금 - 월세액  2011.01 kth 추가*/ 
              
          if (housvsubded < 0) housvsubded = 0;    

          /* 주택 청약 종합 저축 */
          housvcomamt = fmin(housvcomamt,1200000); /*hjku 2013.01 한도추가*/                  
          housvcomded = floor( housvcomamt * HSRATE / 100 ); /* 주택 청약 종합 저축  2011.01 kth 추가 */
          
          if (housvcomded >= 480000) housvcomded = 480000;          
          
          if  ((houseded  + houseded3 + houserentded + housvsubded +housvcomded ) > HSDEDLIMIT )
              housvcomded = HSDEDLIMIT - houseded -houseded3  -houserentded-housvsubded;  /* 한도 -주택임차차임금 - 월세액-쳥약저축  2011.01 kth 추가*/
               
          if (housvcomded < 0) housvcomded = 0;      

          /* 장기주택 마련저축 */
          houseded2 = 0;
          /*2013.12.hjku 장기주택마련저축 삭제
          houseded2 = floor( houseamt2 * HSRATE / 100 );      장기주택 마련저축  2011.01 kth 추가                                                             
          if  ((houseded  + houseded3 + houserentded + housvsubded +housvcomded + houseded2) > HSDEDLIMIT )
              houseded2 = HSDEDLIMIT - houseded -houseded3 -houserentded-housvsubded-housvcomded; // 한도 -주택임차차임금 - 월세액-쳥약저축-청약종합  

          if (houseded2 < 0) houseded2 = 0;  
          */             
          
          /* 근로자 주택  마련저축 */          
          housvempded = floor( housvempamt * HSRATE / 100 );
          if (housvempded >= 720000) housvempded = 720000;          

          if  ((houseded  +houseded3 + houserentded + housvsubded +housvcomded + houseded2 + housvempded) > HSDEDLIMIT )
              housvempded = HSDEDLIMIT - houseded - houseded3 - houserentded - housvsubded - housvcomded - houseded2; /* 한도 -주택임차차임금 - 월세액-쳥약저축-청약종합-장마  2011.01 kth 추가*/                     
          
          if (housvempded < 0) housvempded = 0;  

          houseded4 = housvsubded + housvcomded + houseded2 + housvempded; //주택마련저축소득공제 합
                                                    
          //delete hjku 2012.12 if ( houseded2 < 0 ) houseded2 = 0;
//                                                                                      
          /* 주택공제② : 장기주택저당차입금이자상환 */
          houseintmaxded  = houseintded  = fmin(houseintamt ,HSDEDLIMIT2); 
          houseintmaxded2 = houseintded2 = fmin(houseintamt2,HSDEDLIMIT3);
          houseintmaxded3 = houseintded3 = fmin(houseintamt3,HSDEDLIMIT4);
          houseintmaxded4 = houseintded4 = fmin(houseintamt4,HSDEDLIMIT5); /*hjku 추가 2012.12*/ 
          houseintmaxded5 = houseintded5 = fmin(houseintamt5,HSDEDLIMIT6); /*hjku 추가 2012.12*/ 
          
                        //주택임차원리금상환액 //월세액       //주택마련저축소득공제 //장기주택저당차입금이자상환액   
          housededsum = houseded + houseded3 + houserentded + houseded4 +            houseintded + houseintded2 + houseintded3 + houseintded4 + houseintded5;
          
          
          if      (houseintamt3 > 0 )  /* 상환기간 30년 이상일때 1500만원까지...kth 2010.01 추가*/
          {
              housededsum = fmin(housededsum,HSDEDLIMIT4);
          }                    
          else if      (houseintamt4 > 0 )  /* 고정금리.비거치상황대출(2012년이후)일때 1500만원까지...hjku 2012.12 추가*/
          {
              housededsum = fmin(housededsum,HSDEDLIMIT5);
          }                    
          else if      (houseintamt2 > 0 )  /* 상환기간 15년 이상일때 1000만원까지...*/
          {
              housededsum = fmin(housededsum,HSDEDLIMIT3);
          }
          else if (houseintamt  > 0 )  /* 상환기간 10년 이상일때  600만원까지...*/
          {
              housededsum = fmin(housededsum,HSDEDLIMIT2);
          }
          else if (houseintamt5  > 0 )  /* 기타대출(2012년이후)일때  500만원까지...*/
          {
              housededsum = fmin(housededsum,HSDEDLIMIT6);
          }          

          houseintded  = fmin(fmax((HSDEDLIMIT2 - (houseded + houseded3 + houserentded + houseded4)),0),houseintded );
          houseintded2 = fmin(fmax((HSDEDLIMIT3 - (houseded + houseded3 + houserentded + houseded4) - houseintded),0),houseintded2);
          houseintded3 = fmin(fmax((HSDEDLIMIT4 - (houseded + houseded3 + houserentded + houseded4) - houseintded - houseintded2),0),houseintded3);
          houseintded4 = fmin(fmax((HSDEDLIMIT5 - (houseded + houseded3 + houserentded + houseded4) - houseintded - houseintded2 - houseintded3),0),houseintded4);
          houseintded5 = fmin(fmax((HSDEDLIMIT6 - (houseded + houseded3 + houserentded + houseded4) - houseintded - houseintded2 - houseintded3 - houseintded4),0),houseintded5);          
          
          /*
          printf("[debug in before] : empno=%s,houseintamt=%f,housededsum=%f,houseintded= %f  \n",empno,houseintamt,housededsum,houseintded);
          printf("[debug in before] : empno=%s,houseintamt2=%f,housededsum=%f,houseintded2= %f  \n",empno,houseintamt2,housededsum,houseintded2);
          printf("[debug in before] : empno=%s,houseintamt3=%f,housededsum=%f,houseintded3= %f  \n",empno,houseintamt3,housededsum,houseintded3);
          printf("[debug in before] : empno=%s,houseintamt4=%f,housededsum=%f,houseintded4= %f  \n",empno,houseintamt4,housededsum,houseintded4);
          printf("[debug in before] : empno=%s,houseintamt5=%f,housededsum=%f,houseintded5= %f  \n",empno,houseintamt5,housededsum,houseintded5);
          */
          
          housededsum = housededsum - (houseded + houseded3 + houserentded + houseded4 + houseintded + houseintded2 + houseintded3 + houseintded4 + houseintded5);
          if(housededsum  > 0)
          {
            double temp_houseintded =0;
            
            temp_houseintded = (houseintmaxded - houseintded);
            houseintded  = houseintded + fmin(housededsum,temp_houseintded);
            housededsum = fmax((housededsum-temp_houseintded),0);

            temp_houseintded = (houseintmaxded2 - houseintded2);             
            houseintded2  = houseintded2 + fmin(housededsum,temp_houseintded);
            housededsum = fmax((housededsum-temp_houseintded),0);           

            temp_houseintded = (houseintmaxded3 - houseintded3);
            houseintded3  = houseintded3 + fmin(housededsum,temp_houseintded);
            housededsum = fmax((housededsum-temp_houseintded),0);          

            temp_houseintded = (houseintmaxded4 - houseintded4);
            houseintded4  = houseintded4 + fmin(housededsum,temp_houseintded);
            housededsum = fmax((housededsum-temp_houseintded),0);

            temp_houseintded = (houseintmaxded5 - houseintded5);
            houseintded5  = houseintded5 + fmin(housededsum,temp_houseintded);
            housededsum = fmax((housededsum-temp_houseintded),0);                                   
          
          /*printf("[debug in after] : empno=%s,houseintmaxded5=%f,housededsum=%f,houseintded5= %f,%f  \n",empno,houseintmaxded5,housededsum,houseintded5,(houseintmaxded5 - houseintded5));*/
          }
          
          houseintded  = fmin( laborlimit, houseintded);
          laborlimit   = fmax((laborlimit - houseintded), 0);
          
          houseintded2 = fmin( laborlimit, houseintded2);
          laborlimit   = fmax((laborlimit - houseintded2), 0);
          
          houseintded3 = fmin( laborlimit, houseintded3);
          laborlimit   = fmax((laborlimit - houseintded3), 0);

          houseintded4 = fmin( laborlimit, houseintded4);
          laborlimit   = fmax((laborlimit - houseintded4), 0);

          houseintded5 = fmin( laborlimit, houseintded5);
          laborlimit   = fmax((laborlimit - houseintded5), 0);
          

/***************************  기부금(이월분)  *******************************/          
          /*기부금 공제 순서 : 정치자금기부금 ->법정기부금(이월) -> 법정기부금 ->  특례기부금(이월) -> 공익신탁기부금(이월) ->
                               우리사주조합기부금 ->종교단체외지정기부금(이월) -> 종교단체기부금(이월)-> 종교단체외지정기부금 -> 종교단체기부금 */                                                                                                 


          /* 2014.12.22 하은영 연말정산 소득계산 프로그램에서 일괄 갱신함에 따라서 삭제처리  
           이월기부금 수정 시작 2012.02.09 KTH  
           이월기부금 반영 변경 2013.01.14 hjku 
          EXEC    SQL
          SELECT NVL(SUM(DECODE(GIVECOD,'10',DEDAMT)),0) NAGIVEAMT,
                 NVL(SUM(DECODE(GIVECOD,'30',DEDAMT,'31',DEDAMT)),0) NSPGIVAMT,
                 NVL(SUM(DECODE(GIVECOD,'40',DEDAMT)),0) NPGIVEAMT2,
                 NVL(SUM(case when NEWORKYY='2010' and givecod='40' then DEDAMT else 0 end),0) NPGIVEAMT2_2010,
                 NVL(SUM(case when NEWORKYY<>'2010' and givecod='40' then DEDAMT else 0 end),0) npgiveamt2_else, 
                 NVL(SUM(DECODE(GIVECOD,'41',DEDAMT)),0) NPGIVEAMT
            INTO :nagiveamt, :nspgivamt,:npgiveamt2,:npgiveamt2_2010,:npgiveamt2_else,:npgiveamt                 
            FROM PKMYSGIVNE             
           WHERE WORKYY = :workyy 
             AND EMPNO  = :empno
             AND WORKYY > NEWORKYY
        GROUP BY EMPNO;
             
        if (sqlca.sqlcode != 0)
        {       
           nagiveamt       = 0;
           nspgivamt       = 0;
           npgiveamt2      = 0;
           npgiveamt2_2010 = 0;
           npgiveamt2_else = 0;
           npgiveamt       = 0;  
        }
        */  
          
         /*  printf("[debug0] : empno=%s,laboramt=%f  \n",empno, laboramt);  */            
                   
          /* 2014.12.22 하은영 2014년부터 기부금은 특별소득공제와 특별세액공제로 분리됨에 따라 시스템 적용 */
          /* 2014.12.22 하은영 정치자금 세액공제 산식 변경 10만원이하, 10만원초과로 분리                   */
          if  (poliamt == POLILIMIT) 
          {
               polided1     = POLILIMIT;
               politaxded1  = floor(POLILIMIT * 100 / 110); //정치자금세액공제
          }
          else if (poliamt > POLILIMIT) 
          {
            polided1       = POLILIMIT;
            politaxded1    = floor(POLILIMIT * 100 / 110);
       
            polided2       = poliamt - POLILIMIT;
            polided2       = fmin(laboramt, polided2);
            if ((poliamt + polided1)  < GIVESLIMIT)
               politaxded2 =  floor(polided2  * SPECIALRATE2 / 100);
            else
               politaxded2 =  floor((GIVESLIMIT - POLILIMIT)  * SPECIALRATE2 / 100) + floor((polided1 + polided2  - GIVESLIMIT)  * GIVESRATE / 100);
          }
          else if  (poliamt > 0) 
          {
               polided1    = poliamt;
               politaxded1 = floor(poliamt * 100 / 110);
          }
          
          
          //2014.12.22 하은영 법정기부금 산식 변경
          nagiveded = nagiveamt;
          nagiveded = fmin((laboramt - polided2),nagiveded);
          nagiveded = fmax(nagiveded,0);
       
          agiveded  = agiveamt;
          agiveded  = fmin((laboramt - polided2 - nagiveded),agiveded);
          agiveded  = fmax(agiveded,0);

          /* printf("[debug0] : empno=%s,agiveded=%f,laboramt=%f,polided2=%f,nagiveded=%f  \n",empno,agiveded, agiveamt, laboramt, polided2, nagiveded);             */
                                 
          
          /* 특례지정기부금 parksh 20021213 추가 */
          spgivded = spgivamt + nspgivamt;
          if ( spgivded > floor((laboramt-polided2-agiveded) * SPGIVDEDRATE / 100))
               spgivded = fmax(floor((laboramt-polided2-agiveded) * SPGIVDEDRATE / 100),0) ;
   
          /* 소득금액 */
          pgivededamt = fmax((laboramt-polided2-nagiveded-agiveded-spgivded),0); /* 소득금액 :(근로소득금액 -정치기부금 - 전액공제기부금 - 특례기부금) */

          /* printf("[debug0] : empno=%s,pgivededamt=%f  \n",empno,pgivededamt);             */

                                                                    
          /* 지정기부금  */
          pgiveded  = pgiveamt + npgiveamt;  /* 종교   */  
          pgiveded2 = pgiveamt2+ npgiveamt2; /* 비종교 */                   
          
          npgiveded  = 0; /* 종교이월    */ 
          npgiveded2 = 0; /* 비종교이월  */           
          if (pgiveded > 0) { 
            /* 지정기부금전체한도 */
            pgivededlimit1 = floor((pgivededamt * GIVDEDRATE / 100)+fmin((pgivededamt * GIVDEDRATE2 / 100),fmin((pgivededamt * GIVDEDRATE / 100),npgiveamt2_2010)+ npgiveamt2_else + pgiveamt2 ));
            /* 종교단체 공제한도 */
            pgivededlimit2 = floor(pgivededamt * GIVDEDRATE / 100); 
            
            /* 지정기부금공제금액 */
            pgivededlimit1 = fmin((pgiveded+pgiveded2), pgivededlimit1);


            /* 해당년도 종교단체외 이월기부금 1  */
            npgiveded2     = fmin(pgivededlimit1,npgiveamt2);
            pgivededlimit1 = fmax((pgivededlimit1 - npgiveded2),0);
       
            /* 해당년도 종교단체   이월기부금 2  */
            pgivededlimit2 = fmin(pgivededlimit2,pgivededlimit1);
            npgiveded      = fmin(pgivededlimit2,npgiveamt);
       
            pgivededlimit1 = fmax((pgivededlimit1 - npgiveded),0);
            pgivededlimit2 = fmax((pgivededlimit2 - npgiveded),0);
       
       
            /* 해당년도 종교단체외 기부금 3    */
            pgiveded2      = fmin(pgivededlimit1,pgiveamt2);
            pgivededlimit1 = fmax((pgivededlimit1 - pgiveded2),0);
       
            /* 해당년도 종교단체   기부금 4    */
            pgiveded       = fmin( pgivededlimit2,  pgiveamt);
            pgiveded       = fmin( pgivededlimit1,  pgiveded);       
                                                                                  
          } else if (pgiveded2 > 0) {
            if (pgiveded2 == npgiveamt2_2010)
                 pgivededlimit1 = floor(pgivededamt * GIVDEDRATE2 / 100);
            else pgivededlimit1 = floor(pgivededamt * GIVDEDRATE3 / 100);
       
            pgiveded  = 0;
       
            //2014.12.11 하은영 해당년도 종교단체외 이월, 당해 기부금 분리해서 추가
            npgiveded2     = fmin(pgivededlimit1,npgiveamt2);
            pgivededlimit1 = fmax((pgivededlimit1 - npgiveded2),0);
       
            pgiveded2 = fmin(pgiveamt2,pgivededlimit1);
          } else if(pgiveded > 0) {
            pgivededlimit1 = floor(pgivededamt * GIVDEDRATE / 100); /* 종교단체 공제한도 */

            pgiveded  = fmin(pgiveded,pgivededlimit1);            
            pgiveded2 = 0;
          } else {
            pgiveded = 0;
            pgiveded2= 0; 
          }

          /*printf("[debug] : empno=%s,npgiveded=%f,npgiveded2=%f,pgiveded= %f,pgiveded2=%f  \n",empno,npgiveded,npgiveded2,pgiveded,pgiveded2);       */

          /* 기부금공제 = 정치기부금 + 전액기부금  + 특례지정기부금 + 지정기부금 */
          /* 2015.01.19 하은영 기부금공제 계를 기부금 세액공제 대상항목만 합산되도록 요청 - 지순미 과장
          giveded = polided1 + polided2 + agiveded +  spgivded + pgiveded + pgiveded2 + nagiveded + npgiveded + npgiveded2;  */
          
          giveded = polided2 + agiveded + spgivded + pgiveded + pgiveded2;
          giveded = floor(giveded);
          

          /*printf("[debug] : empno=%s,laborlimit=%f,giveded=%f \n",empno,laborlimit,giveded);*/          
          if(laborlimit<=0) {
             polided1   = 0;
             polided1   = 0;
             agiveded   = 0;
             spgivded   = 0;
             pgiveded2  = 0;
             pgiveded   = 0;
             nagiveded  = 0;
             npgiveded2 = 0;
             npgiveded  = 0;
             giveded    = 0;
          }else if(laborlimit < giveded) {
            /* 법정이월기부금   */
            nagiveded   = fmin(laborlimit, nagiveded);
            laborlimit  = fmax((laborlimit - nagiveded), 0);
        
            /* 지정종교외이월기부금  */
            npgiveded2 = fmin(laborlimit, npgiveded2);
            laborlimit = fmax((laborlimit - npgiveded2), 0);
        
            /* 지정종교이월기부금  */
            npgiveded  = fmin(laborlimit, npgiveded);
            laborlimit = fmax((laborlimit - npgiveded), 0);
        
            /* 2015.01.19 하은영 기부금공제 계를 기부금 세액공제 대상항목만 합산되도록 요청 - 지순미 과장
            giveded = polided1 + polided1 + agiveded +  spgivded + pgiveded + pgiveded2 + nagiveded + npgiveded + npgiveded2;        */

            giveded = polided2 + agiveded + spgivded + pgiveded + pgiveded2;
          }

          pgiveded_curr  = pgiveded;
          pgiveded2_curr = pgiveded2;
          
          ngiveded   = nagiveded + npgiveded + npgiveded2;
          
    
/***************************  특별소득공제  *******************************/          
          /* 특별소득공제 = 보험료공제 + 주택자금공제 + 기부금이월공제  */
          specialded = medded + hireded + houseded + houseded3 + houseintded + houseintded2 + houseintded3 + houseintded4 + houseintded5                       
                     + ngiveded;  
          
          
/***************************  차감소득금액  *******************************/          
          chagamamt = fmax(( laboramt
                            -basicded
                            -appendded
                            -anuded
                            -specialded), 0);

          laborlimit = chagamamt;
          
/* 그밖의 소득공제 START=====================================================================*/
/***************************  개인연금저축  *******************************/          
   
          /*  개인연금저축소득 공제 */
          pended  = floor((penamt1 + penamt2 +bpenamt ) * PENRATE / 100);
   
          if  (pended > PENDEDLIMIT)
               pended = PENDEDLIMIT;

          pended      = fmin( laborlimit,  pended);                                                                                 
          laborlimit  = fmax((laborlimit - pended), 0);  
          

/***************************  주택마련저축  *******************************/          
          housvsubded = fmin( laborlimit,  housvsubded);
          laborlimit  = fmax((laborlimit - housvsubded), 0);
          
          housvcomded = fmin( laborlimit,  housvcomded);
          laborlimit  = fmax((laborlimit - housvcomded), 0);
          
          housvempded = fmin( laborlimit,  housvempded);
          laborlimit  = fmax((laborlimit - housvempded), 0);                                    
          

/***************************  투자조합출자등소득공제  *******************************/          
          /* 투자조합    */
          
          /* 투자조합 (2011.12.31. 이전분) 2012.12 hjku */             
          OINVESTLIMIT   = floor(laboramt * OINVESTDEDRATE / 100);/*kth 2010.02 공제율 INVESTDEDRATE 데이터 없어서계산 안되는 거 30%넣어서 처리*/
          OINVESTLIMIT   = fmin(laborlimit, OINVESTLIMIT);
          oinvestded     = floor(oinvestamt * OINVESTRATE /100) ;   /*kth 2010.02 공제율 INVESTRATE 10%로 같이 사용 */
      
          /*if  (oinvestded > OINVESTLIMIT) oinvestded = OINVESTLIMIT;*/
          oinvestded = fmin(oinvestded,OINVESTLIMIT); 

          laborlimit = fmax((laborlimit - oinvestded), 0);

          /* 투자조합 (2012.12.31. 이전분) 2013.12 hjku */             
          INVESTLIMIT    = floor(laboramt * INVESTDEDRATE / 100);
          INVESTLIMIT    = fmax((INVESTLIMIT-oinvestded),0);          
          INVESTLIMIT    = fmin(laborlimit,INVESTLIMIT);          
          investded      = floor(investamt * INVESTRATE /100 + investamt2 * INVESTRATE2 /100) ;
          
          /*if (investded > INVESTLIMIT) investded = INVESTLIMIT;*/
          investded      = fmin(investded,INVESTLIMIT); 
          laborlimit     = fmax((laborlimit - investded), 0);
          
          /* 투자조합 (2013.12.31. 이전분) 2013.12 hjku */   
          INVESTLIMIT    = floor(laboramt * INVESTDEDRATE / 100);              
          INVESTLIMIT    = fmax((INVESTLIMIT-oinvestded-investded),0);                
          INVESTLIMIT    = fmin(laborlimit,INVESTLIMIT);          
          investded2     = floor(investamt3 * INVESTRATE /100 + investamt4 * INVESTRATE3 /100) ;
   
          /*if (investded2 > INVESTLIMIT) investded2 = INVESTLIMIT;*/
          investded2     = fmin(investded2,INVESTLIMIT);                         
          laborlimit     = fmax((laborlimit - investded2), 0);
                
          
          /* 투자조합 (2014년 10%) 2014.12 하은영      */
          INVESTLIMIT    = floor(laboramt * INVESTDEDRATE3 / 100);
          investded3     = floor(investamt5 * INVESTRATE4 /100 + investamt6 * INVESTRATE5 /100  + investamt7 * INVESTRATE6 /100) ;
          investded3     = fmin(investded3,INVESTLIMIT);
      
          investded3     = fmin(laborlimit, investded3);
          laborlimit     = fmax((laborlimit - investded3),0);
      
          //2014.12.10 하은영 종합한도 계산용
          investded3_splimitovded  =  floor(investamt5 * INVESTRATE4 /100) ;
          investded3_splimitovded  =  fmin(laborlimit, investded3_splimitovded);
      
          /* 투자조합공제액합  */
          tinvestded = oinvestded + investded + investded2 + investded3;    
                

   
/***************************  신용카드등소득공제  *******************************/             
          /*================================================================================
            2003.12. Dsa2000  추가....  => 2004.12  기명식선불카드 추가. 직불카드 요율 20%로 축소
            2005.11  현금영수증 사용액(cashamt) 추가 
            2007.12  신용카드공제시 의료비중복공제 배제.(의료비공제 받은 자에 대한 중복공제 배제)
            2012.12  전통시장 추가 및 한도추가 반영 
            
          ① 신용카드등 사용금액 = 신용카드+기명식 선불카드+직불카드+현금영수증+전통시장사용분+교통카드사용분
          ② 최저사용금액 =(총급여액×25%)
          ③ 신용카드등   =(신용카드금액))×15%  *학원비 지로공제 삭제
          ④ 직불카드     =(직불카드+현금영수증)×30%
          ⑤ 전통시장     =(전통시장)×30%
          ⑥ 대중교통     =(대중교통)×30%
          ⑦ 공제제외금액 
                1(최저사용금액 <= 신용카드사용분)일때  최저사용금액 * 15% or
                2(최저사용금액 >  신용카드사용분)일때  ③(신용카드사용분*15%) +(최저사용금액-신용카드사용분*30%       
          ⑧ 신용카드등 소득공제금액 : ③+④+⑤+⑥-⑦   ☞ 한도액 :  MIN(총급여액×20%,300만원)
          ⑨ 전통시장사용분 추가공제 MIN(MIN(한도초과금액, 전통시장사용분*30%),100만원)
             대중교통이용분 추가공제 MIN(MIN(한도초과금액, 대중교통이용분*30%),100만원)
          ** 신용카드등 소득공제 = ⑧총 공제금액 + ⑨ 전통시장사용분, 대중교통이용분 추가 공제
          ================================================================================ */
          creditded = 0;
          
          /*creditdedamt => 신용카드 의료기관 사용액 중 기본공제자가 아닌자를 위하여 지출한 카드금액으로 변경사용 */
          creditamt = credittotamt - creditdedamt;     /* 신용카드 공제 가능금액 = 총 공제신청금액 - 법인 사용분 */              
          
          if (creditamt < 0)    creditamt = 0;      
          
          totcreditamt = creditamt + debitamt + cashamt + tmarketamt + trafficamt;  /*①*/ /*+ giroamt  삭제2013.12*/    
          
          crededlimit1 = floor(taxgross  * CREORATE / 100);                         /*②*/
            
          if  ((totcreditamt - crededlimit1) > 0)
          {       
              creditded1 = floor(creditamt            * CREDEDLRATE    /100) ;            /*③ 신용카드*/  /*+ giroamt  삭제2013.12*/                
              creditded2 = floor((debitamt + cashamt) * DEBITDEDRATE   /100) ;            /*④ 직불카드.현금영수증*/
              creditded3 = floor( tmarketamt          * TMARKETDEDRATE /100) ;            /*⑤ 전통시장*/
              creditded4 = floor( trafficamt          * TRAFFICDEDRATE /100) ;            /*⑥ 대중교통*/              
                          
              crededlimit2 = floor(crededlimit1  * CREDEDLRATE / 100);                    /*⑦-1*/
                
              if( crededlimit2 > creditded1 ) 
                  crededlimit2 = creditded1 + floor((crededlimit1-creditamt)*DEBITDEDRATE /100); /*⑦-2*/
              
              creditdedadd = 0;
              /* 2014.12.10 하은영 2014년 추가공제율사용분 계산  */
              if (creditaddamt1 < creditaddamt2 )
              {
                creditdedadd = floor((creditaddamt4 - floor(creditaddamt3  * CARDUPRATE1 / 100)) *  CARDUPRATE2 / 100);

                creditdedadd = fmax(creditdedadd, 0);
              }
              
              
              creditdedmax = creditded1 + creditded2 + creditded3 + creditded4 + creditdedadd - crededlimit2;        /* ⑧ 신용카드등 소득공제금액 */ 
              
                                 
              /* 한도 체크 : 총과세급여액의 20%와 300만원중 적은금액 */
              creamt1 = fmin(floor(taxgross * CREDEDRATE / 100),CREDEDLIMIT) ; /* 총급여액의 20% */
                
              creditded = fmin(creamt1,creditdedmax);
              
              crededlimit2 = creditdedmax ;
              
              /* ⑨전통시장 추가 한도금액 적용 */
              if (((crededlimit2-creditded)>0)&&(creditded3>0))
              {
                crededlimit2 = fmin((crededlimit2-creditded),creditded3); 
                crededlimit2 = fmin(crededlimit2,TMARKETEXLIMIT);
                creditded    = creditded + crededlimit2;
              }
              
              crededlimit2 = creditdedmax;
                            
              /* ⑨대중교통 추가 한도금액 적용 */
              if (((crededlimit2-creditded)>0)&&(creditded4>0))
              {
                crededlimit2 = fmin((crededlimit2-creditded),creditded4); 
                crededlimit2 = fmin(crededlimit2,TRAFFICEXLIMIT);
                creditded    = creditded + crededlimit2;
              }       
              
           /* printf("[debug0] : empno=%s,creditdedadd=%f,creditdedmax=%f,creamt1=%f,crededlimit2=%f  \n",empno,creditdedadd, creditdedmax, creamt1, crededlimit2);             */
                     
          }else creditded = 0;
          
          creditded  = fmin( laborlimit,  creditded);                                                                                 
          laborlimit = fmax((laborlimit - creditded), 0);                       
          
      /* Dsa2000  2003.12.  End. .........................................................*/                        
      
      /*Dsa2000  2007.01. 우리사주조합출연금 공제 추가.*/
      
          if  (costockamt > COSTOCKLIMIT )
               costockded = COSTOCKLIMIT;
          else
               costockded = costockamt;
          
          costockded = fmin( laborlimit,  costockded);                                                                                 
          laborlimit = fmax((laborlimit - costockded), 0);                       
                    
                  /*  2013.12.09.hjku 삭제
                  장기 주식형 펀드 공제 2008.12 KTH   
          fundded   =  floor(fundamt1   * FUNDRATE1/100)+
                       floor(fundamt2   * FUNDRATE2/100)+
                       floor(fundamt3   * FUNDRATE3/100) ;*/
                       
          fundded = 0;
                  
      /*===============================================================================
       2003.12. Dsa2000  추가....   2004.12. 외국인 세제개편에 따라 폐지.
       외국인임직원 해외근무에 따른 추가비용 소득공제
        1.외국인임직원의 해외근무수당 비과세 한도 확대  - 월정액급여의 40% : 하나로통신 해당없음.
        2.외국인임직원이 우리나라에 근무함으로 인해 추가로 지출한 비용에 대하여 소득공제
          ===============================================================================
       foreignded = 0;
       sprintf(juminid, "%.1s",juminid+7);
       
      if ( (strcmp(juminid, "5") == 0 ) || (strcmp(juminid, "6") == 0 ) )
      {
         foreignded = ( taxgross - foreignamt ) * FOREDEDRATE / 100;     
        
         if ( foreignamt < foreignded )
                         foreignded = foreignamt;       
      }
         Dsa2000  2003.12.  End..........................................................*/                        
               
/***************************  목돈안드는 전세 이자상환액 공제  *******************************/                            
          hsrentinded = floor(hsrentinamt * HSRENTINTRATE / 100);
          /*if  ( hsrentinded > HSRENTINTLIMIT )  hsrentinded = HSRENTINTLIMIT;           */
          hsrentinded = fmin(hsrentinded, HSRENTINTLIMIT);
          
          hsrentinded  = fmin( laborlimit,  hsrentinded);                                                                                 
          laborlimit   = fmax((laborlimit - hsrentinded), 0);     
          
          
          
/***************************  장기투자  *******************************/                            
          /* 2014.12.09 하은영 장기투자    */
          longfundded = fmin(longfundamt, LONGFUNDLIMIT1);
          longfundded = floor(longfundded * LONGFUNDRATE / 100);
       
          longfundded = fmin(laborlimit, longfundded);
       
                                                    
/***************************  그밖의 소득공제  *******************************/                   
          /*조세특례법에의한 소득공제 합계*/          
          incomeded  = pended     
                     + housvsubded + housvcomded + housvempded           
                     + tinvestded 
                     + creditded   + costockded
                     + hsrentinded
                     + longfundded; 
                     
      
/***************************  소득공제 종합한도 초과액  *******************************/  
          totlimitded =   houseded                                 /* 주택임차_대출기관                */
                        + houseded3                                /* 주택임차_거주자	                 */
                        + houseintded                              /* 장기주택저당차입금_15년미만      */
                        + houseintded2                             /* 장기주택저당차입금_30년미만      */
                        + houseintded3                             /* 장기주택저당차입금_30년이상      */
                        + houseintded4                             /* 장기주택저당차입금_고정금리      */
                        + houseintded5                             /* 장기주택저당차입금_기타대출      */
                        + 0                                        /* 소상공인(없음)                   */
                        + housvsubded                              /* 주택마련저축_청약저축            */
                        + housvcomded                              /* 주택마련저축_주택청약종합저축    */
                        + housvempded                              /* 주택마련저축_근로자주택마련저축  */
                        + investded2                               /* 2013 년 투자조합                 */
                        + investded3_splimitovded                  /* 2014 년 투자조합(개인 50,30은 제외)   */
                        + creditded                                /* 신용카드등 소득공제                   */
                        + costockded                               /* 우리사주조합소득공제                  */
                        + longfundded                              /* 장기집합투자증권저축                  */
                       ;
         
                                
          splimitovded = fmax((totlimitded - SPDEDLIMIT),0);
                  
   
/***************************  종합소득 과세표준  *******************************/             
          taxlevel   = chagamamt  
                     - incomeded                                        /*그밖의 소득공제*/
                     + splimitovded                                     /*소득공제 종합한도 초과액*/
                     ;
   
          if (taxlevel < 0 )
             taxlevel = 0;
             
/***************************  산출세액  *******************************/                          
          if (taxlevel == 0)
              calctax = 0;
          else
              calctax = GetTax(taxlevel);
          calctaxlimit = calctax;   /* 2015.01.12 하은영 산출세액에서 차감해야함 */
   
/***************************  근로소득 세액공제  *******************************/             
        /* 2014.12.22 하은영 근로소득 세액공제 산식 적용  
          2013년까지 사용
          if  (calctax < TAXDEDBASIC)
               incomtded = floor(calctax * TAXDEDBRATE / 100);
          else
               incomtded = floor((TAXDEDBASIC * TAXDEDBRATE /100) +
                           + (calctax - TAXDEDBASIC) * TAXDEDORATE / 100);                                                                   
   
          if  (incomtded > TAXDEDLIMIT)
               incomtded = TAXDEDLIMIT;  */
               
         
          /* 2015.05.12 eyha 근로소득세액공제 산식 폐기 - 산식 변경됨     
          if (taxgross <= TAXDEDSECT3) {
             incomtdedlimit = TAXDEDSLIMIT3;
          }else if  (taxgross <= TAXDEDSECT1) {
             incomtdedlimit = fmax(TAXDEDSLIMIT3-floor((taxgross-TAXDEDSECT3)*8/1000),TAXDEDSLIMIT1);   
          }else if  (taxgross <= TAXDEDSECT2) {
             incomtdedlimit = fmax(TAXDEDSLIMIT1-floor((taxgross-TAXDEDSECT1)*1/2),TAXDEDSLIMIT2);
          }else if  (taxgross >  TAXDEDSECT2) {
             incomtdedlimit = fmax(TAXDEDSLIMIT2-floor((taxgross-TAXDEDSECT2)*1/2),TAXDEDLIMIT  );
          }  */
                 
                         
          if (taxgross <= TAXDEDSECT1) {
             incomtdedlimit = TAXDEDSLIMIT1;
          }else if  (taxgross <= TAXDEDSECT2) {
             incomtdedlimit = fmax(TAXDEDSLIMIT1-floor((taxgross-TAXDEDSECT1)*0.008),TAXDEDSLIMIT2);
          }else if  (taxgross >  TAXDEDSECT2) {
             incomtdedlimit = fmax(TAXDEDSLIMIT2-floor((taxgross-TAXDEDSECT2)*0.5),TAXDEDLIMIT  );
          } 
          
                   
          if (calctax < TAXDEDBASIC) {
               incomtded = calctax * TAXDEDBRATE / 100;
          }else {
               incomtded = (TAXDEDBASIC * TAXDEDBRATE / 100) 
                         + (calctax - TAXDEDBASIC) * TAXDEDORATE /100 ;
          }
     
          incomtded    = fmin(incomtdedlimit,incomtded);
          incomtded    = floor(incomtded);                   /* 2015.02.09 하은영 소수점 처리-세액공제계에서 오류남 */ 
          incomtded    = fmin(calctaxlimit,incomtded);       /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-incomtded, 0);    /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
                         
                              
/***************************  자녀세액공제  *******************************/               
          //2014.12.22 하은영 자녀세액공제 수정 (1인:15, 2인:300, 3인이상 : 300000 + ((인원-2) * 300000)
          if ((manychildno == 1) || (manychildno == 2) ) 
            childtaxded = manychildno * FEWDED1;
          else if (manychildno > 2) 
            childtaxded = (2 * FEWDED1) + ((manychildno - 2) * FEWDED2);
          else
          {
            childtaxded = 0;
          }        

          childtaxded  = fmin(calctaxlimit,childtaxded);      /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-childtaxded, 0);   /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */


/***************************  6세이하(2자녀이상) 2015.05.06 eyha 추가 **************************/  
          if (childno > 1) 
            infanttaxded = (childno-1) * INFANTDED;          

          infanttaxded  = fmin(calctaxlimit,infanttaxded);      
          calctaxlimit  = fmax(calctaxlimit-infanttaxded, 0);   
          
          
/***************************  출산/입양 2015.05.06 eyha 추가    *******************************/  
          if (babyno > 0) 
            addbabytaxded = babyno * ADDBABYDED;
          

          addbabytaxded  = fmin(calctaxlimit,addbabytaxded);      
          calctaxlimit   = fmax(calctaxlimit-addbabytaxded, 0);   
            
               
/***************************  연금계좌 세액공제  *******************************/
      /* 2013.12.05.hjku 2013년 연말정산부터 특별공제로 옮겨짐 */    
      /* 2014.12.22 하은영 2014년 부터 세액공제로 옮겨짐 */
      /* ==========================================================================
         4.00       2001.12.14         유효성          연금저축 추가
      ============================================================================= */     
          npended = npenamt + npenamt2 ;
       
          if  (npended > NPENDEDLIMIT) 
               npended = NPENDEDLIMIT;      

          /* 2015.04.29 eyha 총급여 55백만원이하는 15%, 나머지는 12% */
          if (taxgross <= NPENLIMIT)
              npendtaxded  = floor(npended  * NPENRATE2 / 100);
          else               
              npendtaxded  = floor(npended  * NPENRATE  / 100);
                    
          npendtaxded  = fmin(calctaxlimit,npendtaxded);        /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-npendtaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */

          /* 2015.02.05 하은영 연금저축세액공제가 0이면 공제금액도 0처리  */    
          if  (npendtaxded <= 0) 
               npended = 0;      

/***************************  보장성보험료 특별세액공제  *******************************/               
/*2014.12.22 하은영 보장성보험료, 의료비, 교육비, 기부금 당해년도분은 특별소득공제에서 특별세액공제로 이동 */

          /*  보장성일반보험료 공제     */
          /* 2014.12.22 하은영 보장성보험료와 의료보험료를 소득공제와 세액공제로 분리 */
          guarded = guaramt;
          if  (guarded < INSDEDLIMIT)
               guarded = guaramt;
          else
               guarded = INSDEDLIMIT;     
          
          /*  장애인전용보험료 공제     */      
          obsguarded = obsguaramt;      
          if  (obsguarded > OBSDEDLIMIT)
               obsguarded = OBSDEDLIMIT;
          
                                        
          /*  보험료공제 = 일반보험료 + 장애인보험료   */
          insded = guarded + obsguarded ;
          
          /* 2014.12.22 하은영 일반보장성보험 세액공제 추가 */
          guartaxded   = floor(guarded  * SPECIALRATE1 / 100);           
          guartaxded   = fmin(calctaxlimit,guartaxded);        /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-guartaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
          
          /* 2015.05.06 eyha 장애보장성보험 세액공제 추가 */
          obsguartaxded= floor(obsguarded  * SPECIALRATE2 / 100);           
          obsguartaxded= fmin(calctaxlimit,obsguartaxded);        /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-obsguartaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
                    
          /*printf("[debug] : empno=%s,insded=%f ,guartaxded=%f ,SPECIALRATE1=%f ,SPECIALRATE2=%f  \n",empno,insded, guartaxded, SPECIALRATE1,SPECIALRATE2);            */

          
/***************************  의료비  *******************************/
          /*  과세급여액*MEDORATE를 초과하는 의료비중 MEDDEDLIMIT를 한도로 공제 ,
              but 장애자,경로우대자의료비가 있는 경우 추가로 공제 
              추가공제에 본인의료비(shosamt) 포함 2004년 귀속부터.   */
          hosamt = ghosamt + ohosamt + nhosamt + shosamt;          
          hosded = floor(hosamt - (taxgross  * MEDORATE /100));
      
          if  (hosded<0)
               hosded=0;                        
          
          if  (hosded > MEDDEDLIMIT)
               hosded = MEDDEDLIMIT;
   
          medappded_A = floor(hosamt - floor(taxgross * MEDORATE / 100) - MEDDEDLIMIT);
          if  (medappded_A < 0 ) 
               medappded_A = 0;
   
          medappded_B = ohosamt + nhosamt + shosamt;
          if  (medappded_A < medappded_B ) 
               hosded = floor(hosded + medappded_A);
          else
               hosded = floor(hosded + medappded_B);

          /* 장애인 의료비 공제금 계산 추가 2013.11 */ 
          obshosded = fmin(hosded,nhosamt); 
          
          /* 2014.12.22 하은영 의료비 세액공제 추가 */
          hostaxded    = floor(hosded  * SPECIALRATE2 / 100); 
          hostaxded    = fmin(calctaxlimit,hostaxded);        /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-hostaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
          
          

/***************************  교육비  *******************************/          
          /*  본인학자금 */
          seduded = seduamt;
                    
          /*PARKSH 수정 유치원 학자금 + 영유아학자금=>취학전아동교육비로 통합 */                          
          if  (keduamt > keduno * KINEDULIMIT)
               keduded = keduno * KINEDULIMIT;
          else
               keduded = keduamt;
          
          /*  초중고 학자금공제 */
          ceduded = ceduamt;
          if  (ceduamt > ceduno * CJKEDULIMIT)
               ceduded = ceduno * CJKEDULIMIT;
          else
               ceduded = ceduamt;

          /*  대학교육비 공제 */
          if  (ueduamt > ueduno*UNIEDULIMIT)
               ueduded = ueduno*UNIEDULIMIT;
          else
               ueduded = ueduamt;

   
          /* 장애인특수교육비 PARKSH 20021213 추가*/ 
          /*if (obseduamt > obseduno*OBSEDULIMIT)
              obseduded = obseduno*OBSEDULIMIT;
          else     */
          obseduded = obseduamt;   /*2004.12.  dsa2000  장애인특수교육비 한도 폐지.*/
    
              
          /* 교육비 공제 = 본인교육비 + 유치원교육비 + 초중고교육비+ 대학교육비 + 장애인특수교육비 */
          eduded  = seduded + keduded  + ceduded + ueduded + obseduded; /*parksh 200211213 수정 + keduded1 */
               
          /* 2014.12.22 하은영 교육비 세액공제 추가 */
          edutaxded    = floor(eduded  * SPECIALRATE2 / 100); 
          edutaxded    = fmin(calctaxlimit,edutaxded);        /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-edutaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
               
               
/***************************  기부금  *******************************/                                        
          /* 2014.12.12 하은영 기부금 산식 적용    */
          tdedsum_calc = calctax
                       - incomtded
                       - childtaxded
                       - infanttaxded - addbabytaxded                                        /*2015.05.05 eyha 추가*/ 
                       - (npendtaxded + guartaxded + obsguartaxded + hostaxded + edutaxded); /*2015.05.05 eyha 추가*/ 
        

        
          /* printf("[debug1] : empno=%s,agiveded=%f ,pgiveded2=%f ,pgiveded=%f  \n",empno,agiveded, pgiveded2, pgiveded);              */
        
          if (tdedsum_calc <= 0) 
          {
             polided1    = 0;
             polided2    = 0;
             agiveded    = 0;
             pgiveded2   = 0;
             pgiveded    = 0;
        
             giveded     = 0;
        
             politaxded1 = 0;
             politaxded2 = 0;
             agivetaxded = 0;
             pgivetaxded = 0;
          } else if (tdedsum_calc > 0) 
          {
            /* 정치자금 세액공제  */
            politaxded1  = fmin(tdedsum_calc, politaxded1);
            politaxded1  = fmin(calctax,politaxded1);   /* 2015.01.09 하은영 산출세액보다 작아야 함 */            
            tdedsum_calc = fmax((tdedsum_calc - politaxded1), 0);
        
            politaxded2  = fmin(tdedsum_calc, politaxded2);
            politaxded2  = fmin(calctax,politaxded2);   /* 2015.01.09 하은영 산출세액보다 작아야 함 */            
            tdedsum_calc = fmax((tdedsum_calc - politaxded2), 0);
        
            /* 법정, 기부금  세액공제  */
            if ((agiveded + pgiveded2 + pgiveded)  < GIVESLIMIT)    /* 3천만원 미만은 그냥 각각 15%  */
            {
               agivetaxded  =  fmax(floor(agiveded  * SPECIALRATE2 / 100), 0);
               pgivetaxded  =  fmax(floor((pgiveded2 + pgiveded)  * SPECIALRATE2 / 100),0);
            } else
            {    /* 3천만원까지 15%, 초과는 25%, 그리고 안분하기  */
               givetaxsum1 = agiveded + pgiveded2 + pgiveded;
               givetaxsum2 = floor(GIVESLIMIT  * SPECIALRATE2 / 100) + floor((givetaxsum1  - GIVESLIMIT)  * GIVESRATE / 100);
        
               agivetaxded =  floor(givetaxsum2  * (agiveded / givetaxsum1));
               pgivetaxded =  floor(givetaxsum2  * ((pgiveded2 + pgiveded) / givetaxsum1));
            }

            /* printf("[debug1] : empno=%s,agivetaxded=%f ,pgivetaxded=%f ,tdedsum_calc=%f  \n",empno,agivetaxded, pgivetaxded, tdedsum_calc);             */
        
        
            /* 2014.12.12 하은영  법정+지정 기부금으로 인해 결정세액이 0인 경우 안분 처리   */
            givetaxsum3 = agivetaxded +  pgivetaxded;
            if ((tdedsum_calc   < (agivetaxded + pgivetaxded) ) )
            {
              givetaxsum1 = agiveded + pgiveded2 + pgiveded;
              givetaxsum4 = givetaxsum3 - tdedsum_calc;
        
              /* 법정 세액공제  */
              givetaxsum5 = floor(givetaxsum4 * (agiveded / givetaxsum1));
              agivetaxded = fmax(agivetaxded - givetaxsum5, 0);
              tdedsum_calc = fmax((tdedsum_calc - agivetaxded), 0);

        
              /* 지정 세액공제  */
              /* 2015.01.12 하은영 결정세액 안분처리시에 1원 때문에 오류남으로 재수정  
              givetaxsum5 = floor(givetaxsum4 * ((pgiveded2 + pgiveded) / givetaxsum1));  
              pgivetaxded = fmax(pgivetaxded - givetaxsum5, 0);                           */
              pgivetaxded = tdedsum_calc;

              /* printf("[debug2] : empno=%s,givetaxsum1=%f, agiveded=%f, pgiveded2=%f, pgiveded=%f  \n",empno,givetaxsum1, agiveded, pgiveded2, pgiveded);               */
        
              /* 법정, 기부금  공제대상금액 안분처리  */
              givetaxsum3 = agivetaxded + pgivetaxded;
              givetaxsum6 = floor(GIVESLIMIT  * SPECIALRATE2 / 100);            
              if (givetaxsum3  < givetaxsum6)    /*  세액공제계가 4500000 이하면15%, 이상이면 15% / 25%  */
              {
                 givetaxsum5  = floor(givetaxsum3 / SPECIALRATE2 * 100);

                 /* printf("[debug3_1] : empno=%s,givetaxsum5=%f,givetaxsum1=%f    \n",empno, givetaxsum5, givetaxsum1);               */
        
                 agiveded     = fmax(floor(givetaxsum5 *  (agiveded  / givetaxsum1)), 0);
                 pgiveded2    = fmax(floor(givetaxsum5 *  (pgiveded2 / givetaxsum1)), 0);
                 pgiveded     = fmax(floor(givetaxsum5 *  (pgiveded  / givetaxsum1)), 0);
              } else    /* 3천만원까지 15%, 초과는 25%, 그리고 안분하기  */
              {
                 givetaxsum5  = floor(givetaxsum6 / SPECIALRATE2 * 100) +   
                                floor((givetaxsum3 - givetaxsum6) / GIVESRATE * 100)  ;

                 /*printf("[debug3_2] : empno=%s,givetaxsum5=%f,givetaxsum1=%f ,givetaxsum3=%f    \n",empno, givetaxsum5, givetaxsum1, givetaxsum3);               */

                 
                 agiveded     =  fmax(floor(givetaxsum5 *  (agiveded  / givetaxsum1)), 0);
                 pgiveded2    =  fmax(floor(givetaxsum5 *  (pgiveded2 / givetaxsum1)), 0);
                 pgiveded     =  fmax(floor(givetaxsum5 *  (pgiveded  / givetaxsum1)), 0);
              }
            }
            /* 2015.01.19 하은영 기부금공제 계를 기부금 세액공제 대상항목만 합산되도록 요청 - 지순미 과장
            giveded = polided1 + polided2 + agiveded +  spgivded + pgiveded + pgiveded2 + nagiveded + npgiveded + npgiveded2;  */

            giveded = polided2 + agiveded + spgivded + pgiveded + pgiveded2;
            
          }              
          calctaxlimit = fmax(calctaxlimit-politaxded1, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
          calctaxlimit = fmax(calctaxlimit-politaxded2, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
          calctaxlimit = fmax(calctaxlimit-agivetaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
          calctaxlimit = fmax(calctaxlimit-pgivetaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
               
               
/***************************  특별세액공제 계  *******************************/                         
          /* 2014.12.10 하은영 특별세액공제계  */
          /* 2015.05.06 eyha 장애보험세액공제 */
          taxdedsum = guartaxded + obsguartaxded + hostaxded + edutaxded + politaxded1 + politaxded2 + agivetaxded + pgivetaxded;
                                        
          
/***************************  재형저축세액공제  *******************************/                         
          /*  재형저축세액공제  2000년 삭제됨*/
          /*propded = floor((propamt1+propamt2+bpropamt)*PRODEDRATE / 100);*/
                         
                          
/***************************  주택차입금이자세액 공제  *******************************/                         
          /*  주택차입금이자세액 공제  */
          hloanded     = floor(hloanamt * HSINTRATE / 100);
          hloanded     = fmin(calctaxlimit,hloanded);        /* 2015.01.09 하은영 산출세액보다 작아야 함 */
          calctaxlimit = fmax(calctaxlimit-hloanded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
          
          
/***************************  주식저축공제  *******************************/                         
          /*  주식저축공제  2002 주식저축공제 없어짐.*/
                   /*stkded   = floor(stkamt * STKDEDRATE / 100);
                    if (stkded > STKDEDLIMIT)
                           stkded  = STKDEDLIMIT;*/
   
                /*2001.12.17 유효성          장기증권저축 추가
                     lstkded = floor(lstkamt * LSTKDEDRATE / 100) ;         dsa2000  2004년 폐지.*/               
                   /* parksh 20021213 추가 전년도 장기주식저축 공제 
                   olstkded = floor(olstkamt * OLSTKDEDRATE / 100);               dsa2000  2004년 폐지.*/
                     
                   /*tlstkded = lstkded + olstkded;   전년장기증권저축 + 당년 장기증권저축  dsa2000  2004년 폐지.*/

                             
/*************************** 외국납부세액공제  *******************************/                         
                   /*  외국납부세액공제한도:   국내근로소득금액 * 국외근로소득금액 / 근로소득금액  */
                   /*   외국납부세액공제  *************************************** */
          FORILIMIT = 0;
          if  (laborded > 0)
               FORILIMIT =  calctax * foritaxgross1 / laborded;
   
          if  (FORILIMIT  < foriamt)
               forided = FORILIMIT;
          else
               forided = foriamt;
          
/***************************  기타세액공제  *******************************/                         
          /*  기타세액공제
          etctded = etctamt;                */
   
    
/***************************  월세액   *******************************/                         
          /* 2014.12.22 하은영 특별공제에서 세액공제로 옮겨짐 */
          /* 월세액 */                               
          houserentded = fmin(HOUSERENTLIMIT2, houserentamt);
          
          houserenttaxded  = fmax(floor(houserentded * HOUSERENTRATE / 100),0);
          houserenttaxded  = fmin(calctaxlimit,houserenttaxded);   /* 2015.01.09 하은영 산출세액보다 작아야 함 */            

   
/***************************  표준세액공제  *******************************/                         
          /* 2014.12.22 하은영 표준세액공제 적용, 특별소득공제에서 세액공제로 옮김    */     
          /* 표준세액공제는 특별공제와, 특별세액공제, 월세 세액공제는 중복되지 않는다. 단 정치자금세액공제와 우리사주조합기부금은 중복가능 */
          /* 2014.12.24 정치자금 세액공제액은 중복적용됨에 따라서 적용, 우리사주조합기부금은 항목이 없음  */
          standded = 0 ;   
          if  (((specialded + taxdedsum + houserenttaxded) - (politaxded1 + politaxded2) ) < STDDED)
          {
          
               medded = hireded = houseded = houseded3     = 0;
               houseintded = houseintded2  = houseintded3  = houseintded4  = houseintded5  = 0;
               ngiveded = nagiveded = npgiveded = npgiveded2 = 0;
               
               agiveded = spgivded = pgiveded = pgiveded2 = 0;
               agivetaxded = pgivetaxded = 0;
               pgiveded_curr = pgiveded2_curr =0;

               guarded = obsguarded = insded = guartaxded = 0;
               hosded = obshosded =  hostaxded =0;
               seduded = keduded = ceduded = ueduded = obseduded = eduded = edutaxded = 0;
               specialded  = 0 ;  
               standded    = STDDED;
               houserentded = houserenttaxded = 0;
               
               
               /* 표준세액공제 적용함에 따라서 다시 차감소득금액, 과세표준, 산출세액, 근로소득 재계산 */
               /* 차감소득금액 */
               chagamamt = fmax(( laboramt
                                 -basicded
                                 -appendded
                                 -anuded
                                 -specialded), 0);
                                 
               /***************************  소득공제 종합한도 초과액  *******************************/  
               totlimitded =   houseded                                 /* 주택임차_대출기관                */
                             + houseded3                                /* 주택임차_거주자	                 */
                             + houseintded                              /* 장기주택저당차입금_15년미만      */
                             + houseintded2                             /* 장기주택저당차입금_30년미만      */
                             + houseintded3                             /* 장기주택저당차입금_30년이상      */
                             + houseintded4                             /* 장기주택저당차입금_고정금리      */
                             + houseintded5                             /* 장기주택저당차입금_기타대출      */
                             + 0                                        /* 소상공인(없음)                   */
                             + housvsubded                              /* 주택마련저축_청약저축            */
                             + housvcomded                              /* 주택마련저축_주택청약종합저축    */
                             + housvempded                              /* 주택마련저축_근로자주택마련저축  */
                             + investded2                               /* 2013 년 투자조합                 */
                             + investded3_splimitovded                  /* 2014 년 투자조합(개인 50,30은 제외)   */
                             + creditded                                /* 신용카드등 소득공제                   */
                             + costockded                               /* 우리사주조합소득공제                  */
                             + longfundded                              /* 장기집합투자증권저축                  */
                            ;
               
                                     
               splimitovded = fmax((totlimitded - SPDEDLIMIT),0);
                                 
                  
               /***************************  종합소득 과세표준  *******************************/             
               taxlevel   = chagamamt  
                          - incomeded                                        /*그밖의 소득공제*/
                          + splimitovded                                     /*소득공제 종합한도 초과액*/
                          ;
               
               if (taxlevel < 0 )
                  taxlevel = 0;
                            
               /***************************  산출세액  *******************************/                          
               if (taxlevel == 0)
                   calctax = 0;
               else
                   calctax = GetTax(taxlevel);
                  
               /***************************  근로소득 세액공제  *******************************/             
               /* 2015.05.06 eyha 근로소득세액공제 산식 변경     */          
               if (taxgross <= TAXDEDSECT1) {
                  incomtdedlimit = TAXDEDSLIMIT1;
               }else if  (taxgross <= TAXDEDSECT2) {
                  incomtdedlimit = fmax(TAXDEDSLIMIT1-floor((taxgross-TAXDEDSECT1)*0.008),TAXDEDSLIMIT2);
               }else if  (taxgross >  TAXDEDSECT2) {
                  incomtdedlimit = fmax(TAXDEDSLIMIT2-floor((taxgross-TAXDEDSECT2)*0.5),TAXDEDLIMIT  );
               } 
                                     
               if (calctax < TAXDEDBASIC) {
                    incomtded = calctax * TAXDEDBRATE / 100;
               }else {
                    incomtded = (TAXDEDBASIC * TAXDEDBRATE / 100) 
                              + (calctax - TAXDEDBASIC) * TAXDEDORATE /100 ;
               }               

               incomtded    = fmin(incomtdedlimit,incomtded);
               incomtded    = floor(incomtded);                   /* 2015.02.09 하은영 소수점 처리-세액공제계에서 오류남 */ 
               incomtded    = fmin(calctax,incomtded);            /* 2015.01.09 하은영 산출세액보다 작아야 함 */
               calctaxlimit = fmax(calctax-incomtded, 0);         /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
                 
                 
               /* 2015.05.06 eyha 자녀, 6세이하, 출생입양, 연금저축 처리 */
  
               if ((manychildno == 1) || (manychildno == 2) ) 
                 childtaxded = manychildno * FEWDED1;
               else if (manychildno > 2) 
                 childtaxded = (2 * FEWDED1) + ((manychildno - 2) * FEWDED2);
               else
               {
                 childtaxded = 0;
               }                  
               childtaxded  = fmin(calctaxlimit,childtaxded);      /* 2015.01.09 하은영 산출세액보다 작아야 함 */
               calctaxlimit = fmax(calctaxlimit-childtaxded, 0);   /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */


               if (childno > 1) 
                 infanttaxded = (childno-1) * INFANTDED;               
               infanttaxded  = fmin(calctaxlimit,infanttaxded);      
               calctaxlimit  = fmax(calctaxlimit-infanttaxded, 0);   
                              
               if (babyno > 0) 
                 addbabytaxded = babyno * ADDBABYDED;               
               addbabytaxded  = fmin(calctaxlimit,addbabytaxded);      
               calctaxlimit   = fmax(calctaxlimit-addbabytaxded, 0);   
            
               
               if (taxgross <= NPENLIMIT)
                   npendtaxded  = floor(npended  * NPENRATE2 / 100);
               else               
                   npendtaxded  = floor(npended  * NPENRATE  / 100);                    
               npendtaxded  = fmin(calctaxlimit,npendtaxded);        /* 2015.01.09 하은영 산출세액보다 작아야 함 */
               calctaxlimit = fmax(calctaxlimit-npendtaxded, 0);     /* 2015.01.09 하은영 산출세액에서 차감한 금액 비교 */
               if  (npendtaxded <= 0) 
                  npended = 0;      

                                  
               standded  = fmin(calctax,standded);   /* 2015.01.09 하은영 산출세액보다 작아야 함 */            
                 
               taxdedsum = guartaxded + obsguartaxded + hostaxded + edutaxded + politaxded1 + politaxded2 + agivetaxded + pgivetaxded;
               
               /* 2015.01.19 하은영 기부금공제 계를 기부금 세액공제 대상항목만 합산되도록 요청 - 지순미 과장
               giveded = polided1 + polided2 + agiveded +  spgivded + pgiveded + pgiveded2 + nagiveded + npgiveded + npgiveded2;  */

               giveded = polided2 + agiveded + spgivded + pgiveded + pgiveded2;
                                         
          }
   
   
/***************************  세액공제 합계  *******************************/                         
          /*세액공제 합계*/
          tdedsum = incomtded + childtaxded + infanttaxded + addbabytaxded  /*2015.05.06 eyha 추가*/              
                  + npendtaxded + taxdedsum + standded + hloanded + forided   
                  + etctded + houserenttaxded;  
   
   
                  
/***************************  결정세액 소득세  *******************************/                                           
          /* 소득세 / 주민세 */               
          if  (calctax - tdedsum > 0) 
          {
               dintax = floor((calctax - tdedsum) / 10) * 10;
               djutax = floor(dintax / 100) * 10 ;
          }                   
          else    
          {    
               dintax = 0 ;
               djutax = 0 ;    
          }
            
          
/***************************  농특세  *******************************/                                           
          /* 농특세 : 2014.12.15 하은영 농특세 변경  */           
          if  (hsrentinded > 0 || hloanded > 0 || tinvestded > 0 || longfundded > 0)   
          {
              dnongtaxlevel = fmax((chagamamt -(pended + housvsubded + housvcomded + housvempded + creditded + costockded )
                                              + fmax(splimitovded - investded2 - investded3_splimitovded - longfundded - hsrentinded,0)),0) ;
            
              dnongtax     = floor( ( hloanded + GetTax(dnongtaxlevel) - calctax) * NONGRATE / 100);
            
              if (dnongtax < 0) 
                dnongtax = 0;
              else 
                dnongtax = floor(dnongtax / 10) * 10;
          	
               /*2013.01.06.hjku 수정*/               
               /*
               dnongcalctax = GetTax(taxlevel - fmin(splimitovded,investded2));
               dnongtax = floor( ( hloanded + (GetTax(tinvestded + taxlevel -fmin(splimitovded,investded2)) - dnongcalctax)) * NONGRATE / 100) ;                
               */
               
              /* 2013년에 사용함       	
               dnongtax = floor( ( hloanded + (GetTax(tinvestded + taxlevel) - calctax)) * NONGRATE / 100) ;                
               dnongtax = floor(dnongtax / 10) * 10; 
              */ 
               
          }    
          else  dnongtax = 0 ;
            
          intax   = mintax   + bintax  + bintax1;
          jutax   = mjutax   + bjutax  + bjutax1;
          nongtax = mnongtax + bnongtax+ bnongtax1;
   
          yintax   = trunc((dintax - intax)/ 10) * 10;
          yjutax   = trunc((djutax - jutax)/ 10) * 10;
          ynongtax = trunc((dnongtax - nongtax)/ 10) * 10; 
          
          /*2013.01.21 hjku 차감징수액이 소액부징수(0<=??<1000)이면 0원처리 */
          if((yintax   >= 0)&&(yintax   < 1000)) {
            yintax   = 0;
            yjutax   = 0;
          }
          if((ynongtax >= 0)&&(ynongtax < 1000)) ynongtax = 0;            
   
          ycalctax = yintax + yjutax + ynongtax;
          
          ProcessRent();
          UpdateResult();
     }
}

ProcessRent()
{  
     double  temp_yloanded     = 0;     /* 거주자간 공제액 정산용 */
     double  temp_mrentcostded = 0;     /* 월세액 공제액 정산용 */

     yseq =  yloansum  = yloanded     = 0; 
     mseq =  mrentcost = mrentcostded = 0;
     	
     /* 재계산시 초기화 */	
     /* EXEC SQL
     UPDATE PKMYSRENT
        SET YLOANDED     = 0,
            MRENTCOSTDED = 0
      WHERE WORKYY   = (select workyy from pkcpbas) 
        AND EMPNO    = :empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 118;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMYSRENT  set YLOANDED=0,MRENTCOSTDED=0 where (\
WORKYY=(select workyy  from pkcpbas ) and EMPNO=:b0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1096;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)empno;
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


                  	
	   /* 주택임차원리금상환액_거주자간 개별 공제금 계산 update */	
     /* EXEC SQL DECLARE c2 CURSOR FOR
     SELECT SEQ,  YLOANSUM
       FROM PKMYSRENT            
      WHERE WORKYY = (select workyy from pkcpbas) 
        AND EMPNO  = :empno
        AND NVL(YRENTCOST,0) > 0
      ORDER BY SEQ; */ 

        
     /* EXEC    SQL OPEN c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 118;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0007;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1115;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)empno;
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


     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "거주자간 차입금 fetch Error1");  
          err_print(sqlca.sqlcode,"거주자간 차입금 fetch Error1");
          exit(1);
     }
     
     temp_yloanded = houseded3;
     
     while(1)
     {    
          /* EXEC SQL FETCH c2 INTO 
          :yseq, :yloansum; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 118;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1134;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&yseq;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&yloansum;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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


          
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {       
            Write_batlog(seqno++, "거주자간 차입금 기초자료 read Error");  
            err_print(sqlca.sqlcode,"거주자간 차입금 기초자료 read Error");
            exit(1);
          }
          
          if (sqlca.sqlcode == 1403)
          {
             /* EXEC SQL close c2; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 118;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )1157;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


             break;
          } 
          
          yloanded = fmin(floor(yloansum * HSRATE / 100),temp_yloanded);
          temp_yloanded = fmax(temp_yloanded - yloanded, 0);
          
          /* EXEC SQL
          UPDATE PKMYSRENT
             SET YLOANDED = :yloanded
           WHERE WORKYY   = (select workyy from pkcpbas) 
             AND EMPNO    = :empno
             AND SEQ      = :yseq; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 118;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMYSRENT  set YLOANDED=:b0 where ((WORKYY=\
(select workyy  from pkcpbas ) and EMPNO=:b1) and SEQ=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1172;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&yloanded;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
          sqlstm.sqhstv[2] = (unsigned char  *)&yseq;
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


             
          if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {  
               Write_batlog(seqno++, " 거주자간 차입금 공제금액 setting Error");  
               err_print(sqlca.sqlcode," 거주자간 차입금 공제금액 Setting Error");
               exit(1);
          }  
     }
     
     /* 월세액 개별 공제금 계산 update*/	
     /* EXEC SQL DECLARE c3 CURSOR FOR
     SELECT SEQ,  MRENTCOST
       FROM PKMYSRENT            
      WHERE WORKYY = (select workyy from pkcpbas) 
        AND EMPNO  = :empno
        AND NVL(MRENTCOST,0) > 0
      ORDER BY SEQ; */ 

     
     /* EXEC    SQL OPEN c3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 118;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0009;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1199;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)empno;
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


        
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "월세액 기초자료 fetch Error1");  
          err_print(sqlca.sqlcode,"월세액 기초자료 fetch Error1");
          exit(1);
     }
     
     temp_mrentcostded = houserentded;
     
     while(1)
     {
          
          /* EXEC SQL FETCH c3 INTO 
          :mseq, :mrentcost; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 118;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1218;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)&mseq;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&mrentcost;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
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


          
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {       
            Write_batlog(seqno++, "월세액 기초자료 read Error");  
            err_print(sqlca.sqlcode,"월세액 기초자료 read Error");
            exit(1);
          }
          
          if (sqlca.sqlcode == 1403)
          {
             /* EXEC SQL close c3; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 118;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )1241;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

                                       
             break;
          } 
          
          /* 2015.01.05 하은영 월세 세액공제 금액으로 수정 */
          /* mrentcostded = fmin(floor(mrentcost * HSRATE2 / 100),temp_mrentcostded);  */          
          mrentcostded = fmin(floor(mrentcost * HOUSERENTRATE / 100),floor(temp_mrentcostded * HOUSERENTRATE / 100) );
                    
          temp_mrentcostded = fmax(temp_mrentcostded - mrentcostded, 0);
          
          /* EXEC SQL
          UPDATE PKMYSRENT
             SET MRENTCOSTDED = :mrentcostded
           WHERE WORKYY   = (select workyy from pkcpbas) 
             AND EMPNO    = :empno
             AND SEQ      = :mseq; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 118;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMYSRENT  set MRENTCOSTDED=:b0 where ((WOR\
KYY=(select workyy  from pkcpbas ) and EMPNO=:b1) and SEQ=:b2)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1256;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&mrentcostded;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
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
          sqlstm.sqhstv[2] = (unsigned char  *)&mseq;
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


             
          if ( sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {  
               Write_batlog(seqno++, " 월세액 공제금액 setting Error");  
               err_print(sqlca.sqlcode," 월세액 공제금액 Setting Error");
               exit(1);
          } 
          
     }
}


/* =====================================================================
        계산결과를 수정합니다.
* ===================================================================== */

UpdateResult()
{  
  /* EXEC SQL
        UPDATE  PKMYSMAS
           SET
                LABORDED     = :laborded,
                LABORAMT     = :laboramt,
                SELFDED      = :selfded,
                MATEDED      = :mateded,
                FAMIDED      = :famided,
                BASICDED     = :basicded,
                OLDDED       = :oldded,
                OBSDED       = :obsded,
                WOMANDED     = :womanded,
                CHILDDED     = :childded,
                APPENDDED    = :appendded,
                FEWNO        = :fewno,
                FEWDED       = :fewded,
                SPARENTDED   = :sparentded,     /o2013.12  추가o/
                MEDDED       = :medded,
                HIREDED      = :hireded,
                GUARDED      = :guarded,
                OBSGUARDED   = :obsguarded,
                INSDED       = :insded,
                HOSAMT       = :hosamt,
                HOSDED       = :hosded,
                OBSHOSDED    = :obshosded,      /o2013.12  추가o/
                SEDUDED      = :seduded,
                KEDUDED      = :keduded,
                /oKEDUDED      = :keduded + :keduded1, /o2001.12.31 유효성 분리          o/
                /oKEDUDED1     = :keduded1, parksh 20021213막음 유치원,영유아교육비가 취학전아동비로 통합됨o/           
                CEDUDED      = :ceduded,
                UEDUDED      = :ueduded,
                EDUDED       = :eduded,
                HOUSEDED     = :houseded,
                HOUSEDED3    = :houseded3,  /o 2012.02 kth 주택자금 거주자 추가 o/
                HOUSEDED2    = :houseded2,
                HOUSEINTDED  = :houseintded,           
                HOUSEINTDED2 = :houseintded2,             
                HOUSEINTDED3 = :houseintded3,               
                HOUSEINTDED4 = :houseintded4, /o2012.12 hjku 추가o/               
                HOUSEINTDED5 = :houseintded5, /o2012.12 hjku 추가o/                             
                AGIVEDED     = :agiveded,
                PGIVEDED     = :pgiveded,
                PGIVEDED2    = :pgiveded2,
                POLITAXDED   = :politaxded,
                GIVEDED      = :giveded,
                SPECIALDED   = :specialded,
                STANDDED     = :standded, /o2001.12.26.유효성 추가 o/           
                ANUDED       = :anuded,
                PENDED       = :pended,
                NPENDED      = :npended,
                CREDITAMT    = :creditamt,
                CREDITDED    = :creditded,
                FOREIGNDED   = :foreignded,
                specaddded   = :specaddded,  /o Dsa2000 2004.12.  특별추가공제(결혼.장례.이사비 공제액), 정치자금세액공제 추가o/
                CHAGAMAMT    = :chagamamt,   /o2013.12  추가o/                
                polided      = :polided,
                OBSEDUDED    = :obseduded,
                OINVESTDED   = :oinvestded,
                INVESTDED    = :investded,    
                INVESTDED2   = :investded2,    /o2013.12  추가o/                       
                TINVESTDED   = :tinvestded,
                SPGIVDED     = :spgivded,     
                HSRENTINDED  = :hsrentinded,    /o2013.12  추가o/
                INCOMEDED    = :incomeded,
                SPLIMITOVDED = :splimitovded,   /o2013.12  추가o/
                NEPGIVEDED   = :nepgiveded,     /o2013.12  추가o/ 
                NEPGIVEDED2  = :nepgiveded2,    /o2013.12  추가o/ 
                TAXLEVEL     = :taxlevel,
                CALCTAX      = :calctax,
                INCOMTDED    = :incomtded,
                HLOANDED     = :hloanded,
                COSTOCKDED   = :costockded,
                /oPROPDED      = :propded,o/
                /oSTKDED       = :stkded, /o2002.12.16 유효성 주식저축공제 삭제o/           
                /oLSTKDED      = :lstkded, o/
                /oOLSTKDED  = :olstkded,   /o -------parksh 20021213 추가----- o/
                /oTLSTKDED     = :tlstkded, o/           
                FORIDED      = :forided,
                ETCTDED      = :etctded,
                TDEDSUM      = :tdedsum,
                DINTAX       = :dintax,
                DJUTAX       = :djutax,
                DNONGTAX     = :dnongtax,
                INTAX        = :intax,
                JUTAX        = :jutax,
                NONGTAX      = :nongtax,
                YINTAX       = :yintax,
                YJUTAX       = :yjutax,
                YNONGTAX     = :ynongtax,
                YCALCTAX     = :ycalctax,
                SUBDATE      = :log_subdate,   /odsa2000  2005.01. 추가o/           
                WRITEMAN     = :writeman,
                WRITETIME    = to_char(sysdate,'yyyymmddhh24miss'),           
                BABYDED      = :babyded,
                FUNDDED      = :fundded,  
                HOUSERENTDED = :houserentded, 
                HOUSVSUBDED  = :housvsubded,
                HOUSVEMPDED  = :housvempded, 
                HOUSVCOMDED  = :housvcomded,
/o 2014.12.22 하은영 삭제           
                NAGIVEAMT    = :nagiveamt,
                NPGIVEAMT    = :npgiveamt, 
                NPGIVEAMT2   = :npgiveamt2,       o/
                NAGIVEDED    = :nagiveded          ,  /o2014.12.22 하은영 추가 o/
                NPGIVEDED    = :npgiveded          ,  
                NPGIVEDED2   = :npgiveded2         ,  
                NGIVEDED     = :ngiveded           ,  
                INVESTDED3   = :investded3         ,  
                LONGFUNDDED  = :longfundded        ,  
                CHILDTAXDED  = :childtaxded        ,  
                NPENDTAXDED  = :npendtaxded        ,  
                GUARTAXDED   = :guartaxded         ,  
                HOSTAXDED    = :hostaxded          ,  
                EDUTAXDED    = :edutaxded          ,  
                POLIDED1     = :polided1           ,  
                POLIDED2     = :polided2           ,  
                POLITAXDED1  = :politaxded1        ,  
                POLITAXDED2  = :politaxded2        ,  
                AGIVETAXDED  = :agivetaxded        ,  
                PGIVETAXDED  = :pgivetaxded        ,  
                TAXDEDSUM    = :taxdedsum          ,   
                HOUSERENTTAXDED = :houserenttaxded ,
                INFANTTAXDED    = :infanttaxded    ,  /o2015.05.06 eyha 추가 o/
                ADDBABYTAXDED   = :addbabytaxded   ,  /o2015.05.06 eyha 추가 o/  
                OBSGUARTAXDED   = :obsguartaxded      /o2015.05.06 eyha 추가 o/                                                    
         WHERE  EMPNO = :empno; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 12;
  sqlstm.arrsiz = 118;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlbuft((void **)0,
    "update PKMYSMAS  set LABORDED=:b0,LABORAMT=:b1,SELFDED=:b2,MATEDED=:b3,\
FAMIDED=:b4,BASICDED=:b5,OLDDED=:b6,OBSDED=:b7,WOMANDED=:b8,CHILDDED=:b9,APP\
ENDDED=:b10,FEWNO=:b11,FEWDED=:b12,SPARENTDED=:b13,MEDDED=:b14,HIREDED=:b15,\
GUARDED=:b16,OBSGUARDED=:b17,INSDED=:b18,HOSAMT=:b19,HOSDED=:b20,OBSHOSDED=:\
b21,SEDUDED=:b22,KEDUDED=:b23,CEDUDED=:b24,UEDUDED=:b25,EDUDED=:b26,HOUSEDED\
=:b27,HOUSEDED3=:b28,HOUSEDED2=:b29,HOUSEINTDED=:b30,HOUSEINTDED2=:b31,HOUSE\
INTDED3=:b32,HOUSEINTDED4=:b33,HOUSEINTDED5=:b34,AGIVEDED=:b35,PGIVEDED=:b36\
,PGIVEDED2=:b37,POLITAXDED=:b38,GIVEDED=:b39,SPECIALDED=:b40,STANDDED=:b41,A\
NUDED=:b42,PENDED=:b43,NPENDED=:b44,CREDITAMT=:b45,CREDITDED=:b46,FOREIGNDED\
=:b47,specaddded=:b48,CHAGAMAMT=:b49,polided=:b50,OBSEDUDED=:b51,OINVESTDED=\
:b52,INVESTDED=:b53,INVESTDED2=:b54,TINVESTDED=:b55,SPGIVDED=:b56,HSRENTINDE\
D=:b57,INCOMEDED=:b58,SPLIMITOVDED=:b59,NEPGIVEDED=:b60,NEPGIVEDED2=:b61,TAX\
LEVEL=:b62,CALCTAX=:b63,INCOMTDED=:b64,HLOANDED=:b65,COSTOCKDED=:b66,FORIDED\
=:b67,ETCTDED=:b68,TDEDSUM=:b69,DINTAX=:b");
  sqlstm.stmt = "70,DJUTAX=:b71,DNONGTAX=:b72,INTAX=:b73,JUTAX=:b74,NONGTAX\
=:b75,YINTAX=:b76,YJUTAX=:b77,YNONGTAX=:b78,YCALCTAX=:b79,SUBDATE=:b80,WRITEM\
AN=:b81,WRITETIME=to_char(sysdate,'yyyymmddhh24miss'),BABYDED=:b82,FUNDDED=:b\
83,HOUSERENTDED=:b84,HOUSVSUBDED=:b85,HOUSVEMPDED=:b86,HOUSVCOMDED=:b87,NAGIV\
EDED=:b88,NPGIVEDED=:b89,NPGIVEDED2=:b90,NGIVEDED=:b91,INVESTDED3=:b92,LONGFU\
NDDED=:b93,CHILDTAXDED=:b94,NPENDTAXDED=:b95,GUARTAXDED=:b96,HOSTAXDED=:b97,E\
DUTAXDED=:b98,POLIDED1=:b99,POLIDED2=:b100,POLITAXDED1=:b101,POLITAXDED2=:b10\
2,AGIVETAXDED=:b103,PGIVETAXDED=:b104,TAXDEDSUM=:b105,HOUSERENTTAXDED=:b106,I\
NFANTTAXDED=:b107,ADDBABYTAXDED=:b108,OBSGUARTAXDED=:b109 where EMPNO=:b110";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )1283;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)4352;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (unsigned char  *)&laborded;
  sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         short *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned long )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (unsigned char  *)&laboramt;
  sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[1] = (         int  )0;
  sqlstm.sqindv[1] = (         short *)0;
  sqlstm.sqinds[1] = (         int  )0;
  sqlstm.sqharm[1] = (unsigned long )0;
  sqlstm.sqadto[1] = (unsigned short )0;
  sqlstm.sqtdso[1] = (unsigned short )0;
  sqlstm.sqhstv[2] = (unsigned char  *)&selfded;
  sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[2] = (         int  )0;
  sqlstm.sqindv[2] = (         short *)0;
  sqlstm.sqinds[2] = (         int  )0;
  sqlstm.sqharm[2] = (unsigned long )0;
  sqlstm.sqadto[2] = (unsigned short )0;
  sqlstm.sqtdso[2] = (unsigned short )0;
  sqlstm.sqhstv[3] = (unsigned char  *)&mateded;
  sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[3] = (         int  )0;
  sqlstm.sqindv[3] = (         short *)0;
  sqlstm.sqinds[3] = (         int  )0;
  sqlstm.sqharm[3] = (unsigned long )0;
  sqlstm.sqadto[3] = (unsigned short )0;
  sqlstm.sqtdso[3] = (unsigned short )0;
  sqlstm.sqhstv[4] = (unsigned char  *)&famided;
  sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[4] = (         int  )0;
  sqlstm.sqindv[4] = (         short *)0;
  sqlstm.sqinds[4] = (         int  )0;
  sqlstm.sqharm[4] = (unsigned long )0;
  sqlstm.sqadto[4] = (unsigned short )0;
  sqlstm.sqtdso[4] = (unsigned short )0;
  sqlstm.sqhstv[5] = (unsigned char  *)&basicded;
  sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[5] = (         int  )0;
  sqlstm.sqindv[5] = (         short *)0;
  sqlstm.sqinds[5] = (         int  )0;
  sqlstm.sqharm[5] = (unsigned long )0;
  sqlstm.sqadto[5] = (unsigned short )0;
  sqlstm.sqtdso[5] = (unsigned short )0;
  sqlstm.sqhstv[6] = (unsigned char  *)&oldded;
  sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[6] = (         int  )0;
  sqlstm.sqindv[6] = (         short *)0;
  sqlstm.sqinds[6] = (         int  )0;
  sqlstm.sqharm[6] = (unsigned long )0;
  sqlstm.sqadto[6] = (unsigned short )0;
  sqlstm.sqtdso[6] = (unsigned short )0;
  sqlstm.sqhstv[7] = (unsigned char  *)&obsded;
  sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[7] = (         int  )0;
  sqlstm.sqindv[7] = (         short *)0;
  sqlstm.sqinds[7] = (         int  )0;
  sqlstm.sqharm[7] = (unsigned long )0;
  sqlstm.sqadto[7] = (unsigned short )0;
  sqlstm.sqtdso[7] = (unsigned short )0;
  sqlstm.sqhstv[8] = (unsigned char  *)&womanded;
  sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[8] = (         int  )0;
  sqlstm.sqindv[8] = (         short *)0;
  sqlstm.sqinds[8] = (         int  )0;
  sqlstm.sqharm[8] = (unsigned long )0;
  sqlstm.sqadto[8] = (unsigned short )0;
  sqlstm.sqtdso[8] = (unsigned short )0;
  sqlstm.sqhstv[9] = (unsigned char  *)&childded;
  sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[9] = (         int  )0;
  sqlstm.sqindv[9] = (         short *)0;
  sqlstm.sqinds[9] = (         int  )0;
  sqlstm.sqharm[9] = (unsigned long )0;
  sqlstm.sqadto[9] = (unsigned short )0;
  sqlstm.sqtdso[9] = (unsigned short )0;
  sqlstm.sqhstv[10] = (unsigned char  *)&appendded;
  sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[10] = (         int  )0;
  sqlstm.sqindv[10] = (         short *)0;
  sqlstm.sqinds[10] = (         int  )0;
  sqlstm.sqharm[10] = (unsigned long )0;
  sqlstm.sqadto[10] = (unsigned short )0;
  sqlstm.sqtdso[10] = (unsigned short )0;
  sqlstm.sqhstv[11] = (unsigned char  *)&fewno;
  sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[11] = (         int  )0;
  sqlstm.sqindv[11] = (         short *)0;
  sqlstm.sqinds[11] = (         int  )0;
  sqlstm.sqharm[11] = (unsigned long )0;
  sqlstm.sqadto[11] = (unsigned short )0;
  sqlstm.sqtdso[11] = (unsigned short )0;
  sqlstm.sqhstv[12] = (unsigned char  *)&fewded;
  sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[12] = (         int  )0;
  sqlstm.sqindv[12] = (         short *)0;
  sqlstm.sqinds[12] = (         int  )0;
  sqlstm.sqharm[12] = (unsigned long )0;
  sqlstm.sqadto[12] = (unsigned short )0;
  sqlstm.sqtdso[12] = (unsigned short )0;
  sqlstm.sqhstv[13] = (unsigned char  *)&sparentded;
  sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[13] = (         int  )0;
  sqlstm.sqindv[13] = (         short *)0;
  sqlstm.sqinds[13] = (         int  )0;
  sqlstm.sqharm[13] = (unsigned long )0;
  sqlstm.sqadto[13] = (unsigned short )0;
  sqlstm.sqtdso[13] = (unsigned short )0;
  sqlstm.sqhstv[14] = (unsigned char  *)&medded;
  sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[14] = (         int  )0;
  sqlstm.sqindv[14] = (         short *)0;
  sqlstm.sqinds[14] = (         int  )0;
  sqlstm.sqharm[14] = (unsigned long )0;
  sqlstm.sqadto[14] = (unsigned short )0;
  sqlstm.sqtdso[14] = (unsigned short )0;
  sqlstm.sqhstv[15] = (unsigned char  *)&hireded;
  sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[15] = (         int  )0;
  sqlstm.sqindv[15] = (         short *)0;
  sqlstm.sqinds[15] = (         int  )0;
  sqlstm.sqharm[15] = (unsigned long )0;
  sqlstm.sqadto[15] = (unsigned short )0;
  sqlstm.sqtdso[15] = (unsigned short )0;
  sqlstm.sqhstv[16] = (unsigned char  *)&guarded;
  sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[16] = (         int  )0;
  sqlstm.sqindv[16] = (         short *)0;
  sqlstm.sqinds[16] = (         int  )0;
  sqlstm.sqharm[16] = (unsigned long )0;
  sqlstm.sqadto[16] = (unsigned short )0;
  sqlstm.sqtdso[16] = (unsigned short )0;
  sqlstm.sqhstv[17] = (unsigned char  *)&obsguarded;
  sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[17] = (         int  )0;
  sqlstm.sqindv[17] = (         short *)0;
  sqlstm.sqinds[17] = (         int  )0;
  sqlstm.sqharm[17] = (unsigned long )0;
  sqlstm.sqadto[17] = (unsigned short )0;
  sqlstm.sqtdso[17] = (unsigned short )0;
  sqlstm.sqhstv[18] = (unsigned char  *)&insded;
  sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[18] = (         int  )0;
  sqlstm.sqindv[18] = (         short *)0;
  sqlstm.sqinds[18] = (         int  )0;
  sqlstm.sqharm[18] = (unsigned long )0;
  sqlstm.sqadto[18] = (unsigned short )0;
  sqlstm.sqtdso[18] = (unsigned short )0;
  sqlstm.sqhstv[19] = (unsigned char  *)&hosamt;
  sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[19] = (         int  )0;
  sqlstm.sqindv[19] = (         short *)0;
  sqlstm.sqinds[19] = (         int  )0;
  sqlstm.sqharm[19] = (unsigned long )0;
  sqlstm.sqadto[19] = (unsigned short )0;
  sqlstm.sqtdso[19] = (unsigned short )0;
  sqlstm.sqhstv[20] = (unsigned char  *)&hosded;
  sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[20] = (         int  )0;
  sqlstm.sqindv[20] = (         short *)0;
  sqlstm.sqinds[20] = (         int  )0;
  sqlstm.sqharm[20] = (unsigned long )0;
  sqlstm.sqadto[20] = (unsigned short )0;
  sqlstm.sqtdso[20] = (unsigned short )0;
  sqlstm.sqhstv[21] = (unsigned char  *)&obshosded;
  sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[21] = (         int  )0;
  sqlstm.sqindv[21] = (         short *)0;
  sqlstm.sqinds[21] = (         int  )0;
  sqlstm.sqharm[21] = (unsigned long )0;
  sqlstm.sqadto[21] = (unsigned short )0;
  sqlstm.sqtdso[21] = (unsigned short )0;
  sqlstm.sqhstv[22] = (unsigned char  *)&seduded;
  sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[22] = (         int  )0;
  sqlstm.sqindv[22] = (         short *)0;
  sqlstm.sqinds[22] = (         int  )0;
  sqlstm.sqharm[22] = (unsigned long )0;
  sqlstm.sqadto[22] = (unsigned short )0;
  sqlstm.sqtdso[22] = (unsigned short )0;
  sqlstm.sqhstv[23] = (unsigned char  *)&keduded;
  sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[23] = (         int  )0;
  sqlstm.sqindv[23] = (         short *)0;
  sqlstm.sqinds[23] = (         int  )0;
  sqlstm.sqharm[23] = (unsigned long )0;
  sqlstm.sqadto[23] = (unsigned short )0;
  sqlstm.sqtdso[23] = (unsigned short )0;
  sqlstm.sqhstv[24] = (unsigned char  *)&ceduded;
  sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[24] = (         int  )0;
  sqlstm.sqindv[24] = (         short *)0;
  sqlstm.sqinds[24] = (         int  )0;
  sqlstm.sqharm[24] = (unsigned long )0;
  sqlstm.sqadto[24] = (unsigned short )0;
  sqlstm.sqtdso[24] = (unsigned short )0;
  sqlstm.sqhstv[25] = (unsigned char  *)&ueduded;
  sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[25] = (         int  )0;
  sqlstm.sqindv[25] = (         short *)0;
  sqlstm.sqinds[25] = (         int  )0;
  sqlstm.sqharm[25] = (unsigned long )0;
  sqlstm.sqadto[25] = (unsigned short )0;
  sqlstm.sqtdso[25] = (unsigned short )0;
  sqlstm.sqhstv[26] = (unsigned char  *)&eduded;
  sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[26] = (         int  )0;
  sqlstm.sqindv[26] = (         short *)0;
  sqlstm.sqinds[26] = (         int  )0;
  sqlstm.sqharm[26] = (unsigned long )0;
  sqlstm.sqadto[26] = (unsigned short )0;
  sqlstm.sqtdso[26] = (unsigned short )0;
  sqlstm.sqhstv[27] = (unsigned char  *)&houseded;
  sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[27] = (         int  )0;
  sqlstm.sqindv[27] = (         short *)0;
  sqlstm.sqinds[27] = (         int  )0;
  sqlstm.sqharm[27] = (unsigned long )0;
  sqlstm.sqadto[27] = (unsigned short )0;
  sqlstm.sqtdso[27] = (unsigned short )0;
  sqlstm.sqhstv[28] = (unsigned char  *)&houseded3;
  sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[28] = (         int  )0;
  sqlstm.sqindv[28] = (         short *)0;
  sqlstm.sqinds[28] = (         int  )0;
  sqlstm.sqharm[28] = (unsigned long )0;
  sqlstm.sqadto[28] = (unsigned short )0;
  sqlstm.sqtdso[28] = (unsigned short )0;
  sqlstm.sqhstv[29] = (unsigned char  *)&houseded2;
  sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[29] = (         int  )0;
  sqlstm.sqindv[29] = (         short *)0;
  sqlstm.sqinds[29] = (         int  )0;
  sqlstm.sqharm[29] = (unsigned long )0;
  sqlstm.sqadto[29] = (unsigned short )0;
  sqlstm.sqtdso[29] = (unsigned short )0;
  sqlstm.sqhstv[30] = (unsigned char  *)&houseintded;
  sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[30] = (         int  )0;
  sqlstm.sqindv[30] = (         short *)0;
  sqlstm.sqinds[30] = (         int  )0;
  sqlstm.sqharm[30] = (unsigned long )0;
  sqlstm.sqadto[30] = (unsigned short )0;
  sqlstm.sqtdso[30] = (unsigned short )0;
  sqlstm.sqhstv[31] = (unsigned char  *)&houseintded2;
  sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[31] = (         int  )0;
  sqlstm.sqindv[31] = (         short *)0;
  sqlstm.sqinds[31] = (         int  )0;
  sqlstm.sqharm[31] = (unsigned long )0;
  sqlstm.sqadto[31] = (unsigned short )0;
  sqlstm.sqtdso[31] = (unsigned short )0;
  sqlstm.sqhstv[32] = (unsigned char  *)&houseintded3;
  sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[32] = (         int  )0;
  sqlstm.sqindv[32] = (         short *)0;
  sqlstm.sqinds[32] = (         int  )0;
  sqlstm.sqharm[32] = (unsigned long )0;
  sqlstm.sqadto[32] = (unsigned short )0;
  sqlstm.sqtdso[32] = (unsigned short )0;
  sqlstm.sqhstv[33] = (unsigned char  *)&houseintded4;
  sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[33] = (         int  )0;
  sqlstm.sqindv[33] = (         short *)0;
  sqlstm.sqinds[33] = (         int  )0;
  sqlstm.sqharm[33] = (unsigned long )0;
  sqlstm.sqadto[33] = (unsigned short )0;
  sqlstm.sqtdso[33] = (unsigned short )0;
  sqlstm.sqhstv[34] = (unsigned char  *)&houseintded5;
  sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[34] = (         int  )0;
  sqlstm.sqindv[34] = (         short *)0;
  sqlstm.sqinds[34] = (         int  )0;
  sqlstm.sqharm[34] = (unsigned long )0;
  sqlstm.sqadto[34] = (unsigned short )0;
  sqlstm.sqtdso[34] = (unsigned short )0;
  sqlstm.sqhstv[35] = (unsigned char  *)&agiveded;
  sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[35] = (         int  )0;
  sqlstm.sqindv[35] = (         short *)0;
  sqlstm.sqinds[35] = (         int  )0;
  sqlstm.sqharm[35] = (unsigned long )0;
  sqlstm.sqadto[35] = (unsigned short )0;
  sqlstm.sqtdso[35] = (unsigned short )0;
  sqlstm.sqhstv[36] = (unsigned char  *)&pgiveded;
  sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[36] = (         int  )0;
  sqlstm.sqindv[36] = (         short *)0;
  sqlstm.sqinds[36] = (         int  )0;
  sqlstm.sqharm[36] = (unsigned long )0;
  sqlstm.sqadto[36] = (unsigned short )0;
  sqlstm.sqtdso[36] = (unsigned short )0;
  sqlstm.sqhstv[37] = (unsigned char  *)&pgiveded2;
  sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[37] = (         int  )0;
  sqlstm.sqindv[37] = (         short *)0;
  sqlstm.sqinds[37] = (         int  )0;
  sqlstm.sqharm[37] = (unsigned long )0;
  sqlstm.sqadto[37] = (unsigned short )0;
  sqlstm.sqtdso[37] = (unsigned short )0;
  sqlstm.sqhstv[38] = (unsigned char  *)&politaxded;
  sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[38] = (         int  )0;
  sqlstm.sqindv[38] = (         short *)0;
  sqlstm.sqinds[38] = (         int  )0;
  sqlstm.sqharm[38] = (unsigned long )0;
  sqlstm.sqadto[38] = (unsigned short )0;
  sqlstm.sqtdso[38] = (unsigned short )0;
  sqlstm.sqhstv[39] = (unsigned char  *)&giveded;
  sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[39] = (         int  )0;
  sqlstm.sqindv[39] = (         short *)0;
  sqlstm.sqinds[39] = (         int  )0;
  sqlstm.sqharm[39] = (unsigned long )0;
  sqlstm.sqadto[39] = (unsigned short )0;
  sqlstm.sqtdso[39] = (unsigned short )0;
  sqlstm.sqhstv[40] = (unsigned char  *)&specialded;
  sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[40] = (         int  )0;
  sqlstm.sqindv[40] = (         short *)0;
  sqlstm.sqinds[40] = (         int  )0;
  sqlstm.sqharm[40] = (unsigned long )0;
  sqlstm.sqadto[40] = (unsigned short )0;
  sqlstm.sqtdso[40] = (unsigned short )0;
  sqlstm.sqhstv[41] = (unsigned char  *)&standded;
  sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[41] = (         int  )0;
  sqlstm.sqindv[41] = (         short *)0;
  sqlstm.sqinds[41] = (         int  )0;
  sqlstm.sqharm[41] = (unsigned long )0;
  sqlstm.sqadto[41] = (unsigned short )0;
  sqlstm.sqtdso[41] = (unsigned short )0;
  sqlstm.sqhstv[42] = (unsigned char  *)&anuded;
  sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[42] = (         int  )0;
  sqlstm.sqindv[42] = (         short *)0;
  sqlstm.sqinds[42] = (         int  )0;
  sqlstm.sqharm[42] = (unsigned long )0;
  sqlstm.sqadto[42] = (unsigned short )0;
  sqlstm.sqtdso[42] = (unsigned short )0;
  sqlstm.sqhstv[43] = (unsigned char  *)&pended;
  sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[43] = (         int  )0;
  sqlstm.sqindv[43] = (         short *)0;
  sqlstm.sqinds[43] = (         int  )0;
  sqlstm.sqharm[43] = (unsigned long )0;
  sqlstm.sqadto[43] = (unsigned short )0;
  sqlstm.sqtdso[43] = (unsigned short )0;
  sqlstm.sqhstv[44] = (unsigned char  *)&npended;
  sqlstm.sqhstl[44] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[44] = (         int  )0;
  sqlstm.sqindv[44] = (         short *)0;
  sqlstm.sqinds[44] = (         int  )0;
  sqlstm.sqharm[44] = (unsigned long )0;
  sqlstm.sqadto[44] = (unsigned short )0;
  sqlstm.sqtdso[44] = (unsigned short )0;
  sqlstm.sqhstv[45] = (unsigned char  *)&creditamt;
  sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[45] = (         int  )0;
  sqlstm.sqindv[45] = (         short *)0;
  sqlstm.sqinds[45] = (         int  )0;
  sqlstm.sqharm[45] = (unsigned long )0;
  sqlstm.sqadto[45] = (unsigned short )0;
  sqlstm.sqtdso[45] = (unsigned short )0;
  sqlstm.sqhstv[46] = (unsigned char  *)&creditded;
  sqlstm.sqhstl[46] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[46] = (         int  )0;
  sqlstm.sqindv[46] = (         short *)0;
  sqlstm.sqinds[46] = (         int  )0;
  sqlstm.sqharm[46] = (unsigned long )0;
  sqlstm.sqadto[46] = (unsigned short )0;
  sqlstm.sqtdso[46] = (unsigned short )0;
  sqlstm.sqhstv[47] = (unsigned char  *)&foreignded;
  sqlstm.sqhstl[47] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[47] = (         int  )0;
  sqlstm.sqindv[47] = (         short *)0;
  sqlstm.sqinds[47] = (         int  )0;
  sqlstm.sqharm[47] = (unsigned long )0;
  sqlstm.sqadto[47] = (unsigned short )0;
  sqlstm.sqtdso[47] = (unsigned short )0;
  sqlstm.sqhstv[48] = (unsigned char  *)&specaddded;
  sqlstm.sqhstl[48] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[48] = (         int  )0;
  sqlstm.sqindv[48] = (         short *)0;
  sqlstm.sqinds[48] = (         int  )0;
  sqlstm.sqharm[48] = (unsigned long )0;
  sqlstm.sqadto[48] = (unsigned short )0;
  sqlstm.sqtdso[48] = (unsigned short )0;
  sqlstm.sqhstv[49] = (unsigned char  *)&chagamamt;
  sqlstm.sqhstl[49] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[49] = (         int  )0;
  sqlstm.sqindv[49] = (         short *)0;
  sqlstm.sqinds[49] = (         int  )0;
  sqlstm.sqharm[49] = (unsigned long )0;
  sqlstm.sqadto[49] = (unsigned short )0;
  sqlstm.sqtdso[49] = (unsigned short )0;
  sqlstm.sqhstv[50] = (unsigned char  *)&polided;
  sqlstm.sqhstl[50] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[50] = (         int  )0;
  sqlstm.sqindv[50] = (         short *)0;
  sqlstm.sqinds[50] = (         int  )0;
  sqlstm.sqharm[50] = (unsigned long )0;
  sqlstm.sqadto[50] = (unsigned short )0;
  sqlstm.sqtdso[50] = (unsigned short )0;
  sqlstm.sqhstv[51] = (unsigned char  *)&obseduded;
  sqlstm.sqhstl[51] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[51] = (         int  )0;
  sqlstm.sqindv[51] = (         short *)0;
  sqlstm.sqinds[51] = (         int  )0;
  sqlstm.sqharm[51] = (unsigned long )0;
  sqlstm.sqadto[51] = (unsigned short )0;
  sqlstm.sqtdso[51] = (unsigned short )0;
  sqlstm.sqhstv[52] = (unsigned char  *)&oinvestded;
  sqlstm.sqhstl[52] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[52] = (         int  )0;
  sqlstm.sqindv[52] = (         short *)0;
  sqlstm.sqinds[52] = (         int  )0;
  sqlstm.sqharm[52] = (unsigned long )0;
  sqlstm.sqadto[52] = (unsigned short )0;
  sqlstm.sqtdso[52] = (unsigned short )0;
  sqlstm.sqhstv[53] = (unsigned char  *)&investded;
  sqlstm.sqhstl[53] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[53] = (         int  )0;
  sqlstm.sqindv[53] = (         short *)0;
  sqlstm.sqinds[53] = (         int  )0;
  sqlstm.sqharm[53] = (unsigned long )0;
  sqlstm.sqadto[53] = (unsigned short )0;
  sqlstm.sqtdso[53] = (unsigned short )0;
  sqlstm.sqhstv[54] = (unsigned char  *)&investded2;
  sqlstm.sqhstl[54] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[54] = (         int  )0;
  sqlstm.sqindv[54] = (         short *)0;
  sqlstm.sqinds[54] = (         int  )0;
  sqlstm.sqharm[54] = (unsigned long )0;
  sqlstm.sqadto[54] = (unsigned short )0;
  sqlstm.sqtdso[54] = (unsigned short )0;
  sqlstm.sqhstv[55] = (unsigned char  *)&tinvestded;
  sqlstm.sqhstl[55] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[55] = (         int  )0;
  sqlstm.sqindv[55] = (         short *)0;
  sqlstm.sqinds[55] = (         int  )0;
  sqlstm.sqharm[55] = (unsigned long )0;
  sqlstm.sqadto[55] = (unsigned short )0;
  sqlstm.sqtdso[55] = (unsigned short )0;
  sqlstm.sqhstv[56] = (unsigned char  *)&spgivded;
  sqlstm.sqhstl[56] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[56] = (         int  )0;
  sqlstm.sqindv[56] = (         short *)0;
  sqlstm.sqinds[56] = (         int  )0;
  sqlstm.sqharm[56] = (unsigned long )0;
  sqlstm.sqadto[56] = (unsigned short )0;
  sqlstm.sqtdso[56] = (unsigned short )0;
  sqlstm.sqhstv[57] = (unsigned char  *)&hsrentinded;
  sqlstm.sqhstl[57] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[57] = (         int  )0;
  sqlstm.sqindv[57] = (         short *)0;
  sqlstm.sqinds[57] = (         int  )0;
  sqlstm.sqharm[57] = (unsigned long )0;
  sqlstm.sqadto[57] = (unsigned short )0;
  sqlstm.sqtdso[57] = (unsigned short )0;
  sqlstm.sqhstv[58] = (unsigned char  *)&incomeded;
  sqlstm.sqhstl[58] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[58] = (         int  )0;
  sqlstm.sqindv[58] = (         short *)0;
  sqlstm.sqinds[58] = (         int  )0;
  sqlstm.sqharm[58] = (unsigned long )0;
  sqlstm.sqadto[58] = (unsigned short )0;
  sqlstm.sqtdso[58] = (unsigned short )0;
  sqlstm.sqhstv[59] = (unsigned char  *)&splimitovded;
  sqlstm.sqhstl[59] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[59] = (         int  )0;
  sqlstm.sqindv[59] = (         short *)0;
  sqlstm.sqinds[59] = (         int  )0;
  sqlstm.sqharm[59] = (unsigned long )0;
  sqlstm.sqadto[59] = (unsigned short )0;
  sqlstm.sqtdso[59] = (unsigned short )0;
  sqlstm.sqhstv[60] = (unsigned char  *)&nepgiveded;
  sqlstm.sqhstl[60] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[60] = (         int  )0;
  sqlstm.sqindv[60] = (         short *)0;
  sqlstm.sqinds[60] = (         int  )0;
  sqlstm.sqharm[60] = (unsigned long )0;
  sqlstm.sqadto[60] = (unsigned short )0;
  sqlstm.sqtdso[60] = (unsigned short )0;
  sqlstm.sqhstv[61] = (unsigned char  *)&nepgiveded2;
  sqlstm.sqhstl[61] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[61] = (         int  )0;
  sqlstm.sqindv[61] = (         short *)0;
  sqlstm.sqinds[61] = (         int  )0;
  sqlstm.sqharm[61] = (unsigned long )0;
  sqlstm.sqadto[61] = (unsigned short )0;
  sqlstm.sqtdso[61] = (unsigned short )0;
  sqlstm.sqhstv[62] = (unsigned char  *)&taxlevel;
  sqlstm.sqhstl[62] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[62] = (         int  )0;
  sqlstm.sqindv[62] = (         short *)0;
  sqlstm.sqinds[62] = (         int  )0;
  sqlstm.sqharm[62] = (unsigned long )0;
  sqlstm.sqadto[62] = (unsigned short )0;
  sqlstm.sqtdso[62] = (unsigned short )0;
  sqlstm.sqhstv[63] = (unsigned char  *)&calctax;
  sqlstm.sqhstl[63] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[63] = (         int  )0;
  sqlstm.sqindv[63] = (         short *)0;
  sqlstm.sqinds[63] = (         int  )0;
  sqlstm.sqharm[63] = (unsigned long )0;
  sqlstm.sqadto[63] = (unsigned short )0;
  sqlstm.sqtdso[63] = (unsigned short )0;
  sqlstm.sqhstv[64] = (unsigned char  *)&incomtded;
  sqlstm.sqhstl[64] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[64] = (         int  )0;
  sqlstm.sqindv[64] = (         short *)0;
  sqlstm.sqinds[64] = (         int  )0;
  sqlstm.sqharm[64] = (unsigned long )0;
  sqlstm.sqadto[64] = (unsigned short )0;
  sqlstm.sqtdso[64] = (unsigned short )0;
  sqlstm.sqhstv[65] = (unsigned char  *)&hloanded;
  sqlstm.sqhstl[65] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[65] = (         int  )0;
  sqlstm.sqindv[65] = (         short *)0;
  sqlstm.sqinds[65] = (         int  )0;
  sqlstm.sqharm[65] = (unsigned long )0;
  sqlstm.sqadto[65] = (unsigned short )0;
  sqlstm.sqtdso[65] = (unsigned short )0;
  sqlstm.sqhstv[66] = (unsigned char  *)&costockded;
  sqlstm.sqhstl[66] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[66] = (         int  )0;
  sqlstm.sqindv[66] = (         short *)0;
  sqlstm.sqinds[66] = (         int  )0;
  sqlstm.sqharm[66] = (unsigned long )0;
  sqlstm.sqadto[66] = (unsigned short )0;
  sqlstm.sqtdso[66] = (unsigned short )0;
  sqlstm.sqhstv[67] = (unsigned char  *)&forided;
  sqlstm.sqhstl[67] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[67] = (         int  )0;
  sqlstm.sqindv[67] = (         short *)0;
  sqlstm.sqinds[67] = (         int  )0;
  sqlstm.sqharm[67] = (unsigned long )0;
  sqlstm.sqadto[67] = (unsigned short )0;
  sqlstm.sqtdso[67] = (unsigned short )0;
  sqlstm.sqhstv[68] = (unsigned char  *)&etctded;
  sqlstm.sqhstl[68] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[68] = (         int  )0;
  sqlstm.sqindv[68] = (         short *)0;
  sqlstm.sqinds[68] = (         int  )0;
  sqlstm.sqharm[68] = (unsigned long )0;
  sqlstm.sqadto[68] = (unsigned short )0;
  sqlstm.sqtdso[68] = (unsigned short )0;
  sqlstm.sqhstv[69] = (unsigned char  *)&tdedsum;
  sqlstm.sqhstl[69] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[69] = (         int  )0;
  sqlstm.sqindv[69] = (         short *)0;
  sqlstm.sqinds[69] = (         int  )0;
  sqlstm.sqharm[69] = (unsigned long )0;
  sqlstm.sqadto[69] = (unsigned short )0;
  sqlstm.sqtdso[69] = (unsigned short )0;
  sqlstm.sqhstv[70] = (unsigned char  *)&dintax;
  sqlstm.sqhstl[70] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[70] = (         int  )0;
  sqlstm.sqindv[70] = (         short *)0;
  sqlstm.sqinds[70] = (         int  )0;
  sqlstm.sqharm[70] = (unsigned long )0;
  sqlstm.sqadto[70] = (unsigned short )0;
  sqlstm.sqtdso[70] = (unsigned short )0;
  sqlstm.sqhstv[71] = (unsigned char  *)&djutax;
  sqlstm.sqhstl[71] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[71] = (         int  )0;
  sqlstm.sqindv[71] = (         short *)0;
  sqlstm.sqinds[71] = (         int  )0;
  sqlstm.sqharm[71] = (unsigned long )0;
  sqlstm.sqadto[71] = (unsigned short )0;
  sqlstm.sqtdso[71] = (unsigned short )0;
  sqlstm.sqhstv[72] = (unsigned char  *)&dnongtax;
  sqlstm.sqhstl[72] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[72] = (         int  )0;
  sqlstm.sqindv[72] = (         short *)0;
  sqlstm.sqinds[72] = (         int  )0;
  sqlstm.sqharm[72] = (unsigned long )0;
  sqlstm.sqadto[72] = (unsigned short )0;
  sqlstm.sqtdso[72] = (unsigned short )0;
  sqlstm.sqhstv[73] = (unsigned char  *)&intax;
  sqlstm.sqhstl[73] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[73] = (         int  )0;
  sqlstm.sqindv[73] = (         short *)0;
  sqlstm.sqinds[73] = (         int  )0;
  sqlstm.sqharm[73] = (unsigned long )0;
  sqlstm.sqadto[73] = (unsigned short )0;
  sqlstm.sqtdso[73] = (unsigned short )0;
  sqlstm.sqhstv[74] = (unsigned char  *)&jutax;
  sqlstm.sqhstl[74] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[74] = (         int  )0;
  sqlstm.sqindv[74] = (         short *)0;
  sqlstm.sqinds[74] = (         int  )0;
  sqlstm.sqharm[74] = (unsigned long )0;
  sqlstm.sqadto[74] = (unsigned short )0;
  sqlstm.sqtdso[74] = (unsigned short )0;
  sqlstm.sqhstv[75] = (unsigned char  *)&nongtax;
  sqlstm.sqhstl[75] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[75] = (         int  )0;
  sqlstm.sqindv[75] = (         short *)0;
  sqlstm.sqinds[75] = (         int  )0;
  sqlstm.sqharm[75] = (unsigned long )0;
  sqlstm.sqadto[75] = (unsigned short )0;
  sqlstm.sqtdso[75] = (unsigned short )0;
  sqlstm.sqhstv[76] = (unsigned char  *)&yintax;
  sqlstm.sqhstl[76] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[76] = (         int  )0;
  sqlstm.sqindv[76] = (         short *)0;
  sqlstm.sqinds[76] = (         int  )0;
  sqlstm.sqharm[76] = (unsigned long )0;
  sqlstm.sqadto[76] = (unsigned short )0;
  sqlstm.sqtdso[76] = (unsigned short )0;
  sqlstm.sqhstv[77] = (unsigned char  *)&yjutax;
  sqlstm.sqhstl[77] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[77] = (         int  )0;
  sqlstm.sqindv[77] = (         short *)0;
  sqlstm.sqinds[77] = (         int  )0;
  sqlstm.sqharm[77] = (unsigned long )0;
  sqlstm.sqadto[77] = (unsigned short )0;
  sqlstm.sqtdso[77] = (unsigned short )0;
  sqlstm.sqhstv[78] = (unsigned char  *)&ynongtax;
  sqlstm.sqhstl[78] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[78] = (         int  )0;
  sqlstm.sqindv[78] = (         short *)0;
  sqlstm.sqinds[78] = (         int  )0;
  sqlstm.sqharm[78] = (unsigned long )0;
  sqlstm.sqadto[78] = (unsigned short )0;
  sqlstm.sqtdso[78] = (unsigned short )0;
  sqlstm.sqhstv[79] = (unsigned char  *)&ycalctax;
  sqlstm.sqhstl[79] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[79] = (         int  )0;
  sqlstm.sqindv[79] = (         short *)0;
  sqlstm.sqinds[79] = (         int  )0;
  sqlstm.sqharm[79] = (unsigned long )0;
  sqlstm.sqadto[79] = (unsigned short )0;
  sqlstm.sqtdso[79] = (unsigned short )0;
  sqlstm.sqhstv[80] = (unsigned char  *)log_subdate;
  sqlstm.sqhstl[80] = (unsigned long )9;
  sqlstm.sqhsts[80] = (         int  )0;
  sqlstm.sqindv[80] = (         short *)0;
  sqlstm.sqinds[80] = (         int  )0;
  sqlstm.sqharm[80] = (unsigned long )0;
  sqlstm.sqadto[80] = (unsigned short )0;
  sqlstm.sqtdso[80] = (unsigned short )0;
  sqlstm.sqhstv[81] = (unsigned char  *)writeman;
  sqlstm.sqhstl[81] = (unsigned long )5;
  sqlstm.sqhsts[81] = (         int  )0;
  sqlstm.sqindv[81] = (         short *)0;
  sqlstm.sqinds[81] = (         int  )0;
  sqlstm.sqharm[81] = (unsigned long )0;
  sqlstm.sqadto[81] = (unsigned short )0;
  sqlstm.sqtdso[81] = (unsigned short )0;
  sqlstm.sqhstv[82] = (unsigned char  *)&babyded;
  sqlstm.sqhstl[82] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[82] = (         int  )0;
  sqlstm.sqindv[82] = (         short *)0;
  sqlstm.sqinds[82] = (         int  )0;
  sqlstm.sqharm[82] = (unsigned long )0;
  sqlstm.sqadto[82] = (unsigned short )0;
  sqlstm.sqtdso[82] = (unsigned short )0;
  sqlstm.sqhstv[83] = (unsigned char  *)&fundded;
  sqlstm.sqhstl[83] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[83] = (         int  )0;
  sqlstm.sqindv[83] = (         short *)0;
  sqlstm.sqinds[83] = (         int  )0;
  sqlstm.sqharm[83] = (unsigned long )0;
  sqlstm.sqadto[83] = (unsigned short )0;
  sqlstm.sqtdso[83] = (unsigned short )0;
  sqlstm.sqhstv[84] = (unsigned char  *)&houserentded;
  sqlstm.sqhstl[84] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[84] = (         int  )0;
  sqlstm.sqindv[84] = (         short *)0;
  sqlstm.sqinds[84] = (         int  )0;
  sqlstm.sqharm[84] = (unsigned long )0;
  sqlstm.sqadto[84] = (unsigned short )0;
  sqlstm.sqtdso[84] = (unsigned short )0;
  sqlstm.sqhstv[85] = (unsigned char  *)&housvsubded;
  sqlstm.sqhstl[85] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[85] = (         int  )0;
  sqlstm.sqindv[85] = (         short *)0;
  sqlstm.sqinds[85] = (         int  )0;
  sqlstm.sqharm[85] = (unsigned long )0;
  sqlstm.sqadto[85] = (unsigned short )0;
  sqlstm.sqtdso[85] = (unsigned short )0;
  sqlstm.sqhstv[86] = (unsigned char  *)&housvempded;
  sqlstm.sqhstl[86] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[86] = (         int  )0;
  sqlstm.sqindv[86] = (         short *)0;
  sqlstm.sqinds[86] = (         int  )0;
  sqlstm.sqharm[86] = (unsigned long )0;
  sqlstm.sqadto[86] = (unsigned short )0;
  sqlstm.sqtdso[86] = (unsigned short )0;
  sqlstm.sqhstv[87] = (unsigned char  *)&housvcomded;
  sqlstm.sqhstl[87] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[87] = (         int  )0;
  sqlstm.sqindv[87] = (         short *)0;
  sqlstm.sqinds[87] = (         int  )0;
  sqlstm.sqharm[87] = (unsigned long )0;
  sqlstm.sqadto[87] = (unsigned short )0;
  sqlstm.sqtdso[87] = (unsigned short )0;
  sqlstm.sqhstv[88] = (unsigned char  *)&nagiveded;
  sqlstm.sqhstl[88] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[88] = (         int  )0;
  sqlstm.sqindv[88] = (         short *)0;
  sqlstm.sqinds[88] = (         int  )0;
  sqlstm.sqharm[88] = (unsigned long )0;
  sqlstm.sqadto[88] = (unsigned short )0;
  sqlstm.sqtdso[88] = (unsigned short )0;
  sqlstm.sqhstv[89] = (unsigned char  *)&npgiveded;
  sqlstm.sqhstl[89] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[89] = (         int  )0;
  sqlstm.sqindv[89] = (         short *)0;
  sqlstm.sqinds[89] = (         int  )0;
  sqlstm.sqharm[89] = (unsigned long )0;
  sqlstm.sqadto[89] = (unsigned short )0;
  sqlstm.sqtdso[89] = (unsigned short )0;
  sqlstm.sqhstv[90] = (unsigned char  *)&npgiveded2;
  sqlstm.sqhstl[90] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[90] = (         int  )0;
  sqlstm.sqindv[90] = (         short *)0;
  sqlstm.sqinds[90] = (         int  )0;
  sqlstm.sqharm[90] = (unsigned long )0;
  sqlstm.sqadto[90] = (unsigned short )0;
  sqlstm.sqtdso[90] = (unsigned short )0;
  sqlstm.sqhstv[91] = (unsigned char  *)&ngiveded;
  sqlstm.sqhstl[91] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[91] = (         int  )0;
  sqlstm.sqindv[91] = (         short *)0;
  sqlstm.sqinds[91] = (         int  )0;
  sqlstm.sqharm[91] = (unsigned long )0;
  sqlstm.sqadto[91] = (unsigned short )0;
  sqlstm.sqtdso[91] = (unsigned short )0;
  sqlstm.sqhstv[92] = (unsigned char  *)&investded3;
  sqlstm.sqhstl[92] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[92] = (         int  )0;
  sqlstm.sqindv[92] = (         short *)0;
  sqlstm.sqinds[92] = (         int  )0;
  sqlstm.sqharm[92] = (unsigned long )0;
  sqlstm.sqadto[92] = (unsigned short )0;
  sqlstm.sqtdso[92] = (unsigned short )0;
  sqlstm.sqhstv[93] = (unsigned char  *)&longfundded;
  sqlstm.sqhstl[93] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[93] = (         int  )0;
  sqlstm.sqindv[93] = (         short *)0;
  sqlstm.sqinds[93] = (         int  )0;
  sqlstm.sqharm[93] = (unsigned long )0;
  sqlstm.sqadto[93] = (unsigned short )0;
  sqlstm.sqtdso[93] = (unsigned short )0;
  sqlstm.sqhstv[94] = (unsigned char  *)&childtaxded;
  sqlstm.sqhstl[94] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[94] = (         int  )0;
  sqlstm.sqindv[94] = (         short *)0;
  sqlstm.sqinds[94] = (         int  )0;
  sqlstm.sqharm[94] = (unsigned long )0;
  sqlstm.sqadto[94] = (unsigned short )0;
  sqlstm.sqtdso[94] = (unsigned short )0;
  sqlstm.sqhstv[95] = (unsigned char  *)&npendtaxded;
  sqlstm.sqhstl[95] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[95] = (         int  )0;
  sqlstm.sqindv[95] = (         short *)0;
  sqlstm.sqinds[95] = (         int  )0;
  sqlstm.sqharm[95] = (unsigned long )0;
  sqlstm.sqadto[95] = (unsigned short )0;
  sqlstm.sqtdso[95] = (unsigned short )0;
  sqlstm.sqhstv[96] = (unsigned char  *)&guartaxded;
  sqlstm.sqhstl[96] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[96] = (         int  )0;
  sqlstm.sqindv[96] = (         short *)0;
  sqlstm.sqinds[96] = (         int  )0;
  sqlstm.sqharm[96] = (unsigned long )0;
  sqlstm.sqadto[96] = (unsigned short )0;
  sqlstm.sqtdso[96] = (unsigned short )0;
  sqlstm.sqhstv[97] = (unsigned char  *)&hostaxded;
  sqlstm.sqhstl[97] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[97] = (         int  )0;
  sqlstm.sqindv[97] = (         short *)0;
  sqlstm.sqinds[97] = (         int  )0;
  sqlstm.sqharm[97] = (unsigned long )0;
  sqlstm.sqadto[97] = (unsigned short )0;
  sqlstm.sqtdso[97] = (unsigned short )0;
  sqlstm.sqhstv[98] = (unsigned char  *)&edutaxded;
  sqlstm.sqhstl[98] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[98] = (         int  )0;
  sqlstm.sqindv[98] = (         short *)0;
  sqlstm.sqinds[98] = (         int  )0;
  sqlstm.sqharm[98] = (unsigned long )0;
  sqlstm.sqadto[98] = (unsigned short )0;
  sqlstm.sqtdso[98] = (unsigned short )0;
  sqlstm.sqhstv[99] = (unsigned char  *)&polided1;
  sqlstm.sqhstl[99] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[99] = (         int  )0;
  sqlstm.sqindv[99] = (         short *)0;
  sqlstm.sqinds[99] = (         int  )0;
  sqlstm.sqharm[99] = (unsigned long )0;
  sqlstm.sqadto[99] = (unsigned short )0;
  sqlstm.sqtdso[99] = (unsigned short )0;
  sqlstm.sqhstv[100] = (unsigned char  *)&polided2;
  sqlstm.sqhstl[100] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[100] = (         int  )0;
  sqlstm.sqindv[100] = (         short *)0;
  sqlstm.sqinds[100] = (         int  )0;
  sqlstm.sqharm[100] = (unsigned long )0;
  sqlstm.sqadto[100] = (unsigned short )0;
  sqlstm.sqtdso[100] = (unsigned short )0;
  sqlstm.sqhstv[101] = (unsigned char  *)&politaxded1;
  sqlstm.sqhstl[101] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[101] = (         int  )0;
  sqlstm.sqindv[101] = (         short *)0;
  sqlstm.sqinds[101] = (         int  )0;
  sqlstm.sqharm[101] = (unsigned long )0;
  sqlstm.sqadto[101] = (unsigned short )0;
  sqlstm.sqtdso[101] = (unsigned short )0;
  sqlstm.sqhstv[102] = (unsigned char  *)&politaxded2;
  sqlstm.sqhstl[102] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[102] = (         int  )0;
  sqlstm.sqindv[102] = (         short *)0;
  sqlstm.sqinds[102] = (         int  )0;
  sqlstm.sqharm[102] = (unsigned long )0;
  sqlstm.sqadto[102] = (unsigned short )0;
  sqlstm.sqtdso[102] = (unsigned short )0;
  sqlstm.sqhstv[103] = (unsigned char  *)&agivetaxded;
  sqlstm.sqhstl[103] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[103] = (         int  )0;
  sqlstm.sqindv[103] = (         short *)0;
  sqlstm.sqinds[103] = (         int  )0;
  sqlstm.sqharm[103] = (unsigned long )0;
  sqlstm.sqadto[103] = (unsigned short )0;
  sqlstm.sqtdso[103] = (unsigned short )0;
  sqlstm.sqhstv[104] = (unsigned char  *)&pgivetaxded;
  sqlstm.sqhstl[104] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[104] = (         int  )0;
  sqlstm.sqindv[104] = (         short *)0;
  sqlstm.sqinds[104] = (         int  )0;
  sqlstm.sqharm[104] = (unsigned long )0;
  sqlstm.sqadto[104] = (unsigned short )0;
  sqlstm.sqtdso[104] = (unsigned short )0;
  sqlstm.sqhstv[105] = (unsigned char  *)&taxdedsum;
  sqlstm.sqhstl[105] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[105] = (         int  )0;
  sqlstm.sqindv[105] = (         short *)0;
  sqlstm.sqinds[105] = (         int  )0;
  sqlstm.sqharm[105] = (unsigned long )0;
  sqlstm.sqadto[105] = (unsigned short )0;
  sqlstm.sqtdso[105] = (unsigned short )0;
  sqlstm.sqhstv[106] = (unsigned char  *)&houserenttaxded;
  sqlstm.sqhstl[106] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[106] = (         int  )0;
  sqlstm.sqindv[106] = (         short *)0;
  sqlstm.sqinds[106] = (         int  )0;
  sqlstm.sqharm[106] = (unsigned long )0;
  sqlstm.sqadto[106] = (unsigned short )0;
  sqlstm.sqtdso[106] = (unsigned short )0;
  sqlstm.sqhstv[107] = (unsigned char  *)&infanttaxded;
  sqlstm.sqhstl[107] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[107] = (         int  )0;
  sqlstm.sqindv[107] = (         short *)0;
  sqlstm.sqinds[107] = (         int  )0;
  sqlstm.sqharm[107] = (unsigned long )0;
  sqlstm.sqadto[107] = (unsigned short )0;
  sqlstm.sqtdso[107] = (unsigned short )0;
  sqlstm.sqhstv[108] = (unsigned char  *)&addbabytaxded;
  sqlstm.sqhstl[108] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[108] = (         int  )0;
  sqlstm.sqindv[108] = (         short *)0;
  sqlstm.sqinds[108] = (         int  )0;
  sqlstm.sqharm[108] = (unsigned long )0;
  sqlstm.sqadto[108] = (unsigned short )0;
  sqlstm.sqtdso[108] = (unsigned short )0;
  sqlstm.sqhstv[109] = (unsigned char  *)&obsguartaxded;
  sqlstm.sqhstl[109] = (unsigned long )sizeof(double);
  sqlstm.sqhsts[109] = (         int  )0;
  sqlstm.sqindv[109] = (         short *)0;
  sqlstm.sqinds[109] = (         int  )0;
  sqlstm.sqharm[109] = (unsigned long )0;
  sqlstm.sqadto[109] = (unsigned short )0;
  sqlstm.sqtdso[109] = (unsigned short )0;
  sqlstm.sqhstv[110] = (unsigned char  *)empno;
  sqlstm.sqhstl[110] = (unsigned long )5;
  sqlstm.sqhsts[110] = (         int  )0;
  sqlstm.sqindv[110] = (         short *)0;
  sqlstm.sqinds[110] = (         int  )0;
  sqlstm.sqharm[110] = (unsigned long )0;
  sqlstm.sqadto[110] = (unsigned short )0;
  sqlstm.sqtdso[110] = (unsigned short )0;
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


        
        
       /* printf("[debug] : empno=%s,nagiveded=%f  \n",empno,nagiveded);         */
        
        if  (sqlca.sqlcode != 0 )
        {                 
             err_print(sqlca.sqlcode,"갱신중 ERROR");
             Write_batlog(seqno++, "갱신중 ERROR");  /*dsa2000 Rexec 대체*/
             exit(1);
        }
}

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{  
     /* EXEC SQL AT log_db 
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 118;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1742;
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
     sqlstm.arrsiz = 118;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1783;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
 