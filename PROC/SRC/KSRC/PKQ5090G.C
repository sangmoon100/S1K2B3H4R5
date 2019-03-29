
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
    "pkq5090g.pc"
};


static unsigned int sqlctx = 154483;


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
   unsigned char  *sqhstv[41];
   unsigned long  sqhstl[41];
            int   sqhsts[41];
            short *sqindv[41];
            int   sqinds[41];
   unsigned long  sqharm[41];
   unsigned long  *sqharc[41];
   unsigned short  sqadto[41];
   unsigned short  sqtdso[41];
} sqlstm = {12,41};

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

 static char *sq0002 = 
"select NVL(TAXPAYFR,0) ,NVL(TAXPAYTO,0) ,NVL(TAXRATE,0) ,NVL(YEARDED,0)  fr\
om PKCPTAX where TAXNUM=(select CTAXNUM  from PKCPBAS )           ";

 static char *sq0020 = 
"select A.* , case  when MRFRDATE_CALC<='20121231' then MRFRDATE_CALC else '\
'  end  MRFRDATE_2012 , case  when MRFRDATE_CALC<='20121231' then LEAST(MRTOD\
ATE_CALC,'20121231') else ''  end  MRTODATE_2012 , case  when MRTODATE_CALC>=\
'20130101' then GREATEST(MRFRDATE_CALC,'20130101') else ''  end  MRFRDATE_201\
3 , case  when MRTODATE_CALC>='20130101' then MRTODATE_CALC else ''  end  MRT\
ODATE_2013  from (select EMPNO ,MRFRDATE ,MRTODATE ,NVL(SDATE,'9') SDATE , ca\
se  when BRETFRDAY is  not null  then LEAST(MRFRDATE,BRETFRDAY) else MRFRDATE\
  end  MRFRDATE_CALC , case  when BRETTODAY is  not null  then GREATEST(MRTOD\
ATE,BRETTODAY) else MRTODATE  end  MRTODATE_CALC  from PKMMREST where (EMPNO>\
=:b0 and EMPNO<=:b1)) A            ";

 static char *sq0023 = 
"select empno  from PKMMREST where ((empno>=:b0 and empno<=:b1) and paycl>='\
C11') order by empno            ";

 static char *sq0035 = 
"select A.* ,RETUTIL.GET_FIXDED(RETAMTSUM) FIXDED ,RETUTIL.GET_CONDED(REALYY\
_CALC) CONDED ,RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC) RINDED ,GREATEST((RE\
TAMTSUM-RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC)),0) TAXSTAMT  from (select \
EMPNO ,NVL(REALYY_CALC,0) REALYY_CALC ,NVL(REALYY_2012,0) REALYY_2012 ,NVL(RE\
ALYY_2013,0) REALYY_2013 ,NVL(BRETINTAX,0) BRETINTAX ,(NVL(RETAMT,0)+NVL(BRET\
AMT,0)) RETAMTSUM  from PKMMREST where (EMPNO>=:b0 and EMPNO<=:b1)) A        \
    ";

 static char *sq0051 = 
"select EMPNO ,MRFRDATE ,MRTODATE ,DUTYYY ,DUTYMM ,DUTYDD ,((TO_DATE(MRTODAT\
E,'YYYYMMDD')+1)-TO_DATE(NVL(BRETFRDAY,MRFRDATE),'YYYYMMDD'))  from PKMMREST \
where (EMPNO>=:b0 and EMPNO<=:b1)           ";

 static char *sq0052 = 
"select EXFRDATE ,EXTODATE ,((TO_DATE(EXTODATE,'YYYYMMDD')+1)-TO_DATE(EXFRDA\
TE,'YYYYMMDD'))  from PKHEXDD where (EMPNO=:b0 and EXFIXYN='Y')           ";

 static char *sq0058 = 
"select EMPNO ,MRTODATE ,RETAMT  from PKMMREST where (EMPNO>=:b0 and EMPNO<=\
:b1) order by SCORE desc ,PAYCLPLUS desc ,EMPDATEPLUS,FAMICNTPLUS desc ,BIRTH\
PLUS,EMPNO,MRTODATE,RETAMT            ";

 static char *sq0063 = 
"select EMPNO ,KORNAME ,REPLACE(JUMINID,' ','#')  from PKMMREST where ((REPL\
ACE(JUMINID,' ','#') like '%#%' or LENGTH(NVL(JUMINID,' '))<14) and MRTODATE=\
:b0) order by EMPNO            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,44,0,1,258,0,0,0,0,0,1,0,
20,0,0,2,141,0,9,330,0,0,0,0,0,1,0,
35,0,0,2,0,0,13,340,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
66,0,0,2,0,0,15,353,0,0,0,0,0,1,0,
81,0,0,3,461,0,4,387,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,1,4,0,0,1,3,0,0,1,3,0,0,
132,0,0,4,571,0,4,407,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,
4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,
183,0,0,5,75,0,2,430,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
210,0,0,6,573,0,3,444,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,97,0,0,
249,0,0,7,351,0,5,481,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
284,0,0,8,239,0,5,504,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
307,0,0,9,138,0,5,521,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
330,0,0,10,43,0,2,536,0,0,1,1,0,1,0,1,97,0,0,
349,0,0,11,378,0,3,547,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
372,0,0,12,326,0,5,567,0,0,1,1,0,1,0,1,97,0,0,
391,0,0,13,363,0,5,588,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
422,0,0,14,520,0,5,631,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
445,0,0,15,522,0,5,664,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
468,0,0,16,384,0,4,687,0,0,9,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,
3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
519,0,0,17,453,0,4,703,0,0,11,4,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
578,0,0,18,429,0,5,734,0,0,0,0,0,1,0,
593,0,0,19,120,0,5,757,0,0,0,0,0,1,0,
608,0,0,20,726,0,9,799,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
631,0,0,20,0,0,15,803,0,0,0,0,0,1,0,
646,0,0,20,0,0,13,810,0,0,10,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
701,0,0,20,0,0,15,815,0,0,0,0,0,1,0,
716,0,0,21,621,0,5,863,0,0,39,39,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,
0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,
887,0,0,22,93,0,5,1008,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
910,0,0,23,107,0,9,1034,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
933,0,0,23,0,0,13,1044,0,0,1,0,0,1,0,2,97,0,0,
952,0,0,23,0,0,15,1048,0,0,0,0,0,1,0,
967,0,0,24,49,0,5,1071,0,0,2,2,0,1,0,1,4,0,0,1,97,0,0,
990,0,0,25,49,0,5,1084,0,0,2,2,0,1,0,1,4,0,0,1,97,0,0,
1013,0,0,26,237,0,5,1101,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1036,0,0,27,226,0,5,1121,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1059,0,0,28,157,0,5,1157,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1082,0,0,29,53,0,4,1184,0,0,2,0,0,1,0,2,97,0,0,2,4,0,0,
1105,0,0,30,95,0,5,1217,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1128,0,0,31,260,0,5,1235,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1159,0,0,32,239,0,5,1270,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1186,0,0,33,127,0,5,1288,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1209,0,0,34,262,0,5,1314,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1236,0,0,35,464,0,9,1419,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1259,0,0,35,0,0,13,1423,0,0,10,0,0,1,0,2,97,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
1314,0,0,35,0,0,15,1428,0,0,0,0,0,1,0,
1329,0,0,35,0,0,15,1436,0,0,0,0,0,1,0,
1344,0,0,36,216,0,4,1476,0,0,7,5,0,1,0,1,97,0,0,2,4,0,0,2,4,0,0,1,97,0,0,1,4,0,
0,1,4,0,0,1,3,0,0,
1387,0,0,37,219,0,4,1489,0,0,7,4,0,1,0,1,97,0,0,1,3,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,1,4,0,0,1,4,0,0,
1430,0,0,38,87,0,4,1505,0,0,4,3,0,1,0,1,97,0,0,1,4,0,0,1,4,0,0,2,4,0,0,
1461,0,0,39,787,0,5,1526,0,0,41,41,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,1,4,0,0,1,97,0,0,
1640,0,0,40,99,0,5,1593,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1663,0,0,41,96,0,5,1600,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1686,0,0,42,111,0,5,1614,0,0,3,3,0,1,0,1,4,0,0,1,97,0,0,1,97,0,0,
1713,0,0,43,85,0,5,1642,0,0,0,0,0,1,0,
1728,0,0,44,68,0,5,1652,0,0,0,0,0,1,0,
1743,0,0,45,68,0,5,1660,0,0,0,0,0,1,0,
1758,0,0,46,119,0,5,1669,0,0,1,1,0,1,0,1,97,0,0,
1777,0,0,47,240,0,5,1693,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1800,0,0,48,96,0,5,1711,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1823,0,0,49,96,0,5,1725,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1846,0,0,50,366,0,5,1742,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1873,0,0,51,196,0,9,1805,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1896,0,0,51,0,0,15,1809,0,0,0,0,0,1,0,
1911,0,0,51,0,0,13,1816,0,0,7,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,3,0,0,2,3,0,
0,2,3,0,0,2,3,0,0,
1954,0,0,51,0,0,15,1822,0,0,0,0,0,1,0,
1969,0,0,52,149,0,9,1833,0,0,1,1,0,1,0,1,97,0,0,
1988,0,0,52,0,0,13,1847,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,3,0,0,
2015,0,0,52,0,0,15,1852,0,0,0,0,0,1,0,
2030,0,0,53,139,0,5,1883,0,0,10,10,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,
2085,0,0,54,139,0,5,1932,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
2108,0,0,55,189,0,5,1950,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
2131,0,0,56,147,0,5,1968,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
2154,0,0,57,266,0,5,2001,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
2177,0,0,58,190,0,9,2040,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
2200,0,0,58,0,0,15,2044,0,0,0,0,0,1,0,
2215,0,0,58,0,0,13,2050,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,
2242,0,0,58,0,0,15,2055,0,0,0,0,0,1,0,
2257,0,0,59,82,0,5,2062,0,0,4,4,0,1,0,1,3,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
2288,0,0,58,0,0,15,2070,0,0,0,0,0,1,0,
2303,0,0,60,75,0,2,2096,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
2330,0,0,61,98,0,3,2101,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
2357,0,0,62,246,0,4,2113,0,0,9,3,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,3,0,0,2,4,
0,0,2,4,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2408,0,0,63,183,0,9,2146,0,0,1,1,0,1,0,1,97,0,0,
2427,0,0,63,0,0,15,2150,0,0,0,0,0,1,0,
2442,0,0,63,0,0,13,2161,0,0,3,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,
2469,0,0,63,0,0,15,2165,0,0,0,0,0,1,0,
2484,0,0,64,50,0,3,2175,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
2525,0,0,65,0,0,29,2185,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKQ5090G(퇴직중간 정산 (조회용) 생성/계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 유미나
 Version        : 30.00
 Date           : 1999.02.24

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1998.02.17         윤 형식         최초개발본      설계명세서
   30.00      1999.02.24         유미나        Y2K(주민번호관련) 하나로인사재개발
   31.00      2001.03.13         유효성        임원 연봉제에 따른 평균임금 계산방법 변경
                     임원 평균임금= (총연봉+1년분중식비)/12
   32.00      2002.06.21         유효성        임원 퇴직지급율 계산시 직위별 재임기간으로 
                                               산정하게 제도 변경됨
   32.01      2004.02.24         강륜종        Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.
   33.00      2004.10.12       강륜종(dsa2000) 중간정산 여러번 하는 사원을 위한 세금 계산로직 추가.      
   34.00      2004.12.        강륜종(dsa2000)  Rexec대체 서비스를 위한 수정작업.   
   34.01      2005.01.13      dsa2000          퇴직세액공제   2005년부터 폐지
   34.02      2006.03.07      dsa2000          퇴직소득공제 세율변경 (50% => 45%)
=================================================================================================*/ 

/*=============================================================================                                                                     
user lib :  평균임금 구하는...
  lib_name : hperlib.a
  lib_src  : avgpay.pc  
  lib_function_name  : get_mr_avgpay(
        p_empno,
        t_baseyymm,
          &avgpay1, * 초과근무수당 100%적용 평균임금*
        &avgpay2, * 초과근무수당 상한값 적용평균임금* 
        &ovtmamt1,* 초과근무수당 100%  *   
        &ovtmamt2)* 초과근무수당 상한값*    
특이사항 :
parameter 변경시 : pkc3010g (월급여이력보관)에서 퇴직금조회용 계산 pgm 수정
============================================================================= */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
/*#include "mis.h" */
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

/*#define  SUCCESS -1*/
#define  FAIL        -2
/*#define  HOMEDIR  "/hper/insa" */

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
char     log_rundate[16]     = ""; 
char     log_progid[16]      = "";
char     log_writeman[5]     = "";
char     log_buff[100]       = "";
int      seqno = 0; 

/* 함수의 Proto type 선언 */
void Make_PKMMREST();
void Calc_Avggross();
void Calc_Retrealamt();
void Calc_Retamt();
void Calc_Exdd();
void Set_Order();
void Calc_Order();
void Set_PKHMRESH();

/* 전역 변수 선언 */
/* EXEC SQL BEGIN DECLARE SECTION ; */ 

     char   g_mrtodate[8+1] = "";  /* 중간 정산 기산일 to */
     char   g_isall[1+1]    = "";  /* 전체 삭제 여부      */
     char   g_frempno[4+1]  = "";  /* 사번from            */
     char   g_toempno[4+1]  = "";  /* 사번to              */
     char   g_workemp[4+1]  = "";  /* 작업사번            */

/*2012년 이전 근속년수 추가 시작 2013.02.18*/     
     char    empno[5];
     char    mrfrdate[9];
     char    mrtodate[9];
     char    bretfrday[9];     
     char    sdate[9];   /* 20181218 jhg 혼합형적용일 */
     int     dutydd;
     int     dutymm;     
     int     exdd; 
     int     realdd;    
     int     realmm; 
     int     realmm2;    /* 20181218 jhg 혼합형이후 개월수 */
     int     realyy;    
          
     int     retdd;    
     int     retmm;    
     int     retyy;    

     int     dutydd2012;  
     int     exdd2012;    

     int     retdd2012;
     int     retmm2012;
     int     retyy2012;     

     int     retyy2013; 
     
    double avgtaxstamt1;    
    double rettaxrate1;
    double retavgtax1;
    double retcalctax1;
        
    double retintax;
    double retjutax;     


/*정산(합산) 변수*/
     char    mrfrdate_calc[9];
     char    mrtodate_calc[9];          
     int     dutydd_calc;  
     int     dutymm_calc;       
     int     exdd_calc;    
     int     realdd_calc;
     int     realmm_calc;
     int     realyy_calc;   

    double retamtsum;             
    double fixded; 
    double conded;     
    double rinded; 
    double taxstamt;
    double avgtaxstamt;    
    double retavgtaxstamt;    
    double rettaxrate;
    double retavgtax;
    double retavgcalctax;    
    double retcalctax;
    
    double retintax;
    double retjutax;     
    
    double bretintax;

 /*2012.12.31 이전 변수*/
     char    mrfrdate_2012[9];
     char    mrtodate_2012[9];          
     int     dutydd_2012;  
     int     dutymm_2012;       
     int     exdd_2012;    
     int     realdd_2012;
     int     realmm_2012;
     int     realyy_2012;   

    double taxstamt_2012; 
    double avgtaxstamt_2012;    
    double retavgtaxstamt_2012;    
    double rettaxrate_2012;
    double retavgtax_2012;
    double retavgcalctax_2012;    
    double retcalctax_2012;
    double retintax_2012;       
     
/*2013.01.01 이전 변수*/     
     char    mrfrdate_2013[9];
     char    mrtodate_2013[9];          
     int     dutydd_2013;  
     int     dutymm_2013;       
     int     exdd_2013;    
     int     realdd_2013;
     int     realmm_2013;
     int     realyy_2013;    
     
    double taxstamt_2013; 
    double avgtaxstamt_2013;    
    double retavgtaxstamt_2013;    
    double rettaxrate_2013;
    double retavgtax_2013;
    double retavgcalctax_2013;    
    double retcalctax_2013;
    double retintax_2013;    
    
    double change_pay_2016     ;  //2015.12.21 eyha add
    double change_payded_2016  ;  //2015.12.21 eyha add         
    double taxstamt_2016       ;  //2015.12.21 eyha add    
    double rettaxrate_2016     ;  //2015.12.21 eyha add    
    double retavgtax_2016      ;  //2015.12.21 eyha add
    double retcalctax_2016     ;  //2015.12.21 eyha add
    double retintax_2016       ;  //2015.12.21 eyha add
    double retintax_calc       ;  //2015.12.21 eyha add                        
    

    struct
    {      double taxfr   ;
           double taxto   ;
           double taxrate ;
           double yearded ;
    } taxtbl[10];
     
/*2012년 이전 근속년수 추가 종료 2013.02.18*/           
/* EXEC SQL END DECLARE SECTION ; */ 


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


int  taxtblcnt=0;
int  taxtblidx=0;
char  cmdline[256];
int   id;
char  calckind[1+1] = "";  /* 평균임금에 반영되는 초과근무수당    *
                            * 1 :전액,           *
                            * 2 : 중간정산기준에 setting된 한도액 만큼  */

void main(int argc,char *argv[])
{
     char FL_file[255];
     char *HOMEDIR;
     HOMEDIR = hinsa_home();
     strcat(HOMEDIR,"/proc/");
       
     if  (argc != 9) {  /* /hper8/HINSA/proc/bin/Kbin/pkq5090g 20050930 0 1031 1031 1 D006 pkq5090g 20050927114055 */
          printf("[Usage] : pkq5090g 1.중간정산기산일TO 2.1(일부)or0(전체) 3.사번fr 4.사번to  \n");
          printf("                   5.평균임금산정방식(1OR2) 6.작업자 7.프로그램ID 8.시작시간 \n");
          exit(1);
     }
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq5090g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     strcpy(g_mrtodate,argv[1]);
     strcpy(g_isall   ,argv[2]);
     strcpy(g_frempno ,argv[3]);
     strcpy(g_toempno ,argv[4]);
     strcpy(g_workemp ,argv[6]);
     sprintf(calckind,"%s",argv[5]);
     
     /*memset(dir,0x00,sizeof(dir));
      DB_connect(id,0); */
     hinsa_log_print(0,"퇴직중간 정산 (조회용) 생성/계산 시작...");        
     hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[6]);
     strcpy(log_progid,   argv[7]);
     strcpy(log_rundate,  argv[8]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     /* EXEC SQL LOCK TABLE PKMMREST
       IN EXCLUSIVE MODE NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE PKMMREST IN EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          hinsa_exit(0,"0.0 다른 사용자가 점유 사용중...\n");
     }
     ReadTax();         
        
/**************************************
  2002.7.25 유효성 추가   :   임원 퇴직지급율 계산 프로그램 call  : dsa2000. 2004.10.12 임원퇴지금 루틴 불필요하여 삭제\.
***************************************                      
  memset(cmdline,'\0',256);                     
  sprintf(cmdline,"%s/bin/Kbin/pkq5100g %.8s %s %s %s %s",
      HOMEDIR,g_mrtodate,g_frempno,g_toempno,g_workemp,argv[7]);
                        
  system(cmdline);

    
     9.3 생성 처리 Logic */
     printf("\n 조회용 퇴직금 생성중1 ~~~") ;
     Make_PKMMREST();

     /* 9.4 퇴직금 계산 Logic ....일수 관련만 */
     printf("\n 조회용 퇴직금 생성중2 ~~~") ;
     Calc_Retamt();

     /* 9.5 평균 임금/통산임금 계산 */
     printf("\n 조회용 평균임금 계산중 ~~~") ;        
     Calc_Avggross();

     /* 9.6 퇴직금 계산 */
     printf("\n 조회용 퇴직금 계산중 ~~~") ;
     Calc_Retrealamt();

     /* 9.7 순위결정 Logic */
     /* Set_Order();  */

     /* 9.8 우선순위, 퇴직금 누계(retamtsum) 계산 */
     /* Calc_Order();  */

     /* 10 우선순위, 퇴직금 누계(retamtsum) 계산 */
     printf("\n 조회용 퇴직금 누계 계산중 ~~~") ;        
     Set_PKHMRESH();

     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/      
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [ 작 업 성 공 ] =====\n");
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [작업성공] =====\n");
     }
           
     return;
}

