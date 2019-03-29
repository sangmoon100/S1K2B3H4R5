
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
    "pkq2075g.pc"
};


static unsigned int sqlctx = 154115;


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
   unsigned char  *sqhstv[47];
   unsigned long  sqhstl[47];
            int   sqhsts[47];
            short *sqindv[47];
            int   sqinds[47];
   unsigned long  sqharm[47];
   unsigned long  *sqharc[47];
   unsigned short  sqadto[47];
   unsigned short  sqtdso[47];
} sqlstm = {12,47};

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
om PKCPTAX where TAXNUM=(select CTAXNUM  from PKCPBAS )           ";

 static char *sq0026 = 
"select A.* , case  when EMPDATE_CALC<='20121231' then EMPDATE_CALC else '' \
 end  EMPDATE_2012 , case  when EMPDATE_CALC<='20121231' then LEAST(RETDATE_C\
ALC,'20121231') else ''  end  RETDATE_2012 , case  when RETDATE_CALC>='201301\
01' then GREATEST(EMPDATE_CALC,'20130101') else ''  end  EMPDATE_2013 , case \
 when RETDATE_CALC>='20130101' then RETDATE_CALC else ''  end  RETDATE_2013  \
from (select EMPNO ,BRETFRDAY ,BRETTODAY ,EMPDATE ,RETDATE , case  when BRETF\
RDAY is  not null  then LEAST(EMPDATE,BRETFRDAY) else EMPDATE  end  EMPDATE_C\
ALC , case  when BRETTODAY is  not null  then GREATEST(RETDATE,BRETTODAY) els\
e RETDATE  end  RETDATE_CALC  from PKMRTMAS ) A            ";

 static char *sq0030 = 
"select EMPNO ,RETDATE ,DECODE(CALYN,'Y',1,0) ,DECODE(LEAST(NVL(PAYCL,'A99')\
,'A99'),'A99',1,0) ,DECODE(RETDATE,TO_CHAR(LAST_DAY(TO_DATE(RETDATE,'YYYYMMDD\
')),'YYYYMMDD'),1,0)  from PKMRTMAS  order by EMPNO            ";

 static char *sq0045 = 
"select EMPNO ,RETDATE ,REALYY_CALC ,REALYY_2012 ,REALYY_2013 ,BRETINTAX ,TN\
EXTYEARAMT ,RETAMTSUM ,FIXDED ,LEAST(GREATEST((RETAMTSUM-FIXDED),0),CONDED) C\
ONDED ,RINDED ,GREATEST((RETAMTSUM-RINDED),0) TAXSTAMT ,NRETAMTSUM ,CONDED CO\
NDED_2016  from (select A.* ,RETUTIL.GET_FIXDED(RETAMTSUM) FIXDED ,RETUTIL.GE\
T_CONDED(REALYY_CALC) CONDED ,RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC) RINDE\
D  from (select EMPNO ,RETDATE ,NVL(REALYY_CALC,0) REALYY_CALC ,NVL(REALYY_20\
12,0) REALYY_2012 ,NVL(REALYY_2013,0) REALYY_2013 ,NVL(BRETINTAX,0) BRETINTAX\
 ,NVL(TNEXTYEARAMT,0) TNEXTYEARAMT ,((NVL(RETAMT,0)+NVL(BRETAMT,0))+NVL(HORRE\
TAMT,0)) RETAMTSUM ,(NVL(RETAMT,0)+NVL(HORRETAMT,0)) NRETAMTSUM  from PKMRTMA\
S ) A )            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,141,0,9,289,0,0,0,0,0,1,0,
20,0,0,1,0,0,13,300,0,0,4,0,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
51,0,0,1,0,0,15,314,0,0,0,0,0,1,0,
66,0,0,2,149,0,5,389,0,0,0,0,0,1,0,
81,0,0,3,149,0,5,399,0,0,0,0,0,1,0,
96,0,0,4,149,0,5,409,0,0,0,0,0,1,0,
111,0,0,5,149,0,5,419,0,0,0,0,0,1,0,
126,0,0,6,149,0,5,429,0,0,0,0,0,1,0,
141,0,0,7,149,0,5,440,0,0,0,0,0,1,0,
156,0,0,8,149,0,5,450,0,0,0,0,0,1,0,
171,0,0,9,149,0,5,460,0,0,0,0,0,1,0,
186,0,0,10,224,0,5,481,0,0,0,0,0,1,0,
201,0,0,11,86,0,5,501,0,0,0,0,0,1,0,
216,0,0,12,116,0,5,507,0,0,0,0,0,1,0,
231,0,0,13,118,0,5,515,0,0,0,0,0,1,0,
246,0,0,14,118,0,5,526,0,0,0,0,0,1,0,
261,0,0,15,118,0,5,537,0,0,0,0,0,1,0,
276,0,0,16,118,0,5,548,0,0,0,0,0,1,0,
291,0,0,17,118,0,5,559,0,0,0,0,0,1,0,
306,0,0,18,118,0,5,570,0,0,0,0,0,1,0,
321,0,0,19,118,0,5,580,0,0,0,0,0,1,0,
336,0,0,20,127,0,5,600,0,0,0,0,0,1,0,
351,0,0,21,205,0,5,621,0,0,0,0,0,1,0,
366,0,0,22,467,0,5,661,0,0,0,0,0,1,0,
381,0,0,23,120,0,5,687,0,0,0,0,0,1,0,
396,0,0,24,171,0,5,695,0,0,0,0,0,1,0,
411,0,0,25,39,0,5,709,0,0,0,0,0,1,0,
426,0,0,26,673,0,9,738,0,0,0,0,0,1,0,
441,0,0,26,0,0,13,742,0,0,11,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,
500,0,0,26,0,0,15,748,0,0,0,0,0,1,0,
515,0,0,26,0,0,15,754,0,0,0,0,0,1,0,
530,0,0,27,605,0,5,804,0,0,37,37,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,
0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,3,0,0,1,3,0,0,1,97,0,0,
693,0,0,28,63,0,5,870,0,0,0,0,0,1,0,
708,0,0,29,100,0,5,938,0,0,0,0,0,1,0,
723,0,0,30,215,0,9,961,0,0,0,0,0,1,0,
738,0,0,30,0,0,13,967,0,0,5,0,0,1,0,2,97,0,0,2,97,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
773,0,0,30,0,0,15,972,0,0,0,0,0,1,0,
788,0,0,30,0,0,15,981,0,0,0,0,0,1,0,
803,0,0,31,202,0,5,1042,0,0,1,1,0,1,0,1,97,0,0,
822,0,0,32,88,0,5,1069,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,97,0,0,
853,0,0,33,193,0,5,1091,0,0,0,0,0,1,0,
868,0,0,34,87,0,5,1109,0,0,0,0,0,1,0,
883,0,0,35,162,0,5,1123,0,0,0,0,0,1,0,
898,0,0,36,131,0,5,1145,0,0,0,0,0,1,0,
913,0,0,37,140,0,5,1157,0,0,0,0,0,1,0,
928,0,0,38,140,0,5,1169,0,0,0,0,0,1,0,
943,0,0,39,146,0,5,1181,0,0,0,0,0,1,0,
958,0,0,40,146,0,5,1193,0,0,0,0,0,1,0,
973,0,0,41,134,0,5,1206,0,0,0,0,0,1,0,
988,0,0,42,72,0,5,1219,0,0,0,0,0,1,0,
1003,0,0,43,86,0,5,1232,0,0,0,0,0,1,0,
1018,0,0,44,47,0,5,1265,0,0,0,0,0,1,0,
1033,0,0,45,710,0,9,1290,0,0,0,0,0,1,0,
1048,0,0,45,0,0,13,1294,0,0,14,0,0,1,0,2,97,0,0,2,97,0,0,2,3,0,0,2,3,0,0,2,3,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
1119,0,0,45,0,0,15,1299,0,0,0,0,0,1,0,
1134,0,0,45,0,0,15,1308,0,0,0,0,0,1,0,
1149,0,0,46,216,0,4,1350,0,0,7,5,0,1,0,1,97,0,0,2,4,0,0,2,4,0,0,1,97,0,0,1,4,0,
0,1,4,0,0,1,3,0,0,
1192,0,0,47,219,0,4,1363,0,0,7,4,0,1,0,1,97,0,0,1,3,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,1,4,0,0,1,4,0,0,
1235,0,0,48,87,0,4,1379,0,0,4,3,0,1,0,1,97,0,0,1,4,0,0,1,4,0,0,2,4,0,0,
1266,0,0,49,886,0,5,1417,0,0,47,47,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,97,0,0,1,4,0,0,1,97,0,0,
1469,0,0,50,49,0,5,1526,0,0,0,0,0,1,0,
1484,0,0,51,49,0,5,1550,0,0,0,0,0,1,0,
1499,0,0,52,101,0,5,1561,0,0,0,0,0,1,0,
1514,0,0,53,136,0,5,1572,0,0,1,1,0,1,0,1,97,0,0,
1533,0,0,54,56,0,2,1601,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1556,0,0,55,461,0,4,1655,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,
1607,0,0,56,571,0,4,1675,0,0,9,3,0,1,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,
2,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,
1658,0,0,57,414,0,4,1692,0,0,9,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,
2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1709,0,0,58,235,0,4,1719,0,0,7,5,0,1,0,1,97,0,0,1,3,0,0,1,97,0,0,1,3,0,0,2,3,0,
0,2,3,0,0,1,97,0,0,
1752,0,0,59,55,0,4,1762,0,0,2,0,0,1,0,2,4,0,0,2,4,0,0,
1775,0,0,60,677,0,3,1782,0,0,13,13,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,4,0,0,1,3,
0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
1842,0,0,61,508,0,3,1813,0,0,13,13,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,4,0,0,1,3,
0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
1909,0,0,62,1608,0,3,1863,0,0,40,40,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,
3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,4,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,3,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,3,0,0,1,97,0,0,
2084,0,0,63,1353,0,3,1930,0,0,32,32,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,
3,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,
1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,3,0,0,1,97,0,0,
2227,0,0,64,355,0,5,1993,0,0,8,8,0,1,0,1,97,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,3,0,0,
2274,0,0,65,96,0,5,2114,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
2301,0,0,66,181,0,5,2147,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2332,0,0,67,79,0,5,2158,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
2355,0,0,68,255,0,5,2167,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2386,0,0,69,63,0,4,2235,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
2409,0,0,70,162,0,4,2257,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
2432,0,0,71,162,0,4,2274,0,0,2,1,0,1,0,2,4,0,0,1,97,0,0,
2455,0,0,72,319,0,4,2310,0,0,5,2,0,1,0,2,4,0,0,2,4,0,0,2,3,0,0,1,97,0,0,1,97,0,
0,
2490,0,0,73,176,0,4,2338,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
2513,0,0,74,0,0,17,2353,0,0,1,1,0,1,0,1,97,0,0,
2532,0,0,74,0,0,45,2362,0,0,0,0,0,1,0,
2547,0,0,74,0,0,13,2370,0,0,3,0,0,1,0,2,4,0,0,2,4,0,0,2,3,0,0,
2574,0,0,74,0,0,15,2386,0,0,0,0,0,1,0,
2589,0,0,75,67,0,4,2390,0,0,10,5,0,1,0,1,4,0,0,1,4,0,0,1,3,0,0,1,4,0,0,1,4,0,0,
2,4,0,0,2,4,0,0,2,3,0,0,2,4,0,0,2,4,0,0,
2644,0,0,76,50,0,3,2401,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
2685,0,0,77,0,0,29,2411,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKQ2075G(퇴직자 퇴직금 계산)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 퇴직정산
 Programmer     : 윤형식
 Version        : 30.00
 Date           : 1999.03.05

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.02.16         이인환          최초개발본      설계명세서
  30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
  31.00       2001.03.13         유효성        임원 연봉제에 따른 평균임금,통상임금 계산방법 변경
                                              (임원평균임금=(기본연봉+업적연봉+중식비연간총액)/12)
  32.00       2002.03.11         유효성        소득세율 하드코딩 부분을 pkcptax테이블에서 읽어오게 수정                                               
  33.00       2002.12.10         유효성        임원퇴직금 지급율 계산 프로그램 call 추가
  33.01       2004.02.24         강륜종        Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.
  34.00       2004.06.18       강륜종(dsa2000) 직급코드값 변동에 따른 수정.  
                                         코드 10이 사외이사에서 부장으로 변경.   사외이사는 0Z로 코드 변경.
  34.10       2004.11.         강륜종(dsa2000)  Rexec대체 서비스를 위한 수정작업. 
  35.00       2005.01.12       DSA2000         월차폐지 및 정보통신수당(ITAMT) 추가에 다른 수정. 
                                               퇴직세액공제   2005년부터 폐지   
  35.01       2006.03.07       dsa2000         퇴직소득공제 세율변경 (50% => 45%)
============================================================================= */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <math.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"

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

/* EXEC SQL BEGIN DECLARE SECTION; */ 

     char    empno[5];
/*법정퇴직금 변수*/
     char    empdate[9];
     char    retdate[9];          
     int     dutydd;
     int     dutymm;
     int     exdd;
     int     realdd;
     int     realmm;
     int     realyy;     
     


    double avgtaxstamt1;    
    double rettaxrate1;
    double retavgtax1;
    double retcalctax1;
    
/*법정외(명퇴)퇴직금 변수*/    
     char    mempdate[9];
     int     mrealdd; /* 명퇴 변수 추가 kth 2010.07.06*/
     int     mrealmm; /* 명퇴 변수 추가 kth 2010.07.06*/
     int     mrealyy; /* 명퇴 변수 추가 kth 2010.07.06*/     
     int     mdutydd; /* 명퇴 변수 추가 kth 2010.07.06*/
     int     mexdd;   /* 명퇴 변수 추가 kth 2010.07.06*/
     int     mdutydd_2012; 
     int     mexdd_2012;   
     int     mrealdd_2012;
     int     mrealmm_2012;
     int     mrealyy_2012;
     int     mdutydd_2012;
     int     mrealyy_2013;    

    double mtaxstamt; 
    double mavgtaxstamt;    
    double mrettaxrate;
    double mretavgtax;
    double mretcalctax;


/*2012년 이전 근속년수 추가 시작 2013.02.13*/   
     char    bretfrday[9];
     char    brettoday[9]; 
     char    bretsubdate[9]; 
     int     dutydd_bret;  
     int     dutymm_bret;       
     int     exdd_bret;    
     int     realdd_bret;
     int     realmm_bret;
     int     realyy_bret;  

/*정산(합산) 변수*/
     char    empdate_calc[9];
     char    retdate_calc[9];          
     int     dutydd_calc;  
     int     dutymm_calc;       
     int     exdd_calc;    
     int     realdd_calc;
     int     realmm_calc;
     int     realyy_calc;   

    double retamtsum;             
    double fixded; 
    double conded; 
    double conded_2016; 
    double rinded; 
    double taxstamt;
    double avgtaxstamt;    
    double retavgtaxstamt;    
    double rettaxrate;
    double retavgtax;
    double retavgcalctax;    
    double retcalctax;
    
    double calcintax;
    double calcjutax;
        
    double retintax;
    double retjutax;     
    
    double bretintax;

    double tnextyearamt;
    double njutax;
    double nintax;        

 /*2012.12.31 이전 변수*/
     char    empdate_2012[9];
     char    retdate_2012[9];          
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
     char    empdate_2013[9];
     char    retdate_2013[9];          
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
    
    double change_pay_2016     ;  //2015.12.15 eyha add
    double change_payded_2016  ;  //2015.12.15 eyha add         
    double taxstamt_2016       ;  //2015.12.15 eyha add    
    double rettaxrate_2016     ;  //2015.12.15 eyha add    
    double retavgtax_2016      ;  //2015.12.15 eyha add
    double retcalctax_2016     ;  //2015.12.15 eyha add
    double retintax_2016       ;  //2015.12.15 eyha add
    double retintax_calc       ;  //2015.12.15 eyha add                        
                               
    double nretamtsum          ;  //2016.10.19 eyha add                        
        

    struct
    {      double taxfr   ;
           double taxto   ;
           double taxrate ;
           double yearded ;
    } taxtbl[10];
     
/*2012년 이전 근속년수 추가 종료 2013.02.13*/          
     char  jobempno[4+1]  = "";  /* 작업자사번   */                     
/* EXEC SQL END   DECLARE SECTION; */ 


/* =============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
  30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
============================================================================= */
int set_avgpay(char *m_empno, char *m_retdate, int m_gubuncl, int m_iscalyn, char *meg);
int get_dd(char *m_empno,char *m_retdate, int m_befmon, int *m_totdd, int *m_dudd, char *meg);
int set_paysum(char *m_empno, char *m_retdate, int m_islastret, int m_iscalyn, int m_befmon, int m_totdd, int m_dudd, char *meg);
int set_yearmonsum(char *m_empno,char *m_retdate,int m_islastret, char *meg);
int get_avgpay(char *m_empno, char *m_retdate, int m_gubuncl, double *m_pay3sum, double *m_bon12sum, double *m_commonamt, double *m_sptmamt, int *m_termdd, char *meg);

FILE *fp = stdout;

char  cmdline[256];
char  userid[10] ;
int   id;

/* =============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
  30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
============================================================================= */
const int LASTRET_Y = -2;
const int LASTRET_N = -3;

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0; 
int  taxtblcnt=0;
int  taxtblidx=0;

void main(argc,argv)
int argc;
char *argv[];
{       
     char FL_file[255];
             
     if  (argc != 4) {  /* /hper8/HINSA/proc/bin/Kbin/pkq2075g D006 pkq2075g 2004110100000 */
          printf("[Usage] : pkq2075g  1.작업자사번 2.프로그램ID 3.시작시간 \n");  
          exit(1);
     }  
     
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkq2075g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     sprintf(jobempno,"%s",  argv[1]);       
         
     hinsa_log_print(0,"퇴직자 퇴직금 계산 시작...");        
     hinsa_db_connect();  /*DB Connect 실시..*/
          
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[1]);
     strcpy(log_progid,   argv[2]);
     strcpy(log_rundate,  argv[3]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     CalcRetAmt();      
           
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====\n");
          Write_batlog(seqno++, log_buff);   
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else  
     {
          sprintf(log_buff, "OK ====== [퇴직금 계산 작업성공] =====\n");
          Write_batlog(seqno++, log_buff); 
          hinsa_exit(0,"OK ====== [퇴직금 계산 작업성공] =====\n");
     }       
     
}

err_print(errcode,str)
int errcode;
char *str;
{
     fprintf(fp,"[ERRCODE : %d] %s\n",errcode,str);
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
     sqlstm.stmt = sq0001;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
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
          sqlstm.offset = (unsigned int  )20;
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
            err_print(sqlca.sqlcode,"연말정산 기초자료 read Error");
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
               sqlstm.offset = (unsigned int  )51;
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
/*==============================================================================*/
CalcRetAmt()
{
     int     tmpmm;
     int     mtmpmm; /* 명퇴 임시 변수 추가 kth 2010.07.06*/
             
     double  bon12sum   = 0.0 ;
     double  pay3sum    = 0.0 ;
     int     termdd     = 0 ;
     char    empno[4+1]    ;
     char    retdate[8+1]  ;
     char    dirempno[4+1] ;
     char    dirretdate[8+1] ;
     char    sempno[2] ;
     char    yearchk[5] ;
     double  commonamt = 0;
     double  avggross  = 0;
     double  p_sptmamt = 0;
     int     iscalyn   = 0;
     int     gubuncl   = 0;
     int     p_lastret = 0;
     char    meg[2000] ;        
     char    *HOMEDIR; /*MIS2*/
     
     HOMEDIR = hinsa_home();
     strcat(HOMEDIR,"/proc");

     memset(meg,'\0',sizeof(meg));

hinsa_log_print(0,"ReadTax 시작...");        

    ReadTax(); 

/*  PKQ2020A (퇴직자관리) 화면에서 퇴직마스터의 입사일자를 수정처리 가능하도록 반영함 [2018-09-13 이상용] */
/*
     EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  EMPDATE, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             );
*/


hinsa_log_print(0,"기산일 반영 시작...");      
  
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20110301' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2290'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20110\
301' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='2290'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )66;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* 2017.02.22 eyha 퇴직금 승계에 따른 전직장 기산일 반영 홍원영 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20130401' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2906'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20130\
401' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='2906'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )81;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* 2017.03.31 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20140101' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2912'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20140\
101' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='2912'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )96;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     /* 2017.04.25 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20141215' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2907'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20141\
215' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='2907'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )111;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     /* 2017.10.17 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20120227' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2900'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20120\
227' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='2900'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )126;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     
     /* 2018.03.03 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20120401' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2888'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20120\
401' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='2888'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )141;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     /* 2018.03.12 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20150615' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='3048'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20150\
615' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='3048'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )156;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* 2018.06.14 jhg 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE, RETDATE ) =
             (SELECT  '20160404' empdate, NVL(RETDATE,A.RETDATE)  
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2899'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE,RETDATE)=(select '20160\
404' empdate ,NVL(RETDATE,A.RETDATE)  from PIMPMAS B where A.EMPNO=B.EMPNO) w\
here empno='2899'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )171;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

      

     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {       
          err_print(sqlca.sqlcode,"1.1 근속기간 setting Error");
          sprintf(log_buff, "1.1 근속기간 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     
     
hinsa_log_print(0,"중간정산 기산일 반영 시작...");      

     /* 중간정산 한 사람에 대해서 입사일을 중간정산이후 일자로 한다..*/
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (EMPDATE ) =
             (SELECT  TO_CHAR(TO_DATE(MAX(MRTODATE),'YYYYMMDD') + 1 ,'YYYYMMDD')
                FROM  PKHMRHIS B   /o 중간정산이력 o/
               WHERE  A.EMPNO = B.EMPNO
               GROUP  BY B.EMPNO )
      WHERE  EMPNO IN (SELECT  EMPNO 
                         FROM  PKHMRHIS B
                        WHERE  A.EMPNO = B.EMPNO) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (EMPDATE)=(select TO_CHAR((TO_DA\
TE(max(MRTODATE),'YYYYMMDD')+1),'YYYYMMDD')  from PKHMRHIS B where A.EMPNO=B.\
EMPNO group by B.EMPNO) where EMPNO in (select EMPNO  from PKHMRHIS B where A\
.EMPNO=B.EMPNO)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )186;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          err_print(sqlca.sqlcode,"1. 중간정산자료 setting Error ");
          sprintf(log_buff, "1. 중간정산자료 setting Error ");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     
     /* 명퇴시 최초 입사일 DEMPDATE 에 넣음 2010.06.23 KTH 시작  */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  MEMPDATE = (SELECT  EMPDATE
                           FROM  PIMPMAS  B
                          WHERE  A.EMPNO = B.EMPNO); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set MEMPDATE=(select EMPDATE  from P\
IMPMAS B where A.EMPNO=B.EMPNO)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )201;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                          
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  MEMPDATE = (SELECT  '20110301' empdate
                           FROM  PIMPMAS  B
                          WHERE  A.EMPNO = B.EMPNO)
       where empno ='2290' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set MEMPDATE=(select '20110301' empd\
ate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='2290'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )216;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

                          

     /* 2017.02.22 eyha 퇴직금 승계에 따른 전직장 기산일 반영 홍원영 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (MEMPDATE ) =
             (SELECT  '20130401' empdate 
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2906'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (MEMPDATE)=(select '20130401' em\
pdate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='2906'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )231;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}




     /* 2017.03.31 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (MEMPDATE ) =
             (SELECT  '20140101' empdate 
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2912'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (MEMPDATE)=(select '20140101' em\
pdate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='2912'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )246;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     

     /* 2017.04.25 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (MEMPDATE ) =
             (SELECT  '20141215' empdate 
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2907'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (MEMPDATE)=(select '20141215' em\
pdate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='2907'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )261;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}




     /* 2017.10.17 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (MEMPDATE ) =
             (SELECT  '20120227' empdate 
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2900'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (MEMPDATE)=(select '20120227' em\
pdate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='2900'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )276;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          

     /* 2018.03.03 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (MEMPDATE ) =
             (SELECT  '20120401' empdate
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2888'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (MEMPDATE)=(select '20120401' em\
pdate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='2888'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )291;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     
     /* 2018.03.12 eyha 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (MEMPDATE ) =
             (SELECT  '20150615' empdate
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='3048'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (MEMPDATE)=(select '20150615' em\
pdate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='3048'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )306;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     /* 2018.06.14 jhg 퇴직금 승계에 따른 전직장 기산일 반영 김선일 M */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (MEMPDATE ) =
             (SELECT  '20160404' empdate
                FROM    PIMPMAS  B
               WHERE   A.EMPNO = B.EMPNO
             )
     where empno ='2899'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (MEMPDATE)=(select '20160404' em\
pdate  from PIMPMAS B where A.EMPNO=B.EMPNO) where empno='2899'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )321;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

      


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          err_print(sqlca.sqlcode,"1. 명퇴자 최초입사일 입력  setting Error ");
          sprintf(log_buff, "1. 명퇴자 최초입사일 입력 setting Error ");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     /* 명퇴시 최초 입사일 DEMPDATE 에 넣음 2010.06.23 KTH 끝  */
     
     /* 명퇴시 최초 입사일 DEMPDATE 에 넣음 2011.01.06 KTH 시작 '2398' 하드코딩 나중에 삭제 요암 kth */
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  MEMPDATE = (SELECT  '19941012'
                           FROM  PIMPMAS  B
                          WHERE  A.EMPNO = B.EMPNO
                          and empno ='2398')
        where empno ='2398'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set MEMPDATE=(select '19941012'  fro\
m PIMPMAS B where (A.EMPNO=B.EMPNO and empno='2398')) where empno='2398'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )336;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          err_print(sqlca.sqlcode,"1. 명퇴자 최초입사일 입력  setting Error ");
          sprintf(log_buff, "1. 명퇴자 최초입사일 입력 setting Error ");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     /* 명퇴시 최초 입사일 DEMPDATE 에 넣음 2010.06.23 KTH 끝  */     
     
     