/*  연세율표를 읽어 배열에 저장한다 */
ReadTax()
{
     int i=0;

     /* EXEC SQL DECLARE ctax CURSOR FOR
     SELECT NVL(TAXPAYFR,0), NVL(TAXPAYTO,0), NVL(TAXRATE,0), NVL(YEARDED,0)
       FROM PKCPTAX
      WHERE TAXNUM = (Select CTAXNUM From PKCPBAS); */ 


     /* EXEC SQL OPEN ctax; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 0;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0002;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )20;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
           Write_batlog(seqno++, "연세율표  fetch Error");  
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
          sqlstm.offset = (unsigned int  )35;
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




          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
            Write_batlog(seqno++, "연말정산 기초자료   read Error");  
            exit(1);
          }

          if (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close ctax; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 4;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )66;
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
     
     if (taxlevel <= 0 )
       return 0 ;
     
     for (i=0 ;i <taxtblcnt ; ++i)
     {
          if ((taxtbl[i].taxfr < taxlevel) && (taxtbl[i].taxto >= taxlevel))
          {
                res = taxlevel * taxtbl[i].taxrate / 100;
                res = res - taxtbl[i].yearded;
                taxtblidx = i;
               return res;
          }
     }
}

CalcTax2012(   int  m_realyy_calc,        int  m_realyy_2012,         double  m_taxstamt_2012,   
            double *m_avgtaxstamt_2012,double *m_retavgtaxstamt_2012,    
            double *m_rettaxrate_2012, double *m_retavgtax_2012,      double *m_retavgcalctax_2012,    
            double *m_retcalctax_2012)
{
    /* EXEC SQL    
         SELECT AVGTAXSTAMT_2012,
                RETAVGTAXSTAMT_2012,
                RETUTIL.GET_RETTAXRATE(AVGTAXSTAMT_2012)             RETTAXRATE_2012,
                0                                                     RETAVGTAX_2012,
                 RETUTIL.GET_RETAVGTAX(AVGTAXSTAMT_2012)              RETAVGCALCTAX_2012,
               ( RETUTIL.GET_RETAVGTAX(AVGTAXSTAMT_2012)*REALYY_2012) RETCALCTAX_2012   
          INTO :m_avgtaxstamt_2012[0], :m_retavgtaxstamt_2012[0], :m_rettaxrate_2012[0], :m_retavgtax_2012[0], :m_retavgcalctax_2012[0], :m_retcalctax_2012[0]
          FROM (SELECT A.*,
                       FLOOR(TAXSTAMT_2012/REALYY_2012) AVGTAXSTAMT_2012,
                       0 RETAVGTAXSTAMT_2012
                  FROM (SELECT :m_taxstamt_2012 TAXSTAMT_2012, :m_realyy_calc REALYY_CALC, :m_realyy_2012 REALYY_2012 FROM DUAL)A
               )A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 9;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select AVGTAXSTAMT_2012 ,RETAVGTAXSTAMT_2012 ,RETUTIL.GE\
T_RETTAXRATE(AVGTAXSTAMT_2012) RETTAXRATE_2012 ,0 RETAVGTAX_2012 ,RETUTIL.GET\
_RETAVGTAX(AVGTAXSTAMT_2012) RETAVGCALCTAX_2012 ,(RETUTIL.GET_RETAVGTAX(AVGTA\
XSTAMT_2012)* REALYY_2012) RETCALCTAX_2012 into :b0,:b1,:b2,:b3,:b4,:b5  from\
 (select A.* ,FLOOR((TAXSTAMT_2012/REALYY_2012)) AVGTAXSTAMT_2012 ,0 RETAVGTA\
XSTAMT_2012  from (select :b6 TAXSTAMT_2012 ,:b7 REALYY_CALC ,:b8 REALYY_2012\
  from DUAL ) A ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )81;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&m_avgtaxstamt_2012[0];
    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&m_retavgtaxstamt_2012[0];
    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&m_rettaxrate_2012[0];
    sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&m_retavgtax_2012[0];
    sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&m_retavgcalctax_2012[0];
    sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&m_retcalctax_2012[0];
    sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&m_taxstamt_2012;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&m_realyy_calc;
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&m_realyy_2012;
    sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
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

 
}

CalcTax2013(   int  m_realyy_calc,        int  m_realyy_2013,         double m_taxstamt_2013,   
            double *m_avgtaxstamt_2013,double *m_retavgtaxstamt_2013,    
            double *m_rettaxrate_2013, double *m_retavgtax_2013,      double *m_retavgcalctax_2013,    
            double *m_retcalctax_2013)
{
    /* EXEC SQL    
         SELECT AVGTAXSTAMT_2013,
                RETAVGTAXSTAMT_2013,
                 RETUTIL.GET_RETTAXRATE(RETAVGTAXSTAMT_2013)          RETTAXRATE_2013,
                 RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)           RETAVGTAX_2013,
                FLOOR( RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)/5) RETAVGCALCTAX_2013,
               (FLOOR( RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_2013)/5)*REALYY_2013) RETCALCTAX_2013   
          INTO :m_avgtaxstamt_2013[0], :m_retavgtaxstamt_2013[0], :m_rettaxrate_2013[0], :m_retavgtax_2013[0], :m_retavgcalctax_2013[0], :m_retcalctax_2013[0]
          FROM (SELECT A.*,
                       FLOOR(TAXSTAMT_2013/REALYY_2013) AVGTAXSTAMT_2013,
                       FLOOR(TAXSTAMT_2013/REALYY_2013)*5 RETAVGTAXSTAMT_2013
                  FROM (SELECT :m_taxstamt_2013 TAXSTAMT_2013, :m_realyy_calc REALYY_CALC, :m_realyy_2013 REALYY_2013 FROM DUAL)A
               )A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 9;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select AVGTAXSTAMT_2013 ,RETAVGTAXSTAMT_2013 ,RETUTIL.GE\
T_RETTAXRATE(RETAVGTAXSTAMT_2013) RETTAXRATE_2013 ,RETUTIL.GET_RETAVGTAX(RETA\
VGTAXSTAMT_2013) RETAVGTAX_2013 ,FLOOR((RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_\
2013)/5)) RETAVGCALCTAX_2013 ,(FLOOR((RETUTIL.GET_RETAVGTAX(RETAVGTAXSTAMT_20\
13)/5))* REALYY_2013) RETCALCTAX_2013 into :b0,:b1,:b2,:b3,:b4,:b5  from (sel\
ect A.* ,FLOOR((TAXSTAMT_2013/REALYY_2013)) AVGTAXSTAMT_2013 ,(FLOOR((TAXSTAM\
T_2013/REALYY_2013))* 5) RETAVGTAXSTAMT_2013  from (select :b6 TAXSTAMT_2013 \
,:b7 REALYY_CALC ,:b8 REALYY_2013  from DUAL ) A ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )132;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&m_avgtaxstamt_2013[0];
    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&m_retavgtaxstamt_2013[0];
    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&m_rettaxrate_2013[0];
    sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&m_retavgtax_2013[0];
    sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&m_retavgcalctax_2013[0];
    sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&m_retcalctax_2013[0];
    sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&m_taxstamt_2013;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&m_realyy_calc;
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&m_realyy_2013;
    sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
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

 
}



/***************************************************************************
 9.3 생성 처리 Logic
***************************************************************************/
void Make_PKMMREST()
{
    /*  9.3.1 중간정산 조회마스터 삭제 */
     /* EXEC SQL
     DELETE FROM PKMMREST
      WHERE (EMPNO >= :g_frempno AND EMPNO <= :g_toempno)
         OR (MRTODATE <> :g_mrtodate); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKMMREST  where ((EMPNO>=:b0 and EMPNO<=:b\
1) or MRTODATE<>:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )183;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_mrtodate;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.3.1 중간정산 조회마스터 삭제중...\n"); 
          hinsa_exit(0,"9.3.1 중간정산 조회마스터 삭제중...\n");
     }

  
  
     /* 9.3.2 인사마스터에서 조회중간정산으로 insert */
     /* EXEC SQL
     INSERT INTO PKMMREST
           (EMPNO, KORNAME, JUMINID,
            PAYCL, PAYGR,
            PAYRA, PSTATE, ORGNUM, DEPTCODE, EMPDATE, CALCYN, APPDATE,
            MRFRDATE, MRTODATE,  WRITETIME, WRITEMAN)
     SELECT EMPNO, KORNAME, JUMINID,
            PAYCL,  PAYGR,  /oPAYCL, DECODE(PAYCL,'00',TO_NUMBER(SUBSTR(PAYRA,1,2)),PAYGR),o/
            PAYRA, PSTATE, ORGNUM, DEPTCODE, EMPDATE, 'Y', :g_mrtodate,
            case WHEN (EMPNO >= '2358' AND EMPNO <=  '2499') THEN GROUPEMPDATE    /o 2010.01.04 kth 네트웍 입사자 처러 o/
            else ORGEMPDATE                                                   
            END  ORGEMPDATE,  :g_mrtodate, TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'), :g_workemp /o 20091028 KTH 시작일을 EMPDATE -> ORGEMPDATE 로 변경 o/
     FROM PIMPMAS
     WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
       AND EMPNO IN (select empno from pkhyphis )
       AND EMPNO IN (select empno from pkmpmas )
       AND PSTATE < '70'
       AND EMPDATE < substr(:g_mrtodate,1,6); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKMMREST (EMPNO,KORNAME,JUMINID,PAYCL,PAYGR\
,PAYRA,PSTATE,ORGNUM,DEPTCODE,EMPDATE,CALCYN,APPDATE,MRFRDATE,MRTODATE,WRITET\
IME,WRITEMAN)select EMPNO ,KORNAME ,JUMINID ,PAYCL ,PAYGR ,PAYRA ,PSTATE ,ORG\
NUM ,DEPTCODE ,EMPDATE ,'Y' ,:b0 , case  when (EMPNO>='2358' and EMPNO<='2499\
') then GROUPEMPDATE else ORGEMPDATE  end  ORGEMPDATE ,:b0 ,TO_CHAR(SYSDATE,'\
YYYYMMDDHH24MISS') ,:b2  from PIMPMAS where (((((EMPNO>=:b3 and EMPNO<=:b4) a\
nd EMPNO in (select empno  from pkhyphis )) and EMPNO in (select empno  from \
pkmpmas )) and PSTATE<'70') and EMPDATE<substr(:b0,1,6))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )210;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_workemp;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[4] = (unsigned long )5;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)g_mrtodate;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "인사마스터에서 인사사항 갱신중"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.3.2 인사마스터에서 인사사항 갱신중...\n");
     }    
     
     /************** CREATE OR REPLACE VIEW V_PKMMREST *************
         CREATE OR REPLACE VIEW V_PKHMRHIS
           (EMPNO, KORNAME, MRTODATE)
         AS SELECT EMPNO, KORNAME, MAX(MRTODATE)
            FROM PKHMRHIS
            WHERE UPPER(CALCYN) = 'Y'
            GROUP BY EMPNO, KORNAME
         ************** CREATE OR REPLACE VIEW V_PKMMREST *************/
     
     
     
     /* 9.3.3 중간정산이력에서 조회중간정산으로 update */
     /* EXEC SQL
     UPDATE PKMMREST S SET
           (MRFRDATE, MRTODATE ) =
           (SELECT TO_CHAR(TO_DATE(MAX(H.MRTODATE),'YYYYMMDD')+1,'YYYYMMDD'), :g_mrtodate
              FROM PKHMRHIS H
             WHERE S.EMPNO = H.EMPNO
               AND H.MRTODATE <= :g_mrtodate
               AND UPPER(H.CALCYN) = 'Y'
             GROUP BY S.EMPNO, H.EMPNO
           )
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT EMPNO FROM PKHMRHIS
                       WHERE MRTODATE <= :g_mrtodate
                         AND UPPER(CALCYN) = 'Y') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST S  set (MRFRDATE,MRTODATE)=(select TO_C\
HAR((TO_DATE(max(H.MRTODATE),'YYYYMMDD')+1),'YYYYMMDD') ,:b0  from PKHMRHIS H\
 where ((S.EMPNO=H.EMPNO and H.MRTODATE<=:b0) and UPPER(H.CALCYN)='Y') group \
by S.EMPNO,H.EMPNO) where ((EMPNO>=:b2 and EMPNO<=:b3) and EMPNO in (select E\
MPNO  from PKHMRHIS where (MRTODATE<=:b0 and UPPER(CALCYN)='Y')))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )249;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[3] = (unsigned long )5;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[4] = (unsigned long )9;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "중간정산이력에서 인사사항 갱신중."); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.3.3 중간정산이력에서 인사사항 갱신중...\n");
     }
     
     
     /* 9.3.3_1 퇴직기산일 특이자 update Start [2018-09-13 이상용] */
     /* EXEC SQL
     UPDATE PKMMREST S SET
             MRFRDATE = (SELECT RETCALCDATE FROM PKZRTSPC T WHERE S.EMPNO = T.EMPNO )
            ,EMPDATE  = (SELECT RETCALCDATE FROM PKZRTSPC T WHERE S.EMPNO = T.EMPNO )
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT EMPNO FROM PKZRTSPC ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST S  set MRFRDATE=(select RETCALCDATE  fr\
om PKZRTSPC T where S.EMPNO=T.EMPNO),EMPDATE=(select RETCALCDATE  from PKZRTS\
PC T where S.EMPNO=T.EMPNO) where ((EMPNO>=:b0 and EMPNO<=:b1) and EMPNO in (\
select EMPNO  from PKZRTSPC ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )284;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "퇴직기산일 특이자 갱신중."); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.3.3_1 퇴직기산일 특이자 갱신중...\n");
     }
     /* 9.3.3_1 퇴직기산일 특이자 update End [2018-09-13 이상용] */


     
     /* 9.3.4 급여마스터로 부터 은행사항을 setting */
     /* EXEC SQL
     UPDATE PKMMREST A 
        SET (PAYBANK, PAYACNT) =
            (SELECT PAYBANK, PAYACNT
               FROM PKMPMAS B
              WHERE A.EMPNO = B.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST A  set (PAYBANK,PAYACNT)=(select PAYBAN\
K ,PAYACNT  from PKMPMAS B where A.EMPNO=B.EMPNO) where (EMPNO>=:b0 and EMPNO\
<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )307;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "은행사항 갱신중"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.3.4 은행사항 갱신중...\n");
     }
     
     /* 9.3.5 퇴직연금정보 삭제 [2018.12.12 jhg] */
     /* EXEC SQL
     DELETE FROM PKHMRESH_INFO
      WHERE SDATE = :g_mrtodate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHMRESH_INFO  where SDATE=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )330;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직연금정보 삭제중."); 
          hinsa_exit(0,"9.3.5 퇴직연금정보 삭제중...\n");
     }
          
     /* 9.3.5.1 퇴직연금정보 저장 [2018.12.12 jhg] */   
     /* EXEC SQL
     INSERT INTO PKHMRESH_INFO  
        SELECT :g_mrtodate, M.EMPNO, M.RPTYPE, TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'), :g_workemp 
          FROM (SELECT A.EMPNO, A.RPTYPE
                  FROM PKHRPAPP A,
                      (select empno, Max(SDate) SDate, Max(RPTYPE) RPTYPE  /o 2019.02.01 eyha 같은적용일에 제도가 두건있을경우의 오류수정 , Max(RPTYPE) RPTYPE 추가o/ 
                         from PKHRPAPP                    
                        group by EMPNO) B, (SELECT EMPNO FROM PKMPMAS WHERE PSTATE <'80') C
                 WHERE A.EMPNO = B.EMPNO
                   AND A.SDATE = B.SDATE
                   AND A.RPTYPE = B.RPTYPE   /o 2019.02.01 eyha 같은적용일에 제도가 두건있을경우의 오류수정 o/                 
                   AND A.EMPNO = C.EMPNO) M ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHMRESH_INFO  select :b0 ,M.EMPNO ,M.RPTYP\
E ,TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') ,:b1  from (select A.EMPNO ,A.RPTYPE  \
from PKHRPAPP A ,(select empno ,max(SDate) SDate ,max(RPTYPE) RPTYPE  from PK\
HRPAPP  group by EMPNO) B ,(select EMPNO  from PKMPMAS where PSTATE<'80') C w\
here (((A.EMPNO=B.EMPNO and A.SDATE=B.SDATE) and A.RPTYPE=B.RPTYPE) and A.EMP\
NO=C.EMPNO)) M ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )349;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_workemp;
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
          Write_batlog(seqno++, "퇴직연금정보 생성중");
          hinsa_exit(0,"9.3.5.1 퇴직연금정보 생성중...\n");
     }             
     
     /* 9.3.5.2 퇴직연금정보 저장- 혼합형DC [2019.01.02 jhg] */ 
     /* EXEC SQL
     UPDATE PKHMRESH_INFO  
        SET STYPE = '4'
      WHERE EMPNO IN (SELECT A.EMPNO 
                        FROM PKHRPAPP A, (SELECT EMPNO, sdate FROM PKHRPAPP WHERE RPTYPE = '3') B, (SELECT EMPNO FROM PKMPMAS WHERE PSTATE <'80') C
                       WHERE A.sdate <= B.sdate
                         AND A.EMPNO = B.EMPNO
                         AND A.RPTYPE = '2'
                         AND A.EMPNO = C.EMPNO
                       GROUP BY A.EMPNO)
        AND SDATE = :g_mrtodate
        AND STYPE = '3' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHMRESH_INFO  set STYPE='4' where ((EMPNO in (s\
elect A.EMPNO  from PKHRPAPP A ,(select EMPNO ,sdate  from PKHRPAPP where RPT\
YPE='3') B ,(select EMPNO  from PKMPMAS where PSTATE<'80') C where (((A.sdate\
<=B.sdate and A.EMPNO=B.EMPNO) and A.RPTYPE='2') and A.EMPNO=C.EMPNO) group b\
y A.EMPNO) and SDATE=:b0) and STYPE='3')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )372;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
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


        	
        	
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "퇴직연금정보 생성중");
          hinsa_exit(0,"9.3.5.2 퇴직연금정보 생성중...\n");
     }        
     
     /* 9.3.6 혼합형적용일 처리 [2018.12.18 jhg] */
     /* EXEC SQL
     UPDATE PKMMREST A 
        SET A.SDATE =
            (SELECT B.SDATE
               FROM PKHRPAPP B, PKHMRESH_INFO C
              WHERE A.EMPNO = B.EMPNO
                AND B.EMPNO = C.EMPNO
                AND B.RPTYPE = '3'
                AND C.STYPE = '3' 
                AND C.SDATE = :g_mrtodate)
      WHERE A.EMPNO >= :g_frempno AND A.EMPNO <= :g_toempno
      	AND A.EMPNO IN (SELECT B.EMPNO 
      	                  FROM PKHRPAPP B, PKHMRESH_INFO C 
      	                 WHERE B.EMPNO = C.EMPNO AND B.RPTYPE = '3' AND C.STYPE = '3' AND C.SDATE = :g_mrtodate) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST A  set A.SDATE=(select B.SDATE  from PK\
HRPAPP B ,PKHMRESH_INFO C where ((((A.EMPNO=B.EMPNO and B.EMPNO=C.EMPNO) and \
B.RPTYPE='3') and C.STYPE='3') and C.SDATE=:b0)) where ((A.EMPNO>=:b1 and A.E\
MPNO<=:b2) and A.EMPNO in (select B.EMPNO  from PKHRPAPP B ,PKHMRESH_INFO C w\
here (((B.EMPNO=C.EMPNO and B.RPTYPE='3') and C.STYPE='3') and C.SDATE=:b0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )391;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)g_mrtodate;
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


      	
   /*  EXEC SQL
     UPDATE PKMMREST A 
        SET SDATE =
            (SELECT MIN(SDATE)
               FROM PKHMRESH_INFO B
              WHERE A.EMPNO = B.EMPNO
                AND B.STYPE = '3' )
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
      	AND EMPNO IN (SELECT EMPNO FROM PKHMRESH_INFO WHERE STYPE='3') ;  */    	
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "혼합형적용일 처리중"); 
          hinsa_exit(0,"9.3.6 혼합형적용일 처리중...\n");
     }   
     
     /* 9.3.6.1 혼합형이전 데이타 처리 FIRST [2018.12.18 jhg] */
     /*EXEC SQL
     UPDATE PKMMREST A 
        SET (RETRATE1, RETMM1, RETYY1) = (SELECT NVL(RETRATE,0.0), NVL(RETMM,0), NVL(REALYY,0) FROM PKHMRESH B
                                           WHERE A.EMPNO = B.EMPNO 
                                             AND MRTODATE = TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'), -1)),'YYYYMMDD'))
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
        AND SDATE IS NOT NULL  
        AND EMPNO IN (SELECT EMPNO FROM PKHMRESH 
                       WHERE MRTODATE = TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'), -1)),'YYYYMMDD') 
                       	 AND NVL(RETMM2,0) = 0);   */
       
     /* EXEC SQL
     UPDATE PKMMREST A 
        SET (RETRATE1, RETMM1, RETYY1) = (SELECT NVL(RETRATE,0.0), NVL(RETMM,0), NVL(REALYY,0) 
                                            FROM PKHMRESH B, (SELECT EMPNO, MAX(MRTODATE) MRTODATE FROM PKHMRESH GROUP BY EMPNO) D
                                           WHERE A.EMPNO = B.EMPNO 
                                             AND B.MRTODATE = D.MRTODATE
                                             AND B.EMPNO = D.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
        AND SDATE IS NOT NULL  
        AND EMPNO IN (SELECT B.EMPNO FROM PKHMRESH B, (SELECT EMPNO, MAX(MRTODATE) MRTODATE FROM PKHMRESH GROUP BY EMPNO) D
                       WHERE B.MRTODATE = D.MRTODATE 
                         AND B.EMPNO = D.EMPNO
                       	 AND NVL(B.RETMM2,0) = 0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST A  set (RETRATE1,RETMM1,RETYY1)=(select\
 NVL(RETRATE,0.0) ,NVL(RETMM,0) ,NVL(REALYY,0)  from PKHMRESH B ,(select EMPN\
O ,max(MRTODATE) MRTODATE  from PKHMRESH  group by EMPNO) D where ((A.EMPNO=B\
.EMPNO and B.MRTODATE=D.MRTODATE) and B.EMPNO=D.EMPNO)) where (((EMPNO>=:b0 a\
nd EMPNO<=:b1) and SDATE is  not null ) and EMPNO in (select B.EMPNO  from PK\
HMRESH B ,(select EMPNO ,max(MRTODATE) MRTODATE  from PKHMRESH  group by EMPN\
O) D where ((B.MRTODATE=D.MRTODATE and B.EMPNO=D.EMPNO) and NVL(B.RETMM2,0)=0\
)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )422;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          printf("[ERRCODE : %d] %s\n",sqlca.sqlcode, SQLERRM);          
          Write_batlog(seqno++, "혼합형이전 데이타 처리중"); 
          hinsa_exit(0,"9.3.6.1 혼합형이전 데이타 FIRST 처리중...\n");
     }     
     
     /* 9.3.6.2 혼합형이전 데이타 처리 NEXT [2018.12.18 jhg] */
     /*EXEC SQL
     UPDATE PKMMREST A 
        SET (RETRATE1, RETMM1, RETYY1) = (SELECT NVL(RETRATE1,0.0), NVL(RETMM1,0), NVL(RETYY1,0) FROM PKHMRESH B
                                           WHERE A.EMPNO = B.EMPNO 
                                             AND MRTODATE = TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'), -1)),'YYYYMMDD'))
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
        AND SDATE IS NOT NULL  
        AND EMPNO IN (SELECT EMPNO FROM PKHMRESH 
                       WHERE MRTODATE = TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'), -1)),'YYYYMMDD')
                         AND NVL(RETMM2,0) > 0 );   */

     /* EXEC SQL
     UPDATE PKMMREST A 
        SET (RETRATE1, RETMM1, RETYY1) = (SELECT NVL(RETRATE1,0.0), NVL(RETMM1,0), NVL(RETYY1,0) 
                                            FROM PKHMRESH B, (SELECT EMPNO, MAX(MRTODATE) MRTODATE FROM PKHMRESH GROUP BY EMPNO) D
                                           WHERE A.EMPNO = B.EMPNO 
                                             AND B.MRTODATE = D.MRTODATE
                                             AND B.EMPNO = D.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
        AND SDATE IS NOT NULL  
        AND EMPNO IN (SELECT B.EMPNO FROM PKHMRESH B, (SELECT EMPNO, MAX(MRTODATE) MRTODATE FROM PKHMRESH GROUP BY EMPNO) D
                       WHERE B.MRTODATE = D.MRTODATE 
                         AND B.EMPNO = D.EMPNO
                       	 AND NVL(B.RETMM2,0) > 0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 9;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST A  set (RETRATE1,RETMM1,RETYY1)=(select\
 NVL(RETRATE1,0.0) ,NVL(RETMM1,0) ,NVL(RETYY1,0)  from PKHMRESH B ,(select EM\
PNO ,max(MRTODATE) MRTODATE  from PKHMRESH  group by EMPNO) D where ((A.EMPNO\
=B.EMPNO and B.MRTODATE=D.MRTODATE) and B.EMPNO=D.EMPNO)) where (((EMPNO>=:b0\
 and EMPNO<=:b1) and SDATE is  not null ) and EMPNO in (select B.EMPNO  from \
PKHMRESH B ,(select EMPNO ,max(MRTODATE) MRTODATE  from PKHMRESH  group by EM\
PNO) D where ((B.MRTODATE=D.MRTODATE and B.EMPNO=D.EMPNO) and NVL(B.RETMM2,0)\
>0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )445;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "혼합형이전 데이타 처리중");         
          hinsa_exit(0,sqlca.sqlcode+"9.3.6.2 혼합형이전 데이타 NEXT 처리중...\n");
     }          
}

int get_RealYYMMDD(char *m_empno,char *m_empdate,char *m_retdate, int *m_dutydd, int *m_dutymm, int *m_exdd, int *m_realdd, int *m_realmm, int *m_realyy)
{
    /* EXEC SQL
         SELECT   RETUTIL.GET_DUTYDD(       EMPDATE, RETDATE)   DUTYDD                                                                                    
                , RETUTIL.GET_DUTYMM(       EMPDATE, RETDATE)   DUTYMM
                , RETUTIL.GET_EXDD  (EMPNO, EMPDATE, RETDATE)     EXDD                                                                                    
                , RETUTIL.GET_REALDD(EMPNO, EMPDATE, RETDATE)   REALDD
                , RETUTIL.GET_REALMM(EMPNO, EMPDATE, RETDATE)   REALMM
                , RETUTIL.GET_REALYY(EMPNO, EMPDATE, RETDATE)   REALYY                
           INTO m_dutydd, m_dutymm, m_exdd, m_realdd, m_realmm, m_realyy               
           FROM (SELECT :m_empno EMPNO, :m_empdate EMPDATE, :m_retdate RETDATE FROM DUAL) A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 9;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select RETUTIL.GET_DUTYDD(EMPDATE,RETDATE) DUTYDD ,RETUT\
IL.GET_DUTYMM(EMPDATE,RETDATE) DUTYMM ,RETUTIL.GET_EXDD(EMPNO,EMPDATE,RETDATE\
) EXDD ,RETUTIL.GET_REALDD(EMPNO,EMPDATE,RETDATE) REALDD ,RETUTIL.GET_REALMM(\
EMPNO,EMPDATE,RETDATE) REALMM ,RETUTIL.GET_REALYY(EMPNO,EMPDATE,RETDATE) REAL\
YY into :b0,:b1,:b2,:b3,:b4,:b5  from (select :b6 EMPNO ,:b7 EMPDATE ,:b8 RET\
DATE  from DUAL ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )468;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)m_dutydd;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)m_dutymm;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)m_exdd;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)m_realdd;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)m_realmm;
    sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)m_realyy;
    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)m_empno;
    sqlstm.sqhstl[6] = (unsigned long )0;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)m_empdate;
    sqlstm.sqhstl[7] = (unsigned long )0;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)m_retdate;
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


    
    return 0;
}

/* 2018.12.18 JHG 혼합형적용이후 개월수 계산위해 REALMM2,SDATE 추가 */
int get_RealYYMMDD2(char *m_empno,char *m_empdate,char *m_retdate, int *m_dutydd, int *m_dutymm, int *m_exdd, int *m_realdd, int *m_realmm, int *m_realyy, int *m_realmm2, char *m_sdate)
{
    /* EXEC SQL
         SELECT   RETUTIL.GET_DUTYDD(       EMPDATE, RETDATE)   DUTYDD                                                                                    
                , RETUTIL.GET_DUTYMM(       EMPDATE, RETDATE)   DUTYMM
                , RETUTIL.GET_EXDD  (EMPNO, EMPDATE, RETDATE)     EXDD                                                                                    
                , RETUTIL.GET_REALDD(EMPNO, EMPDATE, RETDATE)   REALDD
                , RETUTIL.GET_REALMM(EMPNO, EMPDATE, RETDATE)   REALMM
                , RETUTIL.GET_REALYY(EMPNO, EMPDATE, RETDATE)   REALYY
                , RETUTIL.GET_REALMM(EMPNO, SDATE,   RETDATE)-1   REALMM2 
           INTO m_dutydd, m_dutymm, m_exdd, m_realdd, m_realmm, m_realyy, m_realmm2                
           FROM (SELECT :m_empno EMPNO, :m_empdate EMPDATE, :m_retdate RETDATE, :m_sdate SDATE FROM DUAL) A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 11;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select RETUTIL.GET_DUTYDD(EMPDATE,RETDATE) DUTYDD ,RETUT\
IL.GET_DUTYMM(EMPDATE,RETDATE) DUTYMM ,RETUTIL.GET_EXDD(EMPNO,EMPDATE,RETDATE\
) EXDD ,RETUTIL.GET_REALDD(EMPNO,EMPDATE,RETDATE) REALDD ,RETUTIL.GET_REALMM(\
EMPNO,EMPDATE,RETDATE) REALMM ,RETUTIL.GET_REALYY(EMPNO,EMPDATE,RETDATE) REAL\
YY ,(RETUTIL.GET_REALMM(EMPNO,SDATE,RETDATE)-1) REALMM2 into :b0,:b1,:b2,:b3,\
:b4,:b5,:b6  from (select :b7 EMPNO ,:b8 EMPDATE ,:b9 RETDATE ,:b10 SDATE  fr\
om DUAL ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )519;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)m_dutydd;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)m_dutymm;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)m_exdd;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)m_realdd;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)m_realmm;
    sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)m_realyy;
    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)m_realmm2;
    sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)m_empno;
    sqlstm.sqhstl[7] = (unsigned long )0;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)m_empdate;
    sqlstm.sqhstl[8] = (unsigned long )0;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)m_retdate;
    sqlstm.sqhstl[9] = (unsigned long )0;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)m_sdate;
    sqlstm.sqhstl[10] = (unsigned long )0;
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


    
    return 0;
}

/***************************************************************************
9.4 퇴직금 계산 Logic .... 일수 관련만
***************************************************************************/
void Calc_Retamt()
{
     int Tmp=0;
     char mrfrdate[9], mrtodate[9], bretfrday[9];
     char empno[4+1];
     char tcalcyy[4+1],tcalcmm[2+1],tcalcdd[2+1] ; /* 계산결과*/
     int  tduyy=0,tdumm=0,tdudd=0,tdudays=0;

     memset(empno,     0x00,sizeof(empno));
     

/* dsa2000 추가 2004.10.12  전산처리요청  1년에 여러번 중간정산하는자의 근속기간 및 세금 계산시
                                         기존 정산내역을 포함하여 계산되도록함.*/        
        /* 종전 중간정산 자료를 종근무지 자료에 입력한다.*/
     /* EXEC SQL
     UPDATE  PKMMREST A
        SET  (BRETMM     , BRETAMT   ,
              BRETINTAX  , BRETJUTAX ,
              BRETFRDAY  , BRETTODAY ) =
             (SELECT  SUM(NVL(RETMM   ,0)), SUM(NVL(RETAMT,  0)),
                      SUM(NVL(RETINTAX,0)), SUM(NVL(RETJUTAX,0)),
                      MIN(MRFRDATE),        MAX(MRTODATE)
                FROM  PKHMRHIS B
               WHERE A.EMPNO = B.EMPNO
                 AND SUBSTR(A.MRTODATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)
               GROUP BY B.EMPNO )
        WHERE  EMPNO IN (SELECT EMPNO 
                           FROM  PKHMRHIS B
                          WHERE  A.EMPNO = B.EMPNO
                            AND  SUBSTR(A.MRTODATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST A  set (BRETMM,BRETAMT,BRETINTAX,BRETJU\
TAX,BRETFRDAY,BRETTODAY)=(select sum(NVL(RETMM,0)) ,sum(NVL(RETAMT,0)) ,sum(N\
VL(RETINTAX,0)) ,sum(NVL(RETJUTAX,0)) ,min(MRFRDATE) ,max(MRTODATE)  from PKH\
MRHIS B where (A.EMPNO=B.EMPNO and SUBSTR(A.MRTODATE,1,4)=SUBSTR(B.MRTODATE,1\
,4)) group by B.EMPNO) where EMPNO in (select EMPNO  from PKHMRHIS B where (A\
.EMPNO=B.EMPNO and SUBSTR(A.MRTODATE,1,4)=SUBSTR(B.MRTODATE,1,4)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )578;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



        if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
        {       
             Write_batlog(seqno++, "중간정산자료 setting Error"); /*dsa2000 Rexec 대체*/
             error_quit(sqlca.sqlcode,"1.2 중간정산자료 setting Error");
        }

       /* EXEC SQL
       UPDATE  PKMMREST A
          SET  BRETMM      = NVL(BRETMM    ,0),
               BRETAMT     = NVL(BRETAMT   ,0),
               BRETINTAX   = NVL(BRETINTAX ,0),
               BRETJUTAX   = NVL(BRETJUTAX ,0) ; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 11;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMMREST A  set BRETMM=NVL(BRETMM,0),BRETAMT=N\
VL(BRETAMT,0),BRETINTAX=NVL(BRETINTAX,0),BRETJUTAX=NVL(BRETJUTAX,0)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )593;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


 

/*입사일, 퇴사일모두 근속일에 포함(+1부분추가)
        EXEC    SQL
        UPDATE  PKMMREST
           SET  dutymm = ceil(months_between(to_date(mrtodate,'YYYYMMDD') + 1,
                                             to_date(mrfrdate,'YYYYMMDD'))),
                dutydd = to_date(mrtodate,'YYYYMMDD')-
                         to_date(mrfrdate,'YYYYMMDD') + 1;

        if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
        {       
             Write_batlog(seqno++, "근속일수  setting Error"); 
             error_quit(sqlca.sqlcode,"1.3 근속일수 setting Error");
        }
 */        
/* dsa2000 추가 end   2004.10.12.........................................................*/


     /* EXEC SQL DECLARE s1 CURSOR FOR
         SELECT A.*,
                CASE WHEN MRFRDATE_CALC <='20121231'  THEN MRFRDATE_CALC                      ELSE '' END MRFRDATE_2012,
                CASE WHEN MRFRDATE_CALC <='20121231'  THEN LEAST(MRTODATE_CALC,'20121231')    ELSE '' END MRTODATE_2012,
                CASE WHEN MRTODATE_CALC >='20130101'  THEN GREATEST(MRFRDATE_CALC,'20130101') ELSE '' END MRFRDATE_2013,
                CASE WHEN MRTODATE_CALC >='20130101'  THEN MRTODATE_CALC                      ELSE '' END MRTODATE_2013      
         FROM (           
              SELECT  EMPNO,
                      MRFRDATE, 
                      MRTODATE,
                      NVL(SDATE,'9') SDATE,     /o 2018.12.18 jhg 혼합형적용일 o/	
                      CASE WHEN BRETFRDAY IS NOT NULL THEN LEAST   (MRFRDATE,BRETFRDAY)  ELSE MRFRDATE END MRFRDATE_CALC,
                      CASE WHEN BRETTODAY IS NOT NULL THEN GREATEST(MRTODATE,BRETTODAY)  ELSE MRTODATE END MRTODATE_CALC                     
                FROM  PKMMREST WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
             )A; */ 

     
     
     /* EXEC SQL open  s1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 11;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0020;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )608;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          /* EXEC SQL close s1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )631;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          Write_batlog(seqno++, "근속기간 계산중 Error"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.4.1 근속기간 계산중...\n");
     }
     
     for(;;)
     {
          /* EXEC SQL FETCH s1
          INTO  :empno, :mrfrdate, :mrtodate, :sdate, :mrfrdate_calc, :mrtodate_calc,:mrfrdate_2012, :mrtodate_2012,:mrfrdate_2013, :mrtodate_2013; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )646;
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
          sqlstm.sqhstv[1] = (unsigned char  *)mrfrdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)mrtodate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)sdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)mrfrdate_calc;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)mrtodate_calc;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)mrfrdate_2012;
          sqlstm.sqhstl[6] = (unsigned long )9;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)mrtodate_2012;
          sqlstm.sqhstl[7] = (unsigned long )9;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)mrfrdate_2013;
          sqlstm.sqhstl[8] = (unsigned long )9;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)mrtodate_2013;
          sqlstm.sqhstl[9] = (unsigned long )9;
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

 /* 2018.12.18 jhg 혼합형적용일 sdate */
          	
          if (sqlca.sqlcode == 1403)
          {
              /* EXEC SQL close s1; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 11;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )701;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              break;
          }
     
          /* 최종분 근속 연수 */
          dutydd = dutymm = exdd = realdd = realmm = realyy = realmm2 = 0; /* 2018.12.18 jhg 혼합형적용이후 개월수 realmm2 */

          
          get_RealYYMMDD(empno,mrfrdate,mrtodate,&dutydd,&dutymm,&exdd,&realdd,&realmm,&realyy);
          
          /* 2018.12.18 jhg 혼합형적용일로 분리 */
          if (strcmp(sdate,"9")!=0) 
          {	 
            get_RealYYMMDD2(empno,mrfrdate,mrtodate,&dutydd,&dutymm,&exdd,&realdd,&realmm,&realyy,&realmm2,sdate); 
          }
                      	
          /* 정산(합산) 근속 연수 */
          dutydd_calc = dutymm_calc = exdd_calc = realdd_calc = realmm_calc = realyy_calc = 0;

          get_RealYYMMDD(empno,mrfrdate_calc,mrtodate_calc,&dutydd_calc,&dutymm_calc,&exdd_calc,&realdd_calc,&realmm_calc,&realyy_calc); 


          /* 2012.12.31. 이전 근속 연수 */
          dutydd_2012 = dutymm_2012 = exdd_2012 = realdd_2012 = realmm_2012 = realyy_2012 = 0;

          if((strcmp(mrfrdate_2012,"")!=0)&&(strcmp(mrtodate_2012,"")!=0)  )
             get_RealYYMMDD(empno,mrfrdate_2012,mrtodate_2012,&dutydd_2012,&dutymm_2012,&exdd_2012,&realdd_2012,&realmm_2012,&realyy_2012); 


          /* 2013.01.01. 이후 근속 연수 */
          dutydd_2013 = dutymm_2013 = exdd_2013 = realdd_2013 = realmm_2013 = realyy_2013 = 0;
          
          /* 2017.03.14 eyha 근속연수 계산식 변경  
          if((strcmp(mrfrdate_2013,"")!=0)&&(strcmp(mrtodate_2013,"")!=0)  )
             get_RealYYMMDD(empno,mrfrdate_2013,mrtodate_2013,&dutydd_2013,&dutymm_2013,&exdd_2013,&realdd_2013,&realmm_2013,&realyy_2013);  */

          if((strcmp(mrfrdate_2013,"")!=0)&&(strcmp(mrtodate_2013,"")!=0)  )
          {	
  		      dutydd_2013  = dutydd_calc - dutydd_2012;
	  	      dutymm_2013  = dutymm_calc - dutymm_2012;
		        exdd_2013    = exdd_calc   - exdd_2012;
		        realdd_2013  = realdd_calc - realdd_2012;
		        realmm_2013  = realmm_calc - realmm_2012;
          } 


          realyy_2013 = realyy_calc - realyy_2012;
     
          /* EXEC SQL
          UPDATE PKMMREST  
             SET
                     EXDAYS     = :exdd,                             
                     DUDAYS     = :dutydd,
                     REALDAYS   = :realdd,
                     DUTYDD     = :dutydd,
                     DUTYMM     = :dutymm,
                     DUTYYY     = trunc(:dutymm /12),   /o 2015.03.10 근속년수를 사용함에 따라 갱신 o/
                     EXDD       = :exdd,
                     REALDD     = :realdd,
                     REALMM     = :realmm,
                     REALYY     = :realyy,
                     RETMM      = :realmm,
                     RETYY      = :retyy,
                     RETYY2013  = :realyy_2013,
                  MRFRDATE_CALC = :mrfrdate_calc,
                  MRTODATE_CALC = :mrtodate_calc,                      
                    DUTYDD_CALC = :dutydd_calc,
                    DUTYMM_CALC = :dutymm_calc,
                      EXDD_CALC = :exdd_calc,
                    REALDD_CALC = :realdd_calc,
                    REALMM_CALC = :realmm_calc,
                    REALYY_CALC = :realyy_calc,
                  MRFRDATE_2012 = :mrfrdate_2012,
                  MRTODATE_2012 = :mrtodate_2012,                      
                    DUTYDD_2012 = :dutydd_2012,
                    DUTYMM_2012 = :dutymm_2012,
                      EXDD_2012 = :exdd_2012,
                    REALDD_2012 = :realdd_2012,
                    REALMM_2012 = :realmm_2012,
                    REALYY_2012 = :realyy_2012,
                  MRFRDATE_2013 = :mrfrdate_2013,
                  MRTODATE_2013 = :mrtodate_2013,
                    DUTYDD_2013 = :dutydd_2013,
                    DUTYMM_2013 = :dutymm_2013,
                      EXDD_2013 = :exdd_2013,
                    REALDD_2013 = :realdd_2013,
                    REALMM_2013 = :realmm_2013,
                    REALYY_2013 = :realyy_2013,
                    	RETMM2    = :realmm2     /o 2018.12.18 jhg 혼합형적용일로 분리 o/
          WHERE EMPNO =:empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMMREST  set EXDAYS=:b0,DUDAYS=:b1,REALDAY\
S=:b2,DUTYDD=:b1,DUTYMM=:b4,DUTYYY=trunc((:b4/12)),EXDD=:b0,REALDD=:b2,REALMM\
=:b8,REALYY=:b9,RETMM=:b8,RETYY=:b11,RETYY2013=:b12,MRFRDATE_CALC=:b13,MRTODA\
TE_CALC=:b14,DUTYDD_CALC=:b15,DUTYMM_CALC=:b16,EXDD_CALC=:b17,REALDD_CALC=:b1\
8,REALMM_CALC=:b19,REALYY_CALC=:b20,MRFRDATE_2012=:b21,MRTODATE_2012=:b22,DUT\
YDD_2012=:b23,DUTYMM_2012=:b24,EXDD_2012=:b25,REALDD_2012=:b26,REALMM_2012=:b\
27,REALYY_2012=:b28,MRFRDATE_2013=:b29,MRTODATE_2013=:b30,DUTYDD_2013=:b31,DU\
TYMM_2013=:b32,EXDD_2013=:b33,REALDD_2013=:b34,REALMM_2013=:b35,REALYY_2013=:\
b12,RETMM2=:b37 where EMPNO=:b38";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )716;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&exdd;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&dutydd;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&realdd;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&dutydd;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&dutymm;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&dutymm;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&exdd;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&realdd;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&realmm;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&realyy;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&realmm;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&retyy;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)mrfrdate_calc;
          sqlstm.sqhstl[13] = (unsigned long )9;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)mrtodate_calc;
          sqlstm.sqhstl[14] = (unsigned long )9;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&dutydd_calc;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&dutymm_calc;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&exdd_calc;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&realdd_calc;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&realmm_calc;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)mrfrdate_2012;
          sqlstm.sqhstl[21] = (unsigned long )9;
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)mrtodate_2012;
          sqlstm.sqhstl[22] = (unsigned long )9;
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&dutydd_2012;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&dutymm_2012;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&exdd_2012;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&realdd_2012;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&realmm_2012;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)&realyy_2012;
          sqlstm.sqhstl[28] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)mrfrdate_2013;
          sqlstm.sqhstl[29] = (unsigned long )9;
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)mrtodate_2013;
          sqlstm.sqhstl[30] = (unsigned long )9;
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&dutydd_2013;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&dutymm_2013;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&exdd_2013;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&realdd_2013;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&realmm_2013;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&realmm2;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)empno;
          sqlstm.sqhstl[38] = (unsigned long )5;
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
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


              
     }/* end of for */
     
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "근속기간 계산중 Error"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.4.2 근속기간 계산중...\n");
     }
     
}