hinsa_log_print(0,"퇴직기산일 특이자 반영 시작...");      
     
     /* 퇴직기산일 특이자 update 추가 Start [2018-09-13 이상용] */
     /* EXEC SQL
     UPDATE PKMRTMAS S SET
            MEMPDATE = (SELECT RETCALCDATE FROM PKZRTSPC T WHERE S.EMPNO = T.EMPNO ),
            EMPDATE  = (SELECT RETCALCDATE FROM PKZRTSPC T WHERE S.EMPNO = T.EMPNO )
      WHERE EMPNO IN (SELECT EMPNO FROM PKZRTSPC ); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS S  set MEMPDATE=(select RETCALCDATE  fr\
om PKZRTSPC T where S.EMPNO=T.EMPNO),EMPDATE=(select RETCALCDATE  from PKZRTS\
PC T where S.EMPNO=T.EMPNO) where EMPNO in (select EMPNO  from PKZRTSPC )";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )351;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          err_print(sqlca.sqlcode,"퇴직기산일 특이자  setting Error ");
          sprintf(log_buff, "퇴직기산일 특이자 setting Error ");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     /* 퇴직기산일 특이자 update 추가 End [2018-09-13 이상용] */
     
hinsa_log_print(0,"퇴직기산일 특이자 반영 종료...");      

        
     /* 중간정산과 동일년도에  퇴사시 종근무지 자료를 입력한다.
     EXEC SQL
     UPDATE  PKMRTMAS A
     SET     (BRETMM     , BRETAMT   ,
              BRETINTAX  , BRETJUTAX ,
              BRETFRDAY  , BRETTODAY,
              BRETSUBDATE ) =
                (SELECT  SUM(NVL(RETMM   ,0)), SUM(NVL(RETAMT,  0)),
                         SUM(NVL(RETINTAX,0)), SUM(NVL(RETJUTAX,0)),
                         MIN(MRFRDATE)       , MAX(MRTODATE),
                         MAX(SUBDATE)
                 FROM    PKHMRHIS B
                 WHERE   A.EMPNO = B.EMPNO
                 AND   SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)
                GROUP BY B.EMPNO )
        WHERE EMPNO IN (SELECT EMPNO 
           FROM PKHMRHIS B
           WHERE   A.EMPNO = B.EMPNO
                   AND   SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)) ;*/
                   
     /* 2007.07.02 수정 */
     /* 2013.04.19.hjku. 기정산한 중간정산 전체 반영 여부 추가*/
     /* EXEC SQL
     UPDATE  PKMRTMAS A
        SET  (BRETMM     , BRETAMT   ,
              BRETINTAX  , BRETJUTAX ,
              BRETFRDAY  , BRETTODAY ,
              BRETSUBDATE) = (SELECT SUM(NVL(RETMM   ,0))    , SUM(NVL(RETAMT,  0)),
                                     SUM(NVL(REALRETINTAX,0)), SUM(NVL(REALRETJUTAX,0)),
                                     MIN(MRFRDATE)           , MAX(MRTODATE),
                                     MAX(SUBDATE) 
                                FROM PKHMRHIS B
                               WHERE A.EMPNO = B.EMPNO
                                /oAND SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)o/
                                AND ((NVL(a.MRALLYN,'N') ='Y') or ((NVL(a.MRALLYN,'N') ='N') and (SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4))))
                               GROUP BY B.EMPNO )
      WHERE EMPNO IN (SELECT  EMPNO FROM  PKHMRHIS B
                       WHERE  A.EMPNO = B.EMPNO
                         /oAND  SUBSTR(A.RETDATE ,1,4) = SUBSTR(B.MRTODATE ,1,4)) ;o/); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS A  set (BRETMM,BRETAMT,BRETINTAX,BRETJU\
TAX,BRETFRDAY,BRETTODAY,BRETSUBDATE)=(select sum(NVL(RETMM,0)) ,sum(NVL(RETAM\
T,0)) ,sum(NVL(REALRETINTAX,0)) ,sum(NVL(REALRETJUTAX,0)) ,min(MRFRDATE) ,max\
(MRTODATE) ,max(SUBDATE)  from PKHMRHIS B where (A.EMPNO=B.EMPNO and (NVL(a.M\
RALLYN,'N')='Y' or (NVL(a.MRALLYN,'N')='N' and SUBSTR(A.RETDATE,1,4)=SUBSTR(B\
.MRTODATE,1,4)))) group by B.EMPNO) where EMPNO in (select EMPNO  from PKHMRH\
IS B where A.EMPNO=B.EMPNO)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )366;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



        if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
        {       
             err_print(sqlca.sqlcode,"1. 중간정산자료 setting Error 2");
             sprintf(log_buff, "1. 중간정산자료 setting Error 2");
             Write_batlog(seqno++, log_buff); 
             exit(1);
        }

      /* EXEC SQL
      UPDATE  PKMRTMAS A
         SET  BRETMM    = NVL(BRETMM    ,0),
              BRETAMT   = NVL(BRETAMT   ,0),
              BRETINTAX = NVL(BRETINTAX ,0),
              BRETJUTAX = NVL(BRETJUTAX ,0) ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKMRTMAS A  set BRETMM=NVL(BRETMM,0),BRETAMT=NV\
L(BRETAMT,0),BRETINTAX=NVL(BRETINTAX,0),BRETJUTAX=NVL(BRETJUTAX,0)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )381;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                             
      /* 귀속일 Setting.. : YSFRDATE , YSTODATE */
      /* EXEC SQL
      UPDATE  PKMRYMAS a
         SET  YSFRDATE = (select  GREATEST(NVL(b.ORGEMPDATE,substr(b.retdate,1,4)||'0101'),
                                                            substr(b.retdate,1,4)||'0101')
                            from  pkmrtmas b
                           where  a.empno = b.empno) ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKMRYMAS a  set YSFRDATE=(select GREATEST(NVL(b\
.ORGEMPDATE,(substr(b.retdate,1,4)||'0101')),(substr(b.retdate,1,4)||'0101'))\
  from pkmrtmas b where a.empno=b.empno)";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )396;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                      
      if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {    err_print(sqlca.sqlcode,"귀속일from setting Error");
           sprintf(log_buff, "귀속일from setting Error");
           Write_batlog(seqno++, log_buff); 
           exit(1);
      }
  
      /* EXEC SQL
      UPDATE  PKMRYMAS a
         SET  YSTODATE = RETDATE; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 4;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = "update PKMRYMAS a  set YSTODATE=RETDATE";
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )411;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   
        
      if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
      {    err_print(sqlca.sqlcode,"귀속일to setting Error");
           sprintf(log_buff, "귀속일to setting Error");
           Write_batlog(seqno++, log_buff); 
           exit(1);
      } 
      
      
     /* EXEC    SQL DECLARE c1 CURSOR FOR
         SELECT A.*,
                CASE WHEN EMPDATE_CALC <='20121231'  THEN EMPDATE_CALC                      ELSE '' END EMPDATE_2012,
                CASE WHEN EMPDATE_CALC <='20121231'  THEN LEAST(RETDATE_CALC,'20121231')    ELSE '' END RETDATE_2012,
                CASE WHEN RETDATE_CALC >='20130101'  THEN GREATEST(EMPDATE_CALC,'20130101') ELSE '' END EMPDATE_2013,
                CASE WHEN RETDATE_CALC >='20130101'  THEN RETDATE_CALC                      ELSE '' END RETDATE_2013      
         FROM (           
              SELECT  EMPNO,
                      BRETFRDAY,
                      BRETTODAY,
                      EMPDATE,
                      RETDATE,
                      CASE WHEN BRETFRDAY IS NOT NULL THEN LEAST   (EMPDATE,BRETFRDAY)  ELSE EMPDATE END EMPDATE_CALC,
                      CASE WHEN BRETTODAY IS NOT NULL THEN GREATEST(RETDATE,BRETTODAY)  ELSE RETDATE END RETDATE_CALC
                FROM  PKMRTMAS
             )A; */ 

             
     /* EXEC SQL OPEN  c1 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0026;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )426;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     while(1)
     {
          /* EXEC   SQL FETCH c1
          INTO  :empno, :bretfrday, :brettoday, :empdate, :retdate, :empdate_calc, :retdate_calc,:empdate_2012, :retdate_2012,:empdate_2013, :retdate_2013; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 11;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )441;
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
          sqlstm.sqhstv[1] = (unsigned char  *)bretfrday;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)brettoday;
          sqlstm.sqhstl[2] = (unsigned long )9;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)empdate;
          sqlstm.sqhstl[3] = (unsigned long )9;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)retdate;
          sqlstm.sqhstl[4] = (unsigned long )9;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)empdate_calc;
          sqlstm.sqhstl[5] = (unsigned long )9;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)retdate_calc;
          sqlstm.sqhstl[6] = (unsigned long )9;
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)empdate_2012;
          sqlstm.sqhstl[7] = (unsigned long )9;
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)retdate_2012;
          sqlstm.sqhstl[8] = (unsigned long )9;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)empdate_2013;
          sqlstm.sqhstl[9] = (unsigned long )9;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)retdate_2013;
          sqlstm.sqhstl[10] = (unsigned long )9;
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




          if  (sqlca.sqlcode == 1403 )
          {
               /* EXEC SQL close c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 11;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )500;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }

          if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
          {
                /* EXEC SQL close c1; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 11;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )515;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                err_print(sqlca.sqlcode,"FETCH CURSOR c1 Error\n");
                sprintf(log_buff, "FETCH CURSOR c1 Error\n");
                Write_batlog(seqno++, log_buff); 
                exit(1);
          }          
          
          /* 중간정산 근속 연수 */
          dutydd_bret = dutymm_bret = exdd_bret = realdd_bret = realmm_bret = realyy_bret = 0;

          if((strcmp(bretfrday,"")!=0)&&(strcmp(brettoday,"")!=0)  )
             get_RealYYMMDD(empno,bretfrday,brettoday,&dutydd_bret,&dutymm_bret,&exdd_bret,&realdd_bret,&realmm_bret,&realyy_bret);
          

          /* 최종분 근속 연수 */
          dutydd = dutymm = exdd = realdd = realmm = realyy = 0;

          get_RealYYMMDD(empno,empdate,retdate,&dutydd,&dutymm,&exdd,&realdd,&realmm,&realyy);

          /* 정산(합산) 근속 연수 */
          dutydd_calc = dutymm_calc = exdd_calc = realdd_calc = realmm_calc = realyy_calc = 0;

          get_RealYYMMDD(empno,empdate_calc,retdate_calc,&dutydd_calc,&dutymm_calc,&exdd_calc,&realdd_calc,&realmm_calc,&realyy_calc);


          /* 2012.12.31. 이전 근속 연수 */
          dutydd_2012 = dutymm_2012 = exdd_2012 = realdd_2012 = realmm_2012 = realyy_2012 = 0;

          if((strcmp(empdate_2012,"")!=0)&&(strcmp(retdate_2012,"")!=0)  )
             get_RealYYMMDD(empno,empdate_2012,retdate_2012,&dutydd_2012,&dutymm_2012,&exdd_2012,&realdd_2012,&realmm_2012,&realyy_2012);


          /* 2013.01.01. 이후 근속 연수 */
          dutydd_2013 = dutymm_2013 = exdd_2013 = realdd_2013 = realmm_2013 = realyy_2013 = 0;

          /* 2017.03.07 eyha 근속연수 계산식 변경  
          if((strcmp(empdate_2013,"")!=0)&&(strcmp(retdate_2013,"")!=0)  )
             get_RealYYMMDD(empno,empdate_2013,retdate_2013,&dutydd_2013,&dutymm_2013,&exdd_2013,&realdd_2013,&realmm_2013,&realyy_2013);   */

          if((strcmp(empdate_2013,"")!=0)&&(strcmp(retdate_2013,"")!=0)  )
          {	
  		      dutydd_2013  = dutydd_calc - dutydd_2012;
	  	      dutymm_2013  = dutymm_calc - dutymm_2012;
		        exdd_2013    = exdd_calc   - exdd_2012;
		        realdd_2013  = realdd_calc - realdd_2012;
		        realmm_2013  = realmm_calc - realmm_2012;
          } 

                    realyy_2013 = realyy_calc - realyy_2012;
                    
          /* EXEC SQL
          UPDATE  PKMRTMAS
             SET  
                  DUTYDD      = :dutydd,
                  DUTYMM      = :dutymm,
                    EXDD      =   :exdd,
                  REALDD      = :realdd,
                  REALMM      = :realmm,
                  REALYY      = :realyy,
                  DUTYDD_BRET = :dutydd_bret,
                  DUTYMM_BRET = :dutymm_bret,
                    EXDD_BRET =   :exdd_bret,
                  REALDD_BRET = :realdd_bret,
                  REALMM_BRET = :realmm_bret,
                  REALYY_BRET = :realyy_bret,                  	
                  EMPDATE_CALC= :empdate_calc,
                  RETDATE_CALC= :retdate_calc,                      
                  DUTYDD_CALC = :dutydd_calc,
                  DUTYMM_CALC = :dutymm_calc,
                    EXDD_CALC =   :exdd_calc,
                  REALDD_CALC = :realdd_calc,
                  REALMM_CALC = :realmm_calc,
                  REALYY_CALC = :realyy_calc,
                  EMPDATE_2012= :empdate_2012,
                  RETDATE_2012= :retdate_2012,                      
                  DUTYDD_2012 = :dutydd_2012,
                  DUTYMM_2012 = :dutymm_2012,
                    EXDD_2012 =   :exdd_2012,
                  REALDD_2012 = :realdd_2012,
                  REALMM_2012 = :realmm_2012,
                  REALYY_2012 = :realyy_2012,
                  EMPDATE_2013= :empdate_2013,
                  RETDATE_2013= :retdate_2013,
                  DUTYDD_2013 = :dutydd_2013,
                  DUTYMM_2013 = :dutymm_2013,
                    EXDD_2013 =   :exdd_2013,
                  REALDD_2013 = :realdd_2013,
                  REALMM_2013 = :realmm_2013,
                  REALYY_2013 = :realyy_2013                                                            
           WHERE  EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS  set DUTYDD=:b0,DUTYMM=:b1,EXDD=:b\
2,REALDD=:b3,REALMM=:b4,REALYY=:b5,DUTYDD_BRET=:b6,DUTYMM_BRET=:b7,EXDD_BRET=\
:b8,REALDD_BRET=:b9,REALMM_BRET=:b10,REALYY_BRET=:b11,EMPDATE_CALC=:b12,RETDA\
TE_CALC=:b13,DUTYDD_CALC=:b14,DUTYMM_CALC=:b15,EXDD_CALC=:b16,REALDD_CALC=:b1\
7,REALMM_CALC=:b18,REALYY_CALC=:b19,EMPDATE_2012=:b20,RETDATE_2012=:b21,DUTYD\
D_2012=:b22,DUTYMM_2012=:b23,EXDD_2012=:b24,REALDD_2012=:b25,REALMM_2012=:b26\
,REALYY_2012=:b27,EMPDATE_2013=:b28,RETDATE_2013=:b29,DUTYDD_2013=:b30,DUTYMM\
_2013=:b31,EXDD_2013=:b32,REALDD_2013=:b33,REALMM_2013=:b34,REALYY_2013=:b35 \
where EMPNO=:b36";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )530;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&dutydd;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&dutymm;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&exdd;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&realdd;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&realmm;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&realyy;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&dutydd_bret;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&dutymm_bret;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&exdd_bret;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&realdd_bret;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&realmm_bret;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&realyy_bret;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)empdate_calc;
          sqlstm.sqhstl[12] = (unsigned long )9;
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)retdate_calc;
          sqlstm.sqhstl[13] = (unsigned long )9;
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&dutydd_calc;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&dutymm_calc;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&exdd_calc;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&realdd_calc;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&realmm_calc;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)empdate_2012;
          sqlstm.sqhstl[20] = (unsigned long )9;
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)retdate_2012;
          sqlstm.sqhstl[21] = (unsigned long )9;
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&dutydd_2012;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&dutymm_2012;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&exdd_2012;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&realdd_2012;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&realmm_2012;
          sqlstm.sqhstl[26] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[26] = (         int  )0;
          sqlstm.sqindv[26] = (         short *)0;
          sqlstm.sqinds[26] = (         int  )0;
          sqlstm.sqharm[26] = (unsigned long )0;
          sqlstm.sqadto[26] = (unsigned short )0;
          sqlstm.sqtdso[26] = (unsigned short )0;
          sqlstm.sqhstv[27] = (unsigned char  *)&realyy_2012;
          sqlstm.sqhstl[27] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[27] = (         int  )0;
          sqlstm.sqindv[27] = (         short *)0;
          sqlstm.sqinds[27] = (         int  )0;
          sqlstm.sqharm[27] = (unsigned long )0;
          sqlstm.sqadto[27] = (unsigned short )0;
          sqlstm.sqtdso[27] = (unsigned short )0;
          sqlstm.sqhstv[28] = (unsigned char  *)empdate_2013;
          sqlstm.sqhstl[28] = (unsigned long )9;
          sqlstm.sqhsts[28] = (         int  )0;
          sqlstm.sqindv[28] = (         short *)0;
          sqlstm.sqinds[28] = (         int  )0;
          sqlstm.sqharm[28] = (unsigned long )0;
          sqlstm.sqadto[28] = (unsigned short )0;
          sqlstm.sqtdso[28] = (unsigned short )0;
          sqlstm.sqhstv[29] = (unsigned char  *)retdate_2013;
          sqlstm.sqhstl[29] = (unsigned long )9;
          sqlstm.sqhsts[29] = (         int  )0;
          sqlstm.sqindv[29] = (         short *)0;
          sqlstm.sqinds[29] = (         int  )0;
          sqlstm.sqharm[29] = (unsigned long )0;
          sqlstm.sqadto[29] = (unsigned short )0;
          sqlstm.sqtdso[29] = (unsigned short )0;
          sqlstm.sqhstv[30] = (unsigned char  *)&dutydd_2013;
          sqlstm.sqhstl[30] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[30] = (         int  )0;
          sqlstm.sqindv[30] = (         short *)0;
          sqlstm.sqinds[30] = (         int  )0;
          sqlstm.sqharm[30] = (unsigned long )0;
          sqlstm.sqadto[30] = (unsigned short )0;
          sqlstm.sqtdso[30] = (unsigned short )0;
          sqlstm.sqhstv[31] = (unsigned char  *)&dutymm_2013;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&exdd_2013;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&realdd_2013;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&realmm_2013;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)empno;
          sqlstm.sqhstl[36] = (unsigned long )5;
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
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
                err_print(sqlca.sqlcode,"5.1 실근속년수 산정 Error");
                sprintf(log_buff, "5.1 실근속년수 산정 Error");
                Write_batlog(seqno++, log_buff); 
                exit(1);
           }           
     } /* end of while */

     /* 실근속년수 : 정산 후 기간동안 
     EXEC    SQL
     UPDATE  PKMRTMAS
        SET  REALYY   = CEIL( NVL(REALMM,0)  /12),     
             MREALYY  = CEIL( NVL(MREALMM,0)  /12),    
             MMREALYY = Trunc( NVL(MREALMM,0)  /12- NVL(REALMM,0)  /12+0.9999999) ;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"1.6 실근속년수 산정 Error");
          sprintf(log_buff, "1.6 실근속년수 산정 Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }*/

     
     /*지급율 산정*/
     /* EXEC SQL
     UPDATE  PKMRTMAS P
        SET  RETRATE  = ROUND(P.REALMM/12,2),
             /oMRATRATE = ROUND(P.MREALMM/12,2),  명퇴 작업 MRETRATE 추가  kth 2010.07.06o/
             ADDRATE = 1 ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS P  set RETRATE=ROUND((P.REALMM/12),2),A\
DDRATE=1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )693;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

                     /* 누진제에서 단수제로 전환작업 RETRATE ->  ROUND(REALMM/12,2) kth 2009.03.17*/


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {      
          err_print(sqlca.sqlcode,"2.1 지급율 산정(1) Error");
          sprintf(log_buff, "2.1 지급율 산정(1) Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
     

     /* 임원퇴직금 지급율 계산 프로그램 call  *************************/        
     /* 임원은 계산하지 않으므로 삭제 ...dsa2000   2004.12.28.
     EXEC    SQL DECLARE c7 CURSOR FOR
     SELECT  EMPNO,RETDATE
     FROM    PKMRTMAS ;
     
     EXEC SQL OPEN  c7 ;

     while(1)
     {
             EXEC   SQL FETCH c7
             INTO  :dirempno, :dirretdate ;

             if (sqlca.sqlcode == 1403 )
             {
                     EXEC SQL close c7;
                     break;
             }              
             
             sprintf(sempno, "%.1s", dirempno) ;                
             if (strcmp(sempno, "M") == 0) 
             {
                 memset(cmdline,'\0',256);                     
             sprintf(cmdline,"%s/bin/Kbin/pkq5100g %.8s %s %s %s %s %s",
                           HOMEDIR, dirretdate, dirempno, dirempno, jobempno, log_progid, log_rundate);
                        
             system(cmdline); 
              
             EXEC SQL
             UPDATE PKMRTMAS A
                    SET RETRATE = (SELECT NVL(SUM(NVL(B.CLRETRATE,0)),0) 
                                   FROM PKHRTDIR B       
                                  WHERE A.EMPNO = B.EMPNO
                       AND B.CALCDATE = :dirretdate
                                  GROUP BY B.EMPNO)
                    WHERE EMPNO = :dirempno
                     AND EMPNO IN (SELECT EMPNO 
                                    FROM PKHRTDIR
                                   WHERE CALCDATE = :dirretdate
                      GROUP BY EMPNO) ;

                    if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
                    {
                       err_print(sqlca.sqlcode,"임원 퇴직 지급율 update Error");
                       sprintf(log_buff, "임원 퇴직 지급율 update Error");
                       exit(1);
                    }                  
                 }                
     }  end of while */
/*===========================================================================*/           
     

     /* EXEC SQL
     UPDATE  PKMRTMAS P
        SET  RETRATE = 0
      WHERE  REALDD < 366
        AND  EMPNO NOT IN ( SELECT EMPNO FROM PKHMRHIS); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS P  set RETRATE=0 where (REALDD<366 and \
EMPNO not  in (select EMPNO  from PKHMRHIS ))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )708;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

/*중간정산후 1년 미만 퇴직자*/


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"2.1 지급율 초기화(2) Error");
          sprintf(log_buff, "2.1 지급율 초기화(2) Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL DECLARE c2 CURSOR FOR
     SELECT  EMPNO,RETDATE, DECODE(CALYN,'Y',1,0),
             /oDECODE(LEAST(NVL(PAYCL,'10'),'10'),'10',1,0),o/
             /o infra  DECODE(LEAST(NVL(PAYCL,'0Z'),'0Z'),'0Z',1,0),  2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정. o/
             DECODE(LEAST(NVL(PAYCL,'A99'),'A99'),'A99',1,0),
             DECODE(RETDATE,TO_CHAR(LAST_DAY(TO_DATE(RETDATE,'YYYYMMDD')),'YYYYMMDD'), 1 ,0)
       FROM  PKMRTMAS
      ORDER  BY EMPNO; */ 


      /* EXEC SQL OPEN  c2 ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 37;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = sq0030;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )723;
      sqlstm.selerr = (unsigned short)1;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqcmod = (unsigned int )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}





     while(1)
     {
          /* EXEC  SQL FETCH c2
          INTO  :empno,:retdate,:iscalyn,:gubuncl,:p_lastret ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )738;
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
          sqlstm.sqhstv[1] = (unsigned char  *)retdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&iscalyn;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&gubuncl;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&p_lastret;
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



          if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
          {
                /* EXEC SQL close c2; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 37;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )773;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                err_print(sqlca.sqlcode,"FETCH CURSOR c2 Error\n");
                sprintf(log_buff, "FETCH CURSOR c2 Error\n");
                Write_batlog(seqno++, log_buff); 
                exit(1);
          }
 
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL close c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )788;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               break;
          }

          /* =============================================================================
             Version    date(yy.mm.dd)     programmer      description     relevant doc.no
            30.00       1999.03.05         윤형식        하나로인사재개발  평균임금 계산 로직변경
          ============================================================================= */
          /*               get_pay3sum(empno,retdate,&pay3sum,&termdd);
           *               get_bon12sum(empno,retdate,&bon12sum); */
          if  (set_avgpay(empno, retdate, gubuncl, iscalyn, meg) )
          {
               printf("평균임금 Setting중 에러발생: %s\n",meg);
               sprintf(log_buff, "평균임금 Setting중 에러발생: %s\n");
               Write_batlog(seqno++, log_buff); 
               exit(1);
          }
          
hinsa_log_print(0,"평균임금 추출 시작...");      
         
          if  (get_avgpay(empno,retdate,gubuncl,&pay3sum,&bon12sum,&commonamt,&p_sptmamt,&termdd,meg) )
          {
hinsa_log_print(0,"평균임금 추출중 오류발생...");      
               printf("평균임금 추출중 에러발생: %s\n",meg);
               sprintf(log_buff, "평균임금 추출중  에러발생: %s\n");
               Write_batlog(seqno++, log_buff); 
               exit(1);
          }
hinsa_log_print(0,"평균임금 추출 종료...");      

          /* debug ************************************************* *
          printf("\n in the middle of empno[%s],retdate[%s],pay3sum[%10f.0],termdd[%d],bon12sum[%10f.0]",
                  empno,retdate,pay3sum,termdd,bon12sum);
          * *************************************************  */
          printf("\n in the middle of empno[%s],retdate[%s],pay3sum[%10f.0],termdd[%d],bon12sum[%10f.0]",
                  empno,retdate,pay3sum,termdd,bon12sum);

          /* =============================================================================
             Version    date(yy.mm.dd)     programmer      description     relevant doc.no
            30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
          ============================================================================= */
          /*
          **                EXEC SQL
          **                UPDATE  PKMRTMAS
          **                SET     PAY3SUM  =:pay3sum ,
          **                        BON12SUM =:bon12sum,
          **                        AVGGROSS = round(:pay3sum  / :termdd * 30 , 0) + round(:bon12sum / 12,0),
          **                        COMMONAMT = (NVL(BASICAMT,0)+NVL(INFOAMT,0)+NVL(DUTYAMT,0))
          **                WHERE   EMPNO =:empno;          */
          if  (gubuncl == 0 )
          {
                  /* =================================================================================
                     Version    date(yy.mm.dd)     programmer      description     relevant doc.no
                    31.00       2001.03.13         유효성        임원 연봉제에 따른 평균임금,통상임금 계산방법 변경
                                                                (임원평균임금=(기본연봉+업적연봉+중식비연간총액)/12)                                               
                  ==================================================================================== */
                  /*  EXEC SQL
                  **  UPDATE  PKMRTMAS
                  **  SET     AVGGROSS  = CEIL(:pay3sum * 22.5 / 12)
                  **  WHERE   EMPNO =:empno ;                  */

               /* EXEC SQL
               UPDATE  PKMRTMAS a
               SET     AVGGROSS  = (select ceil((b.totpay + avgmcaramt)/12) 
                                      from pkhyphis b, pkcpbas c
                                     where a.empno = b.empno
                                      and  b.yearpaynum = ( select to_char(yearpaynum) from pkcpbas) ) 
               WHERE   EMPNO =:empno ; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMRTMAS a  set AVGGROSS=(select ceil(\
((b.totpay+avgmcaramt)/12))  from pkhyphis b ,pkcpbas c where (a.empno=b.empn\
o and b.yearpaynum=(select to_char(yearpaynum)  from pkcpbas ))) where EMPNO=\
:b0";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )803;
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



          }
          else
          {
               /* 중도퇴직시 평균임금 = 평균임금 + 특별근무 /3 ***** */
          	   /* 2016.12.22 eyha 평균임금 계산시 중도, 말일 상관없이 말일기준으로 일괄 계산 변경 홍원영 M    
               if  (p_lastret == 1)   말일퇴직 
               {
                    EXEC SQL
                    UPDATE  PKMRTMAS
                       SET  AVGGROSS  = round(  (:pay3sum + :p_sptmamt) /  3 ,0) + round(:bon12sum / 12,0)
                     WHERE  EMPNO =:empno ;                                           
               }
               else                   중도퇴직 
               { 
                    EXEC SQL
                    UPDATE  PKMRTMAS
                       SET  AVGGROSS  = round(:pay3sum / :termdd * 30 + :p_sptmamt /3,0) + round(:bon12sum / 12,0)   
                     WHERE  EMPNO =:empno ;                      
               }  */
               /* EXEC SQL
               UPDATE  PKMRTMAS
                  SET  AVGGROSS  = round((:pay3sum + :p_sptmamt) /  3 ,0) + round(:bon12sum / 12,0)
               WHERE  EMPNO =:empno ; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKMRTMAS  set AVGGROSS=(round(((:b0+:b\
1)/3),0)+round((:b2/12),0)) where EMPNO=:b3";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )822;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&pay3sum;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&p_sptmamt;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&bon12sum;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
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

                                           
               /* printf("[평균임금_debug] : empno=%s,retdate=%s,pay3sum=%f,p_sptmamt= %f,bon12sum= %f  \n",empno,retdate,pay3sum,p_sptmamt,bon12sum);    */
               
          }
          
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {    err_print(sqlca.sqlcode,"3.0 평균임금 setting Error");
               sprintf(log_buff, "3.0 평균임금 setting Error");
               Write_batlog(seqno++, log_buff); 
               exit(1);
          }
          
          pay3sum  = 0;
          bon12sum = 0;
          termdd   = 0;
          
     } /*end of while */

     /* 통상임금 산정 */
     /* EXEC SQL
     UPDATE  PKMRTMAS C
/o        SET  COMMONAMT = (SELECT  CEIL(NVL(TOTPAY,0)/18)     통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 o/
        SET  COMMONAMT = (SELECT  CEIL((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3) /12)  /o 2014.11.10 하은영 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
                            FROM  PKCPBAS A, PKHYPHIS B
                           WHERE  A.YEARPAYNUM = B.YEARPAYNUM
                             AND  C.EMPNO = B.EMPNO          )
      WHERE  PAYCL >='C11'  ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS C  set COMMONAMT=(select CEIL(((((TOTPA\
Y+TONGAMT1)+TONGAMT2)+TONGAMT3)/12))  from PKCPBAS A ,PKHYPHIS B where (A.YEA\
RPAYNUM=B.YEARPAYNUM and C.EMPNO=B.EMPNO)) where PAYCL>='C11'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )853;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

       
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     { 
          err_print(sqlca.sqlcode,"통상임금 setting Error");
          sprintf(log_buff, "통상임금 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* 퇴직금 산정 */
     /* EXEC SQL   
     UPDATE  PKMRTMAS
        SET  RETAMT = CEIL(GREATEST(nvl(AVGGROSS,0),nvl(COMMONAMT,0)) * RETRATE)   ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set RETAMT=CEIL((GREATEST(nvl(AVGGROSS\
,0),nvl(COMMONAMT,0))* RETRATE))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )868;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {      
          err_print(sqlca.sqlcode,"3.1 퇴직금 setting Error");
          sprintf(log_buff, "3.1 퇴직금 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* 2013.02.05 hjku 명예퇴직이 없을 경우 초기화
        재계산시 초기화되지 않아 지급명세서 작성시 오류남
      */
     /* EXEC SQL 
     UPDATE  PKMRTMAS
        SET  LIMITDAY      = '',
             REMMON        = 0,
             HORRETAMT     = 0,
             MMRINDED      = '',
             MRINDED       = '',
             MTAXSTAMT     = '',
             MAVGTAXSTAMT  = '',
             MRETCALCTAX   = '',
             MRETAVGTAX    = ''
      WHERE  NVL(HORRETYN,'N')='N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set LIMITDAY='',REMMON=0,HORRETAMT=0,M\
MRINDED='',MRINDED='',MTAXSTAMT='',MAVGTAXSTAMT='',MRETCALCTAX='',MRETAVGTAX=\
'' where NVL(HORRETYN,'N')='N'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )883;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    
          err_print(sqlca.sqlcode,"명예퇴직 초기화 setting Error(1)");
          sprintf(log_buff, "명예퇴직 초기화 setting Error(1)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }


     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  LIMITDAY = DECODE(SUBSTR(JUMINID,8,1),'0','19','1','19','20')||SUBSTR(JUMINID,1,6)
      WHERE  NVL(HORRETYN,'N')='Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set LIMITDAY=(DECODE(SUBSTR(JUMINID,8,\
1),'0','19','1','19','20')||SUBSTR(JUMINID,1,6)) where NVL(HORRETYN,'N')='Y'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )898;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    
          err_print(sqlca.sqlcode,"4.1 정년말일 setting Error(1)");
          sprintf(log_buff, "4.1 정년말일 setting Error(1)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  LIMITDAY = TO_CHAR(ADD_MONTHS(TO_DATE(LIMITDAY,'YYYYMMDD'),696),'YYYYMMDD')
     //infra         WHERE   HORRETYN='Y' AND PAYCL>'19';
      WHERE  nvl(HORRETYN,'N')='Y' AND PAYCL>'C19'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set LIMITDAY=TO_CHAR(ADD_MONTHS(TO_DAT\
E(LIMITDAY,'YYYYMMDD'),696),'YYYYMMDD') where (nvl(HORRETYN,'N')='Y' and PAYC\
L>'C19')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )913;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

 
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"4.1 정년말일 나이가 58세 setting Error(2)");
          sprintf(log_buff, "4.1 정년말일 나이가 58세 setting Error(2)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  LIMITDAY = TO_CHAR(ADD_MONTHS(TO_DATE(LIMITDAY,'YYYYMMDD'),720),'YYYYMMDD')
     //infra       WHERE   horretyn='Y' and paycl between '0Z' and '19';   /o2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정.  o/
      WHERE  nvl(horretyn,'N')='Y' and paycl = 'C11'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set LIMITDAY=TO_CHAR(ADD_MONTHS(TO_DAT\
E(LIMITDAY,'YYYYMMDD'),720),'YYYYMMDD') where (nvl(horretyn,'N')='Y' and payc\
l='C11')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )928;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   /*2004.06.18 강륜종(dsa2000) 직급코드값 변동에 따른 수정.  */   
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"4.1 정년말일 나이가 60세 setting Error(2)");
          sprintf(log_buff, "4.1 정년말일 나이가 58세 setting Error(2)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  LIMITDAY = CONCAT(SUBSTR(LIMITDAY,1,4),'0630')
      WHERE  SUBSTR(LIMITDAY,5,4) BETWEEN '0101' AND '0630'
        AND nvl(HORRETYN,'N')='Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set LIMITDAY=CONCAT(SUBSTR(LIMITDAY,1,\
4),'0630') where (SUBSTR(LIMITDAY,5,4) between '0101' and '0630' and nvl(HORR\
ETYN,'N')='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )943;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"4.1 정년말일 상반기 setting Error(3)");
          sprintf(log_buff, "4.1 정년말일 상반기 setting Error(3)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  LIMITDAY = CONCAT(SUBSTR(LIMITDAY,1,4),'1231')
      WHERE  SUBSTR(LIMITDAY,5,4) BETWEEN '0701' AND '1231'
        AND  nvl(HORRETYN,'N')='Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set LIMITDAY=CONCAT(SUBSTR(LIMITDAY,1,\
4),'1231') where (SUBSTR(LIMITDAY,5,4) between '0701' and '1231' and nvl(HORR\
ETYN,'N')='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )958;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    
          err_print(sqlca.sqlcode,"4.1 정년말일 하반기 setting Error(4)");
          sprintf(log_buff, "4.1 정년말일 하반기 setting Error(4)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  REMMON = CEIL(MONTHS_BETWEEN(TO_DATE(LIMITDAY,'YYYYMMDD'),
                                          TO_DATE(RETDATE,'YYYYMMDD')))
      WHERE  nvl(horretyn,'N')='Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set REMMON=CEIL(MONTHS_BETWEEN(TO_DATE\
(LIMITDAY,'YYYYMMDD'),TO_DATE(RETDATE,'YYYYMMDD'))) where nvl(horretyn,'N')='\
Y'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )973;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    
          err_print(sqlca.sqlcode,"4.1 정년말일  정년제한일과 퇴직일까지 기간월 setting Error(5)");
          sprintf(log_buff, "4.1 정년말일  정년제한일과 퇴직일까지 기간월 setting Error(5)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  REMMON = 0 
      WHERE  REMMON < 0 AND nvl(HORRETYN,'N')='Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set REMMON=0 where (REMMON<0 and nvl(H\
ORRETYN,'N')='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )988;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


      

     /*  Test 명퇴
     EXEC SQL
     UPDATE PKMRTMAS M
        SET HORRETAMT = (SELECT HORRETAMT from PKHOPERET T WHERE M.EMPNO =T.EMPNO)
      WHERE nvl(HORRETYN,'N') ='Y';*/


     /* EXEC SQL
     UPDATE PKMRTMAS M
        SET HORRETAMT = 204802000
      WHERE empno ='1110'
        and retdate ='20130228'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS M  set HORRETAMT=204802000 where (empno\
='1110' and retdate='20130228')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1003;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

      

     /* 제한 기간이 1년이상 5년 이하 동안 기본급을 50% 더 
     EXEC    SQL
     UPDATE  PKMRTMAS
        SET  HORRETAMT = CEIL(REMMON * 0.5 * BASICAMT)  
      WHERE  HORRETYN='Y' AND REMMON BETWEEN 12 AND 60;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"정년말일 setting Error(6)");
          sprintf(log_buff, "정년말일 setting Error(6)");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
               
      제한 기간이 5년 이상 동안 기본급을  더 
     EXEC    SQL
     UPDATE  PKMRTMAS
        SET  HORRETAMT = CEIL(60 * 0.5 * BASICAMT + 
                        (REMMON - 60) * 0.25 * BASICAMT)
      WHERE  HORRETYN='Y' AND REMMON BETWEEN 61 AND 120;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"정년말일 setting Error(7)");
          sprintf(log_buff, "정년말일 setting Error(7)");
          Write_batlog(seqno++, log_buff);
          exit(1);
     }
      2010.07.06 KTH 명퇴 작업시 주석*/
      

     /* EXEC SQL
     UPDATE  PKMRTMAS
        SET  horretamt = nvl(horretamt,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 37;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set horretamt=nvl(horretamt,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1018;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     
/*2013.02.07 hjku 2013년 과세표준 적용 시작 */
     /* EXEC   SQL DECLARE c3 CURSOR FOR
        SELECT EMPNO,RETDATE,REALYY_CALC,REALYY_2012,REALYY_2013,BRETINTAX,TNEXTYEARAMT, RETAMTSUM,FIXDED,
               LEAST(GREATEST((RETAMTSUM-FIXDED),0),CONDED) CONDED,
               RINDED,
               GREATEST((RETAMTSUM -RINDED),0) TAXSTAMT,
               NRETAMTSUM,         /o 2016.10.19 eyha add o/
               CONDED CONDED_2016  /o 2017.03.07 eyha add o/
         FROM (SELECT A.*,
                      RETUTIL.GET_FIXDED(RETAMTSUM) FIXDED,
                      RETUTIL.GET_CONDED(REALYY_CALC) CONDED,
                      RETUTIL.GET_RINDED(RETAMTSUM,REALYY_CALC) RINDED
                 FROM (SELECT EMPNO, RETDATE, NVL(REALYY_CALC,0) REALYY_CALC, NVL(REALYY_2012,0) REALYY_2012, NVL(REALYY_2013,0) REALYY_2013, 
                              NVL(BRETINTAX,0) BRETINTAX, NVL(TNEXTYEARAMT,0) TNEXTYEARAMT, 
                              NVL(RETAMT,0) +  NVL(BRETAMT,0) + NVL(HORRETAMT,0) RETAMTSUM,
                              NVL(RETAMT,0) + NVL(HORRETAMT,0) NRETAMTSUM 
                         FROM PKMRTMAS
                       )A
               ); */ 

            
      /* EXEC SQL OPEN  c3 ; */ 