/***************************************************************************
9.5 평균임금/통산임금 계산
***************************************************************************/
void Calc_Avggross()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char before3mon[6+1] = "" ;  /*  3개월 전(g_mrtodate포함 3개월) */
          char before12mon[6+1] = "" ; /* 12개월 전(g_mrtodate포함12개월) */
          long int odamt = 0;          /* 운전지원금 일괄 적용액          */
          float  avgpay1;
          float  avgpay2;
          float  ovtmamt1;
          float  ovtmamt2;
          char  p_empno[4+1];
     /* EXEC SQL END DECLARE SECTION; */ 

  
     char  t_baseyymm[6+1];
     int   flag;

/* ================================================================================
*    // 9.5.1 임시변수 산정
*    EXEC SQL
*        SELECT TO_CHAR(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'),-2),'YYYYMM'),
*               TO_CHAR(ADD_MONTHS(TO_DATE(:g_mrtodate,'YYYYMMDD'),-11),'YYYYMM'),
*               AVGODAMT
*        INTO :before3mon, :before12mon, :odamt
*        FROM PKCPBAS;
*
*    if (sqlca.sqlcode != 0)
*    {
*        hinsa_exit(0,"9.5.1 임시변수 산정중...\n");
*    }
*
*    // 9.5.2  3개월 급여합
*    EXEC SQL
*        UPDATE PKMMREST R SET
*            PAY3SUM =
*            (SELECT SUM(NVL(BASICAMT,0)+NVL(INFOAMT,0)+NVL(DUTYAMT,0)+
*                        NVL(BBASICAMT,0)+NVL(BINFOAMT,0)+NVL(BDUTYAMT,0)+
*                        NVL(MATEAMT,0)+NVL(PARTAMT,0)+NVL(CHILDAMT,0)+
*                        NVL(OVTMAMT,0)+NVL(SPTMAMT,0)+NVL(MCARAMT,0)+
*                        NVL(LICEAMT,0)+NVL(MBONAMT,0)+NVL(SOPAY,0)+
*                        DECODE(NVL(ODAMT,0),0,0,:odamt)
*                       )
*             FROM PKHPHIS H
*             WHERE R.EMPNO = H.EMPNO
*               AND H.PAYDATE BETWEEN :before3mon AND :g_mrtodate
*            )
*        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
*        ;
*             
*    // NULL 값은 상여합 계산 후
*    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
*    {
*        hinsa_exit(0,"9.5.2  3개월 급여합 계산중...\n");
*    }
*
*    // 9.5.3  12개월 상여합
*    EXEC SQL
*        UPDATE PKMMREST R SET
*            BON12SUM =
*            (SELECT SUM(NVL(BONUSAMT,0)+NVL(INCENTAMT,0)+NVL(TRAINAMT,0)+
*                        NVL(WINTERAMT,0)+NVL(YBONAMT,0)+ NVL(HOMESUPAMT,0)+
*                        NVL(SOBON,0)
*                       )
*             FROM PKHPHIS H
*             WHERE R.EMPNO = H.EMPNO
*               AND H.PAYDATE BETWEEN :before12mon AND :g_mrtodate
*            )
*        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
*        ;
*
*    // NULL 값은 상여합 계산 후
*    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
*    {
*        hinsa_exit(0,"9.5.3  12개월 상여합 계산중...\n");
*    }
*
*    // 9.5.4 급여합, 상여합 NULL 조정
*    EXEC SQL
*        UPDATE PKMMREST SET
*            PAY3SUM  = NVL(PAY3SUM,0),
*            BON12SUM = NVL(BON12SUM,0)
*        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
*        ;
*
*    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
*    {
*        hinsa_exit(0,"9.5.4  급여합, 상여합 NULL 조정중...\n");
*    }
*================================================================================ */
     /* EXEC SQL
     UPDATE PKMMREST 
        SET PAY3SUM  = 0,
            BON12SUM = 0,
            AVGPAY   = 0,
            AVGBON   = 0
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set PAY3SUM=0,BON12SUM=0,AVGPAY=0,AVGB\
ON=0 where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )887;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "급여합, 상여합 NULL 조정중."); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.5.4  급여합, 상여합 NULL 조정중...\n");
     }
     
     
       /* 9.5.5 평균 급여, 평균 상여, 평균 임금 */
     
     sprintf(t_baseyymm,"%.6s",g_mrtodate);
     /* EXEC SQL DECLARE cur1 CURSOR FOR
     select  empno
       from  PKMMREST
      where  empno >= :g_frempno and empno <= :g_toempno
             /o and   paycl >= '09'       2002.3.19. 이사대우까지 임원계산로직 반영-->인사팀 요청  o/
             //infra          and   paycl > '09'
        and  paycl >= 'C11'
      order  by empno; */ 


     /* EXEC SQL OPEN cur1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0023;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )910;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405)) 
     {
          Write_batlog(seqno++, "평균 임금 계산중."); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.5.5.1 평균 임금 계산중...\n");
     }
     
     while  (1)
     {
          /* EXEC SQL  FETCH  cur1
          INTO    :p_empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )933;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)p_empno;
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


          if  (sqlca.sqlcode == 1403) 
          {
               /* EXEC SQL CLOSE cur1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )952;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          
          if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
          {
               Write_batlog(seqno++, "2평균 임금 계산중."); /*dsa2000 Rexec 대체*/
               hinsa_exit(0,"9.5.5.2 평균 임금 계산중...\n");
          }
          
          sprintf(p_empno,"%.4s",p_empno);
          
          if ((flag=get_mr_avgpay(p_empno,t_baseyymm,&avgpay1,&avgpay2,
               &ovtmamt1,&ovtmamt2)) != 0)
          {
               printf("empno : [%s] \n",p_empno);
               Write_batlog(seqno++, "3평균 임금 계산중."); /*dsa2000 Rexec 대체*/
               hinsa_exit(0,"9.5.5.3 평균 임금 계산중...\n");    
          }
          /* printf("[DEBUG] empno : [%s] , %10.0f\n",p_empno,avgpay1); */
          
          if  (calckind[0] == '1') 
          { 
               /* EXEC SQL
               update  PKMMREST
                  set  avggross = :avgpay1
                where  empno = :p_empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMMREST  set avggross=:b0 where empno\
=:b1";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )967;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&avgpay1;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)p_empno;
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


               if  (sqlca.sqlcode != 0)
               {
                    printf("empno : [%s] \n %10.0f",p_empno,avgpay1); 
                    Write_batlog(seqno++, "4평균 임금 계산중."); /*dsa2000 Rexec 대체*/
                    hinsa_exit(0,"9.5.5.4 평균 임금 계산중...\n");
               }
          }
          else if (calckind[0] == '2')
          {
               /* EXEC SQL
               update  PKMMREST
                  set  avggross = :avgpay2
                where  empno = :p_empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMMREST  set avggross=:b0 where empno\
=:b1";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )990;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&avgpay2;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)p_empno;
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


               if  (sqlca.sqlcode != 0)
               {
                    Write_batlog(seqno++, "5평균 임금 계산중."); /*dsa2000 Rexec 대체*/
                    hinsa_exit(0,"9.5.5.5 평균 임금 계산중...\n");
               }
          } 
     }
    
/* =================================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   31.00       2001.03.13         유효성        임원 연봉제에 따른 평균임금,통상임금 계산방법 변경
                                                (임원평균임금=(기본연봉+업적연봉+중식비연간총액)/12)                                               
==================================================================================== */
     /* EXEC SQL
     UPDATE PKMMREST A
        SET AVGGROSS = ( SELECT CEIL(( TOTPAY + AVGMCARAMT ) /12)
                           FROM PKHYPHIS B, PKCPBAS C
                           WHERE A.EMPNO = B.EMPNO
                            AND  B.YEARPAYNUM  = (SELECT TO_CHAR(YEARPAYNUM) FROM PKCPBAS)
                        )  
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
         /o 2002.3.19. 이사대우까지 임원계산로직 반영 
         AND PAYCL < '09' ;  o/
         //infra        AND PAYCL <= '09' ;
        AND PAYCL <= 'A99' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST A  set AVGGROSS=(select CEIL(((TOTPAY+A\
VGMCARAMT)/12))  from PKHYPHIS B ,PKCPBAS C where (A.EMPNO=B.EMPNO and B.YEAR\
PAYNUM=(select TO_CHAR(YEARPAYNUM)  from PKCPBAS ))) where ((EMPNO>=:b0 and E\
MPNO<=:b1) and PAYCL<='A99')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1013;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          hinsa_exit(0," 임원 평균 임금 계산중...\n");
     }
     
     
     /* 9.5.6-1 통상 임금 .... */
     /* EXEC SQL
     UPDATE PKMMREST R SET
            COMMONAMT =
/o            (SELECT  CEIL(TOTPAY/18)       통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 o/
            (SELECT  CEIL((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3) /12)  /o 2014.11.07 하은영 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
               FROM  PKHYPHIS P
              WHERE  R.EMPNO = P.EMPNO 
                AND  YEARPAYNUM = (SELECT TO_CHAR(YEARPAYNUM) FROM PKCPBAS)  
            )
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST R  set COMMONAMT=(select CEIL(((((TOTPA\
Y+TONGAMT1)+TONGAMT2)+TONGAMT3)/12))  from PKHYPHIS P where (R.EMPNO=P.EMPNO \
and YEARPAYNUM=(select TO_CHAR(YEARPAYNUM)  from PKCPBAS ))) where (EMPNO>=:b\
0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1036;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


       /*          AND PAYCL >= '09' ;*/
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.5.6-1 통상 임금 계산중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.5.6-1 통상 임금 계산중...\n");
     }

    /* 9.5.6-2 통상 임금 .... 임원 */
/*       EXEC SQL
**       UPDATE PKMMREST R SET
**           COMMONAMT =
**            (SELECT NVL(BASICAMT,0) + NVL(INFOAMT,0) + NVL(DUTYAMT,0) - 125000
**             FROM PKMPMAS P
**             WHERE R.EMPNO = P.EMPNO
**            )
**        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
**          AND PAYCL < '09' ;
**
**   if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
**    {
**        hinsa_exit(0,"9.5.6-2 통상 임금 (임원) 계산중...\n");
**    }
*/

    /* 9.5.7 기준 임금 */
     /* EXEC SQL
     UPDATE PKMMREST 
        SET
            COMMONAMT = NVL(COMMONAMT,0), /o NULL 값 조정 o/
            AVGGROSS  = NVL(AVGGROSS,0),  /o NULL 값 조정 o/
            BASEAMT = GREATEST(NVL(COMMONAMT,0),NVL(AVGGROSS,0))
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set COMMONAMT=NVL(COMMONAMT,0),AVGGROS\
S=NVL(AVGGROSS,0),BASEAMT=GREATEST(NVL(COMMONAMT,0),NVL(AVGGROSS,0)) where (E\
MPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1059;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "9.5.7 기준 임금 계산중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.5.7 기준 임금 계산중...\n");
     }
}

/***************************************************************************
 9.6  퇴직금 계산
***************************************************************************/
void Calc_Retrealamt()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  taxnum[2+1] = ""  ;
          float jutaxrate   = 0.0 ;
     /* EXEC SQL END DECLARE SECTION; */ 

     
	double avgtaxstamt_2012, avgtaxstamt_2013, retavgtax_2012, retavgtax_2013, rettaxrate_2012, rettaxrate_2013, retcalctax_2012, retcalctax_2013;
	     
     /* EXEC SQL
     SELECT CTAXNUM, JUTAXRATE
       INTO :taxnum, :jutaxrate
       FROM PKCPBAS ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select CTAXNUM ,JUTAXRATE into :b0,:b1  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1082;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)taxnum;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&jutaxrate;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(float);
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



    /* 9.6.1 퇴직금 지급율_직급 
     2009.03.27 kth 누진제에서 단수제로 변경 retcl 을 사용 하지 않음. */       