{
      struct sqlexd sqlstm;
      sqlstm.sqlvsn = 12;
      sqlstm.arrsiz = 37;
      sqlstm.sqladtp = &sqladt;
      sqlstm.sqltdsp = &sqltds;
      sqlstm.stmt = sq0045;
      sqlstm.iters = (unsigned int  )1;
      sqlstm.offset = (unsigned int  )1033;
      sqlstm.selerr = (unsigned short)1;
      sqlstm.cud = sqlcud0;
      sqlstm.sqlest = (unsigned char  *)&sqlca;
      sqlstm.sqlety = (unsigned short)4352;
      sqlstm.occurs = (unsigned int  )0;
      sqlstm.sqcmod = (unsigned int )0;
      sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



     while(1)
     {
          /* EXEC  SQL FETCH c3
          INTO  :empno,:retdate,:realyy_calc,:realyy_2012,:realyy_2013,:bretintax,:tnextyearamt, :retamtsum,:fixded,:conded,:rinded,:taxstamt, :nretamtsum, :conded_2016; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 37;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1048;
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
          sqlstm.sqhstv[1] = (unsigned char  *)retdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&realyy_calc;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&realyy_2012;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&realyy_2013;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&bretintax;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&tnextyearamt;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&retamtsum;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&fixded;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&conded;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&rinded;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&taxstamt;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&nretamtsum;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&conded_2016;
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



          if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
          {
                /* EXEC SQL close c3; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 37;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )1119;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                err_print(sqlca.sqlcode,"FETCH CURSOR c2 Error\n");
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
               sqlstm.arrsiz = 37;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1134;
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
          
          calcintax = calcjutax = 0;   /*신고대상 세액*/
          retintax  = retjutax  = 0;   /*퇴직정산 세액*/
          nintax    = njutax    = 0;   /*과세이연 세액*/

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


          /* 2015.12.15 eyha 2016년 퇴직세법 적용  */
          change_pay_2016 = change_payded_2016 = taxstamt_2016 = rettaxrate_2016 = retavgtax_2016 = retcalctax_2016 = retintax_2016 = retintax_calc = 0;               
          if ((retamtsum >0) && (strcmp(retdate,"20160101") >= 0))   
          {          	
          	  /* 환산급여(change_pay_2016), 환산급여공제(change_payded_2016)  */
              /* EXEC  SQL
              SELECT  a.CHANGE_PAY_2016,
                      RETUTIL.GET_CHANGE_PAYDED(substr(:retdate,1,4), CHANGE_PAY_2016) change_payded_2016
              INTO    :change_pay_2016, :change_payded_2016
              FROM   (SELECT  RETUTIL.GET_CHANGE_PAY(substr(:retdate,1,4), :retamtsum - :conded_2016, :realyy_calc ) CHANGE_PAY_2016   /o 2017.03.07 eyha 변경 o/
                      FROM    DUAL
                      ) a; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 37;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select a.CHANGE_PAY_2016 ,RETUTIL.GET_CHANGE_P\
AYDED(substr(:b0,1,4),CHANGE_PAY_2016) change_payded_2016 into :b1,:b2  from \
(select RETUTIL.GET_CHANGE_PAY(substr(:b0,1,4),(:b4-:b5),:b6) CHANGE_PAY_2016\
  from DUAL ) a ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1149;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)retdate;
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
              sqlstm.sqhstv[3] = (unsigned char  *)retdate;
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
              sqlstm.sqhstv[5] = (unsigned char  *)&conded_2016;
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
                     RETUTIL.GET_RETCALCTAX(substr(:retdate,1,4), RETAVGTAX_2016, :realyy_calc)  RETAVGTAX_2016
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
              sqlstm.arrsiz = 37;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select a.* ,RETUTIL.GET_RETCALCTAX(substr(:b0,\
1,4),RETAVGTAX_2016,:b1) RETAVGTAX_2016 into :b2,:b3,:b4  from (select RETUTI\
L.GET_RETTAXRATE(:b5) RETTAXRATE_2016 ,RETUTIL.GET_RETAVGTAX(:b5) RETAVGTAX_2\
016  from DUAL ) a ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1192;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)retdate;
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
              SELECT RETUTIL.GET_RETINTAX(substr(:retdate,1,4), :retcalctax, :retcalctax_2016)  RETINTAX_CALC                 
              INTO :retintax_calc
              FROM DUAL; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 37;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "select RETUTIL.GET_RETINTAX(substr(:b0,1,4),:b\
1,:b2) RETINTAX_CALC into :b3  from DUAL ";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1235;
              sqlstm.selerr = (unsigned short)0;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)retdate;
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

   
              
              
              /*  printf("[debug 3 ] : empno=%s,change_pay_2016=%f,retintax_calc=%f  \n",empno,change_pay_2016,retintax_calc);  */
              
              
                              
          }

            

    
          /* 2015.12.15 eyha 2016년 세법적용 */
          if (strcmp(retdate,"20160101") >= 0)
            calcintax         = retintax_calc - bretintax;   
          else             
            calcintax         = retcalctax - bretintax;   
            
          
          calcjutax         = trunc(calcintax/10);

          retintax          = trunc(calcintax/10)  * 10;
          retjutax          = trunc(calcintax/100) * 10;
                    
          /* 2016.10.19 eyha 퇴직금합계 -> 퇴직금 최종분만(중간정산지급분 제외) 으로 변경 */          
          /* 2016.10.19 eyha 소수점 무조건 반올림으로 처리요청(홍M)                       */
          /*if(tnextyearamt>0) nintax = round(retintax * tnextyearamt / retamtsum);       */
          if(tnextyearamt>0) { 
          	nintax = round(retintax * tnextyearamt / nretamtsum); 
          	njutax = trunc(nintax/10); 
          }	
          	
          /* printf("[debug 3 ] : empno=%s,nintax=%f,njutax=%f  \n",empno,nintax,njutax);  */
          	
          
          /* EXEC SQL 
               UPDATE  PKMRTMAS
                  SET  /oRETAMTSUM           = NVL(RETAMT,0) +  NVL(BRETAMT,0), 추후 확인 필요o/
                       RETAMTSUM           = :retamtsum,
                       FIXDED              = :fixded,
                       CONDED              = :conded,
                       CONDED_2016         = :conded_2016,
                       RINDED              = :rinded,
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
                       /oRETINTAX            = :retintax,
                       RETJUTAX            = floor(:retintax/10),o/
                       CALCINTAX           = :calcintax,
                       CALCJUTAX           = :calcjutax,                       
                       RETINTAX            = :retintax,
                       RETJUTAX            = :retjutax,                       	
                       RETINTAX_2012       = :retintax_2012,                        
                       RETINTAX_2013       = :retintax_2013,
                       NINTAX              = :nintax,
                       /o 2016.10.19 eyha 홍원영M 국세청 엑셀과 동일하게 요구	, 소수점 반올림
                       NJUTAX              = trunc((:nintax/10),-1), 
                       YINTAX              = trunc((:retintax - nvl(:nintax,0)), -1),
                       YJUTAX              = trunc((:retintax - nvl(:nintax,0))/10, -1),  o/
                       NJUTAX              = :njutax,
                       YINTAX              = trunc((:calcintax - nvl(:nintax,0)), -1),
                       YJUTAX              = trunc((:calcjutax - nvl(:njutax,0)), -1),
                       CHANGE_PAY_2016     = :change_pay_2016    ,  /o2015.12.15 eyha addo/
                       CHANGE_PAYDED_2016  = :change_payded_2016 ,
                       TAXSTAMT_2016       = :taxstamt_2016      ,
                       RETTAXRATE_2016     = :rettaxrate_2016    ,
                       RETAVGTAX_2016      = :retavgtax_2016     ,
                       RETCALCTAX_2016     = :retcalctax_2016    ,
                       RETINTAX_2016       = :retintax_2016      ,
                       RETTAXYY            = substr(:retdate,1,4),  	
                       RETINTAX_CALC       = :retintax_calc                          	                         
                WHERE  EMPNO = :empno; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 47;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKMRTMAS  set RETAMTSUM=:b0,FIXDED=:b1,COND\
ED=:b2,CONDED_2016=:b3,RINDED=:b4,TAXSTAMT=:b5,TAXSTAMT_2012=:b6,AVGTAXSTAMT_\
2012=:b7,RETAVGTAXSTAMT_2012=:b8,RETTAXRATE_2012=:b9,RETAVGTAX_2012=:b10,RETA\
VGCALCTAX_2012=:b11,RETCALCTAX_2012=:b12,TAXSTAMT_2013=:b13,AVGTAXSTAMT_2013=\
:b14,RETAVGTAXSTAMT_2013=:b15,RETTAXRATE_2013=:b16,RETAVGTAX_2013=:b17,RETAVG\
CALCTAX_2013=:b18,RETCALCTAX_2013=:b19,AVGTAXSTAMT=:b20,RETAVGTAXSTAMT=:b21,R\
ETAVGTAX=:b22,RETAVGCALCTAX=:b23,RETCALCTAX=:b24,CALCINTAX=:b25,CALCJUTAX=:b2\
6,RETINTAX=:b27,RETJUTAX=:b28,RETINTAX_2012=:b29,RETINTAX_2013=:b30,NINTAX=:b\
31,NJUTAX=:b32,YINTAX=trunc((:b25-nvl(:b31,0)),(-1)),YJUTAX=trunc((:b26-nvl(:\
b32,0)),(-1)),CHANGE_PAY_2016=:b37,CHANGE_PAYDED_2016=:b38,TAXSTAMT_2016=:b39\
,RETTAXRATE_2016=:b40,RETAVGTAX_2016=:b41,RETCALCTAX_2016=:b42,RETINTAX_2016=\
:b43,RETTAXYY=substr(:b44,1,4),RETINTAX_CALC=:b45 where EMPNO=:b46";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1266;
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
          sqlstm.sqhstv[3] = (unsigned char  *)&conded_2016;
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
          sqlstm.sqhstv[5] = (unsigned char  *)&taxstamt;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&taxstamt_2012;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&avgtaxstamt_2012;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&retavgtaxstamt_2012;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&rettaxrate_2012;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&retavgtax_2012;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&retavgcalctax_2012;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&retcalctax_2012;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&taxstamt_2013;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&avgtaxstamt_2013;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
          sqlstm.sqhstv[15] = (unsigned char  *)&retavgtaxstamt_2013;
          sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[15] = (         int  )0;
          sqlstm.sqindv[15] = (         short *)0;
          sqlstm.sqinds[15] = (         int  )0;
          sqlstm.sqharm[15] = (unsigned long )0;
          sqlstm.sqadto[15] = (unsigned short )0;
          sqlstm.sqtdso[15] = (unsigned short )0;
          sqlstm.sqhstv[16] = (unsigned char  *)&rettaxrate_2013;
          sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[16] = (         int  )0;
          sqlstm.sqindv[16] = (         short *)0;
          sqlstm.sqinds[16] = (         int  )0;
          sqlstm.sqharm[16] = (unsigned long )0;
          sqlstm.sqadto[16] = (unsigned short )0;
          sqlstm.sqtdso[16] = (unsigned short )0;
          sqlstm.sqhstv[17] = (unsigned char  *)&retavgtax_2013;
          sqlstm.sqhstl[17] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[17] = (         int  )0;
          sqlstm.sqindv[17] = (         short *)0;
          sqlstm.sqinds[17] = (         int  )0;
          sqlstm.sqharm[17] = (unsigned long )0;
          sqlstm.sqadto[17] = (unsigned short )0;
          sqlstm.sqtdso[17] = (unsigned short )0;
          sqlstm.sqhstv[18] = (unsigned char  *)&retavgcalctax_2013;
          sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[18] = (         int  )0;
          sqlstm.sqindv[18] = (         short *)0;
          sqlstm.sqinds[18] = (         int  )0;
          sqlstm.sqharm[18] = (unsigned long )0;
          sqlstm.sqadto[18] = (unsigned short )0;
          sqlstm.sqtdso[18] = (unsigned short )0;
          sqlstm.sqhstv[19] = (unsigned char  *)&retcalctax_2013;
          sqlstm.sqhstl[19] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[19] = (         int  )0;
          sqlstm.sqindv[19] = (         short *)0;
          sqlstm.sqinds[19] = (         int  )0;
          sqlstm.sqharm[19] = (unsigned long )0;
          sqlstm.sqadto[19] = (unsigned short )0;
          sqlstm.sqtdso[19] = (unsigned short )0;
          sqlstm.sqhstv[20] = (unsigned char  *)&avgtaxstamt;
          sqlstm.sqhstl[20] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[20] = (         int  )0;
          sqlstm.sqindv[20] = (         short *)0;
          sqlstm.sqinds[20] = (         int  )0;
          sqlstm.sqharm[20] = (unsigned long )0;
          sqlstm.sqadto[20] = (unsigned short )0;
          sqlstm.sqtdso[20] = (unsigned short )0;
          sqlstm.sqhstv[21] = (unsigned char  *)&retavgtaxstamt;
          sqlstm.sqhstl[21] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[21] = (         int  )0;
          sqlstm.sqindv[21] = (         short *)0;
          sqlstm.sqinds[21] = (         int  )0;
          sqlstm.sqharm[21] = (unsigned long )0;
          sqlstm.sqadto[21] = (unsigned short )0;
          sqlstm.sqtdso[21] = (unsigned short )0;
          sqlstm.sqhstv[22] = (unsigned char  *)&retavgtax;
          sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[22] = (         int  )0;
          sqlstm.sqindv[22] = (         short *)0;
          sqlstm.sqinds[22] = (         int  )0;
          sqlstm.sqharm[22] = (unsigned long )0;
          sqlstm.sqadto[22] = (unsigned short )0;
          sqlstm.sqtdso[22] = (unsigned short )0;
          sqlstm.sqhstv[23] = (unsigned char  *)&retavgcalctax;
          sqlstm.sqhstl[23] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[23] = (         int  )0;
          sqlstm.sqindv[23] = (         short *)0;
          sqlstm.sqinds[23] = (         int  )0;
          sqlstm.sqharm[23] = (unsigned long )0;
          sqlstm.sqadto[23] = (unsigned short )0;
          sqlstm.sqtdso[23] = (unsigned short )0;
          sqlstm.sqhstv[24] = (unsigned char  *)&retcalctax;
          sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[24] = (         int  )0;
          sqlstm.sqindv[24] = (         short *)0;
          sqlstm.sqinds[24] = (         int  )0;
          sqlstm.sqharm[24] = (unsigned long )0;
          sqlstm.sqadto[24] = (unsigned short )0;
          sqlstm.sqtdso[24] = (unsigned short )0;
          sqlstm.sqhstv[25] = (unsigned char  *)&calcintax;
          sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[25] = (         int  )0;
          sqlstm.sqindv[25] = (         short *)0;
          sqlstm.sqinds[25] = (         int  )0;
          sqlstm.sqharm[25] = (unsigned long )0;
          sqlstm.sqadto[25] = (unsigned short )0;
          sqlstm.sqtdso[25] = (unsigned short )0;
          sqlstm.sqhstv[26] = (unsigned char  *)&calcjutax;
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
          sqlstm.sqhstv[31] = (unsigned char  *)&nintax;
          sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[31] = (         int  )0;
          sqlstm.sqindv[31] = (         short *)0;
          sqlstm.sqinds[31] = (         int  )0;
          sqlstm.sqharm[31] = (unsigned long )0;
          sqlstm.sqadto[31] = (unsigned short )0;
          sqlstm.sqtdso[31] = (unsigned short )0;
          sqlstm.sqhstv[32] = (unsigned char  *)&njutax;
          sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[32] = (         int  )0;
          sqlstm.sqindv[32] = (         short *)0;
          sqlstm.sqinds[32] = (         int  )0;
          sqlstm.sqharm[32] = (unsigned long )0;
          sqlstm.sqadto[32] = (unsigned short )0;
          sqlstm.sqtdso[32] = (unsigned short )0;
          sqlstm.sqhstv[33] = (unsigned char  *)&calcintax;
          sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[33] = (         int  )0;
          sqlstm.sqindv[33] = (         short *)0;
          sqlstm.sqinds[33] = (         int  )0;
          sqlstm.sqharm[33] = (unsigned long )0;
          sqlstm.sqadto[33] = (unsigned short )0;
          sqlstm.sqtdso[33] = (unsigned short )0;
          sqlstm.sqhstv[34] = (unsigned char  *)&nintax;
          sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[34] = (         int  )0;
          sqlstm.sqindv[34] = (         short *)0;
          sqlstm.sqinds[34] = (         int  )0;
          sqlstm.sqharm[34] = (unsigned long )0;
          sqlstm.sqadto[34] = (unsigned short )0;
          sqlstm.sqtdso[34] = (unsigned short )0;
          sqlstm.sqhstv[35] = (unsigned char  *)&calcjutax;
          sqlstm.sqhstl[35] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[35] = (         int  )0;
          sqlstm.sqindv[35] = (         short *)0;
          sqlstm.sqinds[35] = (         int  )0;
          sqlstm.sqharm[35] = (unsigned long )0;
          sqlstm.sqadto[35] = (unsigned short )0;
          sqlstm.sqtdso[35] = (unsigned short )0;
          sqlstm.sqhstv[36] = (unsigned char  *)&njutax;
          sqlstm.sqhstl[36] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[36] = (         int  )0;
          sqlstm.sqindv[36] = (         short *)0;
          sqlstm.sqinds[36] = (         int  )0;
          sqlstm.sqharm[36] = (unsigned long )0;
          sqlstm.sqadto[36] = (unsigned short )0;
          sqlstm.sqtdso[36] = (unsigned short )0;
          sqlstm.sqhstv[37] = (unsigned char  *)&change_pay_2016;
          sqlstm.sqhstl[37] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[37] = (         int  )0;
          sqlstm.sqindv[37] = (         short *)0;
          sqlstm.sqinds[37] = (         int  )0;
          sqlstm.sqharm[37] = (unsigned long )0;
          sqlstm.sqadto[37] = (unsigned short )0;
          sqlstm.sqtdso[37] = (unsigned short )0;
          sqlstm.sqhstv[38] = (unsigned char  *)&change_payded_2016;
          sqlstm.sqhstl[38] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[38] = (         int  )0;
          sqlstm.sqindv[38] = (         short *)0;
          sqlstm.sqinds[38] = (         int  )0;
          sqlstm.sqharm[38] = (unsigned long )0;
          sqlstm.sqadto[38] = (unsigned short )0;
          sqlstm.sqtdso[38] = (unsigned short )0;
          sqlstm.sqhstv[39] = (unsigned char  *)&taxstamt_2016;
          sqlstm.sqhstl[39] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[39] = (         int  )0;
          sqlstm.sqindv[39] = (         short *)0;
          sqlstm.sqinds[39] = (         int  )0;
          sqlstm.sqharm[39] = (unsigned long )0;
          sqlstm.sqadto[39] = (unsigned short )0;
          sqlstm.sqtdso[39] = (unsigned short )0;
          sqlstm.sqhstv[40] = (unsigned char  *)&rettaxrate_2016;
          sqlstm.sqhstl[40] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[40] = (         int  )0;
          sqlstm.sqindv[40] = (         short *)0;
          sqlstm.sqinds[40] = (         int  )0;
          sqlstm.sqharm[40] = (unsigned long )0;
          sqlstm.sqadto[40] = (unsigned short )0;
          sqlstm.sqtdso[40] = (unsigned short )0;
          sqlstm.sqhstv[41] = (unsigned char  *)&retavgtax_2016;
          sqlstm.sqhstl[41] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[41] = (         int  )0;
          sqlstm.sqindv[41] = (         short *)0;
          sqlstm.sqinds[41] = (         int  )0;
          sqlstm.sqharm[41] = (unsigned long )0;
          sqlstm.sqadto[41] = (unsigned short )0;
          sqlstm.sqtdso[41] = (unsigned short )0;
          sqlstm.sqhstv[42] = (unsigned char  *)&retcalctax_2016;
          sqlstm.sqhstl[42] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[42] = (         int  )0;
          sqlstm.sqindv[42] = (         short *)0;
          sqlstm.sqinds[42] = (         int  )0;
          sqlstm.sqharm[42] = (unsigned long )0;
          sqlstm.sqadto[42] = (unsigned short )0;
          sqlstm.sqtdso[42] = (unsigned short )0;
          sqlstm.sqhstv[43] = (unsigned char  *)&retintax_2016;
          sqlstm.sqhstl[43] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[43] = (         int  )0;
          sqlstm.sqindv[43] = (         short *)0;
          sqlstm.sqinds[43] = (         int  )0;
          sqlstm.sqharm[43] = (unsigned long )0;
          sqlstm.sqadto[43] = (unsigned short )0;
          sqlstm.sqtdso[43] = (unsigned short )0;
          sqlstm.sqhstv[44] = (unsigned char  *)retdate;
          sqlstm.sqhstl[44] = (unsigned long )9;
          sqlstm.sqhsts[44] = (         int  )0;
          sqlstm.sqindv[44] = (         short *)0;
          sqlstm.sqinds[44] = (         int  )0;
          sqlstm.sqharm[44] = (unsigned long )0;
          sqlstm.sqadto[44] = (unsigned short )0;
          sqlstm.sqtdso[44] = (unsigned short )0;
          sqlstm.sqhstv[45] = (unsigned char  *)&retintax_calc;
          sqlstm.sqhstl[45] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[45] = (         int  )0;
          sqlstm.sqindv[45] = (         short *)0;
          sqlstm.sqinds[45] = (         int  )0;
          sqlstm.sqharm[45] = (unsigned long )0;
          sqlstm.sqadto[45] = (unsigned short )0;
          sqlstm.sqtdso[45] = (unsigned short )0;
          sqlstm.sqhstv[46] = (unsigned char  *)empno;
          sqlstm.sqhstl[46] = (unsigned long )5;
          sqlstm.sqhsts[46] = (         int  )0;
          sqlstm.sqindv[46] = (         short *)0;
          sqlstm.sqinds[46] = (         int  )0;
          sqlstm.sqharm[46] = (unsigned long )0;
          sqlstm.sqadto[46] = (unsigned short )0;
          sqlstm.sqtdso[46] = (unsigned short )0;
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
                    err_print(sqlca.sqlcode,"산출세액 반영 setting Error(1)");
                    sprintf(log_buff, "산출세액 반영 setting Error(1)");
                    Write_batlog(seqno++, log_buff); 
                    exit(1);
               }
          
     }

/*2013.02.07 hjku 2013년 과세표준 적용 종료 */ 
           
     /*KTH    2010.07.06  명퇴 산출세액  로직추가 시작  */        
     
     
     /* 2009년 산출세액의 30% (근속년수 *24만원 한도) 추가로 세액공제 제도 2009년 일시 적용 
     EXEC    SQL
     UPDATE  PKMRTMAS
        set     rettaxded = floor(retcalctax * 0.30)    산출세액의 30% 
      WHERE  SUBSTR(RETDATE,1,4) = '2009'
        AND (retcalctax * 0.30) <  realyy * 240000  ;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     { 
          err_print(sqlca.sqlcode,"16.1 산출세액 setting Error");
          sprintf(log_buff, "16.1 산출세액  setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }         

     EXEC    SQL
     UPDATE  PKMRTMAS
        set  rettaxded =  realyy * 240000               산출세액 한도 년수 * 240,000만원 
      WHERE  SUBSTR(RETDATE,1,4) = '2009'
        AND  (retcalctax * 0.30) >=   realyy * 240000 ;
        
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     { 
          err_print(sqlca.sqlcode,"16.2 산출세액 setting Error");
          sprintf(log_buff, "16.2 산출세액  setting Error");
          Write_batlog(seqno++, log_buff); dsa2000 Rexec 대체
          exit(1);
     }                       */
     /* 2009년 산출세액의 30% (근속년수 *24만원 한도) 추가로 세액공제 제도 끝 */       
  
     /*dsa2000 2005.01. 2005년도 퇴직소득세액공제 폐지
     EXEC    SQL
     UPDATE  PKMRTMAS
     SET     rettaxded = floor(retcalctax * 0.25);    parksh 수정 공제금액변경 0.5 -> 2003~2004년 까지 0.25 

     EXEC    SQL
     UPDATE  PKMRTMAS
     SET     rettaxded = 120000 * realyy              parksh 수정 공제한도액변경 240000 -> 2003~2004년 까지 공제한도액 120000) 
     WHERE   rettaxded > 120000 * realyy;  */
  
     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  realretintax = nvl(retintax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set realretintax=nvl(retintax,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1469;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        /*SET  realretintax = nvl(retintax,0) - nvl(bretintax,0);*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    
          err_print(sqlca.sqlcode,"17.2 실퇴직소득세 setting Error");
          sprintf(log_buff, "17.2 실퇴직소득세 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

/*
     EXEC    SQL
     UPDATE  PKMRTMAS
        SET  retjutax = floor(retintax / 100) * 10 ;
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    
          err_print(sqlca.sqlcode,"18. 퇴직주민세 setting Error");
          sprintf(log_buff, "18. 퇴직주민세 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
*/
     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  realretjutax = nvl(retjutax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set realretjutax=nvl(retjutax,0)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1484;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        /*SET  realretjutax = nvl(retjutax,0) - nvl(bretjutax,0);*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"18.2 실퇴직주민세 setting Error");
          sprintf(log_buff, "18.2 실퇴직주민세 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

     /* EXEC    SQL
     UPDATE  PKMRTMAS
        SET  retrealamt = retamtsum - retintax - retjutax - nvl(bretintax,0) - nvl(bretjutax,0); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set retrealamt=((((retamtsum-retintax)\
-retjutax)-nvl(bretintax,0))-nvl(bretjutax,0))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1499;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {    err_print(sqlca.sqlcode,"19. 실지급 퇴직금 setting Error");
          sprintf(log_buff, "19. 실지급 퇴직금 setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }

  /* 중간정산반영후 실퇴직금 */
     /* EXEC    SQL
     UPDATE  PKMRTMAS
        set  retreal = retamt + horretamt - realretintax - realretjutax,
             writetime = to_char(sysdate, 'yyyymmddhh24miss') ,
             writeman  = :jobempno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKMRTMAS  set retreal=(((retamt+horretamt)-realr\
etintax)-realretjutax),writetime=to_char(sysdate,'yyyymmddhh24miss'),writeman\
=:b0";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1514;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)jobempno;
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
     {    err_print(sqlca.sqlcode,"20. 실지급 퇴직금 진짜setting Error");  
          sprintf(log_buff, "20. 실지급 퇴직금 진짜setting Error");
          Write_batlog(seqno++, log_buff); 
          exit(1);
     }
}



/* TABLE PKHRTAVG <empno+retdate+paydate> 에 평균임금 기초테이타를 입력한다.
 *   (사번,퇴직일,직급구분)
 * 임원이면(<'08'): PKHRTAVG 자료입력 안함.
 * 말일퇴직이면   : 퇴직일기준     -2, -1, 0 전월
 * 중도퇴직이면   : 퇴직일기준 -3, -2, -1, 0 전월
 */
int set_avgpay(char *m_empno, char *m_retdate, int m_gubuncl, int m_iscalyn, char *meg)
{
     int islastret = 0; /* 만근여부 (만근:-2, 만근아님:-3) */
     int totdd     = 0; /* 월말일 일수                     */
     int dudd      = 0; /* 월 일할일수                     */
     int icnt      = 0; /* 임시 변수                       */
     
     /* 기존자료 in PKHRTAVG <empno+retdate+paydate> 삭제 */
     /* EXEC SQL
     DELETE FROM PKHRTAVG
      WHERE EMPNO = :m_empno
        AND RETDATE = :m_retdate; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHRTAVG  where (EMPNO=:b0 and RETDATE=:b1\
)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1533;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)m_empno;
     sqlstm.sqhstl[0] = (unsigned long )0;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[1] = (unsigned long )0;
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


     
     if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
         sprintf(meg,"\n set_avgpay() PKHRTAVG DELETE [%d]\n",sqlca.sqlcode);
         return 1;
     }
     
     if (m_gubuncl == 0) /* 임원이면 계산 생략 */
         return 0;
     
     /* 월말일일수, 월일할일수 추출 */
     if ( get_dd(m_empno,m_retdate, 0, &totdd, &dudd, meg) )
         return 1;
     
     if (totdd == dudd) islastret = LASTRET_Y; /* 말일퇴직 LASTRET_Y := -2 */
     else               islastret = LASTRET_N; /* 중도퇴직 LASTRET_N := -3 */
     
     /*
      * 말일퇴직이면 : 퇴직일기준     -2, -1, 0 전월
      * 중도퇴직이면 : 퇴직일기준 -3, -2, -1, 0 전월
      *************************************************** */
     for  (icnt = islastret; icnt <= 0; icnt++)
     {
          if  (get_dd(m_empno,m_retdate, icnt, &totdd, &dudd, meg) )
               return 1;
          
          if  (icnt == LASTRET_N)    /* if (-3)       */ 
               dudd = totdd - dudd;
          else if (icnt != 0)       /* if (-2 or -1) */
               dudd = totdd;
          
     /* debug
     printf("~~~~~islastret%d,  sicalyn%d",islastret);
     */
          if  (set_paysum(m_empno, m_retdate, islastret, m_iscalyn, icnt, totdd, dudd, meg) )
               return 1;
     }
     
     if  (set_yearmonsum(m_empno,m_retdate,islastret, meg) )
          return 1;
     
     return 0;
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
    sqlstm.arrsiz = 47;
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
    sqlstm.offset = (unsigned int  )1556;
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
    sqlstm.arrsiz = 47;
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
    sqlstm.offset = (unsigned int  )1607;
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

int get_RealYYMMDD(char *m_empno,char *m_empdate,char *m_retdate, int *m_dutydd, int *m_dutymm, int *m_exdd, int *m_realdd, int *m_realmm, int *m_realyy)
{
    /* EXEC SQL
         SELECT  HPER. RETUTIL.GET_DUTYDD(       EMPDATE, RETDATE)   DUTYDD                                                                                    
                ,HPER. RETUTIL.GET_DUTYMM(       EMPDATE, RETDATE)   DUTYMM
                ,HPER. RETUTIL.GET_EXDD  (EMPNO, EMPDATE, RETDATE)     EXDD                                                                                    
                ,HPER. RETUTIL.GET_REALDD(EMPNO, EMPDATE, RETDATE)   REALDD
                ,HPER. RETUTIL.GET_REALMM(EMPNO, EMPDATE, RETDATE)   REALMM
                ,HPER. RETUTIL.GET_REALYY(EMPNO, EMPDATE, RETDATE)   REALYY
           INTO m_dutydd, m_dutymm, m_exdd, m_realdd, m_realmm, m_realyy                
           FROM (SELECT :m_empno EMPNO, :m_empdate EMPDATE, :m_retdate RETDATE FROM DUAL)A; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 47;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select HPER.RETUTIL.GET_DUTYDD(EMPDATE,RETDATE) DUTYDD ,\
HPER.RETUTIL.GET_DUTYMM(EMPDATE,RETDATE) DUTYMM ,HPER.RETUTIL.GET_EXDD(EMPNO,\
EMPDATE,RETDATE) EXDD ,HPER.RETUTIL.GET_REALDD(EMPNO,EMPDATE,RETDATE) REALDD \
,HPER.RETUTIL.GET_REALMM(EMPNO,EMPDATE,RETDATE) REALMM ,HPER.RETUTIL.GET_REAL\
YY(EMPNO,EMPDATE,RETDATE) REALYY into :b0,:b1,:b2,:b3,:b4,:b5  from (select :\
b6 EMPNO ,:b7 EMPDATE ,:b8 RETDATE  from DUAL ) A ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1658;
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

/* =============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
  30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
============================================================================= */
/* 월말일일수, 월일할일수 추출
 *   (퇴직일, n개월전, 월말일일수, 월일할일수) 
 * return value : m_totdd, m_dudd
. 입사일 이전은 감안이 안되어있음
 */
int get_dd(char *m_empno,char *m_retdate, int m_befmon, int *m_totdd, int *m_dudd, char *meg)
{
     *m_totdd = 0;
     *m_dudd  = 0;
     
     /* EXEC SQL
     SELECT  TO_NUMBER(TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon)),'DD')),
             TO_NUMBER(TO_CHAR(GREATEST(TO_DATE(ORGEMPDATE,'YYYYMMDD')-1,ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon)
                                       ) 
                          ,'DD')
                       )
       INTO    :m_totdd[0], :m_dudd[0]
       FROM    PIMPMAS
      WHERE   EMPNO =:m_empno; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_NUMBER(TO_CHAR(LAST_DAY(ADD_MONTHS(TO_DATE(:b\
0,'YYYYMMDD'),:b1)),'DD')) ,TO_NUMBER(TO_CHAR(GREATEST((TO_DATE(ORGEMPDATE,'Y\
YYYMMDD')-1),ADD_MONTHS(TO_DATE(:b0,'YYYYMMDD'),:b1)),'DD')) into :b4,:b5  fr\
om PIMPMAS where EMPNO=:b6";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1709;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[0] = (unsigned long )0;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&m_befmon;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[2] = (unsigned long )0;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&m_befmon;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&m_totdd[0];
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&m_dudd[0];
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
          sprintf(meg,"\n get_dd() DUAL SELECT [%d]\n",sqlca.sqlcode);
          return 1;
     }
     
     return 0;
}

/* =============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
  30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
============================================================================= */
/* 평균임금 기준 급여항목 setting
 *  (사번,퇴직일,말일퇴직여부,급여정산여부(Y,N = 1,0),n개월전,월말일일수,월일할일수)
 *
 *   1. 연차수당, 월차수당 제외
 *   2. 급여정산여부(=N) and 퇴직월 시에는 퇴직마스터에서 추출
 *      아니면                             급여이력  에서 추출
 *   3. 특별근무수당
 *      중도퇴직이면 퇴직마스터에서 추출
 *      말일퇴직이면 급여이력에서  추출
 */
int set_paysum(char *m_empno, char *m_retdate, int m_islastret, int m_iscalyn, int m_befmon, int m_totdd, int m_dudd, char *meg)
{
     /* 평균임금에 자가운전지원금은 급여기준.평균자가운전지원금으로 한다.
        1999.03.22 leerk ********************************** */
  
     double avgodamt = 0;
     double avgroleamt = 0 ;
     /*2001.11.01.유효성 평균임금계산시 직책수당은 평균직책수당으로 한다. */
     int a_dudd = 0;
     
     /* EXEC SQL
     SELECT AVGODAMT, AVGROLEAMT 
     INTO  :avgodamt, :avgroleamt
     FROM  PKCPBAS; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select AVGODAMT ,AVGROLEAMT into :b0,:b1  from PKCPBAS ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1752;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&avgodamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&avgroleamt;
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


     
     if  (sqlca.sqlcode != 0 )
     {
          sprintf(meg,"\n 기준테이블 읽기오류 Error Code : [%d]\n",sqlca.sqlcode);
          return 1;
     }
     
     
     if ((m_iscalyn == 0) && (m_befmon == 0) ) /* 급여정산여부N and 퇴직월급여 */
     {
         /* debug
         printf("\n else m_befmon %d  m_iscalyn %d",m_befmon,m_iscalyn); 
         */
         
          /* 2016.12.26 eyha 임단협 후속 조치에 따른 무기계약직 반영 - 20161231일까지는 이전으로 나머지는 월정연봉+소급급여로 통일 */
          if (strcmp(m_retdate,"20161231") <= 0) 
          {   /* EXEC SQL
              INSERT INTO PKHRTAVG
                        ( EMPNO,     RETDATE,
                          PAYDATE,   
                          FIXPAY,   
                          ROLEAMT,
                          LICEAMT,   FAMIAMT,  OVTMAMT,   MBONAMT,   SPTMAMT, 
                          SOPAYAMT,  MCARAMT,  
                          ODAMT,     
                          TOTDD,     DUDD ,   SOBONAMT, /o2000.9.25. SOBONAMT 추가o/
                          ITAMT ) /o정보통신수당 추가 2005.01. DSA2000o/
              SELECT :m_empno,    :m_retdate,
                      TO_CHAR(ADD_MONTHS(TO_DATE(RETDATE,'YYYYMMDD'),:m_befmon),'YYYYMM'),   /o KTH P,J,Q 사번 임금 변경 o/
                      DECODE(SUBSTR(EMPNO,1,1),'P', (NVL(FIXPAY,0)),
                                               'J', (NVL(FIXPAY,0)),
                                               'Q', (NVL(FIXPAY,0)),
                      /o 2014.11.10 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)  o/
                      /o                                        (NVL(FIXPAY,0) * 18 /12)),   o/
                                               case when substr(RETDATE,1,6) <= '201412' then CEIL(NVL(FIXPAY,0)*18/12) else NVL(FIXPAY,0) end),                               
                      ceil(DECODE(NVL(ROLEAMT,0),0,0,:avgroleamt) *:m_dudd / :m_totdd),/o2001.11 유효성 평균임금 반영 직책수당은 기준테이블(pkcpbas)의 avgroleamt값으로 o/                
                      NVL(LICEAMT,0),  NVL(FAMIAMT,0),   0,   0,    0,
                      0,               NVL(MCARAMT,0), 
                      ceil(DECODE(NVL(ODAMT,0),0,0,:avgodamt) *:m_dudd / :m_totdd),
                      :m_totdd, :m_dudd, 0, 
                      decode(nvl(ITAMT,0),0,0,ceil(nvl(ITAMT,0)))  /o *:m_dudd / :m_totdd o/
                 FROM PKMRTMAS
                WHERE EMPNO   = :m_empno
                  AND RETDATE = :m_retdate; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 47;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.stmt = "insert into PKHRTAVG (EMPNO,RETDATE,PAYDATE,FI\
XPAY,ROLEAMT,LICEAMT,FAMIAMT,OVTMAMT,MBONAMT,SPTMAMT,SOPAYAMT,MCARAMT,ODAMT,T\
OTDD,DUDD,SOBONAMT,ITAMT)select :b0 ,:b1 ,TO_CHAR(ADD_MONTHS(TO_DATE(RETDATE,\
'YYYYMMDD'),:b2),'YYYYMM') ,DECODE(SUBSTR(EMPNO,1,1),'P',NVL(FIXPAY,0),'J',NV\
L(FIXPAY,0),'Q',NVL(FIXPAY,0), case  when substr(RETDATE,1,6)<='201412' then \
CEIL(((NVL(FIXPAY,0)* 18)/12)) else NVL(FIXPAY,0)  end ) ,ceil(((DECODE(NVL(R\
OLEAMT,0),0,0,:b3)* :b4)/:b5)) ,NVL(LICEAMT,0) ,NVL(FAMIAMT,0) ,0 ,0 ,0 ,0 ,N\
VL(MCARAMT,0) ,ceil(((DECODE(NVL(ODAMT,0),0,0,:b6)* :b4)/:b5)) ,:b5 ,:b4 ,0 ,\
decode(nvl(ITAMT,0),0,0,ceil(nvl(ITAMT,0)))  from PKMRTMAS where (EMPNO=:b0 a\
nd RETDATE=:b1)";
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )1775;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqhstv[0] = (unsigned char  *)m_empno;
              sqlstm.sqhstl[0] = (unsigned long )0;
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
              sqlstm.sqhstl[1] = (unsigned long )0;
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&m_befmon;
              sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[2] = (         int  )0;
              sqlstm.sqindv[2] = (         short *)0;
              sqlstm.sqinds[2] = (         int  )0;
              sqlstm.sqharm[2] = (unsigned long )0;
              sqlstm.sqadto[2] = (unsigned short )0;
              sqlstm.sqtdso[2] = (unsigned short )0;
              sqlstm.sqhstv[3] = (unsigned char  *)&avgroleamt;
              sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[3] = (         int  )0;
              sqlstm.sqindv[3] = (         short *)0;
              sqlstm.sqinds[3] = (         int  )0;
              sqlstm.sqharm[3] = (unsigned long )0;
              sqlstm.sqadto[3] = (unsigned short )0;
              sqlstm.sqtdso[3] = (unsigned short )0;
              sqlstm.sqhstv[4] = (unsigned char  *)&m_dudd;
              sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[4] = (         int  )0;
              sqlstm.sqindv[4] = (         short *)0;
              sqlstm.sqinds[4] = (         int  )0;
              sqlstm.sqharm[4] = (unsigned long )0;
              sqlstm.sqadto[4] = (unsigned short )0;
              sqlstm.sqtdso[4] = (unsigned short )0;
              sqlstm.sqhstv[5] = (unsigned char  *)&m_totdd;
              sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[5] = (         int  )0;
              sqlstm.sqindv[5] = (         short *)0;
              sqlstm.sqinds[5] = (         int  )0;
              sqlstm.sqharm[5] = (unsigned long )0;
              sqlstm.sqadto[5] = (unsigned short )0;
              sqlstm.sqtdso[5] = (unsigned short )0;
              sqlstm.sqhstv[6] = (unsigned char  *)&avgodamt;
              sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[6] = (         int  )0;
              sqlstm.sqindv[6] = (         short *)0;
              sqlstm.sqinds[6] = (         int  )0;
              sqlstm.sqharm[6] = (unsigned long )0;
              sqlstm.sqadto[6] = (unsigned short )0;
              sqlstm.sqtdso[6] = (unsigned short )0;
              sqlstm.sqhstv[7] = (unsigned char  *)&m_dudd;
              sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[7] = (         int  )0;
              sqlstm.sqindv[7] = (         short *)0;
              sqlstm.sqinds[7] = (         int  )0;
              sqlstm.sqharm[7] = (unsigned long )0;
              sqlstm.sqadto[7] = (unsigned short )0;
              sqlstm.sqtdso[7] = (unsigned short )0;
              sqlstm.sqhstv[8] = (unsigned char  *)&m_totdd;
              sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[8] = (         int  )0;
              sqlstm.sqindv[8] = (         short *)0;
              sqlstm.sqinds[8] = (         int  )0;
              sqlstm.sqharm[8] = (unsigned long )0;
              sqlstm.sqadto[8] = (unsigned short )0;
              sqlstm.sqtdso[8] = (unsigned short )0;
              sqlstm.sqhstv[9] = (unsigned char  *)&m_totdd;
              sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[9] = (         int  )0;
              sqlstm.sqindv[9] = (         short *)0;
              sqlstm.sqinds[9] = (         int  )0;
              sqlstm.sqharm[9] = (unsigned long )0;
              sqlstm.sqadto[9] = (unsigned short )0;
              sqlstm.sqtdso[9] = (unsigned short )0;
              sqlstm.sqhstv[10] = (unsigned char  *)&m_dudd;
              sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
              sqlstm.sqhsts[10] = (         int  )0;
              sqlstm.sqindv[10] = (         short *)0;
              sqlstm.sqinds[10] = (         int  )0;
              sqlstm.sqharm[10] = (unsigned long )0;
              sqlstm.sqadto[10] = (unsigned short )0;
              sqlstm.sqtdso[10] = (unsigned short )0;
              sqlstm.sqhstv[11] = (unsigned char  *)m_empno;
              sqlstm.sqhstl[11] = (unsigned long )0;
              sqlstm.sqhsts[11] = (         int  )0;
              sqlstm.sqindv[11] = (         short *)0;
              sqlstm.sqinds[11] = (         int  )0;
              sqlstm.sqharm[11] = (unsigned long )0;
              sqlstm.sqadto[11] = (unsigned short )0;
              sqlstm.sqtdso[11] = (unsigned short )0;
              sqlstm.sqhstv[12] = (unsigned char  *)m_retdate;
              sqlstm.sqhstl[12] = (unsigned long )0;
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


                  	
          	   /* printf("정산여부N_20161231이전  : %s %s %d\n",m_empno,m_retdate, m_befmon)   ;       	                     	*/
          } else {
          	  /* EXEC SQL
              INSERT INTO PKHRTAVG
                        ( EMPNO,     RETDATE,
                          PAYDATE,   
                          FIXPAY,   
                          ROLEAMT,
                          LICEAMT,   FAMIAMT,  OVTMAMT,   MBONAMT,   SPTMAMT, 
                          SOPAYAMT,  MCARAMT,  
                          ODAMT,     
                          TOTDD,     DUDD ,   SOBONAMT, /o2000.9.25. SOBONAMT 추가o/
                          ITAMT )                       /o정보통신수당 추가 2005.01. DSA2000o/
              SELECT :m_empno,    :m_retdate,
                      TO_CHAR(ADD_MONTHS(TO_DATE(RETDATE,'YYYYMMDD'),:m_befmon),'YYYYMM'),   
                      NVL(FIXPAY,0) ,                                          /o 2016.12.26 eyha o/ 
                      ceil(DECODE(NVL(ROLEAMT,0),0,0,:avgroleamt) *:m_dudd / :m_totdd),
                      NVL(LICEAMT,0),  NVL(FAMIAMT,0),   0,   0,    0,
                      0,               NVL(MCARAMT,0), 
                      ceil(DECODE(NVL(ODAMT,0),0,0,:avgodamt) *:m_dudd / :m_totdd),
                      :m_totdd, :m_dudd, 0, 
                      decode(nvl(ITAMT,0),0,0,ceil(nvl(ITAMT,0)))  /o *:m_dudd / :m_totdd o/
                 FROM PKMRTMAS
                WHERE EMPNO   = :m_empno
                  AND RETDATE = :m_retdate; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 47;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlstm.stmt = "insert into PKHRTAVG (EMPNO,RETDATE,PAYDATE,FIX\
PAY,ROLEAMT,LICEAMT,FAMIAMT,OVTMAMT,MBONAMT,SPTMAMT,SOPAYAMT,MCARAMT,ODAMT,TO\
TDD,DUDD,SOBONAMT,ITAMT)select :b0 ,:b1 ,TO_CHAR(ADD_MONTHS(TO_DATE(RETDATE,'\
YYYYMMDD'),:b2),'YYYYMM') ,NVL(FIXPAY,0) ,ceil(((DECODE(NVL(ROLEAMT,0),0,0,:b\
3)* :b4)/:b5)) ,NVL(LICEAMT,0) ,NVL(FAMIAMT,0) ,0 ,0 ,0 ,0 ,NVL(MCARAMT,0) ,c\
eil(((DECODE(NVL(ODAMT,0),0,0,:b6)* :b4)/:b5)) ,:b5 ,:b4 ,0 ,decode(nvl(ITAMT\
,0),0,0,ceil(nvl(ITAMT,0)))  from PKMRTMAS where (EMPNO=:b0 and RETDATE=:b1)";
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )1842;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlstm.sqhstv[0] = (unsigned char  *)m_empno;
             sqlstm.sqhstl[0] = (unsigned long )0;
             sqlstm.sqhsts[0] = (         int  )0;
             sqlstm.sqindv[0] = (         short *)0;
             sqlstm.sqinds[0] = (         int  )0;
             sqlstm.sqharm[0] = (unsigned long )0;
             sqlstm.sqadto[0] = (unsigned short )0;
             sqlstm.sqtdso[0] = (unsigned short )0;
             sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[1] = (unsigned long )0;
             sqlstm.sqhsts[1] = (         int  )0;
             sqlstm.sqindv[1] = (         short *)0;
             sqlstm.sqinds[1] = (         int  )0;
             sqlstm.sqharm[1] = (unsigned long )0;
             sqlstm.sqadto[1] = (unsigned short )0;
             sqlstm.sqtdso[1] = (unsigned short )0;
             sqlstm.sqhstv[2] = (unsigned char  *)&m_befmon;
             sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[2] = (         int  )0;
             sqlstm.sqindv[2] = (         short *)0;
             sqlstm.sqinds[2] = (         int  )0;
             sqlstm.sqharm[2] = (unsigned long )0;
             sqlstm.sqadto[2] = (unsigned short )0;
             sqlstm.sqtdso[2] = (unsigned short )0;
             sqlstm.sqhstv[3] = (unsigned char  *)&avgroleamt;
             sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
             sqlstm.sqhsts[3] = (         int  )0;
             sqlstm.sqindv[3] = (         short *)0;
             sqlstm.sqinds[3] = (         int  )0;
             sqlstm.sqharm[3] = (unsigned long )0;
             sqlstm.sqadto[3] = (unsigned short )0;
             sqlstm.sqtdso[3] = (unsigned short )0;
             sqlstm.sqhstv[4] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[4] = (         int  )0;
             sqlstm.sqindv[4] = (         short *)0;
             sqlstm.sqinds[4] = (         int  )0;
             sqlstm.sqharm[4] = (unsigned long )0;
             sqlstm.sqadto[4] = (unsigned short )0;
             sqlstm.sqtdso[4] = (unsigned short )0;
             sqlstm.sqhstv[5] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[5] = (         int  )0;
             sqlstm.sqindv[5] = (         short *)0;
             sqlstm.sqinds[5] = (         int  )0;
             sqlstm.sqharm[5] = (unsigned long )0;
             sqlstm.sqadto[5] = (unsigned short )0;
             sqlstm.sqtdso[5] = (unsigned short )0;
             sqlstm.sqhstv[6] = (unsigned char  *)&avgodamt;
             sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
             sqlstm.sqhsts[6] = (         int  )0;
             sqlstm.sqindv[6] = (         short *)0;
             sqlstm.sqinds[6] = (         int  )0;
             sqlstm.sqharm[6] = (unsigned long )0;
             sqlstm.sqadto[6] = (unsigned short )0;
             sqlstm.sqtdso[6] = (unsigned short )0;
             sqlstm.sqhstv[7] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[7] = (         int  )0;
             sqlstm.sqindv[7] = (         short *)0;
             sqlstm.sqinds[7] = (         int  )0;
             sqlstm.sqharm[7] = (unsigned long )0;
             sqlstm.sqadto[7] = (unsigned short )0;
             sqlstm.sqtdso[7] = (unsigned short )0;
             sqlstm.sqhstv[8] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[8] = (         int  )0;
             sqlstm.sqindv[8] = (         short *)0;
             sqlstm.sqinds[8] = (         int  )0;
             sqlstm.sqharm[8] = (unsigned long )0;
             sqlstm.sqadto[8] = (unsigned short )0;
             sqlstm.sqtdso[8] = (unsigned short )0;
             sqlstm.sqhstv[9] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[9] = (         int  )0;
             sqlstm.sqindv[9] = (         short *)0;
             sqlstm.sqinds[9] = (         int  )0;
             sqlstm.sqharm[9] = (unsigned long )0;
             sqlstm.sqadto[9] = (unsigned short )0;
             sqlstm.sqtdso[9] = (unsigned short )0;
             sqlstm.sqhstv[10] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[10] = (         int  )0;
             sqlstm.sqindv[10] = (         short *)0;
             sqlstm.sqinds[10] = (         int  )0;
             sqlstm.sqharm[10] = (unsigned long )0;
             sqlstm.sqadto[10] = (unsigned short )0;
             sqlstm.sqtdso[10] = (unsigned short )0;
             sqlstm.sqhstv[11] = (unsigned char  *)m_empno;
             sqlstm.sqhstl[11] = (unsigned long )0;
             sqlstm.sqhsts[11] = (         int  )0;
             sqlstm.sqindv[11] = (         short *)0;
             sqlstm.sqinds[11] = (         int  )0;
             sqlstm.sqharm[11] = (unsigned long )0;
             sqlstm.sqadto[11] = (unsigned short )0;
             sqlstm.sqtdso[11] = (unsigned short )0;
             sqlstm.sqhstv[12] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[12] = (unsigned long )0;
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


          	   /* printf("정산여부N_20161231이후  : %s %s %d\n",m_empno,m_retdate, m_befmon)   ;        	                     	*/

          }	
            
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
               sprintf(meg,"\n set_paysum() PKHRTAVG INSERT 1 [%d]\n",sqlca.sqlcode);
               return 1;
          }
     }
     else
     {
       
     /* printf("\n else m_befmon   %d m_dudd%d,m_totdd%d",
     m_befmon,m_dudd,m_totdd); */
  
          a_dudd = m_dudd;
    
  /*==========2000-08-04 유효성 주석처리 ( 평균임금 계산시 퇴직월급여도 일할계산 요 ) ==
    if (m_befmon == 0 ) 
     m_dudd = m_totdd;
  ======================================================================================*/
  
    
          /* 2016.12.26 eyha 임단협 후속 조치에 따른 무기계약직 반영 - 20161231일까지는 이전으로 나머지는 월정연봉+소급급여로 통일  */
          if (strcmp(m_retdate,"20161231") <= 0) 
          {	
             /* EXEC SQL
             INSERT INTO PKHRTAVG
                   (EMPNO, RETDATE,
                           PAYDATE,
                           FIXPAY,
                           ROLEAMT,
                           LICEAMT,
                           FAMIAMT,
                           OVTMAMT,    MBONAMT,
                           SPTMAMT,
                           SOPAYAMT,
                           MCARAMT,
                           ODAMT,
                           TOTDD, DUDD , SOBONAMT,/o2000.9.25. SOBONAMT(제수당성소급급여) 추가o/
                           ITAMT ) /o정보통신수당 추가 2005.01. DSA2000o/
             SELECT  :m_empno, :m_retdate,
                     TO_CHAR(ADD_MONTHS(TO_DATE(M.RETDATE,'YYYYMMDD'),:m_befmon),'YYYYMM'),
                     DECODE(SUBSTR(H.EMPNO,1,1),'P', ceil(NVL(H.FIXPAY,0)  * :m_dudd / :m_totdd),
                                                'J', ceil(NVL(H.FIXPAY,0)  * :m_dudd / :m_totdd),
                                                'Q', ceil(NVL(H.FIXPAY,0)  * :m_dudd / :m_totdd),                
                     /o 2014.11.10 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함)  o/
                     /o                                           ceil(NVL(H.FIXPAY,0) * 18 / 12 * :m_dudd / :m_totdd)),  o/
                                                case when paydate <= '201412' then (CEIL((NVL(H.FIXPAY,0)+NVL(H.SOPAY,0))*18/12 * :m_dudd / :m_totdd)) else ceil((NVL(H.FIXPAY,0)+NVL(H.SOPAY,0)) * :m_dudd / :m_totdd) end),                                             
                     ceil(LEAST(NVL(H.ROLEAMT,0), :avgroleamt)  * :m_dudd / :m_totdd ),
                     /o2001.11.01. 유효성 
                     평균임금 반영 직책수당은 기준테이블(pkcpbas)의 avgroleamt값으로 o/
                     ceil(NVL(H.LICEAMT,0) * :m_dudd / :m_totdd),
                     ceil( (NVL(H.MATEAMT,0)+NVL(H.PARTAMT,0)+NVL(H.CHILDAMT,0)) * :m_dudd / :m_totdd),
                     0, 0,
                     /o 특별근무수당은 급여이력에서는 0으로 본다. 퇴직마스터에서 추출한다.o/
                     DECODE(:m_islastret, :LASTRET_N, 0, ROUND(NVL(H.SPTMAMT,0) * :m_dudd / :m_totdd) ),
                     /o 2014.11.10 하은영 sopay는 월정연봉에 포함하고 소급급여는 급여대장의 합으로 한다 
                     DECODE(SUBSTR(H.EMPNO,1,1),'P', ceil(NVL(H.SOPAY,0)  * :m_dudd / :m_totdd),
                                                'J', ceil(NVL(H.SOPAY,0)  * :m_dudd / :m_totdd),
                                                'Q', ceil(NVL(H.SOPAY,0)  * :m_dudd / :m_totdd),  
                                                ceil(NVL(H.SOPAY,0) * 18 / 12   * :m_dudd / :m_totdd)), o/
                     0,                                             
                     ceil(NVL(H.MCARAMT,0) * :m_dudd / :m_totdd),
                     ceil(DECODE(NVL(H.ODAMT,0),0,0,:avgodamt)* :m_dudd / :m_totdd),
                     :m_totdd, :a_dudd,
                     ceil(NVL(H.SOBON,0) * :m_dudd / :m_totdd) , /o2000.9.25. SOBONAMT(제수당성소급급여) 추가o/
                     decode(nvl(H.ITAMT,0),0,0,ceil(nvl(H.ITAMT,0)*:m_dudd / :m_totdd))                  
               FROM  PKMRTMAS M,
                     ( SELECT EMPNO,
                              SUBSTR(PAYDATE,1,6)  AS PAYDATE ,
                              SUM(NVL(FIXPAY  ,0)) AS FIXPAY  ,
                              SUM(NVL(SOPAY   ,0)) AS SOPAY   ,
                              SUM(NVL(ROLEAMT ,0)) AS ROLEAMT ,
                              SUM(NVL(LICEAMT ,0)) AS LICEAMT ,
                              SUM(NVL(MATEAMT ,0)) AS MATEAMT ,
                              SUM(NVL(PARTAMT ,0)) AS PARTAMT ,
                              SUM(NVL(CHILDAMT,0)) AS CHILDAMT,
                              SUM(NVL(SPTMAMT ,0)) AS SPTMAMT ,
                              SUM(NVL(MCARAMT ,0)) AS MCARAMT ,
                              SUM(NVL(ODAMT   ,0)) AS ODAMT   ,
                              SUM(NVL(SOBON   ,0)) AS SOBON   ,
                              SUM(NVL(ITAMT   ,0)) AS ITAMT   
                         FROM PKHPHIS 
                        WHERE TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') = SUBSTR(PAYDATE,1,6)
                        GROUP BY EMPNO, SUBSTR(PAYDATE,1,6) ) H
              WHERE  M.EMPNO = H.EMPNO (+)
                AND  TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') = PAYDATE(+)
                AND  M.EMPNO = :m_empno ; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 47;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlbuft((void **)0,
               "insert into PKHRTAVG (EMPNO,RETDATE,PAYDATE,FIXPAY,ROLEAMT,L\
ICEAMT,FAMIAMT,OVTMAMT,MBONAMT,SPTMAMT,SOPAYAMT,MCARAMT,ODAMT,TOTDD,DUDD,SOB\
ONAMT,ITAMT)select :b0 ,:b1 ,TO_CHAR(ADD_MONTHS(TO_DATE(M.RETDATE,'YYYYMMDD'\
),:b2),'YYYYMM') ,DECODE(SUBSTR(H.EMPNO,1,1),'P',ceil(((NVL(H.FIXPAY,0)* :b3\
)/:b4)),'J',ceil(((NVL(H.FIXPAY,0)* :b3)/:b4)),'Q',ceil(((NVL(H.FIXPAY,0)* :\
b3)/:b4)), case  when paydate<='201412' then CEIL((((((NVL(H.FIXPAY,0)+NVL(H\
.SOPAY,0))* 18)/12)* :b3)/:b4)) else ceil((((NVL(H.FIXPAY,0)+NVL(H.SOPAY,0))\
* :b3)/:b4))  end ) ,ceil(((LEAST(NVL(H.ROLEAMT,0),:b13)* :b3)/:b4)) ,ceil((\
(NVL(H.LICEAMT,0)* :b3)/:b4)) ,ceil(((((NVL(H.MATEAMT,0)+NVL(H.PARTAMT,0))+N\
VL(H.CHILDAMT,0))* :b3)/:b4)) ,0 ,0 ,DECODE(:b20,:b21,0,ROUND(((NVL(H.SPTMAM\
T,0)* :b3)/:b4))) ,0 ,ceil(((NVL(H.MCARAMT,0)* :b3)/:b4)) ,ceil(((DECODE(NVL\
(H.ODAMT,0),0,0,:b26)* :b3)/:b4)) ,:b4 ,:b30 ,ceil(((NVL(H.SOBON,0)* :b3)/:b\
4)) ,decode(nvl(H.ITAMT,0),0,0,ceil(((nvl(H.ITAMT,0)* :b3)/:b4)))  from PKMR\
TMAS M ,(select EMPNO ,SUBSTR(PAYDATE,1,6) PAYDATE ,");
             sqlstm.stmt = "sum(NVL(FIXPAY,0)) FIXPAY ,sum(NVL(SOPAY,0)) SO\
PAY ,sum(NVL(ROLEAMT,0)) ROLEAMT ,sum(NVL(LICEAMT,0)) LICEAMT ,sum(NVL(MATEAM\
T,0)) MATEAMT ,sum(NVL(PARTAMT,0)) PARTAMT ,sum(NVL(CHILDAMT,0)) CHILDAMT ,su\
m(NVL(SPTMAMT,0)) SPTMAMT ,sum(NVL(MCARAMT,0)) MCARAMT ,sum(NVL(ODAMT,0)) ODA\
MT ,sum(NVL(SOBON,0)) SOBON ,sum(NVL(ITAMT,0)) ITAMT  from PKHPHIS where TO_C\
HAR(ADD_MONTHS(TO_DATE(:b1,'YYYYMMDD'),:b2),'YYYYMM')=SUBSTR(PAYDATE,1,6) gro\
up by EMPNO,SUBSTR(PAYDATE,1,6)) H where ((M.EMPNO=H.EMPNO(+) and TO_CHAR(ADD\
_MONTHS(TO_DATE(:b1,'YYYYMMDD'),:b2),'YYYYMM')=PAYDATE(+)) and M.EMPNO=:b0)";
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )1909;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlstm.sqhstv[0] = (unsigned char  *)m_empno;
             sqlstm.sqhstl[0] = (unsigned long )0;
             sqlstm.sqhsts[0] = (         int  )0;
             sqlstm.sqindv[0] = (         short *)0;
             sqlstm.sqinds[0] = (         int  )0;
             sqlstm.sqharm[0] = (unsigned long )0;
             sqlstm.sqadto[0] = (unsigned short )0;
             sqlstm.sqtdso[0] = (unsigned short )0;
             sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[1] = (unsigned long )0;
             sqlstm.sqhsts[1] = (         int  )0;
             sqlstm.sqindv[1] = (         short *)0;
             sqlstm.sqinds[1] = (         int  )0;
             sqlstm.sqharm[1] = (unsigned long )0;
             sqlstm.sqadto[1] = (unsigned short )0;
             sqlstm.sqtdso[1] = (unsigned short )0;
             sqlstm.sqhstv[2] = (unsigned char  *)&m_befmon;
             sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[2] = (         int  )0;
             sqlstm.sqindv[2] = (         short *)0;
             sqlstm.sqinds[2] = (         int  )0;
             sqlstm.sqharm[2] = (unsigned long )0;
             sqlstm.sqadto[2] = (unsigned short )0;
             sqlstm.sqtdso[2] = (unsigned short )0;
             sqlstm.sqhstv[3] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[3] = (         int  )0;
             sqlstm.sqindv[3] = (         short *)0;
             sqlstm.sqinds[3] = (         int  )0;
             sqlstm.sqharm[3] = (unsigned long )0;
             sqlstm.sqadto[3] = (unsigned short )0;
             sqlstm.sqtdso[3] = (unsigned short )0;
             sqlstm.sqhstv[4] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[4] = (         int  )0;
             sqlstm.sqindv[4] = (         short *)0;
             sqlstm.sqinds[4] = (         int  )0;
             sqlstm.sqharm[4] = (unsigned long )0;
             sqlstm.sqadto[4] = (unsigned short )0;
             sqlstm.sqtdso[4] = (unsigned short )0;
             sqlstm.sqhstv[5] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[5] = (         int  )0;
             sqlstm.sqindv[5] = (         short *)0;
             sqlstm.sqinds[5] = (         int  )0;
             sqlstm.sqharm[5] = (unsigned long )0;
             sqlstm.sqadto[5] = (unsigned short )0;
             sqlstm.sqtdso[5] = (unsigned short )0;
             sqlstm.sqhstv[6] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[6] = (         int  )0;
             sqlstm.sqindv[6] = (         short *)0;
             sqlstm.sqinds[6] = (         int  )0;
             sqlstm.sqharm[6] = (unsigned long )0;
             sqlstm.sqadto[6] = (unsigned short )0;
             sqlstm.sqtdso[6] = (unsigned short )0;
             sqlstm.sqhstv[7] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[7] = (         int  )0;
             sqlstm.sqindv[7] = (         short *)0;
             sqlstm.sqinds[7] = (         int  )0;
             sqlstm.sqharm[7] = (unsigned long )0;
             sqlstm.sqadto[7] = (unsigned short )0;
             sqlstm.sqtdso[7] = (unsigned short )0;
             sqlstm.sqhstv[8] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[8] = (         int  )0;
             sqlstm.sqindv[8] = (         short *)0;
             sqlstm.sqinds[8] = (         int  )0;
             sqlstm.sqharm[8] = (unsigned long )0;
             sqlstm.sqadto[8] = (unsigned short )0;
             sqlstm.sqtdso[8] = (unsigned short )0;
             sqlstm.sqhstv[9] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[9] = (         int  )0;
             sqlstm.sqindv[9] = (         short *)0;
             sqlstm.sqinds[9] = (         int  )0;
             sqlstm.sqharm[9] = (unsigned long )0;
             sqlstm.sqadto[9] = (unsigned short )0;
             sqlstm.sqtdso[9] = (unsigned short )0;
             sqlstm.sqhstv[10] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[10] = (         int  )0;
             sqlstm.sqindv[10] = (         short *)0;
             sqlstm.sqinds[10] = (         int  )0;
             sqlstm.sqharm[10] = (unsigned long )0;
             sqlstm.sqadto[10] = (unsigned short )0;
             sqlstm.sqtdso[10] = (unsigned short )0;
             sqlstm.sqhstv[11] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[11] = (         int  )0;
             sqlstm.sqindv[11] = (         short *)0;
             sqlstm.sqinds[11] = (         int  )0;
             sqlstm.sqharm[11] = (unsigned long )0;
             sqlstm.sqadto[11] = (unsigned short )0;
             sqlstm.sqtdso[11] = (unsigned short )0;
             sqlstm.sqhstv[12] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[12] = (         int  )0;
             sqlstm.sqindv[12] = (         short *)0;
             sqlstm.sqinds[12] = (         int  )0;
             sqlstm.sqharm[12] = (unsigned long )0;
             sqlstm.sqadto[12] = (unsigned short )0;
             sqlstm.sqtdso[12] = (unsigned short )0;
             sqlstm.sqhstv[13] = (unsigned char  *)&avgroleamt;
             sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
             sqlstm.sqhsts[13] = (         int  )0;
             sqlstm.sqindv[13] = (         short *)0;
             sqlstm.sqinds[13] = (         int  )0;
             sqlstm.sqharm[13] = (unsigned long )0;
             sqlstm.sqadto[13] = (unsigned short )0;
             sqlstm.sqtdso[13] = (unsigned short )0;
             sqlstm.sqhstv[14] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[14] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[14] = (         int  )0;
             sqlstm.sqindv[14] = (         short *)0;
             sqlstm.sqinds[14] = (         int  )0;
             sqlstm.sqharm[14] = (unsigned long )0;
             sqlstm.sqadto[14] = (unsigned short )0;
             sqlstm.sqtdso[14] = (unsigned short )0;
             sqlstm.sqhstv[15] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[15] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[15] = (         int  )0;
             sqlstm.sqindv[15] = (         short *)0;
             sqlstm.sqinds[15] = (         int  )0;
             sqlstm.sqharm[15] = (unsigned long )0;
             sqlstm.sqadto[15] = (unsigned short )0;
             sqlstm.sqtdso[15] = (unsigned short )0;
             sqlstm.sqhstv[16] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[16] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[16] = (         int  )0;
             sqlstm.sqindv[16] = (         short *)0;
             sqlstm.sqinds[16] = (         int  )0;
             sqlstm.sqharm[16] = (unsigned long )0;
             sqlstm.sqadto[16] = (unsigned short )0;
             sqlstm.sqtdso[16] = (unsigned short )0;
             sqlstm.sqhstv[17] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[17] = (         int  )0;
             sqlstm.sqindv[17] = (         short *)0;
             sqlstm.sqinds[17] = (         int  )0;
             sqlstm.sqharm[17] = (unsigned long )0;
             sqlstm.sqadto[17] = (unsigned short )0;
             sqlstm.sqtdso[17] = (unsigned short )0;
             sqlstm.sqhstv[18] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[18] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[18] = (         int  )0;
             sqlstm.sqindv[18] = (         short *)0;
             sqlstm.sqinds[18] = (         int  )0;
             sqlstm.sqharm[18] = (unsigned long )0;
             sqlstm.sqadto[18] = (unsigned short )0;
             sqlstm.sqtdso[18] = (unsigned short )0;
             sqlstm.sqhstv[19] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[19] = (         int  )0;
             sqlstm.sqindv[19] = (         short *)0;
             sqlstm.sqinds[19] = (         int  )0;
             sqlstm.sqharm[19] = (unsigned long )0;
             sqlstm.sqadto[19] = (unsigned short )0;
             sqlstm.sqtdso[19] = (unsigned short )0;
             sqlstm.sqhstv[20] = (unsigned char  *)&m_islastret;
             sqlstm.sqhstl[20] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[20] = (         int  )0;
             sqlstm.sqindv[20] = (         short *)0;
             sqlstm.sqinds[20] = (         int  )0;
             sqlstm.sqharm[20] = (unsigned long )0;
             sqlstm.sqadto[20] = (unsigned short )0;
             sqlstm.sqtdso[20] = (unsigned short )0;
             sqlstm.sqhstv[21] = (unsigned char  *)&LASTRET_N;
             sqlstm.sqhstl[21] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[21] = (         int  )0;
             sqlstm.sqindv[21] = (         short *)0;
             sqlstm.sqinds[21] = (         int  )0;
             sqlstm.sqharm[21] = (unsigned long )0;
             sqlstm.sqadto[21] = (unsigned short )0;
             sqlstm.sqtdso[21] = (unsigned short )0;
             sqlstm.sqhstv[22] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[22] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[22] = (         int  )0;
             sqlstm.sqindv[22] = (         short *)0;
             sqlstm.sqinds[22] = (         int  )0;
             sqlstm.sqharm[22] = (unsigned long )0;
             sqlstm.sqadto[22] = (unsigned short )0;
             sqlstm.sqtdso[22] = (unsigned short )0;
             sqlstm.sqhstv[23] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[23] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[23] = (         int  )0;
             sqlstm.sqindv[23] = (         short *)0;
             sqlstm.sqinds[23] = (         int  )0;
             sqlstm.sqharm[23] = (unsigned long )0;
             sqlstm.sqadto[23] = (unsigned short )0;
             sqlstm.sqtdso[23] = (unsigned short )0;
             sqlstm.sqhstv[24] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[24] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[24] = (         int  )0;
             sqlstm.sqindv[24] = (         short *)0;
             sqlstm.sqinds[24] = (         int  )0;
             sqlstm.sqharm[24] = (unsigned long )0;
             sqlstm.sqadto[24] = (unsigned short )0;
             sqlstm.sqtdso[24] = (unsigned short )0;
             sqlstm.sqhstv[25] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[25] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[25] = (         int  )0;
             sqlstm.sqindv[25] = (         short *)0;
             sqlstm.sqinds[25] = (         int  )0;
             sqlstm.sqharm[25] = (unsigned long )0;
             sqlstm.sqadto[25] = (unsigned short )0;
             sqlstm.sqtdso[25] = (unsigned short )0;
             sqlstm.sqhstv[26] = (unsigned char  *)&avgodamt;
             sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
             sqlstm.sqhsts[26] = (         int  )0;
             sqlstm.sqindv[26] = (         short *)0;
             sqlstm.sqinds[26] = (         int  )0;
             sqlstm.sqharm[26] = (unsigned long )0;
             sqlstm.sqadto[26] = (unsigned short )0;
             sqlstm.sqtdso[26] = (unsigned short )0;
             sqlstm.sqhstv[27] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[27] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[27] = (         int  )0;
             sqlstm.sqindv[27] = (         short *)0;
             sqlstm.sqinds[27] = (         int  )0;
             sqlstm.sqharm[27] = (unsigned long )0;
             sqlstm.sqadto[27] = (unsigned short )0;
             sqlstm.sqtdso[27] = (unsigned short )0;
             sqlstm.sqhstv[28] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[28] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[28] = (         int  )0;
             sqlstm.sqindv[28] = (         short *)0;
             sqlstm.sqinds[28] = (         int  )0;
             sqlstm.sqharm[28] = (unsigned long )0;
             sqlstm.sqadto[28] = (unsigned short )0;
             sqlstm.sqtdso[28] = (unsigned short )0;
             sqlstm.sqhstv[29] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[29] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[29] = (         int  )0;
             sqlstm.sqindv[29] = (         short *)0;
             sqlstm.sqinds[29] = (         int  )0;
             sqlstm.sqharm[29] = (unsigned long )0;
             sqlstm.sqadto[29] = (unsigned short )0;
             sqlstm.sqtdso[29] = (unsigned short )0;
             sqlstm.sqhstv[30] = (unsigned char  *)&a_dudd;
             sqlstm.sqhstl[30] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[30] = (         int  )0;
             sqlstm.sqindv[30] = (         short *)0;
             sqlstm.sqinds[30] = (         int  )0;
             sqlstm.sqharm[30] = (unsigned long )0;
             sqlstm.sqadto[30] = (unsigned short )0;
             sqlstm.sqtdso[30] = (unsigned short )0;
             sqlstm.sqhstv[31] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[31] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[31] = (         int  )0;
             sqlstm.sqindv[31] = (         short *)0;
             sqlstm.sqinds[31] = (         int  )0;
             sqlstm.sqharm[31] = (unsigned long )0;
             sqlstm.sqadto[31] = (unsigned short )0;
             sqlstm.sqtdso[31] = (unsigned short )0;
             sqlstm.sqhstv[32] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[32] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[32] = (         int  )0;
             sqlstm.sqindv[32] = (         short *)0;
             sqlstm.sqinds[32] = (         int  )0;
             sqlstm.sqharm[32] = (unsigned long )0;
             sqlstm.sqadto[32] = (unsigned short )0;
             sqlstm.sqtdso[32] = (unsigned short )0;
             sqlstm.sqhstv[33] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[33] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[33] = (         int  )0;
             sqlstm.sqindv[33] = (         short *)0;
             sqlstm.sqinds[33] = (         int  )0;
             sqlstm.sqharm[33] = (unsigned long )0;
             sqlstm.sqadto[33] = (unsigned short )0;
             sqlstm.sqtdso[33] = (unsigned short )0;
             sqlstm.sqhstv[34] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[34] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[34] = (         int  )0;
             sqlstm.sqindv[34] = (         short *)0;
             sqlstm.sqinds[34] = (         int  )0;
             sqlstm.sqharm[34] = (unsigned long )0;
             sqlstm.sqadto[34] = (unsigned short )0;
             sqlstm.sqtdso[34] = (unsigned short )0;
             sqlstm.sqhstv[35] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[35] = (unsigned long )0;
             sqlstm.sqhsts[35] = (         int  )0;
             sqlstm.sqindv[35] = (         short *)0;
             sqlstm.sqinds[35] = (         int  )0;
             sqlstm.sqharm[35] = (unsigned long )0;
             sqlstm.sqadto[35] = (unsigned short )0;
             sqlstm.sqtdso[35] = (unsigned short )0;
             sqlstm.sqhstv[36] = (unsigned char  *)&m_befmon;
             sqlstm.sqhstl[36] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[36] = (         int  )0;
             sqlstm.sqindv[36] = (         short *)0;
             sqlstm.sqinds[36] = (         int  )0;
             sqlstm.sqharm[36] = (unsigned long )0;
             sqlstm.sqadto[36] = (unsigned short )0;
             sqlstm.sqtdso[36] = (unsigned short )0;
             sqlstm.sqhstv[37] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[37] = (unsigned long )0;
             sqlstm.sqhsts[37] = (         int  )0;
             sqlstm.sqindv[37] = (         short *)0;
             sqlstm.sqinds[37] = (         int  )0;
             sqlstm.sqharm[37] = (unsigned long )0;
             sqlstm.sqadto[37] = (unsigned short )0;
             sqlstm.sqtdso[37] = (unsigned short )0;
             sqlstm.sqhstv[38] = (unsigned char  *)&m_befmon;
             sqlstm.sqhstl[38] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[38] = (         int  )0;
             sqlstm.sqindv[38] = (         short *)0;
             sqlstm.sqinds[38] = (         int  )0;
             sqlstm.sqharm[38] = (unsigned long )0;
             sqlstm.sqadto[38] = (unsigned short )0;
             sqlstm.sqtdso[38] = (unsigned short )0;
             sqlstm.sqhstv[39] = (unsigned char  *)m_empno;
             sqlstm.sqhstl[39] = (unsigned long )0;
             sqlstm.sqhsts[39] = (         int  )0;
             sqlstm.sqindv[39] = (         short *)0;
             sqlstm.sqinds[39] = (         int  )0;
             sqlstm.sqharm[39] = (unsigned long )0;
             sqlstm.sqadto[39] = (unsigned short )0;
             sqlstm.sqtdso[39] = (unsigned short )0;
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


                	
          	   /* printf("정산여부 else_20161231이전  : %s %s %d\n",m_empno,m_retdate, m_befmon)   ;       	                     	*/
                	
          } else {
             /* EXEC SQL
             INSERT INTO PKHRTAVG
                   (EMPNO, RETDATE,
                           PAYDATE,
                           FIXPAY,
                           ROLEAMT,
                           LICEAMT,
                           FAMIAMT,
                           OVTMAMT,    MBONAMT,
                           SPTMAMT,
                           SOPAYAMT,
                           MCARAMT,
                           ODAMT,
                           TOTDD, DUDD , SOBONAMT, 
                           ITAMT )                 
             SELECT  :m_empno, :m_retdate,
                     TO_CHAR(ADD_MONTHS(TO_DATE(M.RETDATE,'YYYYMMDD'),:m_befmon),'YYYYMM'),
                     ceil((NVL(H.FIXPAY,0)+NVL(H.SOPAY,0)) * :m_dudd / :m_totdd) ,   /o 2016.12.26 eyha o/                                          
                     ceil(LEAST(NVL(H.ROLEAMT,0), :avgroleamt)  * :m_dudd / :m_totdd ),
                     ceil(NVL(H.LICEAMT,0) * :m_dudd / :m_totdd),
                     ceil( (NVL(H.MATEAMT,0)+NVL(H.PARTAMT,0)+NVL(H.CHILDAMT,0)) * :m_dudd / :m_totdd),
                     0, 0,
                     DECODE(:m_islastret, :LASTRET_N, 0, ROUND(NVL(H.SPTMAMT,0) * :m_dudd / :m_totdd) ),
                     0,                                             
                     ceil(NVL(H.MCARAMT,0) * :m_dudd / :m_totdd),
                     ceil(DECODE(NVL(H.ODAMT,0),0,0,:avgodamt)* :m_dudd / :m_totdd),
                     :m_totdd, :a_dudd,
                     ceil(NVL(H.SOBON,0) * :m_dudd / :m_totdd) , 
                     decode(nvl(H.ITAMT,0),0,0,ceil(nvl(H.ITAMT,0)*:m_dudd / :m_totdd))                  
               FROM  PKMRTMAS M,
                     ( SELECT EMPNO,
                              SUBSTR(PAYDATE,1,6)  AS PAYDATE ,
                              SUM(NVL(FIXPAY  ,0)) AS FIXPAY  ,
                              SUM(NVL(SOPAY   ,0)) AS SOPAY   ,
                              SUM(NVL(ROLEAMT ,0)) AS ROLEAMT ,
                              SUM(NVL(LICEAMT ,0)) AS LICEAMT ,
                              SUM(NVL(MATEAMT ,0)) AS MATEAMT ,
                              SUM(NVL(PARTAMT ,0)) AS PARTAMT ,
                              SUM(NVL(CHILDAMT,0)) AS CHILDAMT,
                              SUM(NVL(SPTMAMT ,0)) AS SPTMAMT ,
                              SUM(NVL(MCARAMT ,0)) AS MCARAMT ,
                              SUM(NVL(ODAMT   ,0)) AS ODAMT   ,
                              SUM(NVL(SOBON   ,0)) AS SOBON   ,
                              SUM(NVL(ITAMT   ,0)) AS ITAMT   
                         FROM PKHPHIS 
                        WHERE TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') = SUBSTR(PAYDATE,1,6)
                        GROUP BY EMPNO, SUBSTR(PAYDATE,1,6) ) H
              WHERE  M.EMPNO = H.EMPNO (+)
                AND  TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') = PAYDATE(+)
                AND  M.EMPNO = :m_empno ; */ 

{
             struct sqlexd sqlstm;
             sqlstm.sqlvsn = 12;
             sqlstm.arrsiz = 47;
             sqlstm.sqladtp = &sqladt;
             sqlstm.sqltdsp = &sqltds;
             sqlbuft((void **)0,
               "insert into PKHRTAVG (EMPNO,RETDATE,PAYDATE,FIXPAY,ROLEAMT,L\
ICEAMT,FAMIAMT,OVTMAMT,MBONAMT,SPTMAMT,SOPAYAMT,MCARAMT,ODAMT,TOTDD,DUDD,SOB\
ONAMT,ITAMT)select :b0 ,:b1 ,TO_CHAR(ADD_MONTHS(TO_DATE(M.RETDATE,'YYYYMMDD'\
),:b2),'YYYYMM') ,ceil((((NVL(H.FIXPAY,0)+NVL(H.SOPAY,0))* :b3)/:b4)) ,ceil(\
((LEAST(NVL(H.ROLEAMT,0),:b5)* :b3)/:b4)) ,ceil(((NVL(H.LICEAMT,0)* :b3)/:b4\
)) ,ceil(((((NVL(H.MATEAMT,0)+NVL(H.PARTAMT,0))+NVL(H.CHILDAMT,0))* :b3)/:b4\
)) ,0 ,0 ,DECODE(:b12,:b13,0,ROUND(((NVL(H.SPTMAMT,0)* :b3)/:b4))) ,0 ,ceil(\
((NVL(H.MCARAMT,0)* :b3)/:b4)) ,ceil(((DECODE(NVL(H.ODAMT,0),0,0,:b18)* :b3)\
/:b4)) ,:b4 ,:b22 ,ceil(((NVL(H.SOBON,0)* :b3)/:b4)) ,decode(nvl(H.ITAMT,0),\
0,0,ceil(((nvl(H.ITAMT,0)* :b3)/:b4)))  from PKMRTMAS M ,(select EMPNO ,SUBS\
TR(PAYDATE,1,6) PAYDATE ,sum(NVL(FIXPAY,0)) FIXPAY ,sum(NVL(SOPAY,0)) SOPAY \
,sum(NVL(ROLEAMT,0)) ROLEAMT ,sum(NVL(LICEAMT,0)) LICEAMT ,sum(NVL(MATEAMT,0\
)) MATEAMT ,sum(NVL(PARTAMT,0)) PARTAMT ,sum(NVL(CHILDAMT,0)) CHILDAMT ,sum(\
NVL(SPTMAMT,0)) SPTMAMT ,sum(NVL(MCARAMT,0)) MCARAMT");
             sqlstm.stmt = " ,sum(NVL(ODAMT,0)) ODAMT ,sum(NVL(SOBON,0)) SO\
BON ,sum(NVL(ITAMT,0)) ITAMT  from PKHPHIS where TO_CHAR(ADD_MONTHS(TO_DATE(:\
b1,'YYYYMMDD'),:b2),'YYYYMM')=SUBSTR(PAYDATE,1,6) group by EMPNO,SUBSTR(PAYDA\
TE,1,6)) H where ((M.EMPNO=H.EMPNO(+) and TO_CHAR(ADD_MONTHS(TO_DATE(:b1,'YYY\
YMMDD'),:b2),'YYYYMM')=PAYDATE(+)) and M.EMPNO=:b0)";
             sqlstm.iters = (unsigned int  )1;
             sqlstm.offset = (unsigned int  )2084;
             sqlstm.cud = sqlcud0;
             sqlstm.sqlest = (unsigned char  *)&sqlca;
             sqlstm.sqlety = (unsigned short)4352;
             sqlstm.occurs = (unsigned int  )0;
             sqlstm.sqhstv[0] = (unsigned char  *)m_empno;
             sqlstm.sqhstl[0] = (unsigned long )0;
             sqlstm.sqhsts[0] = (         int  )0;
             sqlstm.sqindv[0] = (         short *)0;
             sqlstm.sqinds[0] = (         int  )0;
             sqlstm.sqharm[0] = (unsigned long )0;
             sqlstm.sqadto[0] = (unsigned short )0;
             sqlstm.sqtdso[0] = (unsigned short )0;
             sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[1] = (unsigned long )0;
             sqlstm.sqhsts[1] = (         int  )0;
             sqlstm.sqindv[1] = (         short *)0;
             sqlstm.sqinds[1] = (         int  )0;
             sqlstm.sqharm[1] = (unsigned long )0;
             sqlstm.sqadto[1] = (unsigned short )0;
             sqlstm.sqtdso[1] = (unsigned short )0;
             sqlstm.sqhstv[2] = (unsigned char  *)&m_befmon;
             sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[2] = (         int  )0;
             sqlstm.sqindv[2] = (         short *)0;
             sqlstm.sqinds[2] = (         int  )0;
             sqlstm.sqharm[2] = (unsigned long )0;
             sqlstm.sqadto[2] = (unsigned short )0;
             sqlstm.sqtdso[2] = (unsigned short )0;
             sqlstm.sqhstv[3] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[3] = (         int  )0;
             sqlstm.sqindv[3] = (         short *)0;
             sqlstm.sqinds[3] = (         int  )0;
             sqlstm.sqharm[3] = (unsigned long )0;
             sqlstm.sqadto[3] = (unsigned short )0;
             sqlstm.sqtdso[3] = (unsigned short )0;
             sqlstm.sqhstv[4] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[4] = (         int  )0;
             sqlstm.sqindv[4] = (         short *)0;
             sqlstm.sqinds[4] = (         int  )0;
             sqlstm.sqharm[4] = (unsigned long )0;
             sqlstm.sqadto[4] = (unsigned short )0;
             sqlstm.sqtdso[4] = (unsigned short )0;
             sqlstm.sqhstv[5] = (unsigned char  *)&avgroleamt;
             sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
             sqlstm.sqhsts[5] = (         int  )0;
             sqlstm.sqindv[5] = (         short *)0;
             sqlstm.sqinds[5] = (         int  )0;
             sqlstm.sqharm[5] = (unsigned long )0;
             sqlstm.sqadto[5] = (unsigned short )0;
             sqlstm.sqtdso[5] = (unsigned short )0;
             sqlstm.sqhstv[6] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[6] = (         int  )0;
             sqlstm.sqindv[6] = (         short *)0;
             sqlstm.sqinds[6] = (         int  )0;
             sqlstm.sqharm[6] = (unsigned long )0;
             sqlstm.sqadto[6] = (unsigned short )0;
             sqlstm.sqtdso[6] = (unsigned short )0;
             sqlstm.sqhstv[7] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[7] = (         int  )0;
             sqlstm.sqindv[7] = (         short *)0;
             sqlstm.sqinds[7] = (         int  )0;
             sqlstm.sqharm[7] = (unsigned long )0;
             sqlstm.sqadto[7] = (unsigned short )0;
             sqlstm.sqtdso[7] = (unsigned short )0;
             sqlstm.sqhstv[8] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[8] = (         int  )0;
             sqlstm.sqindv[8] = (         short *)0;
             sqlstm.sqinds[8] = (         int  )0;
             sqlstm.sqharm[8] = (unsigned long )0;
             sqlstm.sqadto[8] = (unsigned short )0;
             sqlstm.sqtdso[8] = (unsigned short )0;
             sqlstm.sqhstv[9] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[9] = (         int  )0;
             sqlstm.sqindv[9] = (         short *)0;
             sqlstm.sqinds[9] = (         int  )0;
             sqlstm.sqharm[9] = (unsigned long )0;
             sqlstm.sqadto[9] = (unsigned short )0;
             sqlstm.sqtdso[9] = (unsigned short )0;
             sqlstm.sqhstv[10] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[10] = (         int  )0;
             sqlstm.sqindv[10] = (         short *)0;
             sqlstm.sqinds[10] = (         int  )0;
             sqlstm.sqharm[10] = (unsigned long )0;
             sqlstm.sqadto[10] = (unsigned short )0;
             sqlstm.sqtdso[10] = (unsigned short )0;
             sqlstm.sqhstv[11] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[11] = (         int  )0;
             sqlstm.sqindv[11] = (         short *)0;
             sqlstm.sqinds[11] = (         int  )0;
             sqlstm.sqharm[11] = (unsigned long )0;
             sqlstm.sqadto[11] = (unsigned short )0;
             sqlstm.sqtdso[11] = (unsigned short )0;
             sqlstm.sqhstv[12] = (unsigned char  *)&m_islastret;
             sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[12] = (         int  )0;
             sqlstm.sqindv[12] = (         short *)0;
             sqlstm.sqinds[12] = (         int  )0;
             sqlstm.sqharm[12] = (unsigned long )0;
             sqlstm.sqadto[12] = (unsigned short )0;
             sqlstm.sqtdso[12] = (unsigned short )0;
             sqlstm.sqhstv[13] = (unsigned char  *)&LASTRET_N;
             sqlstm.sqhstl[13] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[13] = (         int  )0;
             sqlstm.sqindv[13] = (         short *)0;
             sqlstm.sqinds[13] = (         int  )0;
             sqlstm.sqharm[13] = (unsigned long )0;
             sqlstm.sqadto[13] = (unsigned short )0;
             sqlstm.sqtdso[13] = (unsigned short )0;
             sqlstm.sqhstv[14] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[14] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[14] = (         int  )0;
             sqlstm.sqindv[14] = (         short *)0;
             sqlstm.sqinds[14] = (         int  )0;
             sqlstm.sqharm[14] = (unsigned long )0;
             sqlstm.sqadto[14] = (unsigned short )0;
             sqlstm.sqtdso[14] = (unsigned short )0;
             sqlstm.sqhstv[15] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[15] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[15] = (         int  )0;
             sqlstm.sqindv[15] = (         short *)0;
             sqlstm.sqinds[15] = (         int  )0;
             sqlstm.sqharm[15] = (unsigned long )0;
             sqlstm.sqadto[15] = (unsigned short )0;
             sqlstm.sqtdso[15] = (unsigned short )0;
             sqlstm.sqhstv[16] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[16] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[16] = (         int  )0;
             sqlstm.sqindv[16] = (         short *)0;
             sqlstm.sqinds[16] = (         int  )0;
             sqlstm.sqharm[16] = (unsigned long )0;
             sqlstm.sqadto[16] = (unsigned short )0;
             sqlstm.sqtdso[16] = (unsigned short )0;
             sqlstm.sqhstv[17] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[17] = (         int  )0;
             sqlstm.sqindv[17] = (         short *)0;
             sqlstm.sqinds[17] = (         int  )0;
             sqlstm.sqharm[17] = (unsigned long )0;
             sqlstm.sqadto[17] = (unsigned short )0;
             sqlstm.sqtdso[17] = (unsigned short )0;
             sqlstm.sqhstv[18] = (unsigned char  *)&avgodamt;
             sqlstm.sqhstl[18] = (unsigned long )sizeof(double);
             sqlstm.sqhsts[18] = (         int  )0;
             sqlstm.sqindv[18] = (         short *)0;
             sqlstm.sqinds[18] = (         int  )0;
             sqlstm.sqharm[18] = (unsigned long )0;
             sqlstm.sqadto[18] = (unsigned short )0;
             sqlstm.sqtdso[18] = (unsigned short )0;
             sqlstm.sqhstv[19] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[19] = (         int  )0;
             sqlstm.sqindv[19] = (         short *)0;
             sqlstm.sqinds[19] = (         int  )0;
             sqlstm.sqharm[19] = (unsigned long )0;
             sqlstm.sqadto[19] = (unsigned short )0;
             sqlstm.sqtdso[19] = (unsigned short )0;
             sqlstm.sqhstv[20] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[20] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[20] = (         int  )0;
             sqlstm.sqindv[20] = (         short *)0;
             sqlstm.sqinds[20] = (         int  )0;
             sqlstm.sqharm[20] = (unsigned long )0;
             sqlstm.sqadto[20] = (unsigned short )0;
             sqlstm.sqtdso[20] = (unsigned short )0;
             sqlstm.sqhstv[21] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[21] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[21] = (         int  )0;
             sqlstm.sqindv[21] = (         short *)0;
             sqlstm.sqinds[21] = (         int  )0;
             sqlstm.sqharm[21] = (unsigned long )0;
             sqlstm.sqadto[21] = (unsigned short )0;
             sqlstm.sqtdso[21] = (unsigned short )0;
             sqlstm.sqhstv[22] = (unsigned char  *)&a_dudd;
             sqlstm.sqhstl[22] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[22] = (         int  )0;
             sqlstm.sqindv[22] = (         short *)0;
             sqlstm.sqinds[22] = (         int  )0;
             sqlstm.sqharm[22] = (unsigned long )0;
             sqlstm.sqadto[22] = (unsigned short )0;
             sqlstm.sqtdso[22] = (unsigned short )0;
             sqlstm.sqhstv[23] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[23] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[23] = (         int  )0;
             sqlstm.sqindv[23] = (         short *)0;
             sqlstm.sqinds[23] = (         int  )0;
             sqlstm.sqharm[23] = (unsigned long )0;
             sqlstm.sqadto[23] = (unsigned short )0;
             sqlstm.sqtdso[23] = (unsigned short )0;
             sqlstm.sqhstv[24] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[24] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[24] = (         int  )0;
             sqlstm.sqindv[24] = (         short *)0;
             sqlstm.sqinds[24] = (         int  )0;
             sqlstm.sqharm[24] = (unsigned long )0;
             sqlstm.sqadto[24] = (unsigned short )0;
             sqlstm.sqtdso[24] = (unsigned short )0;
             sqlstm.sqhstv[25] = (unsigned char  *)&m_dudd;
             sqlstm.sqhstl[25] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[25] = (         int  )0;
             sqlstm.sqindv[25] = (         short *)0;
             sqlstm.sqinds[25] = (         int  )0;
             sqlstm.sqharm[25] = (unsigned long )0;
             sqlstm.sqadto[25] = (unsigned short )0;
             sqlstm.sqtdso[25] = (unsigned short )0;
             sqlstm.sqhstv[26] = (unsigned char  *)&m_totdd;
             sqlstm.sqhstl[26] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[26] = (         int  )0;
             sqlstm.sqindv[26] = (         short *)0;
             sqlstm.sqinds[26] = (         int  )0;
             sqlstm.sqharm[26] = (unsigned long )0;
             sqlstm.sqadto[26] = (unsigned short )0;
             sqlstm.sqtdso[26] = (unsigned short )0;
             sqlstm.sqhstv[27] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[27] = (unsigned long )0;
             sqlstm.sqhsts[27] = (         int  )0;
             sqlstm.sqindv[27] = (         short *)0;
             sqlstm.sqinds[27] = (         int  )0;
             sqlstm.sqharm[27] = (unsigned long )0;
             sqlstm.sqadto[27] = (unsigned short )0;
             sqlstm.sqtdso[27] = (unsigned short )0;
             sqlstm.sqhstv[28] = (unsigned char  *)&m_befmon;
             sqlstm.sqhstl[28] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[28] = (         int  )0;
             sqlstm.sqindv[28] = (         short *)0;
             sqlstm.sqinds[28] = (         int  )0;
             sqlstm.sqharm[28] = (unsigned long )0;
             sqlstm.sqadto[28] = (unsigned short )0;
             sqlstm.sqtdso[28] = (unsigned short )0;
             sqlstm.sqhstv[29] = (unsigned char  *)m_retdate;
             sqlstm.sqhstl[29] = (unsigned long )0;
             sqlstm.sqhsts[29] = (         int  )0;
             sqlstm.sqindv[29] = (         short *)0;
             sqlstm.sqinds[29] = (         int  )0;
             sqlstm.sqharm[29] = (unsigned long )0;
             sqlstm.sqadto[29] = (unsigned short )0;
             sqlstm.sqtdso[29] = (unsigned short )0;
             sqlstm.sqhstv[30] = (unsigned char  *)&m_befmon;
             sqlstm.sqhstl[30] = (unsigned long )sizeof(int);
             sqlstm.sqhsts[30] = (         int  )0;
             sqlstm.sqindv[30] = (         short *)0;
             sqlstm.sqinds[30] = (         int  )0;
             sqlstm.sqharm[30] = (unsigned long )0;
             sqlstm.sqadto[30] = (unsigned short )0;
             sqlstm.sqtdso[30] = (unsigned short )0;
             sqlstm.sqhstv[31] = (unsigned char  *)m_empno;
             sqlstm.sqhstl[31] = (unsigned long )0;
             sqlstm.sqhsts[31] = (         int  )0;
             sqlstm.sqindv[31] = (         short *)0;
             sqlstm.sqinds[31] = (         int  )0;
             sqlstm.sqharm[31] = (unsigned long )0;
             sqlstm.sqadto[31] = (unsigned short )0;
             sqlstm.sqtdso[31] = (unsigned short )0;
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

          	          	
          	   /* printf("정산여부 else_20161231이후  : %s %s %d\n",m_empno,m_retdate, m_befmon)   ;       	                     	*/
          }		
          	
                	
                  
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
               sprintf(meg,"\n set_paysum() PKHRTAVG INSERT 2 [%d]\n",sqlca.sqlcode);
               return 1;
          }
     }
  
     /* 초과근무수당 */
     /* EXEC SQL
     UPDATE PKHRTAVG R SET
            OVTMAMT =
                     ( SELECT NVL(SUM(OVTMAMT),0)
                         FROM PKHOTHIS T
                        WHERE R.EMPNO = T.EMPNO
                          AND OVTMDATE LIKE TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM')||'%'
                          AND substr(OVTMDATE,7,2) >= decode(:m_befmon,-3,substr(:m_retdate,7,2),'01'))
      WHERE EMPNO   = :m_empno
        AND RETDATE = :m_retdate
        AND PAYDATE = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHRTAVG R  set OVTMAMT=(select NVL(sum(OVTMAMT)\
,0)  from PKHOTHIS T where ((R.EMPNO=T.EMPNO and OVTMDATE like (TO_CHAR(ADD_M\
ONTHS(TO_DATE(:b0,'YYYYMMDD'),:b1),'YYYYMM')||'%')) and substr(OVTMDATE,7,2)>\
=decode(:b1,(-3),substr(:b0,7,2),'01'))) where ((EMPNO=:b4 and RETDATE=:b0) a\
nd PAYDATE=TO_CHAR(ADD_MONTHS(TO_DATE(:b0,'YYYYMMDD'),:b1),'YYYYMM'))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2227;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[0] = (unsigned long )0;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&m_befmon;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&m_befmon;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[3] = (unsigned long )0;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)m_empno;
     sqlstm.sqhstl[4] = (unsigned long )0;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[5] = (unsigned long )0;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[6] = (unsigned long )0;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&m_befmon;
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


  
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
          sprintf(meg,"\n set_paysum() PKHRTAVG.OVTMAMT UPDATE 1 [%d]\n",sqlca.sqlcode);
          return 1;
     }
  
  /* ==== 1999.04.01 leerk 퇴직일-3개월 부터 퇴직일까지 해당월의 초과근무를 평균임금에 포함시킴니다.
      if (m_befmon != LASTRET_N)
      {
          EXEC SQL
          UPDATE PKHRTAVG R SET
            OVTMAMT =
              ( SELECT NVL(SUM(OVTMAMT),0)
                  FROM PKHOTHIS T
                  WHERE R.EMPNO = T.EMPNO
                    AND OVTMDATE LIKE TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM')||'%'
                    AND substr(OVTMDATE,7,2) >= decode(:m_befmon,-3,substr(:m_retdate,7,2),'01')
  *                  AND OVTMDATE <=   TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM')||LTRIM(TO_CHAR(:m_dudd,'00')) )*
            WHERE EMPNO   = :m_empno
              AND RETDATE = :m_retdate
              AND PAYDATE = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') ;
  
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
              sprintf(meg,"\n set_paysum() PKHRTAVG.OVTMAMT UPDATE 1 [%d]\n",sqlca.sqlcode);
              return 1;
          }
      }
      else
      {
          EXEC SQL
          UPDATE PKHRTAVG R SET
            OVTMAMT =
              ( SELECT NVL(SUM(OVTMAMT),0)
                  FROM PKHOTHIS T
                  WHERE R.EMPNO = T.EMPNO
                    AND OVTMDATE LIKE TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM')||'%'
                      AND OVTMDATE >=   TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM')||LTRIM(TO_CHAR(:m_dudd,'00')) )
            WHERE EMPNO   = :m_empno
              AND RETDATE = :m_retdate
              AND PAYDATE = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') ;
  
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
              sprintf(meg,"\n set_paysum() PKHRTAVG.OVTMAMT UPDATE 2 [%d]\n",sqlca.sqlcode);
              return 1;
          }
      }
  ========================================== */
     /*월차수당 SETTING 1월분 월차가 3월에 지급되므로 01,02월에는 월차 해당없슴 
          EXEC SQL
          UPDATE   PKHRTAVG R 
    SET  MBONAMT = (SELECT DECODE(SUBSTR(PAYDATE,5,2),'01',0,'02',0 ,MBONAMT)
          FROM   PKHPHIS B
          WHERE  SUBSTR(R.PAYDATE,1,4)=SUBSTR(B.PAYDATE,1,4)
          AND    B.PAYDATE = R.PAYDATE  
          AND    B.EMPNO   = R.EMPNO    )
            WHERE EMPNO   = :m_empno
              AND RETDATE = :m_retdate
              AND PAYDATE = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') ;
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
              sprintf(meg,"\n set_paysum() PKHRTAVG.MBONAMT UPDATE 1 [%d]\n",sqlca.sqlcode);
              return 1;
          }
  
  
          EXEC SQL
          UPDATE   PKHRTAVG R 
    SET  MBONAMT = NVL(MBONAMT,0)
            WHERE EMPNO   = :m_empno
              AND RETDATE = :m_retdate
              AND PAYDATE = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:m_befmon),'YYYYMM') ;
  
          if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
              sprintf(meg,"\n set_paysum() PKHRTAVG.MBONAMT UPDATE 2 [%d]\n",sqlca.sqlcode);
              return 1;
          }
  
       마지막월에 한꺼번에 들어가도록 함 */
     return 0;
}

/* =============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
  30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
============================================================================= */
/* 연차수당, 월차수당 추출
 *   (사번, 퇴직일, 말일퇴직여부)
 * --> UPDATE INTO PKHRTAVG (MBONAMT, YBONAMT) : PAYDATE는 퇴직월
 *
 *   1. 월차수당은
 *        말일퇴직이면: 퇴직월  월차 + 퇴직월  기준평균임금 반영월차 * 2
 *        중도퇴직이며: 퇴직전월월차 + 퇴직전월기준평균임금 반영월차 * 2
 *   2. 연차수당은 전년도 12월의 연차수당
 */
int set_yearmonsum(char *m_empno,char *m_retdate,int m_islastret, char *meg)
{
     /* 월차수당  */
     /* get_mr_avgpay(char *empno, char* baseyymm, float* avgpay1, float* avgpay2) */
     int bef_mon = 0;
     
     if  (m_islastret == LASTRET_Y)
          bef_mon =  0;
     else
          bef_mon = -1;
     
     /* 월차수당 (최종급여월) */
     /* EXEC SQL
     UPDATE PKHRTAVG A SET
            MBONAMT = 0 /o: 2005년 1월부터 월차수당 폐지. DSA2000   0으로 업데이트.
            ( SELECT NVL( SUM(H.MBONAMT) + SUM(R.MONTHAMT) * 2, 0 )
                FROM PKHPHIS H, T_PKMRTMO R
                WHERE R.EMPNO   = A.EMPNO
                  AND R.RETDATE = A.RETDATE
                  AND R.EMPNO   = H.EMPNO
                  AND H.PAYDATE = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),:bef_mon),'YYYYMM') ) o/
      WHERE EMPNO   = :m_empno
        AND RETDATE = :m_retdate
        AND PAYDATE = SUBSTR(:m_retdate,1,6) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHRTAVG A  set MBONAMT=0 where ((EMPNO=:b0 and \
RETDATE=:b1) and PAYDATE=SUBSTR(:b1,1,6))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2274;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)m_empno;
     sqlstm.sqhstl[0] = (unsigned long )0;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
     sqlstm.sqhstl[1] = (unsigned long )0;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)m_retdate;
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


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
          sprintf(meg,"\n set_yearmonsum() PKHRTAVG.MBONAMT UPDATE [%d]\n",sqlca.sqlcode);
          return 1;
     }
     
     /* 연차수당 (최종급여월) */
     /*2016.12.20 eyha 2016년 임단협 결정- 연차수당은 2017~2018년은 예상연차수당으로 나머지 전년도 급여이력의 연차수당으로(즉 기존 그대로)
     EXEC SQL
     UPDATE PKHRTAVG R SET
            YBONAMT =
              ( SELECT NVL(SUM(YBONAMT),0)
                  FROM PKHPHIS T
                  WHERE R.EMPNO = T.EMPNO
                    AND T.PAYDATE = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),-12),'YYYY')||'12' )
      WHERE EMPNO   = :m_empno
        AND RETDATE = :m_retdate
        AND PAYDATE = SUBSTR(:m_retdate,1,6) ;   */

     if ((strcmp(m_retdate,"20170101") >= 0) && (strcmp(m_retdate,"20181231") <= 0)) 
     {
       /* EXEC SQL
       UPDATE PKHRTAVG R SET
            YBONAMT = 
                ( SELECT YBONAMT
                  FROM PKBONSIM T
                  WHERE R.EMPNO  = T.EMPNO
                    AND T.WORKYY = SUBSTR(:m_retdate,1,4)) 
       WHERE EMPNO   = :m_empno
         AND RETDATE = :m_retdate
         AND PAYDATE = SUBSTR(:m_retdate,1,6) ; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 47;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKHRTAVG R  set YBONAMT=(select YBONAMT  from \
PKBONSIM T where (R.EMPNO=T.EMPNO and T.WORKYY=SUBSTR(:b0,1,4))) where ((EMPN\
O=:b1 and RETDATE=:b0) and PAYDATE=SUBSTR(:b0,1,6))";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )2301;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)m_retdate;
       sqlstm.sqhstl[0] = (unsigned long )0;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)m_empno;
       sqlstm.sqhstl[1] = (unsigned long )0;
       sqlstm.sqhsts[1] = (         int  )0;
       sqlstm.sqindv[1] = (         short *)0;
       sqlstm.sqinds[1] = (         int  )0;
       sqlstm.sqharm[1] = (unsigned long )0;
       sqlstm.sqadto[1] = (unsigned short )0;
       sqlstm.sqtdso[1] = (unsigned short )0;
       sqlstm.sqhstv[2] = (unsigned char  *)m_retdate;
       sqlstm.sqhstl[2] = (unsigned long )0;
       sqlstm.sqhsts[2] = (         int  )0;
       sqlstm.sqindv[2] = (         short *)0;
       sqlstm.sqinds[2] = (         int  )0;
       sqlstm.sqharm[2] = (unsigned long )0;
       sqlstm.sqadto[2] = (unsigned short )0;
       sqlstm.sqtdso[2] = (unsigned short )0;
       sqlstm.sqhstv[3] = (unsigned char  *)m_retdate;
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

     	     	
         	
       /* EXEC SQL
       UPDATE PKHRTAVG R SET
            YBONAMT = NVL(YBONAMT,0)
       WHERE EMPNO   = :m_empno
         AND RETDATE = :m_retdate; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 47;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKHRTAVG R  set YBONAMT=NVL(YBONAMT,0) where (\
EMPNO=:b0 and RETDATE=:b1)";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )2332;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)m_empno;
       sqlstm.sqhstl[0] = (unsigned long )0;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
       sqlstm.sqhstl[1] = (unsigned long )0;
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
       UPDATE PKHRTAVG R SET
            YBONAMT =
              ( SELECT NVL(SUM(YBONAMT),0)
                  FROM PKHPHIS T
                  WHERE R.EMPNO = T.EMPNO
                    AND SUBSTR(T.PAYDATE,1,6) = TO_CHAR(ADD_MONTHS(TO_DATE(:m_retdate,'YYYYMMDD'),-12),'YYYY')||'12' )
       WHERE EMPNO   = :m_empno
         AND RETDATE = :m_retdate
         AND PAYDATE = SUBSTR(:m_retdate,1,6) ; */ 

{
       struct sqlexd sqlstm;
       sqlstm.sqlvsn = 12;
       sqlstm.arrsiz = 47;
       sqlstm.sqladtp = &sqladt;
       sqlstm.sqltdsp = &sqltds;
       sqlstm.stmt = "update PKHRTAVG R  set YBONAMT=(select NVL(sum(YBONAM\
T),0)  from PKHPHIS T where (R.EMPNO=T.EMPNO and SUBSTR(T.PAYDATE,1,6)=(TO_CH\
AR(ADD_MONTHS(TO_DATE(:b0,'YYYYMMDD'),(-12)),'YYYY')||'12'))) where ((EMPNO=:\
b1 and RETDATE=:b0) and PAYDATE=SUBSTR(:b0,1,6))";
       sqlstm.iters = (unsigned int  )1;
       sqlstm.offset = (unsigned int  )2355;
       sqlstm.cud = sqlcud0;
       sqlstm.sqlest = (unsigned char  *)&sqlca;
       sqlstm.sqlety = (unsigned short)4352;
       sqlstm.occurs = (unsigned int  )0;
       sqlstm.sqhstv[0] = (unsigned char  *)m_retdate;
       sqlstm.sqhstl[0] = (unsigned long )0;
       sqlstm.sqhsts[0] = (         int  )0;
       sqlstm.sqindv[0] = (         short *)0;
       sqlstm.sqinds[0] = (         int  )0;
       sqlstm.sqharm[0] = (unsigned long )0;
       sqlstm.sqadto[0] = (unsigned short )0;
       sqlstm.sqtdso[0] = (unsigned short )0;
       sqlstm.sqhstv[1] = (unsigned char  *)m_empno;
       sqlstm.sqhstl[1] = (unsigned long )0;
       sqlstm.sqhsts[1] = (         int  )0;
       sqlstm.sqindv[1] = (         short *)0;
       sqlstm.sqinds[1] = (         int  )0;
       sqlstm.sqharm[1] = (unsigned long )0;
       sqlstm.sqadto[1] = (unsigned short )0;
       sqlstm.sqtdso[1] = (unsigned short )0;
       sqlstm.sqhstv[2] = (unsigned char  *)m_retdate;
       sqlstm.sqhstl[2] = (unsigned long )0;
       sqlstm.sqhsts[2] = (         int  )0;
       sqlstm.sqindv[2] = (         short *)0;
       sqlstm.sqinds[2] = (         int  )0;
       sqlstm.sqharm[2] = (unsigned long )0;
       sqlstm.sqadto[2] = (unsigned short )0;
       sqlstm.sqtdso[2] = (unsigned short )0;
       sqlstm.sqhstv[3] = (unsigned char  *)m_retdate;
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


     }
     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
          sprintf(meg,"\n set_yearmonsum() PKHRTAVG.YBONAMT UPDATE [%d]\n",sqlca.sqlcode);
          return 1;
     }
     
     return 0;
}

/* =============================================================================
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
  30.00       1999.03.05         윤형식        하나로인사재개발  퇴직정산계산로직변경
============================================================================= */
/* 3개월급여합, 12개월상여합, 일할일수합 추출
 *   (사번,퇴직일,직급구분,3개월급여합,12개월상여합,통상임금,특별근무수당,일할일수합)
 * return value : pay3sum,bon12sum,commonamt,sptmamt,termdd
 *
 * 임원  : 3개월급여합  := (급여마스터).기본급 + 직무수당
 *         12개월상여합 := 0
 *         일할일수합   := 0
 *         통상임금     := (급여마스터).기본급 + 직무수당
 *         특별근무수당 := 0
 * 정규직: 3개월급여합  := PKHRTAVG.각 항목들(특별근무수당제외)
 *         12개월상여합 := PKHRTAVG.ybonamt
 *         일할일수합   := sum(PKHRTAVG.DUDD)
 *         통상임금     := 연봉표(pkhyphis).totpay / 23
 *         특별근무수당 := PKHRTAVG.특별근무수당
 */
int    get_avgpay(  char *m_empno, char *m_retdate, int m_gubuncl, 
double *m_pay3sum, double *m_bon12sum, double *m_commonamt, 
double *m_sptmamt, int *m_termdd, char *meg)
{

     double  t_pay3sum    = 0;
     double  t_bon12sum   = 0;
     double  t_sptmamt    = 0;
     double  t_commonamt  = 0;
     int     t_termdd     = 0;
    
     /*--------------------------------------------------------------------------------------------------------*/     
     /* PKCAFLD(통상평균임금항목관리) 테이블적용을 위한 Sql문을 저장하는 변수선언 및 Clear [2018-09-13 이상용] */
     /*--------------------------------------------------------------------------------------------------------*/     
     char   sqlstr[512];
     char   sumstr[128];
     
     memset(sqlstr,'\0',sizeof(sqlstr));
     memset(sumstr,'\0',sizeof(sumstr));   
     /*--------------------------------------------------------------------------------------------------------*/     

     /* 초기화 */
     
     *m_pay3sum  = 0;
     *m_bon12sum = 0;
     *m_termdd   = 0;
     *m_sptmamt  = 0;

     /* EXEC SQL
     SELECT  NVL(SPTMSUM,0) 
       INTO  :t_sptmamt
       FROM  PKMRTMAS R
      WHERE  EMPNO = :m_empno ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select NVL(SPTMSUM,0) into :b0  from PKMRTMAS R where E\
MPNO=:b1";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2386;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&t_sptmamt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)m_empno;
     sqlstm.sqhstl[1] = (unsigned long )0;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
          sprintf(meg,"\n get_avgpay() PKMPMAS.sptmsum SELECT .1 [%d]\n",sqlca.sqlcode);
          return 1;
     }
     
    
     if (m_gubuncl == 0) /* 임원 */
     {
/*        EXEC SQL
**        SELECT NVL(M.BASICAMT,0) + NVL(M.DUTYAMT,0)
**            INTO :m_commonamt[0]
**        FROM PKMPMAS M, PKMRTMAS R
**        WHERE M.EMPNO = R.EMPNO
**          AND R.EMPNO = :m_empno ;
*/
        /* EXEC SQL
/o        SELECT CEIL(NVL(TOTPAY,0)/18)   통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 o/
        SELECT CEIL((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3) /12)  /o 2014.11.10 하은영 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
          INTO :t_commonamt
          FROM PKHYPHIS A
         WHERE EMPNO = :m_empno
           AND YEARPAYNUM = (SELECT TO_CHAR(YEARPAYNUM) FROM PKCPBAS B ) ; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 47;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select CEIL(((((TOTPAY+TONGAMT1)+TONGAMT2)+TONGAMT3)\
/12)) into :b0  from PKHYPHIS A where (EMPNO=:b1 and YEARPAYNUM=(select TO_CH\
AR(YEARPAYNUM)  from PKCPBAS B ))";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2409;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&t_commonamt;
        sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)m_empno;
        sqlstm.sqhstl[1] = (unsigned long )0;
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



        if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
        {
             sprintf(meg,"\n get_avgpay() PKMPMAS.COMMONAMT SELECT 1 [%d]\n",sqlca.sqlcode);
             return 1;
        }
        
    }
    else
    {
         /* EXEC SQL
/o         SELECT CEIL(NVL(TOTPAY,0)/18)   통상임금변경 /23 -> /18 로 변경함 kth 2009.03.11 o/
         SELECT CEIL((TOTPAY + TONGAMT1 + TONGAMT2 + TONGAMT3) /12)  /o 2014.11.10 하은영 하은영 통상임금 규정변경으로 인한 시스템 적용 (18 -> 12, 통상임금, 통상임금수당도 포함) o/
             INTO :t_commonamt
         FROM PKHYPHIS A
         WHERE EMPNO = :m_empno
           AND YEARPAYNUM = (SELECT TO_CHAR(YEARPAYNUM) FROM PKCPBAS B ) ; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 47;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select CEIL(((((TOTPAY+TONGAMT1)+TONGAMT2)+TONGAMT3\
)/12)) into :b0  from PKHYPHIS A where (EMPNO=:b1 and YEARPAYNUM=(select TO_C\
HAR(YEARPAYNUM)  from PKCPBAS B ))";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )2432;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)&t_commonamt;
         sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)m_empno;
         sqlstm.sqhstl[1] = (unsigned long )0;
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


         
         if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
         {
              sprintf(meg,"\n get_avgpay() PKHYPHIS.TOTPAY SELECT 2 [%d]\n",sqlca.sqlcode);
              return 1;
         }
    }

    if  (m_gubuncl == 0) /* 임원 */
    {
         /*  
         ** EXEC SQL
         ** SELECT NVL(BASICAMT,0) + NVL(DUTYAMT,0),
         **         0,                 0
         **   INTO :m_pay3sum[0], :m_bon12sum[0], :m_termdd[0]
         **    FROM PKMPMAS
         **     WHERE EMPNO = :m_empno ;
         **        
         **
         **   if (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
         **   {
         **       sprintf(meg,"\n get_avgpay() PKMPMAS.PAY3SUM,BON12SUM,DUDD SELECT 1 [%d]\n",sqlca.sqlcode);
         **       return 1;
         **   }
         */
    }
    /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 평균임금 구함 Start [2018-09-13 이상용] */
    else if (strcmp(m_retdate,"20180430") <= 0)
    {
          /* EXEC SQL
          SELECT NVL( SUM(NVL(FIXPAY,0)  + NVL(ROLEAMT,0) +
                          NVL(LICEAMT,0) + NVL(FAMIAMT,0) +
                          NVL(OVTMAMT,0) +
                          NVL(MBONAMT,0) + NVL(SOPAYAMT,0)+ NVL(SOBONAMT,0) +   /o  2000.9.25. SOBONAMT 추가 o/
                         NVL(MCARAMT,0) + NVL(ODAMT,0)   + NVL(ITAMT,0)  ), 0), /o  DSA2000  2005.01. ITAMT ADD o/
                 NVL( SUM(NVL(YBONAMT,0)), 0),
                 NVL( SUM(NVL(DUDD,0)), 0)
            INTO :t_pay3sum, :t_bon12sum,  :t_termdd  
            FROM PKHRTAVG
           WHERE EMPNO = :m_empno
             AND RETDATE = :m_retdate; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 47;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select NVL(sum(((((((((((NVL(FIXPAY,0)+NVL(ROLEAMT\
,0))+NVL(LICEAMT,0))+NVL(FAMIAMT,0))+NVL(OVTMAMT,0))+NVL(MBONAMT,0))+NVL(SOPA\
YAMT,0))+NVL(SOBONAMT,0))+NVL(MCARAMT,0))+NVL(ODAMT,0))+NVL(ITAMT,0))),0) ,NV\
L(sum(NVL(YBONAMT,0)),0) ,NVL(sum(NVL(DUDD,0)),0) into :b0,:b1,:b2  from PKHR\
TAVG where (EMPNO=:b3 and RETDATE=:b4)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2455;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&t_pay3sum;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&t_bon12sum;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&t_termdd;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)m_empno;
          sqlstm.sqhstl[3] = (unsigned long )0;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)m_retdate;
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



          /* debug******************************************** */ 
          /* printf("\n 계산대상총일수 termdd %d",m_termdd[0]) */
          /* ************************************************* */
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
               sprintf(meg,"\n get_avgpay() PKHRTAVG.PAY3SUM,BON12SUM,DUDD SELECT 2 [%d]\n",sqlca.sqlcode);
               return 1;
          }

     }
    else
    {
          memset(sqlstr,'\0',sizeof(sqlstr));
          memset(sumstr,'\0',sizeof(sumstr));   
    
          /* EXEC SQL
          SELECT REPLACE(REGEXP_REPLACE(WM_CONCAT(A.DATAFLD), ',', '+'),'SOPAY','SOPAYAMT')
            INTO :sumstr  
            FROM PKCAFLD A
           WHERE A.PAYKIND = '2'
             AND SUBSTR(:m_retdate,1,6) BETWEEN A.FMONTH AND A.TMONTH; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 47;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select REPLACE(REGEXP_REPLACE(WM_CONCAT(A.DATAFLD)\
,',','+'),'SOPAY','SOPAYAMT') into :b0  from PKCAFLD A where (A.PAYKIND='2' a\
nd SUBSTR(:b1,1,6) between A.FMONTH and A.TMONTH)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2490;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)sumstr;
          sqlstm.sqhstl[0] = (unsigned long )128;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)m_retdate;
          sqlstm.sqhstl[1] = (unsigned long )0;
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

     

          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
          {
               sprintf(meg,"\n get_avgpay() PKCAFLD SELECT 1 [%d]\n",sqlca.sqlcode);
               return 1;
          }

          sprintf(sqlstr," SELECT NVL(SUM(%s), 0),NVL( SUM(NVL(YBONAMT,0)), 0),NVL( SUM(NVL(DUDD,0)), 0) FROM PKHRTAVG WHERE EMPNO = '%s' AND RETDATE = '%s' ",sumstr, m_empno, m_retdate );

          /* EXEC SQL PREPARE AVG_PAY_PRE FROM :sqlstr; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 47;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2513;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)sqlstr;
          sqlstm.sqhstl[0] = (unsigned long )512;
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


          
          if(SQLCODE != 0) {
              sprintf(meg,"\n get_avgpay() PKCAFLD SELECT 1 [%d]\n",sqlca.sqlcode);
              return 1;
          }
      
          /* EXEC SQL DECLARE AVG_PAY_CUR CURSOR FOR AVG_PAY_PRE; */ 

          
          /* EXEC SQL OPEN AVG_PAY_CUR; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 47;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2532;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqcmod = (unsigned int )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



          if(SQLCODE != 0) {
              sprintf(meg,"\n get_avgpay() cursor open error(%d)n [%d]\n",sqlca.sqlcode);
              return 1;
          }

          while(1) {
              /* EXEC SQL FETCH AVG_PAY_CUR
                  INTO :t_pay3sum, :t_bon12sum,  :t_termdd 
              ; */ 

{
              struct sqlexd sqlstm;
              sqlstm.sqlvsn = 12;
              sqlstm.arrsiz = 47;
              sqlstm.sqladtp = &sqladt;
              sqlstm.sqltdsp = &sqltds;
              sqlstm.iters = (unsigned int  )1;
              sqlstm.offset = (unsigned int  )2547;
              sqlstm.selerr = (unsigned short)1;
              sqlstm.cud = sqlcud0;
              sqlstm.sqlest = (unsigned char  *)&sqlca;
              sqlstm.sqlety = (unsigned short)4352;
              sqlstm.occurs = (unsigned int  )0;
              sqlstm.sqfoff = (         int )0;
              sqlstm.sqfmod = (unsigned int )2;
              sqlstm.sqhstv[0] = (unsigned char  *)&t_pay3sum;
              sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[0] = (         int  )0;
              sqlstm.sqindv[0] = (         short *)0;
              sqlstm.sqinds[0] = (         int  )0;
              sqlstm.sqharm[0] = (unsigned long )0;
              sqlstm.sqadto[0] = (unsigned short )0;
              sqlstm.sqtdso[0] = (unsigned short )0;
              sqlstm.sqhstv[1] = (unsigned char  *)&t_bon12sum;
              sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
              sqlstm.sqhsts[1] = (         int  )0;
              sqlstm.sqindv[1] = (         short *)0;
              sqlstm.sqinds[1] = (         int  )0;
              sqlstm.sqharm[1] = (unsigned long )0;
              sqlstm.sqadto[1] = (unsigned short )0;
              sqlstm.sqtdso[1] = (unsigned short )0;
              sqlstm.sqhstv[2] = (unsigned char  *)&t_termdd;
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


      
              if(SQLCODE != 0) {
                  if(SQLCODE == 1403) {
                      break;
                  }
                  sprintf(meg,"\n get_avgpay() cursor fetch error(%d)n [%d]\n",sqlca.sqlcode);
                  return 1;
              }
      
              printf("\n empno[%s],retdate[%s],pay3sum[%10f.0],termdd[%d],bon12sum[%10f.0],sptmamt[%10f.0],commonamt[%10f.0]",
                      m_empno,m_retdate,t_pay3sum,t_termdd,t_bon12sum,t_sptmamt,t_commonamt);
          }
      
          /* EXEC SQL CLOSE AVG_PAY_CUR; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 47;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2574;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

          
    /* PKCAFLD(통상평균임금항목관리) 테이블을 활용하여 평균임금 구함 End [2018-09-13 이상용] */
    }
    
    /* EXEC SQL
    SELECT :t_pay3sum, :t_bon12sum,  :t_termdd, :t_commonamt, :t_sptmamt
      INTO :m_pay3sum[0], :m_bon12sum[0],  :m_termdd[0], :m_commonamt[0], :m_sptmamt[0]  
      FROM dual; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 47;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select :b0 ,:b1 ,:b2 ,:b3 ,:b4 into :b5,:b6,:b7,:b8,:b9 \
 from dual ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )2589;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&t_pay3sum;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&t_bon12sum;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&t_termdd;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&t_commonamt;
    sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&t_sptmamt;
    sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&m_pay3sum[0];
    sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&m_bon12sum[0];
    sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&m_termdd[0];
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&m_commonamt[0];
    sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&m_sptmamt[0];
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



     return 0;
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
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2644;
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
     sqlstm.arrsiz = 47;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2685;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}