/*        EXEC SQL
        UPDATE PKMMREST
         SET RETCL = '10'
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
          AND (RETCL < '00' OR RETCL > '09' ) ;
    
    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        Write_batlog(seqno++, "9.6.1 퇴직직급 갱신중...\n"); dsa2000 Rexec 대체
        hinsa_exit(0,"9.6.1 퇴직직급 갱신중...\n");
    }*/
    
    /*
        EXEC SQL
        UPDATE PKMMREST SET
            RETCL = DECODE(PAYCL,'00','0'||TO_CHAR(PAYGR),'10')
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno        ;
    
    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
    {
        hinsa_exit(0,"9.6.1 퇴직금 지급율_직급 계산중...\n");
    }
    */
    

    /* 9.6.2 퇴직금 지급율 */
     /* EXEC SQL
     UPDATE PKMMREST R 
        SET
            RETRATE = NVL(ROUND(R.RETMM/12,2),0.0) /o 누진제에서 단수제로 전환작업 RETRATE ->  ROUND(REALMM/12,2) kth 2009.03.17o/
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST R  set RETRATE=NVL(ROUND((R.RETMM/12),2\
),0.0) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1105;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "9.6.2 퇴직금 지급율 계산중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.6.2 퇴직금 지급율 계산중...\n");
     }
    

/* =================================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   32.00      2002.06.21         유효성        임원 퇴직지급율 계산시 직위별 재임기간으로 
                                               산정하게 제도 변경됨
==================================================================================== */
     /* EXEC SQL
     UPDATE PKMMREST A
        SET RETRATE = (SELECT NVL(SUM(NVL(B.CLRETRATE,0)),0) 
                         FROM PKHRTDIR B         
                        WHERE A.EMPNO = B.EMPNO
                          AND B.CALCDATE = :g_mrtodate
                        GROUP BY B.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT EMPNO 
                        FROM PKHRTDIR
                       WHERE CALCDATE = :g_mrtodate
                       GROUP BY EMPNO) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST A  set RETRATE=(select NVL(sum(NVL(B.CL\
RETRATE,0)),0)  from PKHRTDIR B where (A.EMPNO=B.EMPNO and B.CALCDATE=:b0) gr\
oup by B.EMPNO) where ((EMPNO>=:b1 and EMPNO<=:b2) and EMPNO in (select EMPNO\
  from PKHRTDIR where CALCDATE=:b0 group by EMPNO))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1128;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)g_mrtodate;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.6.2.1 퇴직금 지급율 계산중_임원...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.6.2.1 퇴직금 지급율 계산중_임원...\n");
     }
    
/**Ver 32.00 추가 END**/

    /* 9.6.2.1 퇴직연금 혼합형(DB)대상자 퇴직금 지급율 [2018.12.19 jhg] */
/*     EXEC SQL
     UPDATE PKMMREST R 
        SET (RETRATE, RETRATE2)  = (SELECT NVL(R.RETRATE1,0.0) + NVL(ROUND(R.RETMM2/12,2),0.0), NVL(ROUND(R.RETMM2/12,2),0.0) 
                                      FROM PKHMRESH_INFO B
                                     WHERE B.STYPE = '3'
                                       AND B.SDATE = :g_mrtodate
                                       AND R.EMPNO = B.EMPNO)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT EMPNO 
                        FROM PKHMRESH_INFO 
                       WHERE STYPE = '3'
                         AND SDATE = :g_mrtodate) ; */

     /* EXEC SQL
     UPDATE PKMMREST R 
        SET RETRATE  = NVL(RETRATE1,0.0) + NVL(ROUND(R.RETMM2/12,2),0.0),
            RETRATE2 = NVL(ROUND(R.RETMM2/12,2),0.0)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        AND EMPNO IN (SELECT EMPNO 
                        FROM PKHMRESH_INFO 
                       WHERE STYPE = '3'
                         AND SDATE = :g_mrtodate) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST R  set RETRATE=(NVL(RETRATE1,0.0)+NVL(R\
OUND((R.RETMM2/12),2),0.0)),RETRATE2=NVL(ROUND((R.RETMM2/12),2),0.0) where ((\
EMPNO>=:b0 and EMPNO<=:b1) and EMPNO in (select EMPNO  from PKHMRESH_INFO whe\
re (STYPE='3' and SDATE=:b2)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1159;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_mrtodate;
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

                         
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.6.2.1 퇴직연금 혼합형(DB)대상자 퇴직금 지급율 계산중...\n"); 
          hinsa_exit(0,"9.6.2.1 퇴직연금 혼합형(DB)대상자 퇴직금 지급율 계산중...\n");
     }


     /* 9.6.3 퇴직금 */
     /* EXEC SQL
     UPDATE PKMMREST 
        SET RETRATE = NVL(RETRATE,0.0),   /o NULL 값 조정 o/
            RETAMT  = CEIL(NVL(BASEAMT,0) * NVL(RETRATE,0.0))
      WHERE EMPNO  >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set RETRATE=NVL(RETRATE,0.0),RETAMT=CE\
IL((NVL(BASEAMT,0)* NVL(RETRATE,0.0))) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1186;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "9.6.3 퇴직금 계산중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.6.3 퇴직금 계산중...\n");
     }
     
     /* 9.6.3.1 퇴직금(혼합형) [2018.12.20 jhg] */
/*     EXEC SQL
     UPDATE PKMMREST R
        SET (RETRATE, RETAMT) = (SELECT NVL(RETRATE,0.0), (CEIL(NVL(BASEAMT,0) * NVL(RETRATE1,0.0))) + (CEIL(NVL(BASEAMT,0) * NVL(RETRATE2,0.0)*0.99))
                                   FROM PKHMRESH_INFO B
                                     WHERE B.STYPE = '3'
                                       AND B.SDATE = :g_mrtodate
                                       AND R.EMPNO = B.EMPNO) 
      WHERE EMPNO  >= :g_frempno AND EMPNO <= :g_toempno
        AND	EMPNO IN (SELECT EMPNO 
                        FROM PKHMRESH_INFO 
                       WHERE STYPE = '3'
                         AND SDATE = :g_mrtodate) ; */

     /* EXEC SQL
     UPDATE PKMMREST 
        SET RETRATE = NVL(RETRATE,0.0),   /o NULL 값 조정 o/
            RETAMT  = (CEIL(NVL(BASEAMT,0) * NVL(RETRATE1,0.0))) + (CEIL(NVL(BASEAMT,0) * NVL(RETRATE2,0.0)*0.99))
      WHERE EMPNO  >= :g_frempno AND EMPNO <= :g_toempno
        AND	EMPNO IN (SELECT EMPNO 
                        FROM PKHMRESH_INFO 
                       WHERE STYPE = '3'
                         AND SDATE = :g_mrtodate) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 39;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set RETRATE=NVL(RETRATE,0.0),RETAMT=(C\
EIL((NVL(BASEAMT,0)* NVL(RETRATE1,0.0)))+CEIL(((NVL(BASEAMT,0)* NVL(RETRATE2,\
0.0))* 0.99))) where ((EMPNO>=:b0 and EMPNO<=:b1) and EMPNO in (select EMPNO \
 from PKHMRESH_INFO where (STYPE='3' and SDATE=:b2)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1209;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_mrtodate;
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

                         
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.6.3.1 퇴직금(혼합형) 계산중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.6.3.1 퇴직금(혼합형) 계산중...\n");
     }     
     
/* dsa2000 2004.10.12.  전산처리요청  1년에 여러번 중간정산하는자의 근속기간 및 세금 계산시
                                     기존 정산내역을 포함하여 계산되도록함.*/
        /* 근로소득금액 : 중간정산퇴직금 + 기존 중간정산퇴직금 
     EXEC    SQL
     UPDATE  PKMMREST
        SET  RETAMTSUM = NVL(RETAMT,0) + NVL(BRETAMT,0) ;
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "5. 퇴직급여액 : 중간정산퇴직금 + 기존 중간정산퇴직금 ");
          error_quit(sqlca.sqlcode,"5. 퇴직급여액 : 중간정산퇴직금 + 기존 중간정산퇴직금 ");
     }   */     
/* dsa2000 2004.10.12. End  ...................................................................*/        


        /* *********************** 퇴직 소득세 계산 ********************* */
        /* 9.6.4-1 퇴직 소득 공제(5년 미만)
     EXEC SQL
     UPDATE PKMMREST 
      //SET RINDED = floor( (RETAMTSUM/2) + (300000 * RETYY) )     //dsa2000 2004.10.12. RETAMT => RETAMTSUM로 변경 
        SET RINDED = floor( (RETAMTSUM*40/100) + (300000 * RETYY) )//dsa2000  2006.03.07 50% =>45%로 변경 40% kth 20110201
      WHERE RETYY <= 5
        AND EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          hinsa_exit(0,"9.6.4-1 퇴직 소득 공제(5년 미만) 계산중...\n");
     }
 */
     /* 9.6.4-2 퇴직 소득 공제(10년 미만, 5년 이상)
     EXEC SQL
     UPDATE  PKMMREST 
      //SET  RINDED = floor((RETAMTSUM/2) + 1500000 + 500000 * (RETYY - 5))      //dsa2000 2004.10.12. RETAMT => RETAMTSUM로 변경 
        SET  RINDED = floor( (RETAMTSUM*40/100) + 1500000 + 500000 * (RETYY - 5) )  //dsa2000  2006.03.07 50% =>45%로 변경 40% kth 20110201 
      WHERE  RETYY > 5 AND RETYY <= 10
        AND  EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          hinsa_exit(0,"9.6.4-2 퇴직 소득 공제(10년 미만, 5년 이상) 계산중...\n");
     }
 */
     /* 9.6.4-3 퇴직 소득 공제(20년 미만, 10년 이상) 
     EXEC SQL
     UPDATE  PKMMREST 
      //SET  RINDED = floor( (RETAMTSUM/2) + 4000000 + 800000 * (RETYY - 10) )    //dsa2000 2004.10.12. RETAMT => RETAMTSUM로 변경 
        SET  RINDED = floor( (RETAMTSUM*40/100) + 4000000 + 800000 * (RETYY - 10) ) //dsa2000  2006.03.07 50% =>45%로 변경  40% kth 20110201
      WHERE  RETYY > 10 AND RETYY <= 20
        AND  EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          hinsa_exit(0,"9.6.4-3 퇴직 소득 공제(20년 미만, 10년 이상) 계산중...\n");
     }
*/
     /* 9.6.4-4 퇴직 소득 공제(20년이상) 
     EXEC SQL
     UPDATE PKMMREST 
     //SET  RINDED = floor((RETAMTSUM/2) + 12000000 + 1200000 * (RETYY - 20))      //dsa2000 2004.10.12. RETAMT => RETAMTSUM로 변경 
        SET RINDED = floor((RETAMTSUM*40/100) + 12000000 + 1200000 * (RETYY - 20)) //dsa2000  2006.03.07 50% =>45%로 변경 40% kth 20110201
      WHERE RETYY > 20
        AND EMPNO >= :g_frempno AND EMPNO <= :g_toempno;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          hinsa_exit(0,"9.6.4-4 퇴직 소득 공제(20년이상) 계산중...\n");
     }
*/
     /* 9.6.5 퇴직 소득 금액, 퇴직 소득과세 표준 
     EXEC SQL
         UPDATE PKMMREST 
         SET    RINAMT   = GREATEST(RETAMTSUM - RINDED,0),  //dsa2000 2004.10.12. RETAMT => RETAMTSUM로 변경
                TAXSTAMT = GREATEST(RETAMTSUM - RINDED,0)
         WHERE  EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         Write_batlog(seqno++, "9.6.5 퇴직 소득금액, 퇴직 소득과세표준 계산중...\n"); //dsa2000 Rexec 대체
         hinsa_exit(0,"9.6.5 퇴직 소득금액, 퇴직 소득과세표준 계산중...\n");
     }
*/
/*2013.02.15.hjku 산출 세액 변경 시작*/
     /* EXEC   SQL DECLARE c3 CURSOR FOR
        SELECT A.*,
                RETUTIL.GET_FIXDED(RETAMTSUM) FIXDED,
                RETUTIL.GET_CONDED(REALYY_CALC) CONDED,
                RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC) RINDED,
               GREATEST((RETAMTSUM - RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC)),0) TAXSTAMT
         FROM (SELECT EMPNO, NVL(REALYY_CALC,0) REALYY_CALC, NVL(REALYY_2012,0) REALYY_2012, NVL(REALYY_2013,0) REALYY_2013, 
                      NVL(BRETINTAX,0) BRETINTAX,  
                      NVL(RETAMT,0) +  NVL(BRETAMT,0)  RETAMTSUM
                 FROM PKMMREST WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno 
              )A; */ 
 	

      /* EXEC SQL OPEN  c3 ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 39;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = sq0035;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )1236;
      sqlstm.selerr = (unsigned short)1;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqcmod = (unsigned int )0;
      sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
      sqlstm.sqhstl[0] = (unsigned long )5;
      sqlstm.sqhsts[0] = (         int  )0;
      sqlstm.sqindv[0] = (         short *)0;
      sqlstm.sqinds[0] = (         int  )0;
      sqlstm.sqharm[0] = (unsigned long )0;
      sqlstm.sqadto[0] = (unsigned short )0;
      sqlstm.sqtdso[0] = (unsigned short )0;
      sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



     while(1)
     {
          /* EXEC  SQL FETCH c3
          INTO  :empno,:realyy_calc,:realyy_2012,:realyy_2013,:bretintax, :retamtsum,:fixded,:conded,:rinded,:taxstamt ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 39;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1259;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&realyy_2012;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&bretintax;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&retamtsum;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&fixded;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&conded;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&rinded;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&taxstamt;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
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



          if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
          {
                /* EXEC SQL close c3; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 39;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )1314;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                sprintf(log_buff, "FETCH CURSOR c2 Error\n");
                Write_batlog(seqno++, log_buff); 
                exit(1);
          }
 
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 39;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1329;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          taxstamt_2012 = avgtaxstamt_2012  = retavgtaxstamt_2012 = rettaxrate_2012 = retavgtax_2012 = retavgcalctax_2012 = retcalctax_2012  = retintax_2012 = 0;
          taxstamt_2013 = avgtaxstamt_2013  = retavgtaxstamt_2013 = rettaxrate_2013 = retavgtax_2013 = retavgcalctax_2013 = retcalctax_2013  = retintax_2013 = 0;
          
          retintax = retjutax = 0; /*신고대상 세액*/


          /* 2012년 이전 산출 세액 */
          if((realyy_calc >0)&&(realyy_2012>0)) {
            taxstamt_2012 = lround(taxstamt * realyy_2012 / realyy_calc);

            CalcTax2012(realyy_calc,realyy_2012,taxstamt_2012, &avgtaxstamt_2012, &retavgtaxstamt_2012, &rettaxrate_2012,&retavgtax_2012, &retavgcalctax_2012, &retcalctax_2012);
          }
          
          /* 2013년 이후 산출 세액 */
          if((realyy_calc >0)&&(realyy_2013>0)) {
            taxstamt_2013 = taxstamt - taxstamt_2012;

            CalcTax2013(realyy_calc,realyy_2013,taxstamt_2013, &avgtaxstamt_2013, &retavgtaxstamt_2013, &rettaxrate_2013,&retavgtax_2013, &retavgcalctax_2013, &retcalctax_2013);
          }

          /* 기납부세액 처리 */
          retintax_2012 = retcalctax_2012 - bretintax;
          retintax_2013 = retcalctax_2013;          

          avgtaxstamt       = floor(taxstamt / realyy_calc);
          retavgtaxstamt    = retavgtaxstamt_2013; 
          retavgtax         = retavgtax_2013;
          
          retavgcalctax     = trunc(retavgcalctax_2012  + retavgcalctax_2013);          
          retcalctax        = trunc(retcalctax_2012     + retcalctax_2013);
          
          
          /* 2015.12.18 eyha 2016년 퇴직세법 적용  */
          change_pay_2016 = change_payded_2016 = taxstamt_2016 = rettaxrate_2016 = retavgtax_2016 = retcalctax_2016 = retintax_2016 = retintax_calc = 0;               
          if ((retamtsum >0) && (strcmp(g_mrtodate,"20160101") >= 0))   
          {          	
          	  /* 환산급여(change_pay_2016), 환산급여공제(change_payded_2016)  */
              /* EXEC  SQL
              SELECT  a.CHANGE_PAY_2016,
                      RETUTIL.GET_CHANGE_PAYDED(substr(:g_mrtodate,1,4), CHANGE_PAY_2016) change_payded_2016
              INTO    :change_pay_2016, :change_payded_2016
              FROM   (SELECT  RETUTIL.GET_CHANGE_PAY(substr(:g_mrtodate,1,4), :retamtsum - :conded, :realyy_calc ) CHANGE_PAY_2016
                      FROM    DUAL
                      ) a; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 39;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select a.CHANGE_PAY_2016 ,RETUTIL.GET_CHANGE_P\
AYDED(substr(:b0,1,4),CHANGE_PAY_2016) change_payded_2016 into :b1,:b2  from \
(select RETUTIL.GET_CHANGE_PAY(substr(:b0,1,4),(:b4-:b5),:b6) CHANGE_PAY_2016\
  from DUAL ) a ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1344;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[0] = (unsigned long )9;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)&change_pay_2016;
              sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&change_payded_2016;
              sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         short *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned long )0;
              sqlstm.sqadto[2] = (unsigned short )0;
              sqlstm.sqtdso[2] = (unsigned short )0;
              sqlstm.sqhstv[3] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[3] = (unsigned long )9;
              sqlstm.sqhsts[3] = (         int  )0;
              sqlstm.sqindv[3] = (         short *)0;
              sqlstm.sqinds[3] = (         int  )0;
              sqlstm.sqharm[3] = (unsigned long )0;
              sqlstm.sqadto[3] = (unsigned short )0;
              sqlstm.sqtdso[3] = (unsigned short )0;
              sqlstm.sqhstv[4] = (unsigned char  *)&retamtsum;
              sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[4] = (         int  )0;
              sqlstm.sqindv[4] = (         short *)0;
              sqlstm.sqinds[4] = (         int  )0;
              sqlstm.sqharm[4] = (unsigned long )0;
              sqlstm.sqadto[4] = (unsigned short )0;
              sqlstm.sqtdso[4] = (unsigned short )0;
              sqlstm.sqhstv[5] = (unsigned char  *)&conded;
              sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[5] = (         int  )0;
              sqlstm.sqindv[5] = (         short *)0;
              sqlstm.sqinds[5] = (         int  )0;
              sqlstm.sqharm[5] = (unsigned long )0;
              sqlstm.sqadto[5] = (unsigned short )0;
              sqlstm.sqtdso[5] = (unsigned short )0;
              sqlstm.sqhstv[6] = (unsigned char  *)&realyy_calc;
              sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
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


                                            
                     
              /* 퇴직소득 과세표준(taxstamt_2016) = 환산급여 - 환산급여공제 */       
              taxstamt_2016 =  change_pay_2016 - change_payded_2016;       	
              
              /* 환산산출세율(rettaxrate_2016), 환산산출세액(retavgtax_2016), 산출세액(retcalctax_2016)  */                     
              /* EXEC  SQL
              SELECT a.*, 
                     RETUTIL.GET_RETCALCTAX(substr(:g_mrtodate,1,4), RETAVGTAX_2016, :realyy_calc)  RETAVGTAX_2016
              INTO :rettaxrate_2016, :retavgtax_2016, :retcalctax_2016     
              FROM (
                       SELECT 
                               RETUTIL.GET_RETTAXRATE(:taxstamt_2016) RETTAXRATE_2016,
                               RETUTIL.GET_RETAVGTAX(:taxstamt_2016)  RETAVGTAX_2016
                      FROM DUAL
                   ) a; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 39;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select a.* ,RETUTIL.GET_RETCALCTAX(substr(:b0,\
1,4),RETAVGTAX_2016,:b1) RETAVGTAX_2016 into :b2,:b3,:b4  from (select RETUTI\
L.GET_RETTAXRATE(:b5) RETTAXRATE_2016 ,RETUTIL.GET_RETAVGTAX(:b5) RETAVGTAX_2\
016  from DUAL ) a ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1387;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[0] = (unsigned long )9;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)&realyy_calc;
              sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&rettaxrate_2016;
              sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         short *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned long )0;
              sqlstm.sqadto[2] = (unsigned short )0;
              sqlstm.sqtdso[2] = (unsigned short )0;
              sqlstm.sqhstv[3] = (unsigned char  *)&retavgtax_2016;
              sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[3] = (         int  )0;
              sqlstm.sqindv[3] = (         short *)0;
              sqlstm.sqinds[3] = (         int  )0;
              sqlstm.sqharm[3] = (unsigned long )0;
              sqlstm.sqadto[3] = (unsigned short )0;
              sqlstm.sqtdso[3] = (unsigned short )0;
              sqlstm.sqhstv[4] = (unsigned char  *)&retcalctax_2016;
              sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[4] = (         int  )0;
              sqlstm.sqindv[4] = (         short *)0;
              sqlstm.sqinds[4] = (         int  )0;
              sqlstm.sqharm[4] = (unsigned long )0;
              sqlstm.sqadto[4] = (unsigned short )0;
              sqlstm.sqtdso[4] = (unsigned short )0;
              sqlstm.sqhstv[5] = (unsigned char  *)&taxstamt_2016;
              sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[5] = (         int  )0;
              sqlstm.sqindv[5] = (         short *)0;
              sqlstm.sqinds[5] = (         int  )0;
              sqlstm.sqharm[5] = (unsigned long )0;
              sqlstm.sqadto[5] = (unsigned short )0;
              sqlstm.sqtdso[5] = (unsigned short )0;
              sqlstm.sqhstv[6] = (unsigned char  *)&taxstamt_2016;
              sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
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

              
             
              /* 2016년 이후 소득세 */               
              retintax_2016 = retcalctax_2016;         
                       	
              
              /* 특례 적용 산출세액(retintax_calc)  */                     
              /* EXEC  SQL
              SELECT RETUTIL.GET_RETINTAX(substr(:g_mrtodate,1,4), :retcalctax, :retcalctax_2016)  RETINTAX_CALC                 
              INTO :retintax_calc
              FROM DUAL; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 39;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select RETUTIL.GET_RETINTAX(substr(:b0,1,4),:b\
1,:b2) RETINTAX_CALC into :b3  from DUAL ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1430;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
              sqlstm.sqhstl[0] = (unsigned long )9;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)&retcalctax;
              sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&retcalctax_2016;
              sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         short *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned long )0;
              sqlstm.sqadto[2] = (unsigned short )0;
              sqlstm.sqtdso[2] = (unsigned short )0;
              sqlstm.sqhstv[3] = (unsigned char  *)&retintax_calc;
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

   
              
              
          }
    
          /* 2015.12.18 eyha 2016년 세법적용 
                    retintax          = retcalctax - bretintax;  */
          if (strcmp(g_mrtodate,"20160101") >= 0)
            retintax         = retintax_calc - bretintax;   
          else             
            retintax         = retcalctax - bretintax;   

                    
          retintax          = trunc(retintax/10)  * 10;
          retjutax          = trunc(retintax/100) * 10;

          /*printf("[debug 3 ] : empno=%s,retintax=%f,retintax_calc=%f ,bretintax=%f \n",empno,retintax,retintax_calc, bretintax);                     */
          
               /* EXEC SQL 
               UPDATE  PKMMREST
                  SET  RETAMTSUM           = :retamtsum,
                       FIXDED              = :fixded,
                       CONDED              = :conded,
                       CONDED_2016         = :conded,   /o 2017.03.14 eyha add o/
                       RINDED              = :rinded,
                       RINAMT              = GREATEST(:retamtsum - :rinded,0),
                       TAXSTAMT            = :taxstamt, 
                       TAXSTAMT_2012       = :taxstamt_2012,                            
                       AVGTAXSTAMT_2012    = :avgtaxstamt_2012,
                       RETAVGTAXSTAMT_2012 = :retavgtaxstamt_2012,                          
                       RETTAXRATE_2012     = :rettaxrate_2012,                          
                       RETAVGTAX_2012      = :retavgtax_2012,
                       RETAVGCALCTAX_2012  = :retavgcalctax_2012,                           
                       RETCALCTAX_2012     = :retcalctax_2012,
                       TAXSTAMT_2013       = :taxstamt_2013,                                                    
                       AVGTAXSTAMT_2013    = :avgtaxstamt_2013,
                       RETAVGTAXSTAMT_2013 = :retavgtaxstamt_2013,                          
                       RETTAXRATE_2013     = :rettaxrate_2013,                          
                       RETAVGTAX_2013      = :retavgtax_2013,
                       RETAVGCALCTAX_2013  = :retavgcalctax_2013,                           
                       RETCALCTAX_2013     = :retcalctax_2013,
                       AVGTAXSTAMT         = :avgtaxstamt,
                       RETAVGTAXSTAMT      = :retavgtaxstamt,                           
                       RETAVGTAX           = :retavgtax,
                       RETAVGCALCTAX       = :retavgcalctax,                        
                       RETCALCTAX          = :retcalctax,
                       RETINTAX            = :retintax,
                       RETJUTAX            = :retjutax,
                       RETINTAX_2012       = :retintax_2012,                        
                       RETINTAX_2013       = :retintax_2013,
                       CHANGE_PAY_2016     = :change_pay_2016    ,  /o2015.12.21 eyha addo/
                       CHANGE_PAYDED_2016  = :change_payded_2016 ,
                       TAXSTAMT_2016       = :taxstamt_2016      ,
                       RETTAXRATE_2016     = :rettaxrate_2016    ,
                       RETAVGTAX_2016      = :retavgtax_2016     ,
                       RETCALCTAX_2016     = :retcalctax_2016    ,
                       RETINTAX_2016       = :retintax_2016      ,
                       RETTAXYY            = substr(:g_mrtodate,1,4),  	
                       RETINTAX_CALC       = :retintax_calc  
                WHERE  EMPNO = :empno; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 41;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMMREST  set RETAMTSUM=:b0,FIXDED=:b1\
,CONDED=:b2,CONDED_2016=:b2,RINDED=:b4,RINAMT=GREATEST((:b0-:b4),0),TAXSTAMT=\
:b7,TAXSTAMT_2012=:b8,AVGTAXSTAMT_2012=:b9,RETAVGTAXSTAMT_2012=:b10,RETTAXRAT\
E_2012=:b11,RETAVGTAX_2012=:b12,RETAVGCALCTAX_2012=:b13,RETCALCTAX_2012=:b14,\
TAXSTAMT_2013=:b15,AVGTAXSTAMT_2013=:b16,RETAVGTAXSTAMT_2013=:b17,RETTAXRATE_\
2013=:b18,RETAVGTAX_2013=:b19,RETAVGCALCTAX_2013=:b20,RETCALCTAX_2013=:b21,AV\
GTAXSTAMT=:b22,RETAVGTAXSTAMT=:b23,RETAVGTAX=:b24,RETAVGCALCTAX=:b25,RETCALCT\
AX=:b26,RETINTAX=:b27,RETJUTAX=:b28,RETINTAX_2012=:b29,RETINTAX_2013=:b30,CHA\
NGE_PAY_2016=:b31,CHANGE_PAYDED_2016=:b32,TAXSTAMT_2016=:b33,RETTAXRATE_2016=\
:b34,RETAVGTAX_2016=:b35,RETCALCTAX_2016=:b36,RETINTAX_2016=:b37,RETTAXYY=sub\
str(:b38,1,4),RETINTAX_CALC=:b39 where EMPNO=:b40";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1461;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&retamtsum;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&fixded;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&conded;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)&conded;
               sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&rinded;
               sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)&retamtsum;
               sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[5] = (         int  )0;
               sqlstm.sqindv[5] = (         short *)0;
               sqlstm.sqinds[5] = (         int  )0;
               sqlstm.sqharm[5] = (unsigned long )0;
               sqlstm.sqadto[5] = (unsigned short )0;
               sqlstm.sqtdso[5] = (unsigned short )0;
               sqlstm.sqhstv[6] = (unsigned char  *)&rinded;
               sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[6] = (         int  )0;
               sqlstm.sqindv[6] = (         short *)0;
               sqlstm.sqinds[6] = (         int  )0;
               sqlstm.sqharm[6] = (unsigned long )0;
               sqlstm.sqadto[6] = (unsigned short )0;
               sqlstm.sqtdso[6] = (unsigned short )0;
               sqlstm.sqhstv[7] = (unsigned char  *)&taxstamt;
               sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[7] = (         int  )0;
               sqlstm.sqindv[7] = (         short *)0;
               sqlstm.sqinds[7] = (         int  )0;
               sqlstm.sqharm[7] = (unsigned long )0;
               sqlstm.sqadto[7] = (unsigned short )0;
               sqlstm.sqtdso[7] = (unsigned short )0;
               sqlstm.sqhstv[8] = (unsigned char  *)&taxstamt_2012;
               sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[8] = (         int  )0;
               sqlstm.sqindv[8] = (         short *)0;
               sqlstm.sqinds[8] = (         int  )0;
               sqlstm.sqharm[8] = (unsigned long )0;
               sqlstm.sqadto[8] = (unsigned short )0;
               sqlstm.sqtdso[8] = (unsigned short )0;
               sqlstm.sqhstv[9] = (unsigned char  *)&avgtaxstamt_2012;
               sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[9] = (         int  )0;
               sqlstm.sqindv[9] = (         short *)0;
               sqlstm.sqinds[9] = (         int  )0;
               sqlstm.sqharm[9] = (unsigned long )0;
               sqlstm.sqadto[9] = (unsigned short )0;
               sqlstm.sqtdso[9] = (unsigned short )0;
               sqlstm.sqhstv[10] = (unsigned char  *)&retavgtaxstamt_2012;
               sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[10] = (         int  )0;
               sqlstm.sqindv[10] = (         short *)0;
               sqlstm.sqinds[10] = (         int  )0;
               sqlstm.sqharm[10] = (unsigned long )0;
               sqlstm.sqadto[10] = (unsigned short )0;
               sqlstm.sqtdso[10] = (unsigned short )0;
               sqlstm.sqhstv[11] = (unsigned char  *)&rettaxrate_2012;
               sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[11] = (         int  )0;
               sqlstm.sqindv[11] = (         short *)0;
               sqlstm.sqinds[11] = (         int  )0;
               sqlstm.sqharm[11] = (unsigned long )0;
               sqlstm.sqadto[11] = (unsigned short )0;
               sqlstm.sqtdso[11] = (unsigned short )0;
               sqlstm.sqhstv[12] = (unsigned char  *)&retavgtax_2012;
               sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[12] = (         int  )0;
               sqlstm.sqindv[12] = (         short *)0;
               sqlstm.sqinds[12] = (         int  )0;
               sqlstm.sqharm[12] = (unsigned long )0;
               sqlstm.sqadto[12] = (unsigned short )0;
               sqlstm.sqtdso[12] = (unsigned short )0;
               sqlstm.sqhstv[13] = (unsigned char  *)&retavgcalctax_2012;
               sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[13] = (         int  )0;
               sqlstm.sqindv[13] = (         short *)0;
               sqlstm.sqinds[13] = (         int  )0;
               sqlstm.sqharm[13] = (unsigned long )0;
               sqlstm.sqadto[13] = (unsigned short )0;
               sqlstm.sqtdso[13] = (unsigned short )0;
               sqlstm.sqhstv[14] = (unsigned char  *)&retcalctax_2012;
               sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[14] = (         int  )0;
               sqlstm.sqindv[14] = (         short *)0;
               sqlstm.sqinds[14] = (         int  )0;
               sqlstm.sqharm[14] = (unsigned long )0;
               sqlstm.sqadto[14] = (unsigned short )0;
               sqlstm.sqtdso[14] = (unsigned short )0;
               sqlstm.sqhstv[15] = (unsigned char  *)&taxstamt_2013;
               sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[15] = (         int  )0;
               sqlstm.sqindv[15] = (         short *)0;
               sqlstm.sqinds[15] = (         int  )0;
               sqlstm.sqharm[15] = (unsigned long )0;
               sqlstm.sqadto[15] = (unsigned short )0;
               sqlstm.sqtdso[15] = (unsigned short )0;
               sqlstm.sqhstv[16] = (unsigned char  *)&avgtaxstamt_2013;
               sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[16] = (         int  )0;
               sqlstm.sqindv[16] = (         short *)0;
               sqlstm.sqinds[16] = (         int  )0;
               sqlstm.sqharm[16] = (unsigned long )0;
               sqlstm.sqadto[16] = (unsigned short )0;
               sqlstm.sqtdso[16] = (unsigned short )0;
               sqlstm.sqhstv[17] = (unsigned char  *)&retavgtaxstamt_2013;
               sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[17] = (         int  )0;
               sqlstm.sqindv[17] = (         short *)0;
               sqlstm.sqinds[17] = (         int  )0;
               sqlstm.sqharm[17] = (unsigned long )0;
               sqlstm.sqadto[17] = (unsigned short )0;
               sqlstm.sqtdso[17] = (unsigned short )0;
               sqlstm.sqhstv[18] = (unsigned char  *)&rettaxrate_2013;
               sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[18] = (         int  )0;
               sqlstm.sqindv[18] = (         short *)0;
               sqlstm.sqinds[18] = (         int  )0;
               sqlstm.sqharm[18] = (unsigned long )0;
               sqlstm.sqadto[18] = (unsigned short )0;
               sqlstm.sqtdso[18] = (unsigned short )0;
               sqlstm.sqhstv[19] = (unsigned char  *)&retavgtax_2013;
               sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[19] = (         int  )0;
               sqlstm.sqindv[19] = (         short *)0;
               sqlstm.sqinds[19] = (         int  )0;
               sqlstm.sqharm[19] = (unsigned long )0;
               sqlstm.sqadto[19] = (unsigned short )0;
               sqlstm.sqtdso[19] = (unsigned short )0;
               sqlstm.sqhstv[20] = (unsigned char  *)&retavgcalctax_2013;
               sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[20] = (         int  )0;
               sqlstm.sqindv[20] = (         short *)0;
               sqlstm.sqinds[20] = (         int  )0;
               sqlstm.sqharm[20] = (unsigned long )0;
               sqlstm.sqadto[20] = (unsigned short )0;
               sqlstm.sqtdso[20] = (unsigned short )0;
               sqlstm.sqhstv[21] = (unsigned char  *)&retcalctax_2013;
               sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[21] = (         int  )0;
               sqlstm.sqindv[21] = (         short *)0;
               sqlstm.sqinds[21] = (         int  )0;
               sqlstm.sqharm[21] = (unsigned long )0;
               sqlstm.sqadto[21] = (unsigned short )0;
               sqlstm.sqtdso[21] = (unsigned short )0;
               sqlstm.sqhstv[22] = (unsigned char  *)&avgtaxstamt;
               sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[22] = (         int  )0;
               sqlstm.sqindv[22] = (         short *)0;
               sqlstm.sqinds[22] = (         int  )0;
               sqlstm.sqharm[22] = (unsigned long )0;
               sqlstm.sqadto[22] = (unsigned short )0;
               sqlstm.sqtdso[22] = (unsigned short )0;
               sqlstm.sqhstv[23] = (unsigned char  *)&retavgtaxstamt;
               sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[23] = (         int  )0;
               sqlstm.sqindv[23] = (         short *)0;
               sqlstm.sqinds[23] = (         int  )0;
               sqlstm.sqharm[23] = (unsigned long )0;
               sqlstm.sqadto[23] = (unsigned short )0;
               sqlstm.sqtdso[23] = (unsigned short )0;
               sqlstm.sqhstv[24] = (unsigned char  *)&retavgtax;
               sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[24] = (         int  )0;
               sqlstm.sqindv[24] = (         short *)0;
               sqlstm.sqinds[24] = (         int  )0;
               sqlstm.sqharm[24] = (unsigned long )0;
               sqlstm.sqadto[24] = (unsigned short )0;
               sqlstm.sqtdso[24] = (unsigned short )0;
               sqlstm.sqhstv[25] = (unsigned char  *)&retavgcalctax;
               sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[25] = (         int  )0;
               sqlstm.sqindv[25] = (         short *)0;
               sqlstm.sqinds[25] = (         int  )0;
               sqlstm.sqharm[25] = (unsigned long )0;
               sqlstm.sqadto[25] = (unsigned short )0;
               sqlstm.sqtdso[25] = (unsigned short )0;
               sqlstm.sqhstv[26] = (unsigned char  *)&retcalctax;
               sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[26] = (         int  )0;
               sqlstm.sqindv[26] = (         short *)0;
               sqlstm.sqinds[26] = (         int  )0;
               sqlstm.sqharm[26] = (unsigned long )0;
               sqlstm.sqadto[26] = (unsigned short )0;
               sqlstm.sqtdso[26] = (unsigned short )0;
               sqlstm.sqhstv[27] = (unsigned char  *)&retintax;
               sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[27] = (         int  )0;
               sqlstm.sqindv[27] = (         short *)0;
               sqlstm.sqinds[27] = (         int  )0;
               sqlstm.sqharm[27] = (unsigned long )0;
               sqlstm.sqadto[27] = (unsigned short )0;
               sqlstm.sqtdso[27] = (unsigned short )0;
               sqlstm.sqhstv[28] = (unsigned char  *)&retjutax;
               sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[28] = (         int  )0;
               sqlstm.sqindv[28] = (         short *)0;
               sqlstm.sqinds[28] = (         int  )0;
               sqlstm.sqharm[28] = (unsigned long )0;
               sqlstm.sqadto[28] = (unsigned short )0;
               sqlstm.sqtdso[28] = (unsigned short )0;
               sqlstm.sqhstv[29] = (unsigned char  *)&retintax_2012;
               sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[29] = (         int  )0;
               sqlstm.sqindv[29] = (         short *)0;
               sqlstm.sqinds[29] = (         int  )0;
               sqlstm.sqharm[29] = (unsigned long )0;
               sqlstm.sqadto[29] = (unsigned short )0;
               sqlstm.sqtdso[29] = (unsigned short )0;
               sqlstm.sqhstv[30] = (unsigned char  *)&retintax_2013;
               sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[30] = (         int  )0;
               sqlstm.sqindv[30] = (         short *)0;
               sqlstm.sqinds[30] = (         int  )0;
               sqlstm.sqharm[30] = (unsigned long )0;
               sqlstm.sqadto[30] = (unsigned short )0;
               sqlstm.sqtdso[30] = (unsigned short )0;
               sqlstm.sqhstv[31] = (unsigned char  *)&change_pay_2016;
               sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[31] = (         int  )0;
               sqlstm.sqindv[31] = (         short *)0;
               sqlstm.sqinds[31] = (         int  )0;
               sqlstm.sqharm[31] = (unsigned long )0;
               sqlstm.sqadto[31] = (unsigned short )0;
               sqlstm.sqtdso[31] = (unsigned short )0;
               sqlstm.sqhstv[32] = (unsigned char  *)&change_payded_2016;
               sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[32] = (         int  )0;
               sqlstm.sqindv[32] = (         short *)0;
               sqlstm.sqinds[32] = (         int  )0;
               sqlstm.sqharm[32] = (unsigned long )0;
               sqlstm.sqadto[32] = (unsigned short )0;
               sqlstm.sqtdso[32] = (unsigned short )0;
               sqlstm.sqhstv[33] = (unsigned char  *)&taxstamt_2016;
               sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[33] = (         int  )0;
               sqlstm.sqindv[33] = (         short *)0;
               sqlstm.sqinds[33] = (         int  )0;
               sqlstm.sqharm[33] = (unsigned long )0;
               sqlstm.sqadto[33] = (unsigned short )0;
               sqlstm.sqtdso[33] = (unsigned short )0;
               sqlstm.sqhstv[34] = (unsigned char  *)&rettaxrate_2016;
               sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[34] = (         int  )0;
               sqlstm.sqindv[34] = (         short *)0;
               sqlstm.sqinds[34] = (         int  )0;
               sqlstm.sqharm[34] = (unsigned long )0;
               sqlstm.sqadto[34] = (unsigned short )0;
               sqlstm.sqtdso[34] = (unsigned short )0;
               sqlstm.sqhstv[35] = (unsigned char  *)&retavgtax_2016;
               sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[35] = (         int  )0;
               sqlstm.sqindv[35] = (         short *)0;
               sqlstm.sqinds[35] = (         int  )0;
               sqlstm.sqharm[35] = (unsigned long )0;
               sqlstm.sqadto[35] = (unsigned short )0;
               sqlstm.sqtdso[35] = (unsigned short )0;
               sqlstm.sqhstv[36] = (unsigned char  *)&retcalctax_2016;
               sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[36] = (         int  )0;
               sqlstm.sqindv[36] = (         short *)0;
               sqlstm.sqinds[36] = (         int  )0;
               sqlstm.sqharm[36] = (unsigned long )0;
               sqlstm.sqadto[36] = (unsigned short )0;
               sqlstm.sqtdso[36] = (unsigned short )0;
               sqlstm.sqhstv[37] = (unsigned char  *)&retintax_2016;
               sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[37] = (         int  )0;
               sqlstm.sqindv[37] = (         short *)0;
               sqlstm.sqinds[37] = (         int  )0;
               sqlstm.sqharm[37] = (unsigned long )0;
               sqlstm.sqadto[37] = (unsigned short )0;
               sqlstm.sqtdso[37] = (unsigned short )0;
               sqlstm.sqhstv[38] = (unsigned char  *)g_mrtodate;
               sqlstm.sqhstl[38] = (unsigned long )9;
               sqlstm.sqhsts[38] = (         int  )0;
               sqlstm.sqindv[38] = (         short *)0;
               sqlstm.sqinds[38] = (         int  )0;
               sqlstm.sqharm[38] = (unsigned long )0;
               sqlstm.sqadto[38] = (unsigned short )0;
               sqlstm.sqtdso[38] = (unsigned short )0;
               sqlstm.sqhstv[39] = (unsigned char  *)&retintax_calc;
               sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[39] = (         int  )0;
               sqlstm.sqindv[39] = (         short *)0;
               sqlstm.sqinds[39] = (         int  )0;
               sqlstm.sqharm[39] = (unsigned long )0;
               sqlstm.sqadto[39] = (unsigned short )0;
               sqlstm.sqtdso[39] = (unsigned short )0;
               sqlstm.sqhstv[40] = (unsigned char  *)empno;
               sqlstm.sqhstl[40] = (unsigned long )5;
               sqlstm.sqhsts[40] = (         int  )0;
               sqlstm.sqindv[40] = (         short *)0;
               sqlstm.sqinds[40] = (         int  )0;
               sqlstm.sqharm[40] = (unsigned long )0;
               sqlstm.sqadto[40] = (unsigned short )0;
               sqlstm.sqtdso[40] = (unsigned short )0;
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
                    sprintf(log_buff, "산출세액 반영 setting Error(1)");
                    Write_batlog(seqno++, log_buff); 
                    exit(1);
               }
          
     }

/*2013.02.15.hjku 산출 세액 변경 종료*/
     /* 9.6.9 퇴직세액 공제 *   dsa2000  2005.01. 세액공제 2005년부터 폐지.
     EXEC SQL
         UPDATE PKMMREST 
         SET    RETTAXDED = FLOOR(LEAST(RETCALCTAX * 0.25,        prksh 20030324 0.5->0.25로 변경
                            DECODE(RETYY,0,1,RETYY) * 120000))    prksh 20030324 240000->120000로 변경
         WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno;
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {  hinsa_exit(0,"9.6.9 퇴직세액 공제금 계산중...\n");
     }  */

/*===============================================================================================*/
     /* 9.6.10 퇴직소득세 */  /*dsa2000 2004.10.12.    RetIntax => RealRetIntax 로 변경. */
     if (strcmp(g_mrtodate,"20160101") >= 0)     /*2015.12.21 eyha */
     {	
       /* EXEC SQL
       UPDATE  PKMMREST 
          SET  RealRetIntax = FLOOR(RETINTAX_CALC /10 ) * 10   
        WHERE  EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 41;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMMREST  set RealRetIntax=(FLOOR((RETINTAX_CA\
LC/10))* 10) where (EMPNO>=:b0 and EMPNO<=:b1)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )1640;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
       sqlstm.sqhstl[0] = (unsigned long )5;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     }   	
     else
     {	
       /* EXEC SQL
       UPDATE  PKMMREST 
          SET  RealRetIntax = FLOOR(RETCALCTAX /10 ) * 10   /odsa2000  2005.01. 세액공제 2005년부터 폐지.o/
        /oSET    RealRetIntax = GREATEST(FLOOR((RETCALCTAX - RETTAXDED)/10)*10,0)o/
        WHERE  EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 41;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKMMREST  set RealRetIntax=(FLOOR((RETCALCTAX/\
10))* 10) where (EMPNO>=:b0 and EMPNO<=:b1)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )1663;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
       sqlstm.sqhstl[0] = (unsigned long )5;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     }   	

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.6.10 퇴직소득세 계산중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.6.10 퇴직소득세 계산중...\n");
     }

     /* 9.6.11 퇴직주민세 */
     /* EXEC SQL
     UPDATE  PKMMREST 
        SET  RealRetJutax = FLOOR( (RealRetIntax * :jutaxrate / 100) /10) * 10
      WHERE  EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set RealRetJutax=(FLOOR((((RealRetInta\
x* :b0)/100)/10))* 10) where (EMPNO>=:b1 and EMPNO<=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1686;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&jutaxrate;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.6.11 퇴직주민세 계산중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.6.11 퇴직주민세 계산중...\n");
     }

     /* 9.6.12 실지급 퇴직금 DSA2000  2004.10.12.
     EXEC SQL
         UPDATE PKMMREST SET
             RETREALAMT = RETAMT - (RETINTAX+RETJUTAX)
         WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ;

     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         hinsa_exit(0,"9.6.12 실지급 퇴직금 계산중...\n");        }


  ==== dsa2000 추가 2004.10.12.   Start.. 동해년도의 종전 중간정산 반영한 세금 .=========== */
    /* REALRETINTAX  IS '동해년도 총소득세';  RealRetJutax
       RETREAL       IS '동해년도 총지급 중간정산금';       
       RETINTAX      IS '실소득세 = 동해년도의 총소득세 - 종전소득세';  RetJutax
       RETREALAMT    IS '실퇴직금 = 동해년도의 총소득세 - 종전소득세';                   */
                       
     /* EXEC    SQL
     UPDATE  PKMMREST
        SET  retreal   = retamtsum - RealRETIntax - RealRETJutax
      WHERE  Bretamt <> 0; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set retreal=((retamtsum-RealRETIntax)-\
RealRETJutax) where Bretamt<>0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1713;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

                               /*종전 중간정산 있는 사원만 Update. 데이터 구분을 위해.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "11. 동해년도 총지급 중간정산금  setting Error"); /*dsa2000 Rexec 대체*/
          error_quit(sqlca.sqlcode,"11. 동해년도 총지급 중간정산금  setting Error");
     }
     
     /* EXEC    SQL
     UPDATE  PKMMREST
        SET  retintax = nvl(RealRETIntax,0) - nvl(bretintax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set retintax=(nvl(RealRETIntax,0)-nvl(\
bretintax,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1728;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          error_quit(sqlca.sqlcode,"12. 실퇴직소득세 setting Error");
     }

     /* EXEC    SQL
     UPDATE  PKMMREST
        SET  retjutax = nvl(RealRETJutax,0) - nvl(bretjutax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set retjutax=(nvl(RealRETJutax,0)-nvl(\
bretjutax,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1743;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "13. 실퇴직주민세 setting Error"); /*dsa2000 Rexec 대체*/
          error_quit(sqlca.sqlcode,"13. 실퇴직주민세 setting Error");
     }  
     
     /* EXEC    SQL
     UPDATE  PKMMREST
        SET  retrealamt = retamt - retintax - retjutax,
             writetime  = to_char(sysdate, 'yyyymmddhh24miss') ,
             writeman   = :g_workemp; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set retrealamt=((retamt-retintax)-retj\
utax),writetime=to_char(sysdate,'yyyymmddhh24miss'),writeman=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1758;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_workemp;
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

 
             
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          Write_batlog(seqno++, "14. 실지급 퇴직금 setting Error"); /*dsa2000 Rexec 대체*/
          error_quit(sqlca.sqlcode,"14. 실지급 퇴직금 setting Error");
     }
/* dsa2000 추가 2004.10.12  end................................................................ */        



/* 9.6.13 국민연금 전환금
*  변경후 : 1999.05.25
*    * ===============================================================
*    1999.04 부터 국민연금에서 퇴충부담금 부분이 없어지므로
*    국민연금이력에서 퇴충부담금을 공제할 경우 퇴충필드가 따로 없으므로
*    1999.03 까지만 합계를 낸다.
*    단, 중간정산 이후 금액부터
*    * ================================================================ *
*/
     /* EXEC SQL
     UPDATE  PKMMREST R 
        SET  ANUAMT = (SELECT SUM(NVL(ANUSELFAMT,0))
                         FROM PKHNPHIS N
                        WHERE R.EMPNO = N.EMPNO
                          AND SUBSTR(R.MRFRDATE,1,6) <= N.ANUYYMM
                          AND SUBSTR(R.MRTODATE,1,6) >= N.ANUYYMM
                          AND N.ANUYYMM <= '199903'
                     )
      WHERE  EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST R  set ANUAMT=(select sum(NVL(ANUSELFAM\
T,0))  from PKHNPHIS N where (((R.EMPNO=N.EMPNO and SUBSTR(R.MRFRDATE,1,6)<=N\
.ANUYYMM) and SUBSTR(R.MRTODATE,1,6)>=N.ANUYYMM) and N.ANUYYMM<='199903')) wh\
ere (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1777;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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


     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
         Write_batlog(seqno++, "9.6.13 국민연금 전환금 계산중...\n"); /*dsa2000 Rexec 대체*/
         hinsa_exit(0,"9.6.13 국민연금 전환금 계산중...\n");
     }

     /* 9.6.14 공제금계 산정 */
     /* EXEC SQL
     UPDATE PKMMREST 
        SET
            ANUAMT = NVL(ANUAMT,0),
            DEDSUM = NVL(ANUAMT,0) /o 기타 + NVL(,0) + NVL(,0) o/
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set ANUAMT=NVL(ANUAMT,0),DEDSUM=NVL(AN\
UAMT,0) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1800;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



     if  (sqlca.sqlcode != 0)
     {
          Write_batlog(seqno++, "9.6.14 공제금 산정중... \n");
          hinsa_exit(0,"9.6.14 공제금 산정중... \n");
     }

     /* 9.6.15 실지급액 */
     /* EXEC SQL
     UPDATE PKMMREST 
        SET
            REALAMT = NVL(RETREALAMT,0) - NVL(DEDSUM,0)
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set REALAMT=(NVL(RETREALAMT,0)-NVL(DED\
SUM,0)) where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1823;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          Write_batlog(seqno++, "9.6.15 실지급액 계산중...\n"); 
          hinsa_exit(0,"9.6.15 실지급액 계산중...\n");
     } 
      

        /* 9.6.16 중간정산 대상자 제외 처리
            (1) 퇴직금 = 0 이면                 퇴직관련 항목들 모두 = 0
            (2) 근속년수가 1년 미만자의 경우    퇴직관련 항목들 모두 = 0
        */
     /* EXEC SQL
     UPDATE  PKMMREST 
        SET
             ADDRATE     =  0,
             RINDED      =  0,
             RINAMT      =  0,
             TAXSTAMT    =  0,
             AVGTAXSTAMT =  0,
             RETTAXRATE  =  0,
             RETAVGTAX   =  0,
             RETCALCTAX  =  0,
             RETTAXDED   =  0,
             RETINTAX    =  0,
             RETJUTAX    =  0,
             RETREALAMT  =  0,
             REALAMT     =  0,
             REALRETINTAX = 0,  /odsa2000 추가 2004.10.12o/
             REALRETJUTAX = 0,  /odsa2000 추가 2004.10.12o/
             RETREAL      = 0   /odsa2000 추가 2004.10.12o/
     WHERE  (RETAMT <= 0
        OR  (DUTYYY < 1 AND EMPNO NOT IN (SELECT EMPNO FROM PKHMRHIS
                                           WHERE MRTODATE <= :g_mrtodate
                                             AND UPPER(CALCYN) = 'Y') ) )
       AND  EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set ADDRATE=0,RINDED=0,RINAMT=0,TAXSTA\
MT=0,AVGTAXSTAMT=0,RETTAXRATE=0,RETAVGTAX=0,RETCALCTAX=0,RETTAXDED=0,RETINTAX\
=0,RETJUTAX=0,RETREALAMT=0,REALAMT=0,REALRETINTAX=0,REALRETJUTAX=0,RETREAL=0 \
where (((RETAMT<=0 or (DUTYYY<1 and EMPNO not  in (select EMPNO  from PKHMRHI\
S where (MRTODATE<=:b0 and UPPER(CALCYN)='Y')))) and EMPNO>=:b1) and EMPNO<=:\
b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1846;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          Write_batlog(seqno++, "9.6.16 중간정산 대상자 제외 처리중...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"9.6.16 중간정산 대상자 제외 처리중...\n");
     }

}

void Calc_Exdd()
{
     char calcfrdate[9],calctodate[9];
     char mrfrdate[9],mrtodate[9];
     char exfrdate[9],extodate[9];
     char empno[4+1];
     char tcalcyy[4+1],tcalcmm[2+1],tcalcdd[2+1] ; /* 계산결과*/
     int  tduyy=0,tdumm=0,tdudd=0;
     int  treyy=0,tremm=0,tredd=0;
     int  texyy=0,texmm=0,texdd=0,texdays=0,s_texdays=0;
     int  tot_days = 0;
     int  carryoff=0;    
     
     memset(calcfrdate,0x00,sizeof(calcfrdate));
     memset(calctodate,0x00,sizeof(calctodate));
     memset(exfrdate,  0x00,sizeof(exfrdate));
     memset(extodate,  0x00,sizeof(extodate));
     memset(tcalcyy,   0x00,sizeof(tcalcyy));
     memset(tcalcmm,   0x00,sizeof(tcalcmm));
     memset(tcalcdd,   0x00,sizeof(tcalcdd));
     
     /* EXEC SQL DECLARE c1 CURSOR FOR
     SELECT  EMPNO,MRFRDATE, MRTODATE, DUTYYY,DUTYMM,DUTYDD, 
             TO_DATE(MRTODATE,'YYYYMMDD')+1 - TO_DATE(NVL(BRETFRDAY,MRFRDATE),'YYYYMMDD') /oBRETFRDAY 추가..년도중 중간정산한 최초기준일으로..o/
       FROM  PKMMREST
      WHERE  EMPNO >= :g_frempno AND EMPNO <= :g_toempno
      /oAND  EMPNO IN (SELECT EMPNO FROM PKHEXDD
                       WHERE  EXFIXYN ='Y')           2004.10.25. 수정 . o/         
     ; */ 

     
     /* EXEC SQL open  c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0051;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1873;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          /* EXEC SQL close c1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1896;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          Write_batlog(seqno++, " 근속제외일수 계산중 cursor c1 ...\n"); /*dsa2000 Rexec 대체*/
          hinsa_exit(0," 근속제외일수 계산중 cursor c1 ...\n");
     }
     
     for(;;)
     {
          /* EXEC SQL FETCH c1
          INTO   :empno,  :mrfrdate, :mrtodate, :tduyy, :tdumm, :tdudd,
                 :tot_days ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1911;
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
          sqlstm.sqhstv[1] = (unsigned char  *)mrfrdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)mrtodate;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&tduyy;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&tdumm;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&tdudd;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&tot_days;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
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


     
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 41;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1954;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
     
          /* EXEC SQL DECLARE c2 CURSOR FOR
          SELECT  EXFRDATE ,EXTODATE,
                  TO_DATE(EXTODATE,'YYYYMMDD')+1 - TO_DATE(EXFRDATE,'YYYYMMDD')
            FROM  PKHEXDD
           WHERE  EMPNO   =:empno
             AND  EXFIXYN ='Y'; */ 

     
          /* EXEC SQL open  c2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = sq0052;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1969;
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


     
          texdd     =0;
          texmm     =0;
          texyy     =0;
          texdays   =0;
          s_texdays =0;
     
          tredd     =0;
          tremm     =0;
          treyy     =0;
     
          for(;;)
          {
               /* EXEC SQL FETCH c2
               INTO   :exfrdate, :extodate, :texdays; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 41;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1988;
               sqlstm.selerr = (unsigned short)1;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqfoff = (         int )0;
               sqlstm.sqfmod = (unsigned int )2;
               sqlstm.sqhstv[0] = (unsigned char  *)exfrdate;
               sqlstm.sqhstl[0] = (unsigned long )9;
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)extodate;
               sqlstm.sqhstl[1] = (unsigned long )9;
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&texdays;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
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


               
               if  (sqlca.sqlcode == 1403)
               {
                    /* EXEC SQL close c2; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 41;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )2015;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    
                    texyy = texyy    + (texmm/12);
                    texmm = texmm%12 + (texdd/30);
                    texdd = texdd%30 ;
                    
                    
                    if ((tdudd - texdd) <0 )
                    {
                         carryoff = 1;
                         tredd =  (30 - texdd) + tdudd;
                    }
                    else
                    {
                         tredd = (tdudd - texdd);
                         carryoff =0;
                    }
                    
                    if ((tdumm - texmm - carryoff) <0 )
                    {
                         tremm =  (12 - texmm) + tdumm- carryoff;
                         carryoff = 1;
                    }
                    else
                    {
                         tremm =  tdumm - texmm - carryoff;
                         carryoff =0;
                    }
                    
                    treyy  =  tduyy - texyy - carryoff;
                    
                    /* EXEC SQL
                    UPDATE  PKMMREST
                       set  EXMM   = :texmm,
                            EXYY   = :texyy,
                            EXDD   = :texdd,
                            EXDAYS = :s_texdays,
                            REALYY = :treyy,
                            REALMM = :tremm,
                            REALDD = :tredd,
                            RETYY  = CEIL((:tot_days - :s_texdays)/30/12)
                     WHERE  EMPNO =:empno ; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 41;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.stmt = "update PKMMREST  set EXMM=:b0,EXYY=:b1,E\
XDD=:b2,EXDAYS=:b3,REALYY=:b4,REALMM=:b5,REALDD=:b6,RETYY=CEIL((((:b7-:b3)/30\
)/12)) where EMPNO=:b9";
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )2030;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlstm.sqhstv[0] = (unsigned char  *)&texmm;
                    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[0] = (         int  )0;
                    sqlstm.sqindv[0] = (         short *)0;
                    sqlstm.sqinds[0] = (         int  )0;
                    sqlstm.sqharm[0] = (unsigned long )0;
                    sqlstm.sqadto[0] = (unsigned short )0;
                    sqlstm.sqtdso[0] = (unsigned short )0;
                    sqlstm.sqhstv[1] = (unsigned char  *)&texyy;
                    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[1] = (         int  )0;
                    sqlstm.sqindv[1] = (         short *)0;
                    sqlstm.sqinds[1] = (         int  )0;
                    sqlstm.sqharm[1] = (unsigned long )0;
                    sqlstm.sqadto[1] = (unsigned short )0;
                    sqlstm.sqtdso[1] = (unsigned short )0;
                    sqlstm.sqhstv[2] = (unsigned char  *)&texdd;
                    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[2] = (         int  )0;
                    sqlstm.sqindv[2] = (         short *)0;
                    sqlstm.sqinds[2] = (         int  )0;
                    sqlstm.sqharm[2] = (unsigned long )0;
                    sqlstm.sqadto[2] = (unsigned short )0;
                    sqlstm.sqtdso[2] = (unsigned short )0;
                    sqlstm.sqhstv[3] = (unsigned char  *)&s_texdays;
                    sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[3] = (         int  )0;
                    sqlstm.sqindv[3] = (         short *)0;
                    sqlstm.sqinds[3] = (         int  )0;
                    sqlstm.sqharm[3] = (unsigned long )0;
                    sqlstm.sqadto[3] = (unsigned short )0;
                    sqlstm.sqtdso[3] = (unsigned short )0;
                    sqlstm.sqhstv[4] = (unsigned char  *)&treyy;
                    sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[4] = (         int  )0;
                    sqlstm.sqindv[4] = (         short *)0;
                    sqlstm.sqinds[4] = (         int  )0;
                    sqlstm.sqharm[4] = (unsigned long )0;
                    sqlstm.sqadto[4] = (unsigned short )0;
                    sqlstm.sqtdso[4] = (unsigned short )0;
                    sqlstm.sqhstv[5] = (unsigned char  *)&tremm;
                    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[5] = (         int  )0;
                    sqlstm.sqindv[5] = (         short *)0;
                    sqlstm.sqinds[5] = (         int  )0;
                    sqlstm.sqharm[5] = (unsigned long )0;
                    sqlstm.sqadto[5] = (unsigned short )0;
                    sqlstm.sqtdso[5] = (unsigned short )0;
                    sqlstm.sqhstv[6] = (unsigned char  *)&tredd;
                    sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[6] = (         int  )0;
                    sqlstm.sqindv[6] = (         short *)0;
                    sqlstm.sqinds[6] = (         int  )0;
                    sqlstm.sqharm[6] = (unsigned long )0;
                    sqlstm.sqadto[6] = (unsigned short )0;
                    sqlstm.sqtdso[6] = (unsigned short )0;
                    sqlstm.sqhstv[7] = (unsigned char  *)&tot_days;
                    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[7] = (         int  )0;
                    sqlstm.sqindv[7] = (         short *)0;
                    sqlstm.sqinds[7] = (         int  )0;
                    sqlstm.sqharm[7] = (unsigned long )0;
                    sqlstm.sqadto[7] = (unsigned short )0;
                    sqlstm.sqtdso[7] = (unsigned short )0;
                    sqlstm.sqhstv[8] = (unsigned char  *)&s_texdays;
                    sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
                    sqlstm.sqhsts[8] = (         int  )0;
                    sqlstm.sqindv[8] = (         short *)0;
                    sqlstm.sqinds[8] = (         int  )0;
                    sqlstm.sqharm[8] = (unsigned long )0;
                    sqlstm.sqadto[8] = (unsigned short )0;
                    sqlstm.sqtdso[8] = (unsigned short )0;
                    sqlstm.sqhstv[9] = (unsigned char  *)empno;
                    sqlstm.sqhstl[9] = (unsigned long )5;
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


                    
                    /* EXEC SQL COMMIT;  */
                    break;
               } /* end of  if */
               
               strcpy(calcfrdate,exfrdate);
               strcpy(calctodate,extodate);
               
               /* (기산일 fr > 근속to ) ||(기산일 to < 근속 fr)*/
               if ((strcmp(extodate,mrfrdate) < 0 )||(strcmp(mrtodate,exfrdate) < 0))
                    continue;
               
               /* 기산일 fr > 근속 fr*/
               if  (strcmp(exfrdate,mrfrdate) < 0)
                    strcpy(calcfrdate,mrfrdate);
               
               /* 기산일 to < 근속 to*/
               if  (strcmp(mrtodate,extodate) < 0)
                    strcpy(calctodate,mrtodate);
               
               DPcalc_term(calcfrdate,calctodate,tcalcyy,tcalcmm,tcalcdd);
               
               texmm = texmm + atoi(tcalcmm) + atoi(tcalcdd)/30;
               texdd = texdd + atoi(tcalcdd)%30;
               texyy = texyy + atoi(tcalcyy);
               s_texdays += texdays ;
     
          } /* end of 개인별  for */
     }      /* end of for */
}          /* end of fuction */

/***************************************************************************
9.7 순위결정 Logic
***************************************************************************/
void Set_Order()
{
     /* 9.7.1 직급 점수(payclscore) */
     /* 9.7.1-1 직급점수(일반직) 산정 */
     /* EXEC SQL
     UPDATE  PKMMREST R SET
             PAYCLSCORE =
            (SELECT SCORE
               FROM PKCPCTBL C
              WHERE R.PAYCL = C.PAYCL
            )
      //infra        WHERE PAYCL < '9'
      WHERE  PAYCL < 'A99'
        AND  EMPNO >= :g_frempno AND EMPNO <= :g_toempno
      ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST R  set PAYCLSCORE=(select SCORE  from P\
KCPCTBL C where R.PAYCL=C.PAYCL) where ((PAYCL<'A99' and EMPNO>=:b0) and EMPN\
O<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2085;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          hinsa_exit(0,"9.7.1-1 직급점수(일반직) 산정 계산중...\n");
     }
     
     /* 9.7.1.1-2 직급점수(기능,특수직) 산정 */
     /* EXEC SQL
     UPDATE PKMMREST R SET
            PAYCLSCORE =
            (SELECT SCORE
               FROM PKCPCTBL C
              WHERE R.PAYCL = C.PAYCL
                AND R.PAYGR >= C.FRPAYGR AND R.PAYGR < C.TOPAYGR
            )      
      WHERE PAYCL >= 'C11' //INFRA        WHERE PAYCL >= '9'
        AND EMPNO >= :g_frempno AND EMPNO <= :g_toempno
     ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST R  set PAYCLSCORE=(select SCORE  from P\
KCPCTBL C where ((R.PAYCL=C.PAYCL and R.PAYGR>=C.FRPAYGR) and R.PAYGR<C.TOPAY\
GR)) where ((PAYCL>='C11' and EMPNO>=:b0) and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2108;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          hinsa_exit(0,"9.7.1-2 직급점수(기능,특수직) 산정중...\n");
     }
     
     /* 9.7.2 근속점수 산정(duyyscore) */
     /* EXEC SQL
     UPDATE PKMMREST R SET
            DUYYSCORE =
           (SELECT SCORE
              FROM PKCDUTBL C
             WHERE R.REALYY >= C.FRDUYY AND R.REALYY < C.TODUYY
         )
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
     ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST R  set DUYYSCORE=(select SCORE  from PK\
CDUTBL C where (R.REALYY>=C.FRDUYY and R.REALYY<C.TODUYY)) where (EMPNO>=:b0 \
and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2131;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          hinsa_exit(0,"9.7.2 근속점수 산정 계산중...\n");
     }

    /* 9.7.3 점수합(score) 산정 */
        /* ---> 3.동점자를 위한 우서순위 산정에서 처리 */
    /* 9.7.4 동점자를 위한 우선순위(각종plus) 산정 */

 /* ===============================================================================
    EXEC SQL
        UPDATE PKMMREST SET
            SCORE       = NVL(PAYCLSCORE,0) + NVL(DUYYSCORE,0),
            PAYCLPLUS   = PAYCL,
            EMPDATEPLUS = EMPDATE,
            FAMICNTPLUS = FAMICNT,
            BIRTHPLUS   = '19'||NVL(SUBSTR(JUMINID,1,6),'99999999')
        WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
        ;

        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
        30.00    1999.02.24     유미나     Y2K(주민번호관련)   하나로인사재개발
        =============================================================================== */
     /* EXEC SQL
     UPDATE PKMMREST 
        SET
            SCORE       = NVL(PAYCLSCORE,0) + NVL(DUYYSCORE,0),
            PAYCLPLUS   = PAYCL,
            EMPDATEPLUS = EMPDATE,
            FAMICNTPLUS = FAMICNT,
            BIRTHPLUS   = NVL(decode(substr(juminid,8,1),'1', '19','2','19','3','20','4','20')||
            SUBSTR(JUMINID,1,6), '99999999')
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMMREST  set SCORE=(NVL(PAYCLSCORE,0)+NVL(DUYYS\
CORE,0)),PAYCLPLUS=PAYCL,EMPDATEPLUS=EMPDATE,FAMICNTPLUS=FAMICNT,BIRTHPLUS=NV\
L((decode(substr(juminid,8,1),'1','19','2','19','3','20','4','20')||SUBSTR(JU\
MINID,1,6)),'99999999') where (EMPNO>=:b0 and EMPNO<=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2154;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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
          hinsa_exit(0,"9.7.4 동점자를 위한 우선순위(각종plus) 산정 계산중...\n");
     }

}

/***************************************************************************
9.8 우선순위(priority), 퇴직금 누계(retamtsum)
***************************************************************************/
void Calc_Order()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char empno[4+1] = "";
          char mrtodate[8+1] = "";
          int  priority = 0;
          double retamt = 0;
          double retamtsum = 0;
     /* EXEC SQL END DECLARE SECTION; */ 


     /* EXEC SQL DECLARE c_retamt CURSOR FOR
     SELECT EMPNO, MRTODATE, RETAMT
       FROM PKMMREST
      WHERE EMPNO >= :g_frempno AND EMPNO <= :g_toempno
      ORDER BY SCORE DESC, PAYCLPLUS DESC , EMPDATEPLUS,
               FAMICNTPLUS DESC, BIRTHPLUS, EMPNO, MRTODATE, RETAMT
     ; */ 


     /* EXEC SQL OPEN c_retamt; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0058;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2177;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[0] = (unsigned long )5;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_toempno;
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



     if  (sqlca.sqlcode != 0)
     {
          /* EXEC SQL close c_retamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2200;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"9.8.1 커서 c_retamt를 OPEN 하는 중...\n");
     }
     
     while(1)
     {
          /* EXEC SQL FETCH c_retamt INTO
              :empno, :mrtodate, :retamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2215;
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
          sqlstm.sqhstv[1] = (unsigned char  *)mrtodate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&retamt;
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


          
          if (sqlca.sqlcode == 1403)
          {
              /* EXEC SQL close c_retamt; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 41;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )2242;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


              break;
          }
          
          priority++;
          retamtsum = retamtsum + retamt;
          
          /* EXEC SQL
          UPDATE PKMMREST SET
                 PRIORITY  = :priority,
                 RETAMTSUM = :retamtsum
           WHERE EMPNO = :empno AND MRTODATE = :mrtodate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMMREST  set PRIORITY=:b0,RETAMTSUM=:b1 wh\
ere (EMPNO=:b2 and MRTODATE=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2257;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&priority;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&retamtsum;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)empno;
          sqlstm.sqhstl[2] = (unsigned long )5;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)mrtodate;
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


          
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
               /* EXEC SQL close c_retamt; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 41;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )2288;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               hinsa_exit(0,"9.8.2 커서 c_retamt에서 퇴직금 누계 갱신중...\n");
          }
     }

}

/***************************************************************************
10  퇴직정산 이력(조회용), 작업결과요약
***************************************************************************/
void Set_PKHMRESH()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

          char  m_mrtodate[8+1]="" ;
          char  min_empno[4+1] = "" ;
          char  max_empno[4+1] = "" ;
          int   cnt_empno  = 0    ;
          float sum_retamt = 0.0  ;
          float sum_realretamt = 0.0  ;
          
          char  empno[4+1]    ="" ;
          char  korname[12+1] = "" ;
          char  juminid[14+1] = "" ;
     /* EXEC SQL END DECLARE SECTION; */ 


     /* 10.1 퇴직정산 이력(조회용) 삭제, 입력 */
     /* EXEC SQL
     DELETE  FROM PKHMRESH
      WHERE  MRTODATE = :g_mrtodate
        AND  EMPNO >= :g_frempno AND EMPNO <= :g_toempno  ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHMRESH  where ((MRTODATE=:b0 and EMPNO>=\
:b1) and EMPNO<=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2303;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
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



     /* EXEC SQL
     INSERT INTO PKHMRESH
     SELECT * FROM PKMMREST
      WHERE MRTODATE = :g_mrtodate
        AND EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHMRESH  select *  from PKMMREST where ((M\
RTODATE=:b0 and EMPNO>=:b1) and EMPNO<=:b2)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2330;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)g_toempno;
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



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          hinsa_exit(0,"10.1 퇴직정산 이력(조회용) 삭제, 입력중...\n");
     }

     /* 10.2 통계 및 오류 검증 */
     /* EXEC SQL
     SELECT  NVL(MAX(MRTODATE),'99999999'),
             NVL(MIN(EMPNO),'null'), NVL(MAX(EMPNO),'null'),
             NVL(COUNT(EMPNO),0), NVL(SUM(RETAMT),0),
             NVL(SUM(RETREALAMT),0)
       INTO  :m_mrtodate, :min_empno, :max_empno,
             :cnt_empno,  :sum_retamt,
             :sum_realretamt
       FROM  PKMMREST
      WHERE  MRTODATE = :g_mrtodate
        AND  EMPNO >= :g_frempno AND EMPNO <= :g_toempno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(max(MRTODATE),'99999999') ,NVL(min(EMPNO),'n\
ull') ,NVL(max(EMPNO),'null') ,NVL(count(EMPNO),0) ,NVL(sum(RETAMT),0) ,NVL(s\
um(RETREALAMT),0) into :b0,:b1,:b2,:b3,:b4,:b5  from PKMMREST where ((MRTODAT\
E=:b6 and EMPNO>=:b7) and EMPNO<=:b8)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2357;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)m_mrtodate;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)min_empno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)max_empno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&cnt_empno;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&sum_retamt;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&sum_realretamt;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)g_mrtodate;
     sqlstm.sqhstl[6] = (unsigned long )9;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)g_frempno;
     sqlstm.sqhstl[7] = (unsigned long )5;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)g_toempno;
     sqlstm.sqhstl[8] = (unsigned long )5;
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

  /*dsa2000  2005.02. add*/

     printf("\n--- 총계---\n");
     printf(" 정산 기산일 : %.4s년 %.2s월 %.2s일\n",m_mrtodate,m_mrtodate+4,m_mrtodate+6);
     printf(" 시작   사번 : %s\n",min_empno);
     printf(" 끝     사번 : %s\n",max_empno);
     printf(" 사원   명수 : %d 명\n",cnt_empno);
     printf(" 퇴직금 총계 : %-.0f 원\n",sum_retamt);
     printf(" 실퇴직금총계: %-.0f 원\n",sum_realretamt);

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          hinsa_exit(0,"10.2 통계 및 오류 검증중...\n");
     }

     /* 10.3 주민등록번호 오류 사원 */
     /* EXEC SQL DECLARE c_juminid CURSOR FOR
     SELECT  EMPNO, KORNAME, REPLACE(JUMINID,' ','#')
       FROM  PKMMREST
      WHERE  (REPLACE(JUMINID,' ','#') LIKE '%#%' OR LENGTH(NVL(JUMINID,' ')) < 14)
        AND  MRTODATE = :g_mrtodate
      ORDER  BY EMPNO ; */ 


     /* EXEC SQL OPEN c_juminid; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0063;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2408;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)g_mrtodate;
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



     if  (sqlca.sqlcode != 0)
     {
          /* EXEC SQL close c_juminid; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2427;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          hinsa_exit(0,"10.3 커서 c_juminid 를 OPEN 하는 중...\n");
     }

     printf("\n\n");
     printf("#--------- 주민등록번호 오류 사원 명단 ---------# \n");
     printf(" 사 번 (성 명) : 주민등록번호 \n");
     printf("#-----------------------------------------------# \n");

     while(1)
     {
          /* EXEC SQL FETCH c_juminid INTO
              :empno, :korname, :juminid ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 41;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2442;
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
          sqlstm.sqhstv[1] = (unsigned char  *)korname;
          sqlstm.sqhstl[1] = (unsigned long )13;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)juminid;
          sqlstm.sqhstl[2] = (unsigned long )15;
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


          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c_juminid; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 41;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )2469;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }
          printf(" %s ( %s ) : %s \n", empno, korname, juminid);
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
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2484;
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
          return(FAIL);
     }                        
                        
     /* EXEC SQL AT log_db COMMIT WORK ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 41;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2525;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
/*
hinsacc pkq5090g
pkq5090g 20130131 0 1775 1775 1 2334 pkq5090g 20130220161732
*/  