
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
    "pkg3071g.pc"
};


static unsigned int sqlctx = 151619;


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
   unsigned char  *sqhstv[38];
   unsigned long  sqhstl[38];
            int   sqhsts[38];
            short *sqindv[38];
            int   sqinds[38];
   unsigned long  sqharm[38];
   unsigned long  *sqharc[38];
   unsigned short  sqadto[38];
   unsigned short  sqtdso[38];
} sqlstm = {12,38};

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

 static char *sq0016 = 
"select NVL(OVTMDATE,' ') ,NVL(A.EMPNO,' ') ,NVL(A.KORNAME,' ') ,NVL(D.PAYCL\
,' ') ,NVL(FRAPPTIME,'*') ,NVL(FRREALTIME,'*') ,NVL(TOREALTIME,'*') ,totpay ,\
nvl(restmm,0) ,nvl(sprestmm,0) ,NVL(trim(TJOBDUTY),' ') ,NVL(A.OTFLAG,' ')  f\
rom PKHOTHIS A ,PKHDYPHIS B ,PIMPMAS D where (((((SUBSTR(OVTMDATE,1,6)=:b0 an\
d (A.EMPNO>=:b1 and A.EMPNO<=:b2)) and A.EMPNO=B.EMPNO) and B.EMPNO=D.EMPNO) \
and UPPER(NVL(CONYN,' '))='Y') and D.PAYCL>='D91') order by A.EMPNO,OVTMDATE \
           ";

 static char *sq0018 = 
"select NVL(OVTMDATE,' ') ,NVL(A.EMPNO,' ') ,NVL(A.KORNAME,' ') ,NVL(A.PAYCL\
,' ') ,NVL(FRAPPTIME,'*') ,NVL(FRREALTIME,'*') ,NVL(TOREALTIME,'*') ,totpay ,\
NVL(RESTMM,0) ,NVL(SPRESTMM,0) ,NVL(A.OTFLAG,' ')  from PKHOTHIS A ,PKHYPHIS \
B where (((((SUBSTR(OVTMDATE,1,6)=:b0 and (A.EMPNO>=:b1 and A.EMPNO<=:b2)) an\
d B.YEARPAYNUM=:b3) and A.EMPNO=B.EMPNO) and UPPER(NVL(CONYN,' '))='Y') and P\
AYCL<='D41') order by A.EMPNO,OVTMDATE            ";

 static char *sq0020 = 
"select NVL(A.OVTMDATE,' ') OVTMDATE ,NVL(A.EMPNO,' ') EMPNO ,NVL(A.KORNAME,\
' ') KORNAME ,NVL(A.PAYCL,' ') PAYCL ,NVL(A.FRAPPTIME,'*') FRAPPTIME ,NVL(A.F\
RREALTIME,'*') FRREALTIME ,NVL(A.TOREALTIME,'*') TOREALTIME ,NVL(TOTPAY,0) ,s\
ubstr(NVL(A.CONLTIME,'00000000'),1,8) CONLTIME ,CONLEMP ,NVL(A.RESTMM,0) REST\
MM ,NVL(A.SPRESTMM,0) SPRESTMM ,NVL(D.TJOBDUTY,' ') TJOBDUTY , case  when OVT\
MDATE<:b0 then hper.COMMONUTIL.GET_OLDBASEPAY(a.EMPNO,c.YEARPAYNUM) else hper\
.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO,c.YEARPAYNUM)  end  tongpay ,NVL(A.OTFLAG,\
' ') OTFLAG  from PKHOTHIS A ,PKHYPHIS B ,PKCPBAS C ,PIMPMAS D where ((((((((\
OVTMDATE between :b1 and :b2 and A.EMPNO>=:b3) and A.EMPNO<=:b4) and TO_CHAR(\
C.YEARPAYNUM)=B.YEARPAYNUM) and A.EMPNO not like 'Y%') and A.EMPNO=B.EMPNO) a\
nd B.EMPNO=D.EMPNO) and UPPER(NVL(A.CONYN,' '))='Y') and A.WRITETIME='***') o\
rder by EMPNO,OVTMDATE            ";

 static char *sq0022 = 
"select NVL(A.OVTMDATE,' ') OVTMDATE ,NVL(A.EMPNO,' ') EMPNO ,NVL(A.KORNAME,\
' ') KORNAME ,NVL(A.PAYCL,' ') PAYCL ,NVL(A.FRAPPTIME,'*') FRAPPTIME ,NVL(A.F\
RREALTIME,'*') FRREALTIME ,NVL(A.TOREALTIME,'*') TOREALTIME ,NVL(TOTPAY,0) ,s\
ubstr(NVL(A.CONLTIME,'00000000'),1,8) CONLTIME ,CONLEMP ,NVL(A.RESTMM,0) REST\
MM ,NVL(A.SPRESTMM,0) SPRESTMM ,NVL(D.TJOBDUTY,' ') TJOBDUTY , case  when a.O\
VTMDATE<:b0 then hper.COMMONUTIL.GET_OLDBASEPAY(a.EMPNO,c.DISYEARPAYNUM) else\
 hper.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO,c.DISYEARPAYNUM)  end  tongpay ,NVL(A\
.OTFLAG,' ') OTFLAG  from PKHOTHIS A ,PKHDYPHIS B ,PKCPBAS C ,PIMPMAS D where\
 ((((((((OVTMDATE between :b1 and :b2 and A.EMPNO>=:b3) and A.EMPNO<=:b4) and\
 TO_CHAR(C.DISYEARPAYNUM)=B.YEARPAYNUM) and A.EMPNO like 'Y%') and A.EMPNO=B.\
EMPNO) and B.EMPNO=D.EMPNO) and UPPER(NVL(A.CONYN,' '))='Y') and A.WRITETIME=\
'***')           ";

 static char *sq0024 = 
"select NVL(OVTMDATE,' ') ,NVL(A.EMPNO,' ') ,NVL(A.KORNAME,' ') ,NVL(A.PAYCL\
,' ') ,NVL(FRAPPTIME,'*') ,NVL(FRREALTIME,'*') ,NVL(TOREALTIME,'*') ,totpay ,\
substr(NVL(CONLTIME,'00000000'),1,8) ,CONLEMP ,NVL(RESTMM,0) ,NVL(SPRESTMM,0)\
 ,NVL(TJOBDUTY,' ') , case  when OVTMDATE<:b0 then hper.COMMONUTIL.GET_OLDBAS\
EPAY(a.EMPNO,c.YEARPAYNUM) else hper.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO,c.YEAR\
PAYNUM)  end   from PKHOTHIS A ,PKHYPHIS B ,PKCPBAS C ,PIMPMAS D where ((((((\
((OVTMDATE between :b1 and :b2 and A.EMPNO>=:b3) and A.EMPNO<=:b4) and TO_CHA\
R(C.YEARPAYNUM)=B.YEARPAYNUM) and A.EMPNO=B.EMPNO) and B.EMPNO=D.EMPNO) and O\
TFLAG is null ) and UPPER(NVL(CONYN,' '))='Y') and A.WRITETIME='***') order b\
y A.EMPNO,OVTMDATE            ";

 static char *sq0026 = 
"select NVL(OVTMDATE,' ') ,NVL(A.EMPNO,' ') ,NVL(A.KORNAME,' ') ,NVL(A.PAYCL\
,' ') ,NVL(FRAPPTIME,'*') ,NVL(FRREALTIME,'*') ,NVL(TOREALTIME,'*') ,totpay ,\
NVL(RESTMM,0) ,NVL(SPRESTMM,0)  from PKHOTHIS A ,PKHYPHIS B where ((((((SUBST\
R(OVTMDATE,1,6)=:b0 and (A.EMPNO>=:b1 and A.EMPNO<=:b2)) and B.YEARPAYNUM=:b3\
) and A.EMPNO=B.EMPNO) and UPPER(NVL(CONYN,' '))='Y') and OTFLAG is null ) an\
d PAYCL<='D41') order by A.EMPNO,OVTMDATE            ";

 static char *sq0037 = 
"select A.EMPNO EMPNO ,count(*)  ,sum(EXTHH) ,sum(NIGHTHH) ,sum(HOLIHH) ,sum\
(OVTMHH) ,sum(GENEXT) ,sum(HOLIEXT) ,sum(EXTAMT) ,sum(NIGHTAMT) ,sum(HOLIAMT)\
 ,sum(OVTMAMT) ,sum(OVTMHH) ,sum(OVMCAMT) ,B.TOTPAY  from PKHOTHIS A ,PKHYPHI\
S B where ((((A.EMPNO=B.EMPNO and B.YEARPAYNUM=:b0) and SUBSTR(OVTMDATE,1,6)=\
:b1) and (A.EMPNO>=:b2 and A.EMPNO<=:b3)) and UPPER(NVL(CONYN,' '))='Y') grou\
p by A.EMPNO,B.TOTPAY union all select A.EMPNO ,count(*)  ,sum(A.EXTHH) ,sum(\
A.NIGHTHH) ,sum(A.HOLIHH) ,sum(A.OVTMHH) ,sum(A.GENEXT) ,sum(A.HOLIEXT) ,sum(\
A.EXTAMT) ,sum(A.NIGHTAMT) ,sum(A.HOLIAMT) ,sum(A.OVTMAMT) ,sum(A.OVTMHH) ,su\
m(A.OVMCAMT) ,B.TOTPAY  from PKHOTHIS A ,PKHDYPHIS B where ((((A.EMPNO=B.EMPN\
O and SUBSTR(OVTMDATE,1,6)=:b1) and (A.EMPNO>=:b2 and A.EMPNO<=:b3)) and A.EM\
PNO like 'Y%') and UPPER(NVL(CONYN,' '))='Y') group by A.EMPNO,B.TOTPAY order\
 by EMPNO            ";

 static char *sq0053 = 
"select EMPNO ,DAYKIND ,sum(OVTMHH) ,sum(OVTMAMT)  from PKHOTHIS where ((SUB\
STR(OVTMDATE,1,6)=:b0 and (EMPNO>=:b1 and EMPNO<=:b2)) and UPPER(NVL(CONYN,' \
'))='Y') group by EMPNO,DAYKIND order by EMPNO,DAYKIND            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,55,0,4,277,0,0,1,0,0,1,0,2,97,0,0,
24,0,0,2,88,0,4,297,0,0,1,0,0,1,0,2,97,0,0,
43,0,0,3,72,0,4,302,0,0,3,1,0,1,0,1,97,0,0,2,97,0,0,2,97,0,0,
70,0,0,4,53,0,4,329,0,0,1,0,0,1,0,2,97,0,0,
89,0,0,5,44,0,1,337,0,0,0,0,0,1,0,
104,0,0,6,63,0,4,473,0,0,1,0,0,1,0,2,97,0,0,
123,0,0,7,47,0,4,512,0,0,1,0,0,1,0,2,4,0,0,
142,0,0,8,47,0,4,517,0,0,1,0,0,1,0,2,4,0,0,
161,0,0,9,252,0,5,522,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
188,0,0,10,75,0,2,542,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
215,0,0,11,88,0,4,559,0,0,1,0,0,1,0,2,97,0,0,
234,0,0,12,72,0,4,564,0,0,3,1,0,1,0,1,97,0,0,2,97,0,0,2,97,0,0,
261,0,0,13,47,0,4,569,0,0,1,0,0,1,0,2,4,0,0,
280,0,0,14,47,0,4,574,0,0,1,0,0,1,0,2,4,0,0,
299,0,0,15,291,0,5,579,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
330,0,0,16,471,0,9,653,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
357,0,0,16,0,0,15,659,0,0,0,0,0,1,0,
372,0,0,16,0,0,13,665,0,0,12,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,3,0,0,2,3,0,0,2,97,0,0,2,97,0,0,
435,0,0,16,0,0,15,673,0,0,0,0,0,1,0,
450,0,0,17,254,0,5,759,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
477,0,0,18,433,0,9,794,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
508,0,0,18,0,0,15,800,0,0,0,0,0,1,0,
523,0,0,18,0,0,13,806,0,0,11,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,3,0,0,2,3,0,0,2,97,0,0,
582,0,0,18,0,0,15,813,0,0,0,0,0,1,0,
597,0,0,19,306,0,5,898,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
628,0,0,20,879,0,9,939,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
663,0,0,20,0,0,15,948,0,0,0,0,0,1,0,
678,0,0,20,0,0,13,954,0,0,15,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,3,0,0,2,3,0,0,2,97,0,0,2,4,0,
0,2,97,0,0,
753,0,0,20,0,0,15,964,0,0,0,0,0,1,0,
768,0,0,21,302,0,5,1050,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
799,0,0,22,862,0,9,1098,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
834,0,0,20,0,0,15,1107,0,0,0,0,0,1,0,
849,0,0,22,0,0,13,1113,0,0,15,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,3,0,0,2,3,0,0,2,97,0,0,2,4,0,
0,2,97,0,0,
924,0,0,22,0,0,15,1123,0,0,0,0,0,1,0,
939,0,0,23,302,0,5,1208,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
970,0,0,24,721,0,9,1249,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
1005,0,0,24,0,0,15,1258,0,0,0,0,0,1,0,
1020,0,0,24,0,0,13,1264,0,0,14,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,
97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,97,0,0,2,97,0,0,2,3,0,0,2,3,0,0,2,97,0,0,2,
4,0,0,
1091,0,0,24,0,0,15,1272,0,0,0,0,0,1,0,
1106,0,0,25,276,0,5,1353,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
1133,0,0,26,436,0,9,1389,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1164,0,0,26,0,0,15,1395,0,0,0,0,0,1,0,
1179,0,0,26,0,0,13,1401,0,0,10,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,
97,0,0,2,97,0,0,2,97,0,0,2,4,0,0,2,3,0,0,2,3,0,0,
1234,0,0,26,0,0,15,1406,0,0,0,0,0,1,0,
1249,0,0,27,117,0,4,3092,0,0,3,2,0,1,0,1,97,0,0,1,4,0,0,2,97,0,0,
1276,0,0,28,81,0,4,3112,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
1299,0,0,29,66,0,4,3133,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
1322,0,0,30,265,0,4,3176,0,0,6,5,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,
1361,0,0,31,143,0,4,3365,0,0,7,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,2,4,0,0,
1404,0,0,32,251,0,4,3390,0,0,11,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,
0,2,3,0,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1463,0,0,33,44,0,4,3542,0,0,1,0,0,1,0,2,4,0,0,
1482,0,0,34,451,0,5,3582,0,0,30,30,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,
0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1617,0,0,35,119,0,4,3621,0,0,4,3,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1648,0,0,36,315,0,5,3632,0,0,12,12,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1711,0,0,37,866,0,9,3704,0,0,7,7,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,1,97,0,0,
1754,0,0,37,0,0,15,3708,0,0,0,0,0,1,0,
1769,0,0,37,0,0,13,3718,0,0,15,0,0,1,0,2,97,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,
0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,0,0,2,4,
0,0,
1844,0,0,37,0,0,15,3726,0,0,0,0,0,1,0,
1859,0,0,38,57,0,2,3810,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1882,0,0,39,196,0,3,3823,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
1905,0,0,40,251,0,3,3839,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
1936,0,0,41,188,0,5,3856,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
1971,0,0,42,57,0,4,3879,0,0,2,1,0,1,0,1,3,0,0,2,97,0,0,
1994,0,0,43,224,0,4,3889,0,0,11,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,
0,2,3,0,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2053,0,0,44,143,0,4,3956,0,0,7,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,2,4,0,0,
2096,0,0,45,92,0,4,4038,0,0,4,3,0,1,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2127,0,0,46,264,0,5,4049,0,0,12,12,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2190,0,0,47,374,0,5,4085,0,0,38,38,0,1,0,1,4,0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,4,0,
0,1,3,0,0,1,4,0,0,1,3,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,4,
0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,
4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,1,4,0,0,
1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
2357,0,0,48,384,0,3,4128,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
2392,0,0,49,230,0,5,4150,0,0,6,6,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,1,97,0,0,
2431,0,0,50,248,0,5,4167,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
2466,0,0,51,216,0,5,4189,0,0,5,5,0,1,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
2501,0,0,52,193,0,5,4209,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2532,0,0,53,218,0,9,4248,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,
2559,0,0,53,0,0,15,4254,0,0,0,0,0,1,0,
2574,0,0,53,0,0,13,4262,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,4,0,0,2,4,0,0,
2605,0,0,53,0,0,15,4266,0,0,0,0,0,1,0,
2620,0,0,54,80,0,5,4293,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
2651,0,0,55,80,0,5,4311,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
2682,0,0,56,82,0,5,4329,0,0,4,4,0,1,0,1,4,0,0,1,4,0,0,1,97,0,0,1,97,0,0,
2713,0,0,57,77,0,4,4385,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,4,0,0,
2740,0,0,58,50,0,3,4399,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,
0,0,1,97,0,0,1,97,0,0,
2781,0,0,59,0,0,29,4409,0,0,0,0,0,2,6,76,79,71,95,68,66,
2802,0,0,60,57,0,4,4429,0,0,2,1,0,1,0,1,3,0,0,2,97,0,0,
2825,0,0,61,139,0,4,4441,0,0,5,3,0,1,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
2860,0,0,62,143,0,4,4451,0,0,5,3,0,1,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,
2895,0,0,63,116,0,3,4467,0,0,4,4,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2926,0,0,64,258,0,4,4488,0,0,11,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,
0,2,3,0,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
2985,0,0,65,131,0,3,4501,0,0,11,11,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,3,0,0,1,3,
0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,
3044,0,0,66,281,0,5,4529,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,
97,0,0,
3079,0,0,67,258,0,4,4561,0,0,11,3,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,3,0,
0,2,3,0,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
3138,0,0,68,290,0,5,4574,0,0,13,13,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,
3205,0,0,69,325,0,4,4783,0,0,8,6,0,1,0,2,3,0,0,2,3,0,0,1,97,0,0,1,97,0,0,1,97,
0,0,1,97,0,0,1,97,0,0,1,97,0,0,
3252,0,0,70,63,0,4,4829,0,0,1,0,0,1,0,2,97,0,0,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKG3071G(초과근무수당  계산/월별집계)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 이상문
 Version        : 1.00
 Date           : 2018.06.14

Update Contents
 Version  date(yy.mm.dd)  programmer       description                        relevant doc.no
 1.00     2018.06.14      이상문           자율 근무제 도입에 의한 리뉴얼
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
#define  FRTIME1  "2200"   /* 야간근무시작시간    */
#define  TOTIME1  "3000"   /* 야간근무종료시간(익일06:00)  */
#define  FRTIME2  "4600"   /* 야간근무시작시간(익일22:00)   */
#define  TOTIME2  "4800"   /* 야간근무종료시간(익일24:00)  */

#define  SUMDATE  "20180801"  /* 자율 근무제 집계 반영 날짜 */
#define  CALDATE  "20180701"  /* 자율 근무제 시간계산 반영 날짜 */

/*** 함수 Prototype 선언  ***/
void    get_lastsaturday(char* yymm, char* lastsaturday);
void    get_dayname(char *indate,char *result);
void    get_lastday(char* yymm, char* result);
void    add_days(char* indate,int m, char* rdate);
double  calc_term(char *frdate,char *todate);
void    trail_spaces(char *dest);

/****** log File 관련 ******/
void    CreateLog();
void    WriteLog(char *message);

/*********************************************
  Global Variable
**********************************************/

/* EXEC SQL BEGIN DECLARE SECTION; */ 


/***  초과근무이력테이블(PKHOTHIS) 참조변수  ***/
     char    ovtmdate[9]      = "";  /* 근무일자   */
     char    empno[5]         = "";  /* 사번     */
     char    korname[13]      = "";  /* 성명     */
     char    paycl[4]         = "";  /* 직급     */
     double  paygr            = 0;   /* 호봉     */
     char    payra[4]         = "";  /* 직위     */
     char    orgnum[4]        = "";  /* 조직차수   */
     char    deptcode[7]      = "";  /* 부서코드   */
     char    otkind[3]        = "";  /* 초과근무구분   */
     char    daykind[2]       = "";  /* 근무일구분   */
     char    frapptime[5]     = "";  /* 근무예정시간From  */
     char    toapptime[5]     = "";  /* 근무예정시간To  */
     char    toappdate[9]     = "";  /* 근무예정일To   */
     char    ovtmdesc[31]     = "";  /* 근무내역   */
     char    frrealtime[13]   = "";  /* 실제개시시간   */
     char    torealtime[13]   = "";  /* 실제종료시간   */
     float   exthh            = 0;   /* 연장근로시간   */
     double  nighthh          = 0;   /* 야간근로시간   */
     double  holihh           = 0;   /* 휴일근로시간   */
     double  overhh           = 0;   /* 초과근무시간계  */
     float   ovtmhh           = 0;   /* 초과근무시간총계  */
     float   genext           = 0;   /* 일반연장근로시간  */
     double  holiext          = 0;   /* 휴일연장근로시간  */
     char    apptime[13]      = "";  /* 신청시각   */
     char    conyn[2]         = "";  /* 결재여부   */
     char    contime[13]      = "";  /* 결재일시   */
     char    conemp[5]        = "";  /* 결재자사번   */
     char    conlemp[5]       = "";  /* 최종결재자사번  */
     char    conltime[13]     = "";  /* 최종결재일시   */
     char    otflag[2]        = "";  /* 초과근무구분(G:정상,O:초근) */
     double  ovtmrate         = 0;   /* 초과근무비율   */
     double  extamt           = 0;   /* 연장근로수당   */
     double  nightamt         = 0;   /* 야간근로수당   */
     double  holiamt          = 0;   /* 휴일근로수당   */
     double  overamt          = 0;   /* 초과근무수당계  */
     double  ovtmamt          = 0;   /* 초과근무수당총계  */
     double  ovmcamt          = 0;
     double  t_ovmcamt          = 0;
     double  ovminamt         = 0;   /* 기준통상임금(최저) 적용 (2008.02.18 추가)     */
     double  y_manrate        = 0;   /* 일반직 관리수수료율  (2008.03.20 추가),통상임금 계산시 사용     */
     char    tjobduty[3]      = "";  /* 담당직무  E1,H1 변경 KTH   */
     char    dinner[2]        = "";  /* 석식장소   */

     double  totpay    = 0;
     double  tongpay   = 0;

     /* 지급 항목 */
     double  t_nighthh     = 0;  /* 야간근로시간   */
     float   t_genexthh     = 0;  /* 일반연장근로시간  */
     double  t_holihh      = 0;  /* 휴일근로시간   */
     double  t_holiexthh   = 0;  /* 휴일연장근로시간  */
     double  t_extamt      = 0;  /* 연장근로수당   */
     double  t_nightamt    = 0;  /* 야간근로수당   */
     double  t_holiamt     = 0;  /* 휴일근로수당   */

     /* 제외 항목 */
     int     t_restmm      = 0;  /* 초과근무제외시간  */
     double  t_restamt     = 0;  /* 초과근무제외수당  */
     int     t_sprestmm    = 0;  /* 근무시간에 휴식한 제외시간  */
     double  t_sprestamt   = 0;  /* 근무시간에 휴식한 제외수당  */

     double  t_mealhh      = 0;  /* 식사시간제외시간           */
     double  t_excephh     = 0;  /* 9시간이상시 제외시간   */
     double  t_mealamt     = 0;  /* 식사시간제외수당             */
     double  t_excepamt    = 0;  /* 9시간이상시 제외수당   */

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

     char    workmm[7]       = "";  /* 작업년월   */
     char    frempno[5]      = "";  /* 사번FROM   */
     char    toempno[5]      = "";  /* 사번TO   */
     char    totalYN[2]      = "";  /* 집계여부   */
     char    jobempno[5]     = "";  /* 작업자사번   */
     char    sumkind[2]      = "";  /* 집계형태   */
     int     rephh           = 0 ;  /*대휴기준시간*/
     char    comchdate[9]    = "";  /* 통상임금기준변경일 2014.11 jissi */
     char    yearpaynum[7]   = "";  /* 반영연봉차수       2016.12 jissi */

     char    t_paycl[4]      = "";

     long    s_count         = 0;
     long    f_count         = 0;
     double  total_amt       = 0;

     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     /* 10분단위 계산위한 분단위 변수 */
     int     t_extmm         = 0;   /* 연장근로분 */
     int     t_nightmm       = 0;   /* 야간근로분 */
     int     t_holimm        = 0;   /* 휴일근로분 */
     int     t_genextmm      = 0;   /* 일반연장근로분 */
     int     t_holiextmm     = 0;   /* 휴일연장근로분 */
     int     t_mealmm        = 0;   /* 식사시간제외분 */

     int     pre_genextsum   = 0;   /* 전,당월 일반연장합 */
     int     pre_holiextsum  = 0;   /* 전,당월 휴일연장합 */
     int     pre_nightsum    = 0;   /* 전,당월 야간근로합 */
     int     pre_holisum     = 0;   /* 전,당월 휴일근로합 */
     int     pre_mealsum     = 0;   /* 전,당월 식사시간합 */
     int     pre_restsum     = 0;   /* 전,당월 초과근무제외합(초근평일) */
     int     pre_sprestsum   = 0;   /* 전,당월 근로시간휴식제외합 */
     /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
     int     pre_restsum_h   = 0;   /* 전,당월 초과근무제외합(초근휴일) */

     int     nxt_extmm       = 0;   /* 이월 연장근로분 */
     int     nxt_nightmm     = 0;   /* 이월 야간근로분 */
     int     nxt_holimm      = 0;   /* 이월 휴일근로분 */
     int     nxt_genextmm    = 0;   /* 이월 일반연장근로분 */
     int     nxt_holiextmm   = 0;   /* 이월 휴일연장근로분 */
     int     nxt_mealmm      = 0;   /* 이월 식사시간제외분 */
     int     nxt_restmm      = 0;   /* 이월 초과근무제외시간(초근평일) */
     int     nxt_sprestmm    = 0;   /* 이월 근무시간에 휴식한 제외시간 */
     /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
     int     nxt_restmm_h    = 0;   /* 이월 초과근무제외시간(초근휴일) */

     /* 일일 시간 계산(pkg3075g) 변수 - 2018.06.21 Sangmoon Lee */
     char    frworkdate[9]     = "";   /* 작업년월일 fr  */
     char    toworkdate[9]     = "";   /* 작업년월일 to  */
     char    workmon[6+1];

     char    curdate[9];

     int       cnt;

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
char  LSaturday[8+1]  = "";
char  mm[3] = "";
int   id;


/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = "";
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno = 0;

/* 집계(pkg3070g)와 일일 시간 계산(pkg3075g) 일원화 구분자 추가 - 2018.06.20 Sangmoon Lee */
char  sumYN[2] = "";


/* 일일 시간 계산(pkg3075g) 로그 파일을 위한 - 2018.06.20 Sangmoon Lee */
/****** log File 관련 ******/
char  logfile_fullname[140];

/***** Log Filspeciale Pointer *****/
FILE  *fp;

void main(int argc,char *argv[])
{
     int  flag;
     char FL_file[255];
     char  curdatetime[20+1]="";


     /*dsa2000 Rexec 대체 파라미터 추가...*/
     if  (argc != 11) {  /*/hper/insa/HINSA/proc/bin/Kbin/pkg3070g 201509 0000 zzzz Y 0 2563 pkg3070g 20151007140600 201601 Y*/
          printf("[Usage] : pkg3071g 1.작업월 2.사번fr 3.사번to 4.집계방법(전체Y, 일부N) \n");
          printf("[Usage] :          5.집계방법(전체0, 일부1) 6.작업자사번 7.프로그램ID \n");
          /* 집계(pkg3070g)와 일일 시간 계산(pkg3075g) 일원화 구분자 추가 - 2018.06.20 Sangmoon Lee */
          printf("[Usage] :          8.시작시간 9.반영연봉차수 10.집계여부(집계Y, 시간N) \n");
          exit(1);
     }

     /* Parameter */
     strcpy(workmm,argv[1]);
     strcpy(frempno,argv[2]);
     strcpy(toempno,argv[3]);
     strcpy(totalYN,argv[4]);
     strcpy(sumkind,argv[5]);
     strcpy(jobempno,argv[6]);
     strcpy(yearpaynum,argv[9]);

     /* 집계(pkg3070g)와 일일 시간 계산(pkg3075g) 일원화 구분자 추가 - 2018.06.20 Sangmoon Lee */
     strcpy(sumYN, argv[10]);


     /* 집계(pkg3070g)와 일일 시간 계산(pkg3075g) 일원화 구분자 추가 - 2018.06.21 Sangmoon Lee */
     if (strcmp(sumYN, "Y") == 0)
     {
          /*로그 디렉토리 생성 및 로그작업 */
          STRINIT(FL_file);
          strcpy(FL_file,"pkg3071g_Y");

          hinsa_get_filename(1, FL_file);
          if  (hinsa_log_open(FL_file) == FAILURE)
          {
               hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
               return;
          }

          hinsa_log_print(0,"초과근무수당 생성/계산 시작...[pkg3071g_Y]");
     }
     else if (strcmp(sumYN, "N") == 0)
     {
          /*로그 디렉토리 생성 및 로그작업 */
          STRINIT(FL_file);
          strcpy(FL_file,"pkg3071g_N");

          hinsa_get_filename(1, FL_file);

          hinsa_log_print(0,"초과근무수당 생성/계산 시작...[pkg3071g_N]");
     }

     hinsa_db_connect();  /*DB Connect 실시..*/

     /* EXEC SQL
     SELECT  to_char(sysdate, 'YYYYMMDD')
       INTO  :curdate
       FROM  DUAL ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 1;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select to_char(sysdate,'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curdate;
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




     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[6]);
     strcpy(log_progid,   argv[7]);

     /* EXEC SQL DECLARE log_db DATABASE; */ 

     hinsa_log_db_connect();

     /* 집계(pkg3070g)와 일일 시간 계산(pkg3075g) 일원화 구분자 추가 - 2018.06.21 Sangmoon Lee */
     if (strcmp(sumYN, "Y") == 0)
     {
          strcpy(log_rundate,  argv[8]);
     }
     else if (strcmp(sumYN, "N") == 0)
     {
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
          sqlstm.stmt = "select to_char(add_months(to_date(FIXMON,'YYYYMM')\
,1),'YYYYMM') into :b0  from PKCOTBAS ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )24;
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
          sqlstm.stmt = "select (:b0||'01') ,to_char(sysdate,'YYYYMMDD') in\
to :b1,:b2  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )43;
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



          strcpy(log_rundate,  toworkdate);

          sprintf(frworkdate,"%.8s",frworkdate);
          sprintf(toworkdate,"%.8s",toworkdate);

          CreateLog();

          sprintf(log_buff, "작업년월일fr ~ to : %s ~ %s\n", frworkdate, toworkdate);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/

          sprintf(log_buff, "사번fr ~ to : %s ~ %s\n", argv[2], argv[3]);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/

          sprintf(log_buff, "작업자사번 : %s\n", argv[6]);
          WriteLog(log_buff);
          Write_batlog(seqno++, log_buff); /*dsa2000 Rexec 대체*/

          sprintf(log_buff, "  ");
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
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select value1 into :b0  from PKCVARI where gubun='CM'";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )70;
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



     /*========================================================*/

     /* EXEC SQL LOCK TABLE PKHOTHIS
       IN   EXCLUSIVE  MODE  NOWAIT; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 3;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "lock TABLE PKHOTHIS IN EXCLUSIVE MODE NOWAIT";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )89;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}




     if  (clear_records() != SUCCESS)
     {
          sprintf(log_buff, "= 작업실패 ="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          hinsa_exit(0," 작업실패. !!!\n");
     }



     /* 집계(pkg3070g)와 일일 시간 계산(pkg3075g) 일원화 구분자 추가 - 2018.06.21 Sangmoon Lee */
     if (strcmp(sumYN, "Y") == 0)
     {
          s_count = f_count = total_amt =  0;

          rephh = 8 ; /*대휴기준시간*/

          /*정규직 초과근무 계산*/
          /* 자율 근무제 집계는 2018.08.01부터 가능 - 2018.06.29 Sangmoon Lee */
          if (strcmp(curdate, SUMDATE) < 0)
          {
               flag =  process_records_old();
          }
          else
          {
               flag =  process_records();
          }

          printf("\n 정규직 ====================================");
          sprintf(log_buff, "\n 정규직 ===================================="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

          printf("\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count);
          sprintf(log_buff, "\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

          printf("\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count);
          sprintf(log_buff, "\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

          printf("\n 총수당액 : %10.0f \n",total_amt);
          sprintf(log_buff,"\n 총수당액 : %10.0f \n",total_amt); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

     //printf("curdate=%s, sumdate=%s, compare1=%d, compare2=%d, compare2=%d \n"
     //      ,curdate, SUMDATE, strcmp(curdate, SUMDATE), strcmp("20180801", SUMDATE), strcmp("20180802", SUMDATE));
     //hinsa_exit(0," 개발자 종료. !!!\n");exit(1);
          s_count = f_count = total_amt =  0;


          /*계약직 초과근무 계산*/
          flag =  process_records_con();

          printf("\n 계약직 ====================================");
          sprintf(log_buff, "\n계약직 ===================================="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

          printf("\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count);
          sprintf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 성공.\n",s_count); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

          printf("\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count);
          sprintf(log_buff,"\n (%ld)건에 대해서 초과근무시간 계산 실패.\n",f_count); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

          printf("\n 총수당액 : %10.0f \n",total_amt);
          sprintf(log_buff,"\n 총수당액 : %10.0f \n",total_amt); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);

          printf("\n totalYN : [%s] flag [%d] \n",totalYN,flag);

          process_sumstep1();

          print_Lastamt();

          /* ===============================================================================
           Version  date(yy.mm.dd)  programmer    description                        relevant doc.no
           30.30    2001.11.13.      유효성       근태테이블(pkhduty)의 대휴(repoff)및 교휴(speoff)  를 불러와
                                                  최종계산된 초과수당(pkhotsum의 ovtmamt)에서 빼는 로직 추가.
           ============================================================================= */
          if  (process_repoff() != SUCCESS )
          {
               sprintf(log_buff,"대휴수당 계산작업 실패"); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("작업이 실패했습니다.\n");
          }

          /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
          if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
          {
               sprintf(log_buff, "ERROR ====== [작업 실패] ====="); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               error_quit("ERROR ====== [작업 실패] =====\n");
          }
          else
          {
               sprintf(log_buff, "OK ====== [작업 성공] ====="); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               hinsa_exit(0,"OK ====== [작업 성공] =====\n");
          }
     }
     else if (strcmp(sumYN, "N") == 0)
     {
          s_count = f_count = total_amt =  0;

          /* 자율 근무제 시간 계산은 2018.07.01부터 가능 - 2018.06.29 Sangmoon Lee */
          if (strcmp(curdate, CALDATE) < 0)
          {
              flag =  process_records_N_old();
          }
          else
          {
              flag =  process_records_N();
              
              flag =  process_records_N_con();
          }

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
          sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b\
0  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )104;
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
     }
}

/*****************************************************************************
  계산 전 해당항목을 Clear하는 함수.
 *****************************************************************************/
clear_records()
{
     ovminamt  = 0; /* 통상임금이 시간당 최저 임금보다 낮을 경우 최저임금으로 계산 */
     y_manrate = 0;/* 일반직 통상임금 계산시 관리수수료율 사용 */

     /* 집계(pkg3070g)와 일일 시간 계산(pkg3075g) 일원화 구분자 추가 - 2018.06.20 Sangmoon Lee */
     if (strcmp(sumYN, "Y") == 0)
     {

         /* EXEC SQL
         SELECT   nvl(OVMINAMT,0)
           INTO   :ovminamt
           FROM   PKCOTBAS; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 3;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select nvl(OVMINAMT,0) into :b0  from PKCOTBAS ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )123;
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
         SELECT   nvl(Y_MANRATE,0)
           INTO   :y_manrate
           FROM   PKCPBAS; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 3;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select nvl(Y_MANRATE,0) into :b0  from PKCPBAS ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )142;
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
            SET  EXTHH    = 0,  NIGHTHH   = 0,  HOLIHH   = 0,
                 OVTMHH   = 0,  OVMCAMT   = 0,  GENEXT   = 0,
                 HOLIEXT  = 0,  EXTAMT    = 0,  NIGHTAMT = 0,
                 HOLIAMT  = 0,  OVTMAMT   = 0,  RESTAMT  = 0,
                 SPRESTAMT= 0,  MEALHH    = 0,  MEALAMT  = 0,
                 EXCEPHH  = 0,  EXCEPAMT  = 0
          WHERE  SUBSTR(OVTMDATE,1,6) = :workmm
            AND  (EMPNO >= :frempno AND EMPNO <= :toempno ) ; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 3;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "update PKHOTHIS  set EXTHH=0,NIGHTHH=0,HOLIHH=0,OVT\
MHH=0,OVMCAMT=0,GENEXT=0,HOLIEXT=0,EXTAMT=0,NIGHTAMT=0,HOLIAMT=0,OVTMAMT=0,RE\
STAMT=0,SPRESTAMT=0,MEALHH=0,MEALAMT=0,EXCEPHH=0,EXCEPAMT=0 where (SUBSTR(OVT\
MDATE,1,6)=:b0 and (EMPNO>=:b1 and EMPNO<=:b2))";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )161;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)workmm;
         sqlstm.sqhstl[0] = (unsigned long )7;
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)frempno;
         sqlstm.sqhstl[1] = (unsigned long )5;
         sqlstm.sqhsts[1] = (         int  )0;
         sqlstm.sqindv[1] = (         short *)0;
         sqlstm.sqinds[1] = (         int  )0;
         sqlstm.sqharm[1] = (unsigned long )0;
         sqlstm.sqadto[1] = (unsigned short )0;
         sqlstm.sqtdso[1] = (unsigned short )0;
         sqlstm.sqhstv[2] = (unsigned char  *)toempno;
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



         if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
         {
              printf("ERROR_CODE : %d, 자료 Clear Error. \n", sqlca.sqlcode);
              sprintf(log_buff, "ERROR_CODE : %d, 자료 Clear Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
              Write_batlog(seqno++, log_buff);
              return(FAIL);
         }

         /*2002.6.17 유효성 추가 */
         /* EXEC SQL
         DELETE  FROM PKHOTSUM
          WHERE (EMPNO >= :frempno AND EMPNO <= :toempno)
            AND OVTMYYMM = :workmm; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 3;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "delete  from PKHOTSUM  where ((EMPNO>=:b0 and EMPNO\
<=:b1) and OVTMYYMM=:b2)";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )188;
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
         sqlstm.sqhstv[2] = (unsigned char  *)workmm;
         sqlstm.sqhstl[2] = (unsigned long )7;
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



         if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
         {
              printf("ERROR_CODE : %d, 자료 Delete Error. \n", sqlca.sqlcode);
              sprintf(log_buff, "ERROR_CODE : %d,  자료 Delete Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
              Write_batlog(seqno++, log_buff);
              return(FAIL);
         }
         else
              return(SUCCESS);
     }
     else if (strcmp(sumYN, "N") == 0)
     {
         /* EXEC SQL
         SELECT to_char(add_months(to_date(FIXMON, 'YYYYMM'),1), 'YYYYMM')
           INTO  :workmon
           FROM PKCOTBAS ; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 3;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select to_char(add_months(to_date(FIXMON,'YYYYMM'),\
1),'YYYYMM') into :b0  from PKCOTBAS ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )215;
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
         sqlstm.stmt = "select (:b0||'01') ,to_char(sysdate,'YYYYMMDD') int\
o :b1,:b2  from DUAL ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )234;
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
         sqlstm.offset = (unsigned int  )261;
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
         sqlstm.offset = (unsigned int  )280;
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
         sqlstm.stmt = "update PKHOTHIS  set EXTHH=0,NIGHTHH=0,HOLIHH=0,OVT\
MHH=0,OVMCAMT=0,GENEXT=0,HOLIEXT=0,EXTAMT=0,NIGHTAMT=0,HOLIAMT=0,OVTMAMT=0,RE\
STAMT=0,SPRESTAMT=0,WRITETIME='***',MEALHH=0,MEALAMT=0,EXCEPHH=0,EXCEPAMT=0 w\
here ((OVTMDATE between :b0 and :b1 and EMPNO between :b2 and :b3) and PAYCL \
is null )";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )299;
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
}

/*****************************************************************************
  대상자료를 추출하는 함수.== 계약직사원
 *****************************************************************************/
process_records_con()
{
     char  t_date[11]   = "";
     int   term = 0;
     char  stime[5] = "";
     char  etime[5] = "";
     int   daykind  = 0;
     char  str[8+1]   = "";
     int   dd   = 0;

     /* EXEC SQL DECLARE cursor_2 CURSOR FOR
     SELECT
            NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
            NVL(A.KORNAME,' '),NVL(D.PAYCL,' '),
            NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
            NVL(TOREALTIME,'*'), totpay,
            nvl(restmm, 0), nvl(sprestmm, 0),NVL(TRIM(TJOBDUTY),' '),
            NVL(A.OTFLAG,' ') /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
      FROM  PKHOTHIS A, PKHDYPHIS B
            /o( SELECT A.EMPNO, A.TOTPAY
                FROM PKHDYPHIS A 
               WHERE (A.EMPNO, A.SEQNO) IN ( SELECT B.EMPNO, MAX(B.SEQNO) AS SEQNO  
                                               FROM PKHDYPHIS B                     
                                              WHERE B.YEARPAYNUM = :yearpaynum     
                                              GROUP BY B.EMPNO )) Bo/,   /o PKHDYPHIS 고도화로 계약직 연봉 분리 o/
            PIMPMAS D /o PKHDYPHIS 고도화로 계약직 연봉 분리 o/
     WHERE  (SUBSTR(OVTMDATE,1,6) = :workmm)
       AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
       AND  (A.EMPNO = B.EMPNO)
       AND  (B.EMPNO = D.EMPNO)
       AND  (UPPER(NVL(CONYN,' ')) = 'Y' )
/oinfra   AND  A.PAYCL >='99'  o/
       AND  D.PAYCL >='D91'
     ORDER  BY A.EMPNO, OVTMDATE; */ 


     /* EXEC SQL OPEN cursor_2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0016;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )330;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, cursor_2 Open Error\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d,  cursor_2 Open Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor_2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 4;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )357;
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
          /* EXEC SQL FETCH cursor_2
             INTO :ovtmdate,   :empno,      :korname, :paycl,
                  :frapptime,  :frrealtime,
                  :torealtime, :totpay,  :t_restmm ,  :t_sprestmm,  :tjobduty,
                  :otflag /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
                  ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 12;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )372;
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
          sqlstm.sqhstv[8] = (unsigned char  *)&t_restmm;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)tjobduty;
          sqlstm.sqhstl[10] = (unsigned long )3;
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)otflag;
          sqlstm.sqhstl[11] = (unsigned long )2;
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


          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor_2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 12;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )435;
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

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;

          pre_genextsum   = 0;
          pre_holiextsum  = 0;
          pre_nightsum    = 0;
          pre_holisum     = 0;
          pre_mealsum     = 0;
          pre_restsum     = 0;
          pre_sprestsum   = 0;
          pre_restsum_h   = 0;
          
          strncpy(str,frrealtime,8);

          /* ========================================
          심야근로, 식사시간
          ========================================  */

          if ((get_nighthh(frrealtime,torealtime) == SUCCESS) &&
              (get_genexthh_con(frrealtime, torealtime) == SUCCESS) &&
              (process_holihh(frrealtime,torealtime) == SUCCESS) &&       /* 정규직과 일반직 사원 휴일 수당 동일 하게 계산 작업 kth*/
              (get_mealhh_con(frrealtime, torealtime) == SUCCESS) &&      /* 정규직, 계약직 식사시간 분리 - 2018.02.08 SangMoon Lee */
              (get_excepthh(frrealtime, torealtime)== SUCCESS))
          {
               if  (update_record() != SUCCESS)
               {
                    printf(" EMPNO : %s, KORNAME : %s \n ", empno,korname);
                    
                    sprintf(log_buff, "EMPNO : %s, ovtmdate : %s \n ", empno,ovtmdate); 
                    Write_batlog(seqno++, log_buff);                                        
                    
                    strncpy(t_date,ovtmdate,4);
                    t_date[4] = '-';
                    strncpy(t_date+5,ovtmdate+4,2);
                    t_date[7] = '-';
                    strncpy(t_date+8,ovtmdate+6,2);
                    t_date[10] = '\0';
                    printf(" 초과근무일자 : %s \n",t_date);
                    printf(" BAND : %s \n",paycl);
               }
               s_count++;
          }
          else
          {
               f_count++;
               printf(" 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname);
               /*sprintf(log_buff, " 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                        /*Write_batlog(seqno++, log_buff);*/
               strncpy(t_date,ovtmdate,4);
               t_date[4] = '-';
               strncpy(t_date+5,ovtmdate+4,2);
               t_date[7] = '-';
               strncpy(t_date+8,ovtmdate+6,2);
               t_date[10] = '\0';
               printf(" 초과근무일자 : %s \n",t_date);
          }
     }
}

/*****************************************************************************
  대상자료를 추출하는 함수.== 정규사원
 *****************************************************************************/
process_records()
{
     char  t_date[11]   = "";

     /* EXEC SQL
     UPDATE  PKHOTHIS A
        SET (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCODE )=
          (SELECT B.PAYCL,B.PAYGR,B.PAYRA,B.ORGNUM,B.DEPTCODE
                 FROM   PKMPMAS B
                 WHERE A.EMPNO = B.EMPNO
          )
     WHERE  SUBSTR(OVTMDATE,1,6) = :workmm
       AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
       AND  UPPER(NVL(CONYN,' ')) = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 12;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS A  set (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCO\
DE)=(select B.PAYCL ,B.PAYGR ,B.PAYRA ,B.ORGNUM ,B.DEPTCODE  from PKMPMAS B w\
here A.EMPNO=B.EMPNO) where ((SUBSTR(OVTMDATE,1,6)=:b0 and (A.EMPNO>=:b1 and \
A.EMPNO<=:b2)) and UPPER(NVL(CONYN,' '))='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )450;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
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



     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
     {
          printf("ERROR_CODE : %d, 인사자료 SETTING Error. \n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 인사자료 SETTING Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
     }

     /* EXEC SQL DECLARE cursor1 CURSOR FOR
     SELECT
             NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
             NVL(A.KORNAME,' '),NVL(A.PAYCL,' '),
             NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
             NVL(TOREALTIME,'*'), totpay,
             NVL(RESTMM,0),NVL(SPRESTMM,0),
             NVL(A.OTFLAG,' ') /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
       FROM  PKHOTHIS A, PKHYPHIS B
      WHERE  (SUBSTR(OVTMDATE,1,6) = :workmm)
        AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  (B.YEARPAYNUM = :yearpaynum)
        AND  (A.EMPNO = B.EMPNO)
        AND  (UPPER(NVL(CONYN,' ')) = 'Y' )
        AND  PAYCL <='D41'      /oinfra   PAYCL <='99' o/
      ORDER  BY A.EMPNO, OVTMDATE; */ 


     /* EXEC SQL OPEN cursor1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 12;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0018;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )477;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[3] = (unsigned long )7;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, Cursor1 Open Error\n",  sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, Cursor1 Open Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor1; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 12;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )508;
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
                  :frapptime,:frrealtime,
                  :torealtime, :totpay, :t_restmm,:t_sprestmm,
                  :otflag /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
                  ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 12;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )523;
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
          sqlstm.sqhstv[8] = (unsigned char  *)&t_restmm;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)otflag;
          sqlstm.sqhstl[10] = (unsigned long )2;
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


          if (sqlca.sqlcode == 1403) {
            /* EXEC SQL CLOSE cursor1; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 12;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )582;
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

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;

          pre_genextsum   = 0;
          pre_holiextsum  = 0;
          pre_nightsum    = 0;
          pre_holisum     = 0;
          pre_mealsum     = 0;
          pre_restsum     = 0;
          pre_sprestsum   = 0;
          pre_restsum_h   = 0;


          if ( (get_nighthh(frrealtime,torealtime)    == SUCCESS) &&
               (get_genexthh(frrealtime,torealtime)   == SUCCESS) &&
               (process_holihh(frrealtime,torealtime) == SUCCESS) &&
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.20    2001.08.09.      유효성       휴일근무시 식사시간 제외 추가
============================================================================= */
               (get_mealhh(frrealtime, torealtime) == SUCCESS) &&
               (get_excepthh(frrealtime, torealtime)== SUCCESS) )
          {
               if  (update_record() != SUCCESS)
               {
                    printf(" EMPNO : %s, KORNAME : %s \n ", empno,korname);
                    /*sprintf(log_buff, " EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                              /*Write_batlog(seqno++, log_buff);*/
                    strncpy(t_date,ovtmdate,4);
                    t_date[4] = '-';
                    strncpy(t_date+5,ovtmdate+4,2);
                    t_date[7] = '-';
                    strncpy(t_date+8,ovtmdate+6,2);
                    t_date[10] = '\0';
                    printf(" 초과근무일자 : %s \n",t_date);
                    printf(" BAND : %s \n",paycl);
               }
               s_count++;
          }
          else
          {
               f_count++;
               printf(" 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname);
               /*sprintf(log_buff, " 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                        /*Write_batlog(seqno++, log_buff);*/
               strncpy(t_date,ovtmdate,4);
               t_date[4] = '-';
               strncpy(t_date+5,ovtmdate+4,2);
               t_date[7] = '-';
               strncpy(t_date+8,ovtmdate+6,2);
               t_date[10] = '\0';
               printf(" 초과근무일자 : %s \n",t_date);
          }
     }

}
/*****************************************************************************
  대상자료를 추출하는 함수. ==  시간 계산
 *****************************************************************************/
process_records_N()
{
     char  t_date[11]   = "";
     char  maxcondate[8+1] = "";
     int   holicnt = 0;
     /*double  tongpay;*/
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
        AND  EMPNO NOT LIKE 'Y%'
        AND  WRITETIME  = '***'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 12;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS A  set (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCO\
DE)=(select B.PAYCL ,B.PAYGR ,B.PAYRA ,B.ORGNUM ,B.DEPTCODE  from PKMPMAS B w\
here A.EMPNO=B.EMPNO) where ((((OVTMDATE between :b0 and :b1 and (A.EMPNO>=:b\
2 and A.EMPNO<=:b3)) and UPPER(NVL(CONYN,' '))='Y') and EMPNO not like 'Y%') \
and WRITETIME='***')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )597;
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

     /* EXEC SQL DECLARE cursor4 CURSOR FOR
     SELECT  NVL(A.OVTMDATE,' ') OVTMDATE, NVL(A.EMPNO,' ') EMPNO,
             NVL(A.KORNAME,' ') KORNAME, NVL(A.PAYCL,' ') PAYCL,
             NVL(A.FRAPPTIME,'*') FRAPPTIME, NVL(A.FRREALTIME,'*') FRREALTIME,
             NVL(A.TOREALTIME,'*') TOREALTIME, NVL(TOTPAY,0),
             substr(NVL(A.CONLTIME,'00000000'),1,8) CONLTIME, CONLEMP,
             NVL(A.RESTMM,0) RESTMM, NVL(A.SPRESTMM,0) SPRESTMM, NVL(D.TJOBDUTY, ' ') TJOBDUTY,
             case when OVTMDATE < :comchdate                                     /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                  then hper.COMMONUTIL.GET_OLDBASEPAY(a.EMPNO,c.YEARPAYNUM)
                  else hper.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO,c.YEARPAYNUM) end tongpay,  /oDB package에서 계산 jissi. 2016.12.14o/
             NVL(A.OTFLAG,' ') OTFLAG /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
       FROM  PKHOTHIS A, PKHYPHIS B, PKCPBAS C, PIMPMAS D
      WHERE  OVTMDATE BETWEEN :frworkdate AND :toworkdate
        AND  A.EMPNO >= :frempno AND A.EMPNO <= :toempno
        AND  TO_CHAR(C.YEARPAYNUM) =  B.YEARPAYNUM
        AND  A.EMPNO NOT LIKE 'Y%'
        AND  A.EMPNO = B.EMPNO
        AND  B.EMPNO = D.EMPNO
        AND  UPPER(NVL(A.CONYN,' ')) = 'Y'
        AND  A.WRITETIME = '***'
      ORDER  BY EMPNO, OVTMDATE; */ 


     /* EXEC SQL OPEN cursor4; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 12;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0020;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )628;
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

          sprintf(log_buff,"In the Select ERROR_CODE : %d, Cursor4 Open Error\n", sqlca.sqlcode);
          WriteLog(log_buff);

          /* EXEC SQL CLOSE cursor4; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 12;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )663;
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
          /* EXEC SQL FETCH cursor4
          INTO :ovtmdate, :empno, :korname, :paycl,
               :frapptime,:frrealtime, :torealtime, :totpay,
               :conltime, :conlemp,
               :t_restmm,:t_sprestmm ,:tjobduty, :tongpay,
               :otflag /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
               ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )678;
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
          sqlstm.sqhstl[8] = (unsigned long )13;
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
          sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
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
          sqlstm.sqhstv[14] = (unsigned char  *)otflag;
          sqlstm.sqhstl[14] = (unsigned long )2;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
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
               /* EXEC SQL CLOSE cursor4; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 15;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )753;
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


          sprintf(log_buff,"   ");
          WriteLog(log_buff);

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;
          
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
  대상자료를 추출하는 함수. ==  시간 계산
 *****************************************************************************/
process_records_N_con()
{
     char  t_date[11]   = "";
     char  maxcondate[8+1] = "";
     int   holicnt = 0;
     /*double  tongpay;*/

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
        AND  EMPNO LIKE 'Y%'
        AND  WRITETIME  = '***'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS A  set (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCO\
DE)=(select B.PAYCL ,B.PAYGR ,B.PAYRA ,B.ORGNUM ,B.DEPTCODE  from PKMPMAS B w\
here A.EMPNO=B.EMPNO) where ((((OVTMDATE between :b0 and :b1 and (A.EMPNO>=:b\
2 and A.EMPNO<=:b3)) and UPPER(NVL(CONYN,' '))='Y') and EMPNO like 'Y%') and \
WRITETIME='***')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )768;
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

     /* EXEC SQL DECLARE cursor7 CURSOR FOR
     SELECT  NVL(A.OVTMDATE,' ') OVTMDATE, NVL(A.EMPNO,' ') EMPNO,
             NVL(A.KORNAME,' ') KORNAME, NVL(A.PAYCL,' ') PAYCL,
             NVL(A.FRAPPTIME,'*') FRAPPTIME, NVL(A.FRREALTIME,'*') FRREALTIME,
             NVL(A.TOREALTIME,'*') TOREALTIME, NVL(TOTPAY,0),
             substr(NVL(A.CONLTIME,'00000000'),1,8) CONLTIME, CONLEMP,
             NVL(A.RESTMM,0) RESTMM, NVL(A.SPRESTMM,0) SPRESTMM, NVL(D.TJOBDUTY, ' ') TJOBDUTY,
             case when a.OVTMDATE < :comchdate                                     /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                  then hper.COMMONUTIL.GET_OLDBASEPAY(a.EMPNO,c.DISYEARPAYNUM)
                  else hper.COMMONUTIL.GET_NEWBASEPAY(a.EMPNO,c.DISYEARPAYNUM) end tongpay,  /oDB package에서 계산 jissi. 2016.12.14o/
             NVL(A.OTFLAG,' ') OTFLAG /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
       FROM  PKHOTHIS A, PKHDYPHIS B,
             /o( SELECT A.EMPNO, A.TOTPAY, A.YEARPAYNUM
                 FROM PKHDYPHIS A 
                WHERE (A.EMPNO, A.SEQNO) IN ( SELECT B.EMPNO, MAX(B.SEQNO) AS SEQNO  
                                                FROM PKHDYPHIS B                     
                                               WHERE B.YEARPAYNUM = :yearpaynum     
                                                      GROUP BY B.EMPNO )) B,o/   /o PKHDYPHIS 고도화로 계약직 연봉 분리 o/
             PKCPBAS C, PIMPMAS D
      WHERE  OVTMDATE BETWEEN :frworkdate AND :toworkdate
        AND  A.EMPNO >= :frempno AND A.EMPNO <= :toempno
        AND  TO_CHAR(C.DISYEARPAYNUM) =  B.YEARPAYNUM
        AND  A.EMPNO LIKE 'Y%'
        AND  A.EMPNO = B.EMPNO
        AND  B.EMPNO = D.EMPNO
        AND  UPPER(NVL(A.CONYN,' ')) = 'Y'
        AND  A.WRITETIME = '***'
      /oORDER  BY EMPNO, OVTMDATEo/; */ 


     /* EXEC SQL OPEN cursor7; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0022;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )799;
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

          sprintf(log_buff,"In the Select ERROR_CODE : %d, Cursor4 Open Error\n", sqlca.sqlcode);
          WriteLog(log_buff);

          /* EXEC SQL CLOSE cursor4; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )834;
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
          /* EXEC SQL FETCH cursor7
          INTO :ovtmdate, :empno, :korname, :paycl,
               :frapptime,:frrealtime, :torealtime, :totpay,
               :conltime, :conlemp,
               :t_restmm,:t_sprestmm ,:tjobduty, :tongpay,
               :otflag /o 초과근무 구분 추가 - Sangmoon Lee 2018.06.14 o/
               ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )849;
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
          sqlstm.sqhstl[8] = (unsigned long )13;
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
          sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
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
          sqlstm.sqhstv[14] = (unsigned char  *)otflag;
          sqlstm.sqhstl[14] = (unsigned long )2;
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
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
               /* EXEC SQL CLOSE cursor7; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 15;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )924;
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


          sprintf(log_buff,"   ");
          WriteLog(log_buff);

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;
          
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
  대상자료를 추출하는 함수. - 이전
 *****************************************************************************/
process_records_N_old()
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
        AND  OTFLAG IS NULL
        AND  WRITETIME  = '***'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS A  set (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCO\
DE)=(select B.PAYCL ,B.PAYGR ,B.PAYRA ,B.ORGNUM ,B.DEPTCODE  from PKMPMAS B w\
here A.EMPNO=B.EMPNO) where ((((OVTMDATE between :b0 and :b1 and (A.EMPNO>=:b\
2 and A.EMPNO<=:b3)) and UPPER(NVL(CONYN,' '))='Y') and OTFLAG is null ) and \
WRITETIME='***')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )939;
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


     /* EXEC SQL DECLARE cursor6 CURSOR FOR
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
        AND  OTFLAG IS NULL
        AND  UPPER(NVL(CONYN,' ')) = 'Y'
        AND  A.WRITETIME = '***'
      ORDER  BY A.EMPNO, OVTMDATE; */ 


     /* EXEC SQL OPEN cursor6; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0024;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )970;
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

          sprintf(log_buff,"In the Select ERROR_CODE : %d, Cursor6 Open Error\n", sqlca.sqlcode);
          WriteLog(log_buff);

          /* EXEC SQL CLOSE cursor6; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1005;
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
          /* EXEC SQL FETCH cursor6
          INTO :ovtmdate, :empno, :korname, :paycl,
          	   :frapptime,:frrealtime, :torealtime, :totpay,
               :conltime, :conlemp,
               :t_restmm,:t_sprestmm ,:tjobduty, :tongpay; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1020;
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
          sqlstm.sqhstl[8] = (unsigned long )13;
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
          sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&t_sprestmm;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
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
               /* EXEC SQL CLOSE cursor6; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 15;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1091;
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


          sprintf(log_buff,"   ");
          WriteLog(log_buff);

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;

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
  대상자료를 추출하는 함수.== 정규사원 이전
 *****************************************************************************/
process_records_old()
{
     char  t_date[11]   = "";

     /* EXEC SQL
     UPDATE  PKHOTHIS A
        SET (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCODE )=
          (SELECT B.PAYCL,B.PAYGR,B.PAYRA,B.ORGNUM,B.DEPTCODE
                 FROM   PKMPMAS B
                 WHERE A.EMPNO = B.EMPNO
          )
     WHERE  SUBSTR(OVTMDATE,1,6) = :workmm
       AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
       AND  OTFLAG IS NULL
       AND  UPPER(NVL(CONYN,' ')) = 'Y'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS A  set (PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCO\
DE)=(select B.PAYCL ,B.PAYGR ,B.PAYRA ,B.ORGNUM ,B.DEPTCODE  from PKMPMAS B w\
here A.EMPNO=B.EMPNO) where (((SUBSTR(OVTMDATE,1,6)=:b0 and (A.EMPNO>=:b1 and\
 A.EMPNO<=:b2)) and OTFLAG is null ) and UPPER(NVL(CONYN,' '))='Y')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1106;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
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



     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0))
     {
          printf("ERROR_CODE : %d, 인사자료 SETTING Error. \n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 인사자료 SETTING Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
     }

     /* EXEC SQL DECLARE cursor5 CURSOR FOR
     SELECT
             NVL(OVTMDATE,' '), NVL(A.EMPNO,' '),
             NVL(A.KORNAME,' '),NVL(A.PAYCL,' '),
             NVL(FRAPPTIME,'*'), NVL(FRREALTIME,'*'),
             NVL(TOREALTIME,'*'), totpay,
             NVL(RESTMM,0),NVL(SPRESTMM,0)
       FROM  PKHOTHIS A, PKHYPHIS B
      WHERE  (SUBSTR(OVTMDATE,1,6) = :workmm)
        AND  (A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  (B.YEARPAYNUM = :yearpaynum)
        AND  (A.EMPNO = B.EMPNO)
        AND  (UPPER(NVL(CONYN,' ')) = 'Y' )
        AND  OTFLAG IS NULL
        AND  PAYCL <='D41'      /oinfra   PAYCL <='99' o/
      ORDER  BY A.EMPNO, OVTMDATE; */ 


     /* EXEC SQL OPEN cursor5; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0026;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1133;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[3] = (unsigned long )7;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, Cursor5 Open Error\n",  sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, Cursor5 Open Error. \n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor5; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1164;
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
          /* EXEC SQL FETCH cursor5
             INTO :ovtmdate, :empno, :korname, :paycl,
                  :frapptime,:frrealtime,
                  :torealtime, :totpay, :t_restmm,:t_sprestmm; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1179;
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
          sqlstm.sqhstv[8] = (unsigned char  *)&t_restmm;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&t_sprestmm;
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


          if (sqlca.sqlcode == 1403) {
            /* EXEC SQL CLOSE cursor5; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 15;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )1234;
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

          t_nighthh   = 0;
          t_genexthh  = 0;
          t_holihh    = 0;
          t_holiexthh = 0;
          t_mealhh    = 0;
          t_excephh   = 0;

          t_extmm     = 0;
          t_nightmm   = 0;
          t_holimm    = 0;
          t_genextmm  = 0;
          t_holiextmm = 0;
          t_mealmm    = 0;


          if ( (get_nighthh(frrealtime,torealtime)    == SUCCESS) &&
               (get_genexthh(frrealtime,torealtime)   == SUCCESS) &&
               (process_holihh(frrealtime,torealtime) == SUCCESS) &&
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.20    2001.08.09.      유효성       휴일근무시 식사시간 제외 추가
============================================================================= */
               (get_mealhh(frrealtime, torealtime) == SUCCESS) &&
               (get_excepthh(frrealtime, torealtime)== SUCCESS) )
          {
               if  (update_record() != SUCCESS)
               {
                    printf(" EMPNO : %s, KORNAME : %s \n ", empno,korname);
                    /*sprintf(log_buff, " EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                              /*Write_batlog(seqno++, log_buff);*/
                    strncpy(t_date,ovtmdate,4);
                    t_date[4] = '-';
                    strncpy(t_date+5,ovtmdate+4,2);
                    t_date[7] = '-';
                    strncpy(t_date+8,ovtmdate+6,2);
                    t_date[10] = '\0';
                    printf(" 초과근무일자 : %s \n",t_date);
                    printf(" BAND : %s \n",paycl);
               }
               s_count++;
          }
          else
          {
               f_count++;
               printf(" 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname);
               /*sprintf(log_buff, " 계산에 실패한 EMPNO : %s, KORNAME : %s \n ", empno,korname); dsa2000 Rexec 대체*/
                        /*Write_batlog(seqno++, log_buff);*/
               strncpy(t_date,ovtmdate,4);
               t_date[4] = '-';
               strncpy(t_date+5,ovtmdate+4,2);
               t_date[7] = '-';
               strncpy(t_date+8,ovtmdate+6,2);
               t_date[10] = '\0';
               printf(" 초과근무일자 : %s \n",t_date);
          }
     }

}

/**********************************************************************************************
  야간근로시간을 실제근무시작시간과 실제근무종료시간으로 부터 구하는 함수. (총 10시간 이내범위)

  (야간근로시간 인정시간)
  당일 22:00 ~ 익일 06:00 (8시간)
  익일 22:00 ~ 익일 24:00 (2시간)
  => 초과근무 시작시간과 종료시간을 계산하여 실제 야간근로시간에 해당되는 시간을 산출.
***********************************************************************************************/
get_nighthh(char *frtime, char *totime)
{
     int    dd       = 0;
     int    tmp      = 0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   t_str[5] = "";
     int    btime1   = 0;
     int    btime2   = 0;
     int    btime3   = 0;
     int    btime4   = 0;
     int    istime   = 0;
     int    ietime   = 0;

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
          //printf(" 초과근무일자 : %s,%s,%s,%s \n",tmp,istime,ietime);
     }

     if ((istime >= btime1) && (istime <= btime2) &&
         (ietime > btime2) )
     {
          t_nighthh = get_hourterm(istime,btime2);  /* 야간근무시간 인정시간 : 실제시작시간 ~ 익일06:00 */
          t_nightmm = get_minterm(istime,btime2);
     }
     else if ((ietime >= btime1) &&
              (ietime <= btime2) &&
              (istime < btime1))
     {
          t_nighthh = get_hourterm(btime1,ietime);  /* 야간근무시간 인정시간 : 22:00 ~ 실제종료시간  */
          t_nightmm = get_minterm(btime1,ietime);
     }
     else if ((istime >= btime1) && (istime <= btime2) &&
              (ietime <= btime2) && (ietime >  istime))
     {
          t_nighthh = get_hourterm(istime,ietime);
          t_nightmm = get_minterm(istime,ietime);
     }
     else if ((istime <= btime1) && (ietime >= btime2) &&
              (ietime >  istime))
     {
          t_nighthh = get_hourterm(btime1,btime2);  /* 야간근무시간 인정시간 : 22:00 ~ 익일06:00  */
          t_nightmm = get_minterm(btime1,btime2);
     }
     else
     {
          t_nighthh = 0;
     }

     if ((ietime >= btime3) && (ietime <= btime4)) {
          t_nighthh += get_hourterm(btime3,ietime); /* 야간근무시간 인정시간 : 익일 야간근무시간까지 합산(2시간이내) */
          t_nightmm += get_minterm(btime3,ietime);
     }

     return(SUCCESS);
}
/* ==============================================================================
 Version  date(yy.mm.dd)  programmer  description                 relevant doc.no
 30.20    2001.08.09.      유효성       휴일근무시 식사시간 제외 추가
============================================================================= */

/*****************************************************************************
  실제근무시작시간과 실제근무종료시간으로 부터 식사시간을 구하는 함수.== 정규직
******************************************************************************/
get_mealhh(char *frtime, char *totime)
{
     int    dd       =  0;
     int    tmp      =  0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   t_str[5] = "";
     char   str[8+1] = "";
     int    btime1   =  0;
     int    btime2   =  0;
     int    istime   =  0;
     int    ietime   =  0;
     int    daykind  =  0;
     /* double t_mealmm =  0; */

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     istime = atoi(stime);
     ietime = atoi(etime);


     strncpy(str,frtime,8);
     daykind   = get_daykind(str);

     dd = check_datetime(frtime,totime);


     if  (dd == FAIL)
          return(FAIL);

     if ((daykind == 1)  && (dd == 0) ) /*평일이면서 초과근무시간이 당일 범위 이내이면 계산안함.*/
          return (SUCCESS) ;

     if  (dd == 1)
     {
          strncpy(t_str,totime+8,4);
          tmp   = atoi(t_str);
          ietime  = tmp + 2400;
     }


     /*
      아침 : 08:00 ~ 09:00
      점심 : 12:00 ~ 13:00
      저녁 : 18:00 ~ 19:00
     */
     /* 자율 책임 근무제 집계는 2018.08.01부터 가능 - 2018.06.29 Sangmoon Lee */
     /* 자율 책임 근무제 대상자("G","O") 식사시간제외 삭제 */
     /* 자율 책임 근무제 비대상자("N") 식사시간제외 적용 - 2018.08.17 Sangmoon Lee */
     if  ((strcmp(otflag, "N") == 0))
     {
          /* 아침, 점심, 저녁 식사시간을 차례로 계산 */
          if  (daykind == 4 )
          {
              /*아침*/

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

          btime1 = 1800 ;
          btime2 = 1900 ;


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
                   (ietime >  istime))
          {
               t_mealmm += get_minterm(btime1,btime2);
          }
          else
          {
               t_mealmm += 0;
          }


          if ((dd == 1) && (strcmp(etime,"0800") > 0))
          {
               /*다음날 아침*/

               btime1 = 800 + 2400 ;
               btime2 = 900 + 2400 ;

               if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime > btime2) )    {
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

               btime1 = 1800 + 2400;
               btime2 = 1900 + 2400;


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
     }
     //if  (((strcmp(otflag, "O") == 0)) ||
     //     ((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0)) ||
     //     ((strcmp(sumYN,"N") == 0) && (strcmp(curdate, CALDATE) < 0)))
     //{
     //     /* 아침, 점심, 저녁 식사시간을 차례로 계산 */
     //     if  (daykind == 4 )
     //     {
     //         /*아침*/
     //
     //          btime1 = 800 ;
     //          btime2 = 900 ;
     //
     //          if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime > btime2) )
     //          {
     //               t_mealmm  = get_minterm(istime, btime2) ;
     //          }
     //          else if ((ietime >= btime1) &&
     //                   (ietime <= btime2) &&
     //                   (istime < btime1))
     //          {
     //               t_mealmm  = get_minterm(btime1,ietime);
     //          }
     //          else if ((istime >= btime1) && (istime <= btime2) &&
     //                   (ietime <= btime2) && (ietime >  istime))
     //          {
     //               t_mealmm = get_minterm(istime,ietime);
     //          }
     //          else if ((istime <= btime1) && (ietime >= btime2) &&
     //                   (ietime >  istime))
     //          {
     //               t_mealmm = get_minterm(btime1,btime2);
     //          }
     //          else
     //          {
     //               t_mealmm = 0;
     //          }
     //
     //          /*점심*/
     //
     //          btime1 = 1200 ;
     //          btime2 = 1300 ;
     //
     //          if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime > btime2) )
     //          {
     //               t_mealmm +=  get_minterm(istime,btime2);
     //          }
     //          else if ((ietime >= btime1) &&
     //                   (ietime <= btime2) &&
     //                   (istime < btime1))
     //          {
     //               t_mealmm  += get_minterm(btime1,ietime);
     //          }
     //          else if ((istime >= btime1) && (istime <= btime2) &&
     //                   (ietime <= btime2) && (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(istime,ietime);
     //          }
     //          else if ((istime <= btime1) && (ietime >= btime2) &&
     //                   (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(btime1,btime2);
     //          }
     //          else
     //          {
     //               t_mealmm += 0;
     //          }
     //     }
     //
     //     /*저녁*/
     //
     //     btime1 = 1800 ;
     //     btime2 = 1900 ;
     //
     //
     //     if ((istime >= btime1) && (istime <= btime2) &&
     //         (ietime > btime2) )
     //     {
     //          t_mealmm += get_minterm(istime,btime2);
     //     }
     //     else if ((ietime >= btime1) &&
     //              (ietime <= btime2) &&
     //              (istime < btime1))
     //     {
     //          t_mealmm += get_minterm(btime1,ietime);
     //     }
     //     else if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime <= btime2) && (ietime >  istime))
     //     {
     //          t_mealmm += get_minterm(istime,ietime);
     //     }
     //     else if ((istime <= btime1) && (ietime >= btime2) &&
     //              (ietime >  istime))
     //     {
     //          t_mealmm += get_minterm(btime1,btime2);
     //     }
     //     else
     //     {
     //          t_mealmm += 0;
     //     }
     //
     //
     //     if ((dd == 1) && (strcmp(etime,"0800") > 0))
     //     {
     //          /*다음날 아침*/
     //
     //          btime1 = 800 + 2400 ;
     //          btime2 = 900 + 2400 ;
     //
     //          if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime > btime2) )    {
     //               t_mealmm += get_minterm(istime, btime2) ;
     //          }
     //          else if ((ietime >= btime1) &&
     //                   (ietime <= btime2) &&
     //                   (istime < btime1))
     //          {
     //               t_mealmm += get_minterm(btime1,ietime);
     //          }
     //          else if ((istime >= btime1) && (istime <= btime2) &&
     //                   (ietime <= btime2) && (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(istime,ietime);
     //          }
     //          else if ((istime <= btime1) && (ietime >= btime2) &&
     //                   (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(btime1,btime2);
     //          }
     //          else
     //          {
     //               t_mealmm += 0;
     //          }
     //
     //
     //          /* 다음날 점심*/
     //
     //          btime1 = 1200 + 2400 ;
     //          btime2 = 1300 + 2400 ;
     //
     //          if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime > btime2) )
     //          {
     //               t_mealmm  +=  get_minterm(istime,btime2);
     //          }
     //          else if ((ietime >= btime1) &&
     //                   (ietime <= btime2) &&
     //                   (istime < btime1))
     //          {
     //               t_mealmm  += get_minterm(btime1,ietime);
     //          }
     //          else if ((istime >= btime1) && (istime <= btime2) &&
     //                   (ietime <= btime2) && (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(istime,ietime);
     //          }
     //          else if ((istime <= btime1) && (ietime >= btime2) &&
     //                   (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(btime1,btime2);
     //          }
     //          else
     //          {
     //               t_mealmm += 0;
     //          }
     //
     //
     //          /*다음날 저녁*/
     //
     //          btime1 = 1800 + 2400;
     //          btime2 = 1900 + 2400;
     //
     //
     //          if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime > btime2) )
     //          {
     //               t_mealmm  += get_minterm(istime,btime2);
     //          }
     //          else if ((ietime >= btime1) &&
     //                   (ietime <= btime2) &&
     //                   (istime < btime1))
     //          {
     //               t_mealmm += get_minterm(btime1,ietime);
     //          }
     //          else if ((istime >= btime1) && (istime <= btime2) &&
     //                   (ietime <= btime2) && (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(istime,ietime);
     //          }
     //          else if ((istime <= btime1) && (ietime >= btime2) &&
     //                   (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(btime1,btime2);
     //          }
     //          else
     //          {
     //               t_mealmm += 0;
     //          }
     //     }
     //}
     ///* Sangmoon Lee 2018.06.19 - 휴일근로를 하게 되면 휴일 가산수당이 붙지만 점심과 저녁 각각 1시간씩을 제외 박명언M */
     //else if  (strcmp(otflag, "G") == 0)
     //{
     //     /* 점심, 저녁 식사시간을 차례로 계산 */
     //     if  (daykind == 4 )
     //     {
     //          /*점심*/
     //
     //          btime1 = 1200 ;
     //          btime2 = 1300 ;
     //
     //          if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime > btime2) )
     //          {
     //               t_mealmm =  get_minterm(istime,btime2);
     //          }
     //          else if ((ietime >= btime1) &&
     //                   (ietime <= btime2) &&
     //                   (istime < btime1))
     //          {
     //               t_mealmm  = get_minterm(btime1,ietime);
     //          }
     //          else if ((istime >= btime1) && (istime <= btime2) &&
     //                   (ietime <= btime2) && (ietime >  istime))
     //          {
     //               t_mealmm = get_minterm(istime,ietime);
     //          }
     //          else if ((istime <= btime1) && (ietime >= btime2) &&
     //                   (ietime >  istime))
     //          {
     //               t_mealmm = get_minterm(btime1,btime2);
     //          }
     //          else
     //          {
     //               t_mealmm = 0;
     //          }
     //
     //          /*저녁*/
     //
     //          btime1 = 1800 ;
     //          btime2 = 1900 ;
     //
     //
     //          if ((istime >= btime1) && (istime <= btime2) &&
     //              (ietime > btime2) )
     //          {
     //               t_mealmm += get_minterm(istime,btime2);
     //          }
     //          else if ((ietime >= btime1) &&
     //                   (ietime <= btime2) &&
     //                   (istime < btime1))
     //          {
     //               t_mealmm += get_minterm(btime1,ietime);
     //          }
     //          else if ((istime >= btime1) && (istime <= btime2) &&
     //                   (ietime <= btime2) && (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(istime,ietime);
     //          }
     //          else if ((istime <= btime1) && (ietime >= btime2) &&
     //                   (ietime >  istime))
     //          {
     //               t_mealmm += get_minterm(btime1,btime2);
     //          }
     //          else
     //          {
     //               t_mealmm += 0;
     //          }
     //     }
     //}
     t_mealhh = floor(t_mealmm / 60) ;

     return(SUCCESS);
}

/* 계약직 식사시간 기준 변경으로 식사시간 로직 정규직, 계약직 분리 - 2018.02.08 SangMoon Lee */
/* 계약직은 조식시간 제외 되도록... - HR팀 김선일M [SR-1802-0251] */

/*****************************************************************************
  실제근무시작시간과 실제근무종료시간으로 부터 식사시간을 구하는 함수.== 계약직
******************************************************************************/
get_mealhh_con(char *frtime, char *totime)
{
     int    dd       =  0;
     int    tmp      =  0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   t_str[5] = "";
     char   str[8+1] = "";
     int    btime1   =  0;
     int    btime2   =  0;
     int    istime   =  0;
     int    ietime   =  0;
     int    daykind  =  0;
     /* double t_mealmm =  0; */

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     istime = atoi(stime);
     ietime = atoi(etime);


     strncpy(str,frtime,8);
     daykind   = get_daykind(str);

     dd = check_datetime(frtime,totime);


     if  (dd == FAIL)
          return(FAIL);

     if ((daykind == 1)  && (dd == 0) ) /*평일이면서 초과근무시간이 당일 범위 이내이면 계산안함.*/
          return (SUCCESS) ;

     if  (dd == 1)
     {
          strncpy(t_str,totime+8,4);
          tmp   = atoi(t_str);
          ietime  = tmp + 2400;
     }

     /* 자율 책임 근무제 대상자("G","O") 식사시간제외 삭제 */
     /* 자율 책임 근무제 비대상자("N") 식사시간제외 적용 - 2018.08.17 Sangmoon Lee */
     if  ((strcmp(otflag, "N") == 0))
     {
          /* 아침, 점심, 저녁 식사시간을 차례로 계산 */
          if  (daykind == 4 )
          {
          /*아침 제외*/

          /*점심*/
               btime1 = 1200 ;
               btime2 = 1300 ;

               if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime > btime2) )
               {
                    t_mealmm =  get_minterm(istime,btime2);
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
          }

          /*저녁*/
          /* 석식시간은 동절기, 하절기에 따른 구분값 적용하여 계산 */
          btime1 = 1800 ;
          btime2 = 1900 ;


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
                   (ietime >  istime))
          {
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

               if ((istime >= btime1) && (istime <= btime2) &&
                   (ietime > btime2) )    {
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

               btime1 = 1800 + 2400;
               btime2 = 1900 + 2400;


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
          /* 자율 근무제 로직 반영 - Sangmoon Lee 2018.06.19 */
          /* 자율 책임 근무제 대상자("G","O") 9이상제외 삭제 */
          /* 자율 책임 근무제 비대상자("N") 9이상제외 적용 - 2018.08.17 Sangmoon Lee */
          if  ((strcmp(otflag, "N") == 0))
          {
               if  (strcmp(ba, "1900") < 0 )
                    strcpy(ba, "1900")  ;

               if  (strcmp(bb, "0800") > 0 )
                    strcpy(bb, "0800")  ;

               tmp = atoi(bb) + 2400 ;

               tmp = (int)(get_minterm(atoi(ba), tmp) / 60)  ;

               /*2014.05.20.hjku. 휴식초과가 한시간 미만일 경우 9시간 근무한 대상자에 대해 제외시간 처리.. 홍원영M */
               if  (( tmp >= 9 ) &&(floor(t_restmm/60)<1))
                     t_excephh = 1 ;
          }
          //if  (((strcmp(otflag, "O") == 0)) ||
          //     ((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0)) ||
          //     ((strcmp(sumYN,"N") == 0) && (strcmp(curdate, CALDATE) < 0)))
          //{
          //     if  (strcmp(ba, "1900") < 0 )
          //          strcpy(ba, "1900")  ;
          //
          //     if  (strcmp(bb, "0800") > 0 )
          //          strcpy(bb, "0800")  ;
          //
          //     tmp = atoi(bb) + 2400 ;
          //
          //     tmp = (int)(get_minterm(atoi(ba), tmp) / 60)  ;
          //
          //     /*2014.05.20.hjku. 휴식초과가 한시간 미만일 경우 9시간 근무한 대상자에 대해 제외시간 처리.. 홍원영M */
          //     if  (( tmp >= 9 ) &&(floor(t_restmm/60)<1))
          //           t_excephh = 1 ;
          //}
          ///* Sangmoon Lee 2018.06.19 - 초과근무로 넘어가지 않은 상태에서 야간근로를 하게 되면 9시간 근무 시 제외시간(1시간) 처리.. 박명언M */
          //else if  (strcmp(otflag, "G") == 0)
          //{
          //     if  (strcmp(ba, "2200") < 0 )
          //          strcpy(ba, "2200")  ;
          //
          //     if  (strcmp(bb, "0800") > 0 )
          //          strcpy(bb, "0800")  ;
          //
          //     tmp = atoi(bb) + 2400 ;
          //
          //     tmp = (int)(get_minterm(atoi(ba), tmp) / 60)  ;
          //
          //     if  (( tmp >= 9 ) &&(floor(t_restmm/60)<1))
          //           t_excephh = 1 ;
          //}
     }

     return (SUCCESS) ;
}

/****************************************************************************
        E1,H1평일 오전 시작시간과 종료시간 사이의 간격을 시간단위로 구하는 함수.
 ****************************************************************************/
float get_hourterm_con(int a,int b)
{
     int   mm1,mm2;
     int   hh1,hh2;
     float result;
     int   hh, qq;

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

     hh = ((int)mm2/60);
     qq = ((int)(mm2 -hh*60)/15);

     result = hh + 0.25 * qq; /* 15분 단위로 계산 */

     return(result);
}


/****************************************************************************
        시작시간과 종료시간 사이의 간격을 시간단위로 구하는 함수.
 ****************************************************************************/
get_hourterm(int a,int b)
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

     /*근무시간 오등록으로 음수가 나올 경우 check 2015.10.13 jissi*/
     if  (mm2 < 0)
          mm2 = 0;

     return((int)(mm2/60));
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

     if  ((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0))
     {
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



/****************************************************************************
  실제근무시간의 유효성을 Check 하는 함수.
****************************************************************************/
check_datetime(char *frtime,char *totime)
{
     int len       = 0;
     int  dd;
     char t_yy[3]  = "";
     char t_mm[3]  = "";
     char t_dd[3]  = "";
     char frstr[9] = "";
     char tostr[9] = "";

     len = strlen(frtime);
     if  (len != 12)
     {
          printf("실제시작시간값이 유효하지 않습니다.\n");
          sprintf(log_buff, "실제시작시간값이 유효하지 않습니다.\n"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     len  = strlen(totime);
     if  (len != 12)
     {
          printf("실제종료시간값이 유효하지 않습니다.\n");
          sprintf(log_buff, "실제종료시간값이 유효하지 않습니다.\n"); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     strncpy(frstr,frtime,8);
     strncpy(tostr,totime,8);
     dd = calc_term(frstr,tostr);
     if  (dd == FAIL)
          return(FAIL);

     if ((dd < 0) || (dd >= 2))
     {
          printf( "\n [DEBUG] 0. frtime=%s totime=%s .\n" ,frtime,totime);
          //sprintf(log_buff, "시작일과 종료일의 간격이 유효하지 않습니다.\n empno = %s",empno); /*dsa2000 Rexec 대체*/
          sprintf(log_buff, "\n [DEBUG] 0. frtime=%s totime=%s .\n", frtime,totime);
          //Write_batlog(seqno++, log_buff);
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     return(dd);
}

/***************************************************************************
  계약직 일반연장시간을 처리하는 함수.(2008.05.08 추가)
****************************************************************************/
get_genexthh_con(char *frtime,char *totime)
{
     int   tmp       = 0;
     int   dd        = 0;
     int   daykind1  = 0;
     int   daykind2  = 0;
     char  stime[5]  = "";
     char  etime[5]  = "";
     char  str[8+1]  = "";
     int   term      = 0;

     dd = check_datetime(frtime,totime);

     if (dd == FAIL) return(FAIL);

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);


     strncpy(str,frtime,8);
     daykind1 = get_daykind(str);

     strncpy(str,totime,8);
     daykind2 = get_daykind(str);

     /*printf("\nDEBUG frdate[%s],todate[%s], dakind1[%d],daykind2[%d],dd[%d]",frtime,totime,daykind1,daykind2,dd);*/

     /* 2008.05.08. 추가 E1,H1 평일 오전 0600~0830 사이 초과 근무수당 15분분단위로 초과근무 계산 (인력팀 정정명씨,신영섭대리 통해서.)*/
     /*printf("\nDEBUG dd[%d], dakind1[%d],daykind2[%d]/n",dd,daykind1,daykind2);
     담당직무 비서 09,기사 15로 변경함. KTH */

     /* 자율 책임 근무제 비대상자("N") 기존로직 적용 - 2018.08.17 Sangmoon Lee */
     if ( (strcmp(otflag,"N") == 0) ||
          ((strcmp(otflag," ") == 0) &&
           (((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0)) ||
            ((strcmp(sumYN,"N") == 0) && (strcmp(curdate, CALDATE) < 0)) )) )
     {
          //if((strcmp(paycl,"E1") == 0 )||(strcmp(paycl,"H1") == 0 ))
          if ((strcmp(tjobduty,"09") == 0 )||(strcmp(tjobduty,"15") == 0 ))
          {
               if  (daykind1 != 4)
               {
                   if ((dd == 1)&&(daykind2 != 4))
                   {/* 예->200805050900~200805060830,또는 200805061900~200805070830 입력시 */
                        if ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0))
                        {
                             tmp   = atoi(etime);
                             tmp   = tmp + 2400;

                             /*t_genexthh = get_hourterm_con(atoi(stime),tmp);
                               평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                             if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                             {
                                  t_genexthh = get_hourterm_con(atoi("1800"),tmp);
                                  t_genextmm = get_minterm(atoi("1800"),tmp);
                             }
                             else
                             {
                                  t_genexthh = get_hourterm_con(atoi(stime),tmp);
                                  t_genextmm = get_minterm(atoi(stime),tmp);
                             }
                        }
                        else
                        {
                             tmp   = atoi(etime);
                             tmp   = tmp + 2400;

                             /*t_genexthh = get_hourterm(atoi(stime),tmp);
                               평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                             if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                             {
                                  t_genexthh = get_hourterm(atoi("1800"),tmp);
                                  t_genextmm = get_minterm(atoi("1800"),tmp);
                             }
                             else
                             {
                                  t_genexthh = get_hourterm(atoi(stime),tmp);
                                  t_genextmm = get_minterm(atoi(stime),tmp);
                             }
                        }

                        return(SUCCESS);
                   }
                   else if (dd == 0)
                   {
                        if(((strcmp(stime,"0600") > 0)&&(strcmp(stime,"0830") <= 0))||
                           ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0)))
                        {
                             /*t_genexthh = get_hourterm_con(atoi(stime),atoi(etime));
                               평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                             if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                             {
                                  t_genexthh = get_hourterm_con(atoi("1800"),atoi(etime));
                                  t_genextmm = get_minterm(atoi("1800"),atoi(etime));
                             }
                             else
                             {
                                  t_genexthh = get_hourterm_con(atoi(stime),atoi(etime));
                                  t_genextmm = get_minterm(atoi(stime),atoi(etime));
                             }
                        }
                        else
                        {
                             /*t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                               평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                             if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                             {
                                  t_genexthh = get_hourterm(atoi("1800"),atoi(etime));
                                  t_genextmm = get_minterm(atoi("1800"),atoi(etime));
                             }
                             else
                             {
                                  t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                                  t_genextmm = get_minterm(atoi(stime),atoi(etime));
                             }
                        }

                        return(SUCCESS);
                   }
                   else if ((dd == 1)&&(daykind2 == 4))  // 날짜가 2일이면서 첫날이 휴일이 경우 일반연장 넣어줌.  kth.
                   {
                        tmp     = atoi(etime);
                        tmp     = tmp + 2400;

                        /*t_genexthh = get_hourterm(atoi(stime),tmp);
                          평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                        if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                        {
                             t_genexthh = get_hourterm(atoi("1800"),tmp);
                             t_genextmm = get_minterm(atoi("1800"),tmp);
                        }
                        else
                        {
                             t_genexthh = get_hourterm(atoi(stime),tmp);
                             t_genextmm = get_minterm(atoi(stime),tmp);
                        }

                        return(SUCCESS);
                   }
               }
               else
               {
                    t_genexthh = 0;
                    return(SUCCESS);
               }
          }
     }
     else if (strcmp(otflag,"O") == 0) /* 초과근무시 계산 */
     {
          //if((strcmp(paycl,"E1") == 0 )||(strcmp(paycl,"H1") == 0 ))
          if ((strcmp(tjobduty,"09") == 0 )||(strcmp(tjobduty,"15") == 0 ))
          {
               if  (daykind1 != 4)
               {
                   if ((dd == 1)&&(daykind2 != 4))
                   {/* 예->200805050900~200805060830,또는 200805061900~200805070830 입력시 */
                        if ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0))
                        {
                             tmp   = atoi(etime);
                             tmp   = tmp + 2400;

                             t_genexthh = get_hourterm_con(atoi(stime),tmp);
                             t_genextmm = get_minterm(atoi(stime),tmp);

                        }
                        else
                        {
                             tmp   = atoi(etime);
                             tmp   = tmp + 2400;

                             t_genexthh = get_hourterm(atoi(stime),tmp);
                             t_genextmm = get_minterm(atoi(stime),tmp);

                        }

                        return(SUCCESS);
                   }
                   else if (dd == 0)
                   {
                        if(((strcmp(stime,"0600") > 0)&&(strcmp(stime,"0830") <= 0))||
                           ((strcmp(etime,"0600") > 0)&&(strcmp(etime,"0830") <= 0)))
                        {
                             t_genexthh = get_hourterm_con(atoi(stime),atoi(etime));
                             t_genextmm = get_minterm(atoi(stime),atoi(etime));

                        }
                        else
                        {
                             t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                             t_genextmm = get_minterm(atoi(stime),atoi(etime));

                        }

                        return(SUCCESS);
                   }
                   else if ((dd == 1)&&(daykind2 == 4))  // 날짜가 2일이면서 첫날이 휴일이 경우 일반연장 넣어줌.  kth.
                   {
                        tmp     = atoi(etime);
                        tmp     = tmp + 2400;

                        t_genexthh = get_hourterm(atoi(stime),tmp);
                        t_genextmm = get_minterm(atoi(stime),tmp);


                        return(SUCCESS);
                   }
               }
               else
               {
                    t_genexthh = 0;
                    return(SUCCESS);
               }
          }
          else
          {    //h1, e1 이 아닐 경우 일반연장 계산해 줌. kth 정규직과 동일하게 시간계산.
               if  (daykind1 != 4)
               {
                    if ((dd==1) && (strcmp(etime,"0800") > 0))
                    {
                         tmp     = atoi("0800");
                         tmp     = tmp + 2400;

                         t_genexthh = get_hourterm(atoi(stime),tmp);
                         t_genextmm = get_minterm(atoi(stime),tmp);

                    }
                    else
                    {
                         t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                         t_genextmm = get_minterm(atoi(stime),atoi(etime));

                    }
                    return(SUCCESS);
               }
               else
               {
                    t_genexthh = 0;
                    t_genextmm = 0;
                    return(SUCCESS);
               }//h1, e1 이 아닐 경우 일반연장 계산해 줌. kth 정규직과 동일하게 시간계산 끝
          }
     }
     else if (strcmp(otflag,"G") == 0) /* 휴일 정상근무시 연장근무로 계산 */
     {
          t_genexthh = 0;
          t_genextmm = 0;
          return(SUCCESS);
     }

     return(SUCCESS);
}


/***************************************************************************
  일반연장시간을 처리하는 함수.
****************************************************************************/
get_genexthh(char *frtime,char *totime)
{
     int    tmp      = 0;
     int    dd       = 0;
     int    daykind  = 0;
     char   stime[5] = "";
     char   etime[5] = "";
     char   str[8+1] = "";

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     strncpy(str,frtime,8);
     daykind   = get_daykind(str);

     if  (daykind != 4)
     {
          dd = check_datetime(frtime,totime);
          if  (dd == FAIL)
               return(FAIL);

          /* 자율 책임 근무제 비대상자("N") 기존로직 적용 - 2018.08.17 Sangmoon Lee */
          if ( (strcmp(otflag,"N") == 0) ||
               ((strcmp(otflag," ") == 0) &&
                (((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0)) ||
                 ((strcmp(sumYN,"N") == 0) && (strcmp(curdate, CALDATE) < 0)) )) )
          {
                if ((dd==1) && (strcmp(etime,"0800") > 0))
                {
                     tmp     = atoi("0800");
                     tmp     = tmp + 2400;
                     /*t_genexthh = get_hourterm(atoi(stime),tmp);
                       평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                     if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                     {
                          t_genexthh = get_hourterm(atoi("1800"),tmp);
                          t_genextmm = get_minterm(atoi("1800"),tmp);
                     }
                     else
                     {
                          t_genexthh = get_hourterm(atoi(stime),tmp);
                          t_genextmm = get_minterm(atoi(stime),tmp);
                     }
                }
                else
                {
                     if  (dd == 1)
                     {
                          tmp   = atoi(etime);
                          tmp   = tmp + 2400;
                          /*t_genexthh = get_hourterm(atoi(stime),tmp);
                            평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                          if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                          {
                               t_genexthh = get_hourterm(atoi("1800"),tmp);
                               t_genextmm = get_minterm(atoi("1800"),tmp);
                          }
                          else
                          {
                               t_genexthh = get_hourterm(atoi(stime),tmp);
                               t_genextmm = get_minterm(atoi(stime),tmp);
                          }
                     }
                     else
                     {
                          /*t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                            평일 근무시작시간을 정규근무시간내 등록한 경우 check 2015.10.13 jissi*/
                          if ((strcmp(stime,"0900") >= 0) && (strcmp(stime,"1800") <= 0))
                          {
                               t_genexthh = get_hourterm(atoi("1800"),atoi(etime));
                               t_genextmm = get_minterm(atoi("1800"),atoi(etime));
                          }
                          else
                          {
                               t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                               t_genextmm = get_minterm(atoi(stime),atoi(etime));
                          }
                     }
                }
          }
          /* 자율 근무제 로직 반영 - Sangmoon Lee 2018.06.14 */
          else if (strcmp(otflag,"O") == 0) /* 초과근무시 계산 */
          {
               if ((dd == 1) && (strcmp(etime,"0800") > 0) )
               {
                    tmp     = atoi("0800");
                    tmp     = tmp + 2400;

                    t_genexthh = get_hourterm(atoi(stime),tmp);
                    t_genextmm = get_minterm(atoi(stime),tmp);

               }
               else
               {
                    if  (dd == 1)
                    {
                         tmp   = atoi(etime);
                         tmp   = tmp + 2400;

                         t_genexthh = get_hourterm(atoi(stime),tmp);
                         t_genextmm = get_minterm(atoi(stime),tmp);

                    }
                    else
                    {
                         t_genexthh = get_hourterm(atoi(stime),atoi(etime));
                         t_genextmm = get_minterm(atoi(stime),atoi(etime));

                    }
               }

          }
          else if (strcmp(otflag,"G") == 0) /* 정상근무시 계산 X */
          {
               t_genexthh = 0;
               t_genextmm = 0;
          }
          return(SUCCESS);
     }
     else
     {
          t_genexthh = 0;
          t_genextmm = 0;
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

          char    t_date[8+1]  = "";
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
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(TO_CHAR((TO_DATE(:b0,'YYYYMMDD')\
+:b1),'YYYYMMDD'),'YYYYMMDD'),'YYYYMMDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1249;
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
     SELECT   TO_CHAR(LAST_DAY(TO_DATE(:basedate,'YYYYMMDD')),'YYYYMMDD')
       INTO  :basedate
       FROM  DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMMDD')),'YYYYM\
MDD') into :b0  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1276;
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
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(TO_DATE(:b0,'YYYYMMDD'),'DAY') into :b1 \
 from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1299;
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
     int  i = 0;

     get_dayname(indate,dayname);
     if  (strcmp(dayname,"SUNDAY") == 0)
          return(4);

     sprintf(day,"%s",indate);
     count  = 0;
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
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from (select HOLIDATE  from \
PKCHOLI where HOLIDATE=:b1 union select DUTYDATE  from PKHOLIEMP where ((DUTY\
DATE=:b1 and EMPNO=:b3) and DUKIND='49') minus select DUTYDATE  from PKHOLIEM\
P where ((DUTYDATE=:b1 and EMPNO=:b3) and DUKIND='00')) ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1322;
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


     /*printf("DEBUG count[%d],day[%s],empno[%s]\n",count,day, empno);*/
     if  (count >= 1)
     {
          i = 4;
          return(i);
     }

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
     char    stime[5] = "";
     char    etime[5] = "";
     char    str[9]   = "";
     int     tmp      = 0;
     int     dd       = 0;
     int     daykind  = 0;
     double  a,b;
     int     a1,b1;

     strncpy(stime,frtime+8,4);
     strncpy(etime,totime+8,4);
     strncpy(str,frtime,8);

     daykind    = get_daykind(str);
     if  (daykind == 4)
     {
          dd = check_datetime(frtime,totime);
          if  (dd == FAIL)
               return(FAIL);

          /* 자율 근무제 로직 반영 - Sangmoon Lee 2018.06.14 */
          /* 자율 책임 근무제 비대상자("N") 기존로직 적용 - 2018.08.17 Sangmoon Lee */
          if ((strcmp(otflag,"N") == 0) || /* 초과근무시 모두 계산 */
              ((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0)) ||
              ((strcmp(sumYN,"N") == 0) && (strcmp(curdate, CALDATE) < 0)) )
          {
               if ((dd==1) && (strcmp(etime,"0800") > 0) )
               {
                    tmp    = atoi("0800");
                    tmp   = tmp + 2400;
                    a = get_hourterm(atoi(stime),tmp);
                    b = get_hourterm(atoi("0800"),atoi(etime));

                    a1 = get_minterm(atoi(stime),tmp);
                    b1 = get_minterm(atoi("0800"),atoi(etime));

                    t_holihh = a + b;
                    t_holimm = a1 + b1;

                    if  (a > 8)
                    {
                         t_holiexthh = a - 8;
                         t_holiextmm = a1 - (8 * 60);
                    }
                    if  (b > 8)
                    {
                         t_holiexthh = t_holiexthh + (b - 8);
                         t_holiextmm = t_holiextmm + (b1 - (8 * 60));
                    }
               }
               else
               {
                    if  (dd == 1)
                    {
                         tmp      = atoi(etime);
                         tmp      = tmp + 2400;
                         t_holihh = get_hourterm(atoi(stime),tmp);
                         t_holimm = get_minterm(atoi(stime),tmp);
                    }
                    else
                    {
                         t_holihh = get_hourterm(atoi(stime), atoi(etime));
                         t_holimm = get_minterm(atoi(stime), atoi(etime));
                    }

                    if  (t_holihh > 8)
                    {
                         t_holiexthh = t_holihh - 8;
                         t_holiextmm = t_holimm - (8 * 60);
                    }
               }
          }
          else if (strcmp(otflag,"O") == 0) /* 초과근무시 모두 계산 */
          {
               if ((dd==1) && (strcmp(etime,"0800") > 0) )
               {
                    tmp    = atoi("0800");
                    tmp   = tmp + 2400;
                    a = get_hourterm(atoi(stime),tmp);
                    b = get_hourterm(atoi("0800"),atoi(etime));

                    a1 = get_minterm(atoi(stime),tmp);
                    b1 = get_minterm(atoi("0800"),atoi(etime));

                    t_holihh = a + b;
                    t_holimm = a1 + b1;

                    /* 초과근무시 휴일근로시간 = 휴일연장시간 - Sangmoon Lee 2018.06.14 */
                    t_holiexthh = t_holihh;
                    t_holiextmm = t_holimm;

               }
               else
               {
                    if  (dd == 1)
                    {
                         tmp      = atoi(etime);
                         tmp      = tmp + 2400;
                         t_holihh = get_hourterm(atoi(stime),tmp);
                         t_holimm = get_minterm(atoi(stime),tmp);
                    }
                    else
                    {
                         t_holihh = get_hourterm(atoi(stime), atoi(etime));
                         t_holimm = get_minterm(atoi(stime), atoi(etime));
                    }

                    /* 초과근무시 휴일근로시간 = 휴일연장시간 - Sangmoon Lee 2018.06.14 */
                    t_holiexthh = t_holihh;
                    t_holiextmm = t_holimm;
               }
          }
          else if (strcmp(otflag,"G") == 0) /* 휴일 정상근무시 연장근무로 계산 */
          {
               if  (dd == 1)
               {
                    tmp      = atoi(etime);
                    tmp      = tmp + 2400;
                    t_holiexthh = get_hourterm(atoi(stime),tmp);
                    t_holiextmm = get_minterm(atoi(stime),tmp);
               }
               else
               {
                    t_holiexthh = get_hourterm(atoi(stime), atoi(etime));
                    t_holiextmm = get_minterm(atoi(stime), atoi(etime));
               }
          }
     }

     return(SUCCESS);
}
/****************************************************************************
   계산된 근무시간을 DB에 저장하는 Procedure.
 ****************************************************************************/
update_record()
{
     char    dname[100+1]  = "";
     /*double  tongpay;*/
     int     daykind;
     double  ovtmnightamt = 0;  /*dsa2000 */
     char    t_date[8+1]  = "";
     char    t_chkdate[5]  = "";
     char    otflags[4];
     char    tmp_flag[2];
     strcpy(otflags,"NGO");
     

     if (strcmp(sumYN, "Y") == 0)
     {
          /* EXEC SQL
          SELECT  case when :ovtmdate < :comchdate                      /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                       then hper.COMMONUTIL.GET_OLDBASEPAY(:empno,:yearpaynum)
                       else hper.COMMONUTIL.GET_NEWBASEPAY(:empno,:yearpaynum) end  /oDB package에서 계산 jissi. 2016.12.14o/
            INTO :tongpay
            FROM DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select  case  when :b0<:b1 then hper.COMMONUTIL.GE\
T_OLDBASEPAY(:b2,:b3) else hper.COMMONUTIL.GET_NEWBASEPAY(:b2,:b3)  end  into\
 :b6  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1361;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)ovtmdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)comchdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
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
          sqlstm.sqhstv[3] = (unsigned char  *)yearpaynum;
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)empno;
          sqlstm.sqhstl[4] = (unsigned long )5;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)yearpaynum;
          sqlstm.sqhstl[5] = (unsigned long )7;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&tongpay;
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


     }
     else if (strcmp(sumYN, "N") == 0)
     {
          tongpay  = tongpay;
     }


     /*2016.08.24 jissi HR팀 홍원영M 요청 SR-1608-0885
       휴일근로시간이 1시간인 경우 기존처럼 식사제외시간을 제외하지 않고 0으로 반영
       ※단, 일반연장근로는 제외함. */
     if ((t_holihh == 1) && (t_genexthh == 0) && (t_holiexthh == 0))
          t_mealhh = 0;

     /******************************************************************************/
     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */

     pre_PKHOTFWD(); /* 전월 이월 데이터 조회 */

     /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
     /* EXEC SQL
     SELECT  PRE_GENEXTSUM, PRE_HOLIEXTSUM, PRE_NIGHTSUM,
             PRE_HOLISUM, PRE_MEALSUM, PRE_RESTSUM, PRE_SPRESTSUM, PRE_RESTSUM_H
       INTO  :pre_genextsum, :pre_holiextsum, :pre_nightsum,
             :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum, :pre_restsum_h
       FROM  PKHOTFWD
      WHERE  EMPNO    = to_char(:empno )
        AND  OVTMYYMM = to_char(:workmm)
        AND  OTFLAG   = to_char(:otflag); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 15;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select PRE_GENEXTSUM ,PRE_HOLIEXTSUM ,PRE_NIGHTSUM ,PRE\
_HOLISUM ,PRE_MEALSUM ,PRE_RESTSUM ,PRE_SPRESTSUM ,PRE_RESTSUM_H into :b0,:b1\
,:b2,:b3,:b4,:b5,:b6,:b7  from PKHOTFWD where ((EMPNO=to_char(:b8) and OVTMYY\
MM=to_char(:b9)) and OTFLAG=to_char(:b10))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1404;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum_h;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)empno;
     sqlstm.sqhstl[8] = (unsigned long )5;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)workmm;
     sqlstm.sqhstl[9] = (unsigned long )7;
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)otflag;
     sqlstm.sqhstl[10] = (unsigned long )2;
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


     //sprintf(log_buff, "\n [DEBUG] 0. pre_genextsum=%d", pre_genextsum);
     //Write_batlog(seqno++, log_buff);

     /* 10분 절사 */
     t_genextmm  = floor(t_genextmm  / 10) * 10;
     t_holiextmm = floor(t_holiextmm / 10) * 10;
     t_nightmm   = floor(t_nightmm   / 10) * 10;
     t_holimm    = floor(t_holimm    / 10) * 10;
     t_mealmm    = floor(t_mealmm    / 10) * 10;
     t_restmm    = floor(t_restmm    / 10) * 10;
     t_sprestmm  = floor(t_sprestmm  / 10) * 10;

     /* 일반연장 */
     t_genexthh     = (int)t_genextmm / 60;
     pre_genextsum  = pre_genextsum + (t_genextmm % 60);
     /* 휴일연장 */
     t_holiexthh    = (int)t_holiextmm / 60;
     pre_holiextsum = pre_holiextsum + (t_holiextmm % 60);
     /* 야간근로 */
     t_nighthh      = (int)t_nightmm / 60;
     pre_nightsum   = pre_nightsum + (t_nightmm % 60);
     /* 휴일근로 */
     t_holihh       = (int)t_holimm / 60;
     pre_holisum    = pre_holisum + (t_holimm % 60);
     /* 식사시간 */
     t_mealhh       = (int)t_mealmm / 60;
     pre_mealsum    = pre_mealsum + (t_mealmm % 60);

     /******************************************************************************/

     t_extamt   = (t_genexthh * tongpay * 1.5) +
                  (t_holiexthh* tongpay * 0.5);
     t_nightamt =  t_nighthh  * tongpay * 0.5;
     t_holiamt  =  t_holihh   * tongpay * 1.5;
     t_mealamt  =  t_mealhh   * tongpay * 1.5;
     t_excepamt =  t_excephh  * tongpay * 1.5;

     t_extamt   = ceil(t_extamt);
     t_nightamt = ceil(t_nightamt);
     t_holiamt  = ceil(t_holiamt);
     t_mealamt  = floor(t_mealamt);
     t_excepamt = floor(t_excepamt);

     /*sprintf(log_buff, "\n [DEBUG] 1. t_nightmm=%d, t_nighthh=%d ", t_nightmm, t_nighthh);
     Write_batlog(seqno++, log_buff);*/


     ovtmhh     = get_ovtmhh(frrealtime,torealtime);

     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     /* ==============================================
         초과근무에서 휴식시간분만큼을 제외하는 로직 추가
      * ============================================== */

     /* 자율책임 근무제 도입으로 근무제별 가산 분리 - 2018.08.20 Sangmoon Lee */
     /*
      * N : *1.5
      * G : *0.5
      * O : 평일 *1.5, 휴일 *2.0
      */
     //t_restamt   = floor((int)t_restmm/60  * tongpay * 1.5);
     if (strcmp(otflag,"N") == 0) /* 비대상자 */
     {
          t_restamt   = floor((int)t_restmm/60  * tongpay * 1.5);
     }
     else if (strcmp(otflag,"G") == 0) /* 정상(휴일/야간) */
     {
          t_restamt   = floor((int)t_restmm/60  * tongpay * 0.5);
     }
     else if (strcmp(otflag,"O") == 0) /* 초과근무 */
     {
          if ( t_holihh > 0 )
          {
               t_restamt   = floor((int)t_restmm/60  * tongpay * 2.0);
          }
          else
          {
               t_restamt   = floor((int)t_restmm/60  * tongpay * 1.5);
          }
     }

     //pre_restsum = pre_restsum + (t_restmm % 60);
     /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
     if (strcmp(otflag,"O") == 0) /* 초과근무 */
     {
          if ( t_holihh > 0 )
          {
               pre_restsum_h = pre_restsum + (t_restmm % 60);
          }
          else
          {
               pre_restsum = pre_restsum + (t_restmm % 60);
          }
     }
     else
     {
          pre_restsum = pre_restsum + (t_restmm % 60);
     }

     /* ==============================================
         일상근무에서 휴식시간분만큼을 제외하는 로직 추가
      * ============================================== */
     t_sprestamt   = floor((int)t_sprestmm/60 * tongpay );
     pre_sprestsum = pre_sprestsum + (t_sprestmm % 60);

     /* 자율책임 근무제 도입으로 식사시간, 9이상 제외급 미적용. HR팀 박명언M 요청 - 2018.08.09 Sangmoon Lee */
     /* 자율 책임 근무제 대상자("G","O") 식사시간,9이상제외 삭제 */
     /* 자율 책임 근무제 비대상자("N") 기존로직 적용 - 2018.08.17 Sangmoon Lee */
     if (strcmp(otflag,"N") == 0)
     {
          total_amt  = total_amt + (t_extamt + t_nightamt + t_holiamt)
                     - t_restamt - t_sprestamt - t_mealamt - t_excepamt ;
     }
     else if ((strcmp(otflag,"O") == 0) ||
         ((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0)) ||
         ((strcmp(sumYN,"N") == 0) && (strcmp(curdate, CALDATE) < 0)) )
     {
          total_amt  = total_amt + (t_extamt + t_nightamt + t_holiamt)
                     - t_restamt - t_sprestamt /*- t_mealamt - t_excepamt*/ ;
     }
     else if (strcmp(otflag,"G") == 0)
     {
          total_amt  = total_amt + (t_extamt + t_nightamt + t_holiamt)
                     - t_restamt /*- t_sprestamt*//* - t_mealamt - t_excepamt*/ ;
     }

     if  (total_amt <= 0 )
          printf("\n 오류자료입니다. 사번[%s],성명[%s],초과근무일[%s] 11", empno,korname,ovtmdate);

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

/* dsa2000 2004.08.27. 야근식대 DB에서 읽어오도록 변경 -초과근무기준관리에서 변경 가능 */
          /* EXEC SQL
          SELECT OVTMNIGHTAMT
            INTO :ovtmnightamt
            FROM PKCOTBAS; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 15;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select OVTMNIGHTAMT into :b0  from PKCOTBAS ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1463;
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



    
/* dsa2000 end ===============================================================================*/
     }
     
     strncpy(t_chkdate,frrealtime+8,4);

     /* 자율 책임 근무제 대상자("G","O") 야간근로시 적용 */
     /* 자율 책임 근무제 비대상자("N") 기존로직 적용 - 2018.08.17 Sangmoon Lee */
     if (strcmp(otflag,"N") == 0)
     {
          if ( strcmp(t_chkdate,"1800") >= 0 )
          {
               ovmcamt = ovtmnightamt;
          }
          else
          {
               ovmcamt = 0;
          }
     }
     else if ((strcmp(otflag,"O") == 0) || (strcmp(otflag,"G") == 0))
     {
          if ( t_nighthh > 0 )
          {
               ovmcamt = ovtmnightamt;
          } 
          else
          {
               ovmcamt = 0;
          }
     }
     else
     {
          ovmcamt = 0;
     }

     /* EXEC SQL
     UPDATE  PKHOTHIS
        SET  EXTHH        = (:t_genexthh + :t_holiexthh),
             NIGHTHH      = :t_nighthh,
             HOLIHH       = :t_holihh,
             GENEXT       = :t_genexthh,
             HOLIEXT      = :t_holiexthh,
             OVTMHH       = :ovtmhh,
             OVMCAMT      = :ovmcamt,
             EXTAMT       = :t_extamt,
             NIGHTAMT     = :t_nightamt,
             HOLIAMT      = :t_holiamt,
             OVTMAMT      = (:t_extamt + :t_nightamt + :t_holiamt - :t_restamt - :t_sprestamt- :t_mealamt - :t_excepamt ),
             RESTAMT      = :t_restamt,
             SPRESTAMT    = :t_sprestamt ,
             MEALHH       = :t_mealhh,
             MEALAMT      = :t_mealamt ,
             EXCEPHH      = :t_excephh,
             EXCEPAMT     = :t_excepamt,
             WRITETIME    = TO_Char(sysdate,'YYYYMMDDHH24MISS'),
             WRITEMAN     = :jobempno
      WHERE  EMPNO        = :empno AND OVTMDATE = :ovtmdate
        AND  NVL(FRAPPTIME,'*')  = :frapptime
        AND  NVL(FRREALTIME,'*') = :frrealtime
        AND  OTFLAG              = :otflag
     ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTHIS  set EXTHH=(:b0+:b1),NIGHTHH=:b2,HOLIHH\
=:b3,GENEXT=:b0,HOLIEXT=:b1,OVTMHH=:b6,OVMCAMT=:b7,EXTAMT=:b8,NIGHTAMT=:b9,HO\
LIAMT=:b10,OVTMAMT=((((((:b8+:b9)+:b10)-:b14)-:b15)-:b16)-:b17),RESTAMT=:b14,\
SPRESTAMT=:b15,MEALHH=:b20,MEALAMT=:b16,EXCEPHH=:b22,EXCEPAMT=:b17,WRITETIME=\
TO_Char(sysdate,'YYYYMMDDHH24MISS'),WRITEMAN=:b24 where ((((EMPNO=:b25 and OV\
TMDATE=:b26) and NVL(FRAPPTIME,'*')=:b27) and NVL(FRREALTIME,'*')=:b28) and O\
TFLAG=:b29)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1482;
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
     sqlstm.sqhstv[29] = (unsigned char  *)otflag;
     sqlstm.sqhstl[29] = (unsigned long )2;
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
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
          //printf("ERROR_CODE : %d, UPDATE ERROR\n", sqlca.sqlcode);
          printf("ERROR_CODE : %d, UPDATE ERROR ,empno=%s, ovtmdate=%s .\n", sqlca.sqlcode, empno, ovtmdate);
          //sprintf(log_buff, "\n [DEBUG] 1. empno=%s, ovtmdate=%s", empno, ovtmdate);
          //Write_batlog(seqno++, log_buff);
          return(FAIL);
     }else{
     //     return(SUCCESS);
     /*sprintf(log_buff, "\n [DEBUG] 1. empno=%s, ovtmdate=%s", empno, ovtmdate);
     Write_batlog(seqno++, log_buff);*/
   }
     /* EXEC SQL
     SELECT  COUNT(*)
       INTO  cnt
       FROM  PKHOTFWD
      WHERE  EMPNO           = to_char(:empno )
        AND  OVTMYYMM        = to_char(:workmm)
        AND  OTFLAG          = to_char(:otflag); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select count(*)  into :b0  from PKHOTFWD where ((EMPNO=\
to_char(:b1) and OVTMYYMM=to_char(:b2)) and OTFLAG=to_char(:b3))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1617;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&cnt;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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
     sqlstm.sqhstv[2] = (unsigned char  *)workmm;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)otflag;
     sqlstm.sqhstl[3] = (unsigned long )2;
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



     
     /******************************************************************************/
     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     /* EXEC SQL
     UPDATE  PKHOTFWD
        SET  STATE           = 2
            ,PRE_GENEXTSUM   = :pre_genextsum
            ,PRE_HOLIEXTSUM  = :pre_holiextsum
            ,PRE_NIGHTSUM    = :pre_nightsum
            ,PRE_HOLISUM     = :pre_holisum
            ,PRE_MEALSUM     = :pre_mealsum
            ,PRE_RESTSUM     = :pre_restsum
            ,PRE_SPRESTSUM   = :pre_sprestsum
            /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
            ,PRE_RESTSUM_H   = :pre_restsum_h
            ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
            ,WRITEMAN        = TO_Char(:jobempno)
            /o 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee o/
            /o,OTFLAG          = :otflago/
      WHERE  EMPNO           = to_char(:empno )
        AND  OVTMYYMM        = to_char(:workmm)
        AND  OTFLAG          = to_char(:otflag)
     ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTFWD  set STATE=2,PRE_GENEXTSUM=:b0,PRE_HOLI\
EXTSUM=:b1,PRE_NIGHTSUM=:b2,PRE_HOLISUM=:b3,PRE_MEALSUM=:b4,PRE_RESTSUM=:b5,P\
RE_SPRESTSUM=:b6,PRE_RESTSUM_H=:b7,WRITETIME=TO_Char(sysdate,'YYYYMMDDHH24MIS\
S'),WRITEMAN=TO_Char(:b8) where ((EMPNO=to_char(:b9) and OVTMYYMM=to_char(:b1\
0)) and OTFLAG=to_char(:b11))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1648;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum_h;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)jobempno;
     sqlstm.sqhstl[8] = (unsigned long )5;
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
     sqlstm.sqhstv[10] = (unsigned char  *)workmm;
     sqlstm.sqhstl[10] = (unsigned long )7;
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)otflag;
     sqlstm.sqhstl[11] = (unsigned long )2;
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



     if  (sqlca.sqlcode != 0)
     {
          //printf("ERROR_CODE : %d, UPDATE ERROR\n", sqlca.sqlcode);
          printf("ERROR_CODE : %d, UPDATE ERROR ,empno=%s, ovtmdate=%s .\n", sqlca.sqlcode, empno, ovtmdate); 
          return(FAIL);
     }
     else
          return(SUCCESS);
     /******************************************************************************/
}

/****************************************************************************
  초과근무월별집계를 수행하는 Procedure1.
 ****************************************************************************/
process_sumstep1()
{

     /* EXEC SQL DECLARE cursor2 CURSOR FOR

     SELECT  A.EMPNO EMPNO, COUNT(*), SUM(EXTHH), SUM(NIGHTHH),
             SUM(HOLIHH), SUM(OVTMHH), SUM(GENEXT), SUM(HOLIEXT),
             SUM(EXTAMT), SUM(NIGHTAMT), SUM(HOLIAMT), SUM(OVTMAMT),
             SUM(OVTMHH), SUM(OVMCAMT), B.TOTPAY
       FROM  PKHOTHIS A, PKHYPHIS B
      WHERE  A.EMPNO = B.EMPNO
        AND  B.YEARPAYNUM = :yearpaynum
        AND  SUBSTR(OVTMDATE,1,6) = :workmm
        AND  ( A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  ( UPPER(NVL(CONYN,' ')) = 'Y' )
      GROUP BY A.EMPNO, B.TOTPAY
      UNION ALL
      SELECT  A.EMPNO, COUNT(*), SUM(A.EXTHH), SUM(A.NIGHTHH),
             SUM(A.HOLIHH), SUM(A.OVTMHH), SUM(A.GENEXT), SUM(A.HOLIEXT),
             SUM(A.EXTAMT), SUM(A.NIGHTAMT), SUM(A.HOLIAMT), SUM(A.OVTMAMT),
             SUM(A.OVTMHH), SUM(A.OVMCAMT), B.TOTPAY
       FROM  PKHOTHIS A, PKHDYPHIS B
             /o( SELECT A.EMPNO, A.TOTPAY
                 FROM PKHDYPHIS A 
                WHERE (A.EMPNO, A.SEQNO) IN ( SELECT B.EMPNO, MAX(B.SEQNO) AS SEQNO  
                                                FROM PKHDYPHIS B                     
                                               WHERE B.YEARPAYNUM = :yearpaynum     
                                                      GROUP BY B.EMPNO )) B o/  /o PKHDYPHIS 고도화로 계약직 연봉 분리 o/
      WHERE  A.EMPNO = B.EMPNO
        AND  SUBSTR(OVTMDATE,1,6) = :workmm
        AND  ( A.EMPNO >= :frempno AND A.EMPNO <= :toempno )
        AND  A.EMPNO LIKE 'Y%'
        AND  ( UPPER(NVL(CONYN,' ')) = 'Y' )
      GROUP BY A.EMPNO, B.TOTPAY
      ORDER BY EMPNO
      ; */ 


     /* EXEC SQL OPEN cursor2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0037;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1711;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
     sqlstm.sqhstl[4] = (unsigned long )7;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)frempno;
     sqlstm.sqhstl[5] = (unsigned long )5;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)toempno;
     sqlstm.sqhstl[6] = (unsigned long )5;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) &&
         (sqlca.sqlcode != -1405))
     {
          /* EXEC SQL CLOSE cursor2; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 30;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1754;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          printf("ERROR_CODE : %d, 추출된 자료에 이상이 있습니다.\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 추출된 자료에 이상이 있습니다.\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     s_count = f_count = 0;
     while(1)
     {
          /* EXEC SQL FETCH cursor2
          INTO :empno, :s_totdd, :s_exthh, :s_nighthh,
               :s_holihh, :s_tothh, :s_genext, :s_holiext,
               :s_extamt, :s_nightamt, :s_holiamt, :s_ovtmamt,
               :s_ovtmhh, :s_ovmcamt, :totpay; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 30;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1769;
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
          sqlstm.sqhstv[1] = (unsigned char  *)&s_totdd;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&s_exthh;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&s_nighthh;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&s_holihh;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&s_genext;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&s_holiext;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)&s_extamt;
          sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)&s_nightamt;
          sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)&s_holiamt;
          sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[10] = (         int  )0;
          sqlstm.sqindv[10] = (         short *)0;
          sqlstm.sqinds[10] = (         int  )0;
          sqlstm.sqharm[10] = (unsigned long )0;
          sqlstm.sqadto[10] = (unsigned short )0;
          sqlstm.sqtdso[10] = (unsigned short )0;
          sqlstm.sqhstv[11] = (unsigned char  *)&s_ovtmamt;
          sqlstm.sqhstl[11] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[11] = (         int  )0;
          sqlstm.sqindv[11] = (         short *)0;
          sqlstm.sqinds[11] = (         int  )0;
          sqlstm.sqharm[11] = (unsigned long )0;
          sqlstm.sqadto[11] = (unsigned short )0;
          sqlstm.sqtdso[11] = (unsigned short )0;
          sqlstm.sqhstv[12] = (unsigned char  *)&s_ovtmhh;
          sqlstm.sqhstl[12] = (unsigned long )sizeof(float);
          sqlstm.sqhsts[12] = (         int  )0;
          sqlstm.sqindv[12] = (         short *)0;
          sqlstm.sqinds[12] = (         int  )0;
          sqlstm.sqharm[12] = (unsigned long )0;
          sqlstm.sqadto[12] = (unsigned short )0;
          sqlstm.sqtdso[12] = (unsigned short )0;
          sqlstm.sqhstv[13] = (unsigned char  *)&s_ovmcamt;
          sqlstm.sqhstl[13] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[13] = (         int  )0;
          sqlstm.sqindv[13] = (         short *)0;
          sqlstm.sqinds[13] = (         int  )0;
          sqlstm.sqharm[13] = (unsigned long )0;
          sqlstm.sqadto[13] = (unsigned short )0;
          sqlstm.sqtdso[13] = (unsigned short )0;
          sqlstm.sqhstv[14] = (unsigned char  *)&totpay;
          sqlstm.sqhstl[14] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[14] = (         int  )0;
          sqlstm.sqindv[14] = (         short *)0;
          sqlstm.sqinds[14] = (         int  )0;
          sqlstm.sqharm[14] = (unsigned long )0;
          sqlstm.sqadto[14] = (unsigned short )0;
          sqlstm.sqtdso[14] = (unsigned short )0;
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
               /* EXEC SQL CLOSE cursor2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 30;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )1844;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }

          if  (calc_sum1() == SUCCESS)
          {
               s_count++;
          }
          else
          {
               f_count++;
               printf("[집계단계1]에 실패한 EMPNO : %s \n", empno);
          }
     }


}



/**************************************************************************
  기본인사사항과 시간별집계를 처리한다.
 **************************************************************************/
calc_sum1()
{
     /* EXEC SQL BEGIN DECLARE SECTION; */ 

         double  tongpay;

         /* 전,당월합 60분 이상시 사용. 시간 임시변수 */
         int     tmp_genexthh  = 0;
         int     tmp_holiexthh = 0;
         int     tmp_nighthh   = 0;
         int     tmp_holihh    = 0;
         int     tmp_mealhh    = 0;
         int     tmp_restmm    = 0;
         int     tmp_sprestmm  = 0;
         /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
         int     tmp_restmm_h  = 0;

         /* 임금 임시변수 */
         double  tmp_extamt    = 0;
         double  tmp_nightamt  = 0;
         double  tmp_holiamt   = 0;
         double  tmp_mealamt   = 0;
         double  tmp_excepamt  = 0;
         double  tmp_restamt   = 0;
         double  tmp_sprestamt = 0;
         double  tmp_ovtmamt   = 0;
         /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
         double  tmp_restamt_h = 0;

         int     tmp_exthh     = 0;

         int     i = 0;

         /* 최종 시간 임시변수 */
         int     final_exthh     = 0;
         int     final_genexthh  = 0;
         int     final_holiexthh = 0;
         int     final_nighthh   = 0;
         int     final_holihh    = 0;
         int     final_mealhh    = 0;
         int     final_restmm    = 0;
         int     final_sprestmm  = 0;
         int     final_restmm_h  = 0;

         /* 최종 임금 임시변수 */
         double  final_extamt    = 0;
         double  final_nightamt  = 0;
         double  final_holiamt   = 0;
         double  final_mealamt   = 0;
         double  final_excepamt  = 0;
         double  final_restamt   = 0;
         double  final_sprestamt = 0;
         double  final_ovtmamt   = 0;
         double  final_restamt_h = 0;
     
         char otflags[4];
         char tmp_flag[2];
     /* EXEC SQL END DECLARE SECTION; */ 

     int  otflag_cnt = 0;

     //strcpy(otflags,"NGO");

     /* EXEC SQL
     DELETE  PKHOTSUM
      WHERE  EMPNO    = :empno
        AND   OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "delete  from PKHOTSUM  where (EMPNO=:b0 and OVTMYYMM=:b\
1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1859;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)  )
     {
          printf("ERROR_CODE : %d, 삭제 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 삭제 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /* EXEC SQL
     INSERT INTO PKHOTSUM
             (OVTMYYMM, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE)
     SELECT   PAYDATE, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE
       FROM  PKHPHIS
      WHERE  EMPNO   = :empno
        AND   PAYDATE = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHOTSUM (OVTMYYMM,EMPNO,KORNAME,PAYCL,PAYG\
R,PAYRA,ORGNUM,DEPTCODE)select PAYDATE ,EMPNO ,KORNAME ,PAYCL ,PAYGR ,PAYRA ,\
ORGNUM ,DEPTCODE  from PKHPHIS where (EMPNO=:b0 and PAYDATE=:b1)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1882;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403)  )
     {
          printf("ERROR_CODE : %d, 기본인사사항 생성실패1\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 기본인사사항 생성실패1\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /* EXEC SQL
     INSERT  INTO PKHOTSUM
            (OVTMYYMM, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE)
     SELECT   :workmm, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE
     FROM  PKMPMAS
     WHERE  EMPNO   = :empno
     AND   (0 = (SELECT COUNT(*)
                   FROM   PKHOTSUM
                  WHERE  EMPNO = :empno AND OVTMYYMM = :workmm)); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHOTSUM (OVTMYYMM,EMPNO,KORNAME,PAYCL,PAYG\
R,PAYRA,ORGNUM,DEPTCODE)select :b0 ,EMPNO ,KORNAME ,PAYCL ,PAYGR ,PAYRA ,ORGN\
UM ,DEPTCODE  from PKMPMAS where (EMPNO=:b1 and 0=(select count(*)   from PKH\
OTSUM where (EMPNO=:b1 and OVTMYYMM=:b0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1905;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
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
     sqlstm.sqhstv[2] = (unsigned char  *)empno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workmm;
     sqlstm.sqhstl[3] = (unsigned long )7;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          printf("ERROR_CODE : %d, 기본인사사항 생성실패2\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 기본인사사항 생성실패2\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /* EXEC  SQL
     UPDATE  PKHOTSUM
        SET TONGPAY = (case when OVTMYYMM < :comchdate                        /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                            then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:yearpaynum)
                            else hper.COMMONUTIL.GET_NEWBASEPAY(EMPNO,:yearpaynum) end)
     WHERE  EMPNO = :empno AND OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 30;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM  set TONGPAY= case  when OVTMYYMM<:b0 t\
hen hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:b1) else hper.COMMONUTIL.GET_NEWBAS\
EPAY(EMPNO,:b1)  end  where (EMPNO=:b3 and OVTMYYMM=:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )1936;
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
     sqlstm.sqhstv[1] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[2] = (unsigned long )7;
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
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
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



     if ((sqlca.sqlcode != 0)  && (sqlca.sqlcode != 1403))
     {
          printf("ERROR_CODE : %d, 통상임금 반영실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 통상임금 반영실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /******************************************************************************/
     /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
     // 개인별 PKHOTFWD 조회 -> 이월 게산 -> 시간단위 당월 합산 -> 이훨 Update
     /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
     /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
     for (i = 0;i < 3; i++)
     {
          //strncpy(tmp_flag,otflags+(i),1);
          /* EXEC SQL
          SELECT DECODE(:i,0,'N',1,'G',2,'O')
            INTO :tmp_flag
            FROM DUAL
          ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 30;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select DECODE(:b0,0,'N',1,'G',2,'O') into :b1  fro\
m DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1971;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&i;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)tmp_flag;
          sqlstm.sqhstl[1] = (unsigned long )2;
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


          
     //sprintf(log_buff, "\n [DEBUG] 3. otflag=%s, pre_genextsum=%d", tmp_flag, pre_genextsum);
     //Write_batlog(seqno++, log_buff);
          
          
          /* EXEC SQL
          SELECT  PRE_GENEXTSUM, PRE_HOLIEXTSUM, PRE_NIGHTSUM,
                  PRE_HOLISUM, PRE_MEALSUM, PRE_RESTSUM, PRE_SPRESTSUM, PRE_RESTSUM_H
            INTO  :pre_genextsum, :pre_holiextsum, :pre_nightsum,
                  :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum, :pre_restsum_h
            FROM  PKHOTFWD
           WHERE  EMPNO    = :empno   
             AND  OVTMYYMM = :workmm  
             AND  OTFLAG   = :tmp_flag; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 30;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select PRE_GENEXTSUM ,PRE_HOLIEXTSUM ,PRE_NIGHTSUM\
 ,PRE_HOLISUM ,PRE_MEALSUM ,PRE_RESTSUM ,PRE_SPRESTSUM ,PRE_RESTSUM_H into :b\
0,:b1,:b2,:b3,:b4,:b5,:b6,:b7  from PKHOTFWD where ((EMPNO=:b8 and OVTMYYMM=:\
b9) and OTFLAG=:b10)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )1994;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
          sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
          sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum_h;
          sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[7] = (         int  )0;
          sqlstm.sqindv[7] = (         short *)0;
          sqlstm.sqinds[7] = (         int  )0;
          sqlstm.sqharm[7] = (unsigned long )0;
          sqlstm.sqadto[7] = (unsigned short )0;
          sqlstm.sqtdso[7] = (unsigned short )0;
          sqlstm.sqhstv[8] = (unsigned char  *)empno;
          sqlstm.sqhstl[8] = (unsigned long )5;
          sqlstm.sqhsts[8] = (         int  )0;
          sqlstm.sqindv[8] = (         short *)0;
          sqlstm.sqinds[8] = (         int  )0;
          sqlstm.sqharm[8] = (unsigned long )0;
          sqlstm.sqadto[8] = (unsigned short )0;
          sqlstm.sqtdso[8] = (unsigned short )0;
          sqlstm.sqhstv[9] = (unsigned char  *)workmm;
          sqlstm.sqhstl[9] = (unsigned long )7;
          sqlstm.sqhsts[9] = (         int  )0;
          sqlstm.sqindv[9] = (         short *)0;
          sqlstm.sqinds[9] = (         int  )0;
          sqlstm.sqharm[9] = (unsigned long )0;
          sqlstm.sqadto[9] = (unsigned short )0;
          sqlstm.sqtdso[9] = (unsigned short )0;
          sqlstm.sqhstv[10] = (unsigned char  *)tmp_flag;
          sqlstm.sqhstl[10] = (unsigned long )2;
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



     //sprintf(log_buff, "\n [DEBUG] 3. otflag=%s, pre_genextsum=%d", tmp_flag, pre_genextsum);
     //Write_batlog(seqno++, log_buff);

          /* 60분 이상시 시간 보관 */
          if (pre_genextsum % 60 >= 0)
          {
            tmp_genexthh = (int)pre_genextsum / 60;
            nxt_genextmm   = pre_genextsum % 60;
          }

          if (pre_holiextsum % 60 >= 0)
          {
            tmp_holiexthh = (int)pre_holiextsum / 60;
            nxt_holiextmm = pre_holiextsum % 60;
          }

          if (pre_nightsum % 60 >= 0)
          {
            tmp_nighthh = (int)pre_nightsum / 60;
            nxt_nightmm = pre_nightsum % 60;
          }

          if (pre_holisum % 60 >= 0)
          {
            tmp_holihh = (int)pre_holisum / 60;
            nxt_holimm = pre_holisum % 60;
          }

          if (pre_mealsum % 60 >= 0)
          {
            tmp_mealhh = (int)pre_mealsum / 60;
            nxt_mealmm = pre_mealsum % 60;
          }

          if (pre_restsum % 60 >= 0)
          {
            tmp_restmm = ((int)pre_restsum / 60) * 60;
            nxt_restmm = pre_restsum % 60;
          }

          if (pre_sprestsum % 60 >= 0)
          {
            tmp_sprestmm = ((int)pre_sprestsum / 60) * 60;
            nxt_sprestmm = pre_sprestsum % 60;
          }

          /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
          if (pre_restsum_h % 60 >= 0)
          {
            tmp_restmm_h = ((int)pre_restsum_h / 60) * 60;
            nxt_restmm_h = pre_restsum_h % 60;
          }

          tmp_exthh = tmp_genexthh + tmp_holiexthh;
          /* 60분 이상시 시간 보관 end */


          /* EXEC SQL
          SELECT  case when :ovtmdate < :comchdate                      /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                       then hper.COMMONUTIL.GET_OLDBASEPAY(:empno,:yearpaynum)
                       else hper.COMMONUTIL.GET_NEWBASEPAY(:empno,:yearpaynum) end  /oDB package에서 계산 jissi. 2016.12.14o/
            INTO :tongpay
            FROM DUAL; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 30;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select  case  when :b0<:b1 then hper.COMMONUTIL.GE\
T_OLDBASEPAY(:b2,:b3) else hper.COMMONUTIL.GET_NEWBASEPAY(:b2,:b3)  end  into\
 :b6  from DUAL ";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2053;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)ovtmdate;
          sqlstm.sqhstl[0] = (unsigned long )9;
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)comchdate;
          sqlstm.sqhstl[1] = (unsigned long )9;
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
          sqlstm.sqhstv[3] = (unsigned char  *)yearpaynum;
          sqlstm.sqhstl[3] = (unsigned long )7;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)empno;
          sqlstm.sqhstl[4] = (unsigned long )5;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)yearpaynum;
          sqlstm.sqhstl[5] = (unsigned long )7;
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&tongpay;
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



          /* 임금계산 */
          tmp_extamt    = (tmp_genexthh  * tongpay * 1.5) +
                          (tmp_holiexthh * tongpay * 0.5);
          tmp_nightamt  =  tmp_nighthh   * tongpay * 0.5;
          tmp_holiamt   =  tmp_holihh    * tongpay * 1.5;
          tmp_mealamt   =  tmp_mealhh    * tongpay * 1.5;

          //tmp_restamt   =  floor((int)tmp_restmm/60  * tongpay * 1.5);
          if (strcmp(tmp_flag,"N") == 0) /* 비대상자 */
          {
               tmp_restamt   = floor((int)tmp_restmm/60  * tongpay * 1.5);
          }
          else if (strcmp(tmp_flag,"G") == 0) /* 정상(휴일/야간) */
          {
               tmp_restamt   = floor((int)tmp_restmm/60  * tongpay * 0.5);
          }
          else if (strcmp(tmp_flag,"O") == 0) /* 초과근무 */
          {
               tmp_restamt   = floor((int)tmp_restmm/60  * tongpay * 1.5);
               tmp_restamt_h = floor((int)tmp_restmm_h/60  * tongpay * 2.0);
          }

          tmp_sprestamt =  floor((int)tmp_sprestmm/60 * tongpay );

          tmp_extamt    = ceil(tmp_extamt);
          tmp_nightamt  = ceil(tmp_nightamt);
          tmp_holiamt   = ceil(tmp_holiamt);
          tmp_mealamt   = floor(tmp_mealamt);
          
          //tmp_ovtmamt  = (tmp_extamt + tmp_nightamt + tmp_holiamt)
          //             - tmp_restamt - tmp_sprestamt - tmp_mealamt;
          /* 자율 책임 근무제 대상자("G","O") 식사시간,9이상제외 삭제 */
          /* 자율 책임 근무제 비대상자("N") 기존로직 적용 - 2018.08.17 Sangmoon Lee */
          if (strcmp(tmp_flag,"N") == 0)
          {
               tmp_ovtmamt  = (tmp_extamt + tmp_nightamt + tmp_holiamt)
                            - tmp_restamt - tmp_sprestamt - tmp_mealamt ;
          }
          else if ((strcmp(tmp_flag,"O") == 0) ||
              ((strcmp(sumYN,"Y") == 0) && (strcmp(curdate, SUMDATE) < 0)) ||
              ((strcmp(sumYN,"N") == 0) && (strcmp(curdate, CALDATE) < 0)) )
          {
               tmp_ovtmamt  = (tmp_extamt + tmp_nightamt + tmp_holiamt)
                            - tmp_restamt - tmp_sprestamt - tmp_restamt_h /*- t_mealamt - t_excepamt*/ ;
     //sprintf(log_buff, "\n [DEBUG] 4. tmp_ovtmamt=%f", tmp_ovtmamt);
     //Write_batlog(seqno++, log_buff);
          }
          else if (strcmp(tmp_flag,"G") == 0)
          {
               tmp_ovtmamt  = (tmp_extamt + tmp_nightamt + tmp_holiamt)
                            - tmp_restamt /*- t_sprestamt*//* - t_mealamt - t_excepamt*/ ;
          }
          /* 최종 시간 임시변수 */
          final_exthh     += tmp_exthh    ;
          final_genexthh  += tmp_genexthh ;
          final_holiexthh += tmp_holiexthh;
          final_nighthh   += tmp_nighthh  ;
          final_holihh    += tmp_holihh   ;
          final_mealhh    += tmp_mealhh   ;
          final_restmm    += tmp_restmm   ;
          final_sprestmm  += tmp_sprestmm ;
          final_restmm_h  += tmp_restmm_h ;

          /* 최종 임금 임시변수 */
          final_extamt    += tmp_extamt   ;
          final_nightamt  += tmp_nightamt ;
          final_holiamt   += tmp_holiamt  ;
          final_mealamt   += tmp_mealamt  ;
          final_excepamt  += tmp_excepamt ;
          final_restamt   += tmp_restamt  ;
          final_sprestamt += tmp_sprestamt;
          final_ovtmamt   += tmp_ovtmamt  ;
          final_restamt_h += tmp_restamt_h;

          /******************************************************************************/
          /* EXEC SQL
          SELECT  COUNT(*)
            INTO  :otflag_cnt
            FROM  PKHOTFWD
           WHERE  EMPNO    = :empno   
             AND  OVTMYYMM = :workmm  
             AND  OTFLAG   = :tmp_flag; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 30;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "select count(*)  into :b0  from PKHOTFWD where ((E\
MPNO=:b1 and OVTMYYMM=:b2) and OTFLAG=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2096;
          sqlstm.selerr = (unsigned short)0;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&otflag_cnt;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
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
          sqlstm.sqhstv[2] = (unsigned char  *)workmm;
          sqlstm.sqhstl[2] = (unsigned long )7;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)tmp_flag;
          sqlstm.sqhstl[3] = (unsigned long )2;
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



          if (otflag_cnt != 0)
          {
               /* 초과근무수당 계산번경(10분단위 절사, 잔여분 이월 - 2017.11.20 SangMoon Lee */
               /* EXEC SQL
               UPDATE  PKHOTFWD
                  SET  STATE           = 3
                      ,NXT_GENEXT      = :nxt_genextmm
                      ,NXT_HOLIEXT     = :nxt_holiextmm
                      ,NXT_NIGHT       = :nxt_nightmm
                      ,NXT_HOLI        = :nxt_holimm
                      ,NXT_MEAL        = :nxt_mealmm
                      ,NXT_REST        = :nxt_restmm
                      ,NXT_SPREST      = :nxt_sprestmm
                      /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
                      ,NXT_REST_H      = :nxt_restmm_h
                      ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
                      ,WRITEMAN        = TO_Char(:jobempno)
                      /o 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee o/
                      //,OTFLAG          = :tmp_flag
                WHERE  EMPNO           = :empno   
                  AND  OVTMYYMM        = :workmm  
                  AND  OTFLAG          = :tmp_flag
               ; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 30;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.stmt = "update PKHOTFWD  set STATE=3,NXT_GENEXT=:b0,N\
XT_HOLIEXT=:b1,NXT_NIGHT=:b2,NXT_HOLI=:b3,NXT_MEAL=:b4,NXT_REST=:b5,NXT_SPRES\
T=:b6,NXT_REST_H=:b7,WRITETIME=TO_Char(sysdate,'YYYYMMDDHH24MISS'),WRITEMAN=T\
O_Char(:b8) where ((EMPNO=:b9 and OVTMYYMM=:b10) and OTFLAG=:b11)";
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )2127;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlstm.sqhstv[0] = (unsigned char  *)&nxt_genextmm;
               sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[0] = (         int  )0;
               sqlstm.sqindv[0] = (         short *)0;
               sqlstm.sqinds[0] = (         int  )0;
               sqlstm.sqharm[0] = (unsigned long )0;
               sqlstm.sqadto[0] = (unsigned short )0;
               sqlstm.sqtdso[0] = (unsigned short )0;
               sqlstm.sqhstv[1] = (unsigned char  *)&nxt_holiextmm;
               sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[1] = (         int  )0;
               sqlstm.sqindv[1] = (         short *)0;
               sqlstm.sqinds[1] = (         int  )0;
               sqlstm.sqharm[1] = (unsigned long )0;
               sqlstm.sqadto[1] = (unsigned short )0;
               sqlstm.sqtdso[1] = (unsigned short )0;
               sqlstm.sqhstv[2] = (unsigned char  *)&nxt_nightmm;
               sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[2] = (         int  )0;
               sqlstm.sqindv[2] = (         short *)0;
               sqlstm.sqinds[2] = (         int  )0;
               sqlstm.sqharm[2] = (unsigned long )0;
               sqlstm.sqadto[2] = (unsigned short )0;
               sqlstm.sqtdso[2] = (unsigned short )0;
               sqlstm.sqhstv[3] = (unsigned char  *)&nxt_holimm;
               sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[3] = (         int  )0;
               sqlstm.sqindv[3] = (         short *)0;
               sqlstm.sqinds[3] = (         int  )0;
               sqlstm.sqharm[3] = (unsigned long )0;
               sqlstm.sqadto[3] = (unsigned short )0;
               sqlstm.sqtdso[3] = (unsigned short )0;
               sqlstm.sqhstv[4] = (unsigned char  *)&nxt_mealmm;
               sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[4] = (         int  )0;
               sqlstm.sqindv[4] = (         short *)0;
               sqlstm.sqinds[4] = (         int  )0;
               sqlstm.sqharm[4] = (unsigned long )0;
               sqlstm.sqadto[4] = (unsigned short )0;
               sqlstm.sqtdso[4] = (unsigned short )0;
               sqlstm.sqhstv[5] = (unsigned char  *)&nxt_restmm;
               sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[5] = (         int  )0;
               sqlstm.sqindv[5] = (         short *)0;
               sqlstm.sqinds[5] = (         int  )0;
               sqlstm.sqharm[5] = (unsigned long )0;
               sqlstm.sqadto[5] = (unsigned short )0;
               sqlstm.sqtdso[5] = (unsigned short )0;
               sqlstm.sqhstv[6] = (unsigned char  *)&nxt_sprestmm;
               sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[6] = (         int  )0;
               sqlstm.sqindv[6] = (         short *)0;
               sqlstm.sqinds[6] = (         int  )0;
               sqlstm.sqharm[6] = (unsigned long )0;
               sqlstm.sqadto[6] = (unsigned short )0;
               sqlstm.sqtdso[6] = (unsigned short )0;
               sqlstm.sqhstv[7] = (unsigned char  *)&nxt_restmm_h;
               sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
               sqlstm.sqhsts[7] = (         int  )0;
               sqlstm.sqindv[7] = (         short *)0;
               sqlstm.sqinds[7] = (         int  )0;
               sqlstm.sqharm[7] = (unsigned long )0;
               sqlstm.sqadto[7] = (unsigned short )0;
               sqlstm.sqtdso[7] = (unsigned short )0;
               sqlstm.sqhstv[8] = (unsigned char  *)jobempno;
               sqlstm.sqhstl[8] = (unsigned long )5;
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
               sqlstm.sqhstv[10] = (unsigned char  *)workmm;
               sqlstm.sqhstl[10] = (unsigned long )7;
               sqlstm.sqhsts[10] = (         int  )0;
               sqlstm.sqindv[10] = (         short *)0;
               sqlstm.sqinds[10] = (         int  )0;
               sqlstm.sqharm[10] = (unsigned long )0;
               sqlstm.sqadto[10] = (unsigned short )0;
               sqlstm.sqtdso[10] = (unsigned short )0;
               sqlstm.sqhstv[11] = (unsigned char  *)tmp_flag;
               sqlstm.sqhstl[11] = (unsigned long )2;
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



               if  (sqlca.sqlcode != 0)
               {
                    //printf("ERROR_CODE : %d, UPDATE ERROR\n", sqlca.sqlcode);
                    printf("ERROR_CODE : %d, UPDATE ERROR ,empno=%s, ovtmdate=%s .\n", sqlca.sqlcode, empno, ovtmdate);
                    return(FAIL);
               }
               //else
               //     return(SUCCESS);
               }
          /******************************************************************************/
     }
     /* 임금계산 end */
     //sprintf(log_buff, "\n [DEBUG] 5. final_ovtmamt=%f", final_ovtmamt);
     //Write_batlog(seqno++, log_buff);
     /******************************************************************************/
     /* EXEC SQL
     UPDATE  PKHOTSUM
        SET
             TOTDD    = :s_totdd,
             OVTMDD   = :s_totdd,
             EXTHH    = (:s_exthh+:final_exthh),
             NIGHTHH  = (:s_nighthh+:final_nighthh),
             HOLIHH   = (:s_holihh+:final_holihh),
             OVERHH   = (:s_exthh+:s_nighthh+:s_holihh+:final_exthh+:final_nighthh+:final_holihh),
             TOTHH    = (:s_exthh+:s_nighthh+:s_holihh+:final_exthh+:final_nighthh+:final_holihh),
             GENEXT   = (:s_genext+:final_genexthh),
             HOLIEXT  = (:s_holiext+:final_holiexthh),
             EXTAMT   = (:s_extamt+:final_extamt),
             NIGHTAMT = (:s_nightamt+:final_nightamt),
             HOLIAMT  = (:s_holiamt+:final_holiamt),
             OVERAMT  = (:s_ovtmamt+:final_ovtmamt),
             OVTMAMT  = (:s_ovtmamt+:final_ovtmamt),
             OVMCAMT  = :s_ovmcamt,
             REALHH   = :s_ovtmhh
      WHERE  EMPNO    = :empno
        AND  OVTMYYMM = :workmm; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM  set TOTDD=:b0,OVTMDD=:b0,EXTHH=(:b2+:b\
3),NIGHTHH=(:b4+:b5),HOLIHH=(:b6+:b7),OVERHH=(((((:b2+:b4)+:b6)+:b3)+:b5)+:b7\
),TOTHH=(((((:b2+:b4)+:b6)+:b3)+:b5)+:b7),GENEXT=(:b20+:b21),HOLIEXT=(:b22+:b\
23),EXTAMT=(:b24+:b25),NIGHTAMT=(:b26+:b27),HOLIAMT=(:b28+:b29),OVERAMT=(:b30\
+:b31),OVTMAMT=(:b30+:b31),OVMCAMT=:b34,REALHH=:b35 where (EMPNO=:b36 and OVT\
MYYMM=:b37)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2190;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&s_totdd;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)&s_totdd;
     sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)&s_exthh;
     sqlstm.sqhstl[2] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)&final_exthh;
     sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)&s_nighthh;
     sqlstm.sqhstl[4] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&final_nighthh;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&s_holihh;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&final_holihh;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&s_exthh;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&s_nighthh;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&s_holihh;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&final_exthh;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&final_nighthh;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[12] = (         int  )0;
     sqlstm.sqindv[12] = (         short *)0;
     sqlstm.sqinds[12] = (         int  )0;
     sqlstm.sqharm[12] = (unsigned long )0;
     sqlstm.sqadto[12] = (unsigned short )0;
     sqlstm.sqtdso[12] = (unsigned short )0;
     sqlstm.sqhstv[13] = (unsigned char  *)&final_holihh;
     sqlstm.sqhstl[13] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[13] = (         int  )0;
     sqlstm.sqindv[13] = (         short *)0;
     sqlstm.sqinds[13] = (         int  )0;
     sqlstm.sqharm[13] = (unsigned long )0;
     sqlstm.sqadto[13] = (unsigned short )0;
     sqlstm.sqtdso[13] = (unsigned short )0;
     sqlstm.sqhstv[14] = (unsigned char  *)&s_exthh;
     sqlstm.sqhstl[14] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[14] = (         int  )0;
     sqlstm.sqindv[14] = (         short *)0;
     sqlstm.sqinds[14] = (         int  )0;
     sqlstm.sqharm[14] = (unsigned long )0;
     sqlstm.sqadto[14] = (unsigned short )0;
     sqlstm.sqtdso[14] = (unsigned short )0;
     sqlstm.sqhstv[15] = (unsigned char  *)&s_nighthh;
     sqlstm.sqhstl[15] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[15] = (         int  )0;
     sqlstm.sqindv[15] = (         short *)0;
     sqlstm.sqinds[15] = (         int  )0;
     sqlstm.sqharm[15] = (unsigned long )0;
     sqlstm.sqadto[15] = (unsigned short )0;
     sqlstm.sqtdso[15] = (unsigned short )0;
     sqlstm.sqhstv[16] = (unsigned char  *)&s_holihh;
     sqlstm.sqhstl[16] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[16] = (         int  )0;
     sqlstm.sqindv[16] = (         short *)0;
     sqlstm.sqinds[16] = (         int  )0;
     sqlstm.sqharm[16] = (unsigned long )0;
     sqlstm.sqadto[16] = (unsigned short )0;
     sqlstm.sqtdso[16] = (unsigned short )0;
     sqlstm.sqhstv[17] = (unsigned char  *)&final_exthh;
     sqlstm.sqhstl[17] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[17] = (         int  )0;
     sqlstm.sqindv[17] = (         short *)0;
     sqlstm.sqinds[17] = (         int  )0;
     sqlstm.sqharm[17] = (unsigned long )0;
     sqlstm.sqadto[17] = (unsigned short )0;
     sqlstm.sqtdso[17] = (unsigned short )0;
     sqlstm.sqhstv[18] = (unsigned char  *)&final_nighthh;
     sqlstm.sqhstl[18] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[18] = (         int  )0;
     sqlstm.sqindv[18] = (         short *)0;
     sqlstm.sqinds[18] = (         int  )0;
     sqlstm.sqharm[18] = (unsigned long )0;
     sqlstm.sqadto[18] = (unsigned short )0;
     sqlstm.sqtdso[18] = (unsigned short )0;
     sqlstm.sqhstv[19] = (unsigned char  *)&final_holihh;
     sqlstm.sqhstl[19] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[19] = (         int  )0;
     sqlstm.sqindv[19] = (         short *)0;
     sqlstm.sqinds[19] = (         int  )0;
     sqlstm.sqharm[19] = (unsigned long )0;
     sqlstm.sqadto[19] = (unsigned short )0;
     sqlstm.sqtdso[19] = (unsigned short )0;
     sqlstm.sqhstv[20] = (unsigned char  *)&s_genext;
     sqlstm.sqhstl[20] = (unsigned long )sizeof(float);
     sqlstm.sqhsts[20] = (         int  )0;
     sqlstm.sqindv[20] = (         short *)0;
     sqlstm.sqinds[20] = (         int  )0;
     sqlstm.sqharm[20] = (unsigned long )0;
     sqlstm.sqadto[20] = (unsigned short )0;
     sqlstm.sqtdso[20] = (unsigned short )0;
     sqlstm.sqhstv[21] = (unsigned char  *)&final_genexthh;
     sqlstm.sqhstl[21] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[21] = (         int  )0;
     sqlstm.sqindv[21] = (         short *)0;
     sqlstm.sqinds[21] = (         int  )0;
     sqlstm.sqharm[21] = (unsigned long )0;
     sqlstm.sqadto[21] = (unsigned short )0;
     sqlstm.sqtdso[21] = (unsigned short )0;
     sqlstm.sqhstv[22] = (unsigned char  *)&s_holiext;
     sqlstm.sqhstl[22] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[22] = (         int  )0;
     sqlstm.sqindv[22] = (         short *)0;
     sqlstm.sqinds[22] = (         int  )0;
     sqlstm.sqharm[22] = (unsigned long )0;
     sqlstm.sqadto[22] = (unsigned short )0;
     sqlstm.sqtdso[22] = (unsigned short )0;
     sqlstm.sqhstv[23] = (unsigned char  *)&final_holiexthh;
     sqlstm.sqhstl[23] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[23] = (         int  )0;
     sqlstm.sqindv[23] = (         short *)0;
     sqlstm.sqinds[23] = (         int  )0;
     sqlstm.sqharm[23] = (unsigned long )0;
     sqlstm.sqadto[23] = (unsigned short )0;
     sqlstm.sqtdso[23] = (unsigned short )0;
     sqlstm.sqhstv[24] = (unsigned char  *)&s_extamt;
     sqlstm.sqhstl[24] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[24] = (         int  )0;
     sqlstm.sqindv[24] = (         short *)0;
     sqlstm.sqinds[24] = (         int  )0;
     sqlstm.sqharm[24] = (unsigned long )0;
     sqlstm.sqadto[24] = (unsigned short )0;
     sqlstm.sqtdso[24] = (unsigned short )0;
     sqlstm.sqhstv[25] = (unsigned char  *)&final_extamt;
     sqlstm.sqhstl[25] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[25] = (         int  )0;
     sqlstm.sqindv[25] = (         short *)0;
     sqlstm.sqinds[25] = (         int  )0;
     sqlstm.sqharm[25] = (unsigned long )0;
     sqlstm.sqadto[25] = (unsigned short )0;
     sqlstm.sqtdso[25] = (unsigned short )0;
     sqlstm.sqhstv[26] = (unsigned char  *)&s_nightamt;
     sqlstm.sqhstl[26] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[26] = (         int  )0;
     sqlstm.sqindv[26] = (         short *)0;
     sqlstm.sqinds[26] = (         int  )0;
     sqlstm.sqharm[26] = (unsigned long )0;
     sqlstm.sqadto[26] = (unsigned short )0;
     sqlstm.sqtdso[26] = (unsigned short )0;
     sqlstm.sqhstv[27] = (unsigned char  *)&final_nightamt;
     sqlstm.sqhstl[27] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[27] = (         int  )0;
     sqlstm.sqindv[27] = (         short *)0;
     sqlstm.sqinds[27] = (         int  )0;
     sqlstm.sqharm[27] = (unsigned long )0;
     sqlstm.sqadto[27] = (unsigned short )0;
     sqlstm.sqtdso[27] = (unsigned short )0;
     sqlstm.sqhstv[28] = (unsigned char  *)&s_holiamt;
     sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[28] = (         int  )0;
     sqlstm.sqindv[28] = (         short *)0;
     sqlstm.sqinds[28] = (         int  )0;
     sqlstm.sqharm[28] = (unsigned long )0;
     sqlstm.sqadto[28] = (unsigned short )0;
     sqlstm.sqtdso[28] = (unsigned short )0;
     sqlstm.sqhstv[29] = (unsigned char  *)&final_holiamt;
     sqlstm.sqhstl[29] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[29] = (         int  )0;
     sqlstm.sqindv[29] = (         short *)0;
     sqlstm.sqinds[29] = (         int  )0;
     sqlstm.sqharm[29] = (unsigned long )0;
     sqlstm.sqadto[29] = (unsigned short )0;
     sqlstm.sqtdso[29] = (unsigned short )0;
     sqlstm.sqhstv[30] = (unsigned char  *)&s_ovtmamt;
     sqlstm.sqhstl[30] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[30] = (         int  )0;
     sqlstm.sqindv[30] = (         short *)0;
     sqlstm.sqinds[30] = (         int  )0;
     sqlstm.sqharm[30] = (unsigned long )0;
     sqlstm.sqadto[30] = (unsigned short )0;
     sqlstm.sqtdso[30] = (unsigned short )0;
     sqlstm.sqhstv[31] = (unsigned char  *)&final_ovtmamt;
     sqlstm.sqhstl[31] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[31] = (         int  )0;
     sqlstm.sqindv[31] = (         short *)0;
     sqlstm.sqinds[31] = (         int  )0;
     sqlstm.sqharm[31] = (unsigned long )0;
     sqlstm.sqadto[31] = (unsigned short )0;
     sqlstm.sqtdso[31] = (unsigned short )0;
     sqlstm.sqhstv[32] = (unsigned char  *)&s_ovtmamt;
     sqlstm.sqhstl[32] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[32] = (         int  )0;
     sqlstm.sqindv[32] = (         short *)0;
     sqlstm.sqinds[32] = (         int  )0;
     sqlstm.sqharm[32] = (unsigned long )0;
     sqlstm.sqadto[32] = (unsigned short )0;
     sqlstm.sqtdso[32] = (unsigned short )0;
     sqlstm.sqhstv[33] = (unsigned char  *)&final_ovtmamt;
     sqlstm.sqhstl[33] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[33] = (         int  )0;
     sqlstm.sqindv[33] = (         short *)0;
     sqlstm.sqinds[33] = (         int  )0;
     sqlstm.sqharm[33] = (unsigned long )0;
     sqlstm.sqadto[33] = (unsigned short )0;
     sqlstm.sqtdso[33] = (unsigned short )0;
     sqlstm.sqhstv[34] = (unsigned char  *)&s_ovmcamt;
     sqlstm.sqhstl[34] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[34] = (         int  )0;
     sqlstm.sqindv[34] = (         short *)0;
     sqlstm.sqinds[34] = (         int  )0;
     sqlstm.sqharm[34] = (unsigned long )0;
     sqlstm.sqadto[34] = (unsigned short )0;
     sqlstm.sqtdso[34] = (unsigned short )0;
     sqlstm.sqhstv[35] = (unsigned char  *)&s_ovtmhh;
     sqlstm.sqhstl[35] = (unsigned long )sizeof(float);
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
     sqlstm.sqhstv[37] = (unsigned char  *)workmm;
     sqlstm.sqhstl[37] = (unsigned long )7;
     sqlstm.sqhsts[37] = (         int  )0;
     sqlstm.sqindv[37] = (         short *)0;
     sqlstm.sqinds[37] = (         int  )0;
     sqlstm.sqharm[37] = (unsigned long )0;
     sqlstm.sqadto[37] = (unsigned short )0;
     sqlstm.sqtdso[37] = (unsigned short )0;
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
         printf("ERROR_CODE : %d, 시간별집계 실패\n",sqlca.sqlcode);
         sprintf(log_buff, "ERROR_CODE : %d, 시간별집계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
         Write_batlog(seqno++, log_buff);
         return(FAIL);
     }
     else
         return(SUCCESS);


}

/* ===============================================================================
 Version  date(yy.mm.dd)  programmer    description                        relevant doc.no
 30.30    2001.11.13.      유효성       근태테이블(pkhduty)의 대휴(repoff)및 교휴를 불러와
                                        최종계산된 초과수당(pkhotsum의 ovtmamt)에서 빼는 로직 추가.
 ============================================================================= */
process_repoff()
{
    /*pkhotsum table에 없는 사원은 INSERT*/
     /* EXEC SQL
     INSERT   INTO PKHOTSUM
            (OVTMYYMM, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE, WRITEMAN)
     SELECT   :workmm, EMPNO, KORNAME, PAYCL, PAYGR, PAYRA, ORGNUM, DEPTCODE, '****'
       FROM  PKMPMAS
      WHERE  (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  EMPNO   IN (SELECT   EMPNO
                           FROM   PKHDUTY
                          WHERE   DUYYMM = :workmm
                            AND   (NVL(REPOFF, 0) <> 0  or NVL(SPEOFF,0) <> 0)
                            AND   EMPNO  NOT IN (SELECT EMPNO
                                                   FROM PKHOTSUM
                                                  WHERE OVTMYYMM = :workmm )) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PKHOTSUM (OVTMYYMM,EMPNO,KORNAME,PAYCL,PAYG\
R,PAYRA,ORGNUM,DEPTCODE,WRITEMAN)select :b0 ,EMPNO ,KORNAME ,PAYCL ,PAYGR ,PA\
YRA ,ORGNUM ,DEPTCODE ,'****'  from PKMPMAS where ((EMPNO>=:b1 and EMPNO<=:b2\
) and EMPNO in (select EMPNO  from PKHDUTY where ((DUYYMM=:b0 and (NVL(REPOFF\
,0)<>0 or NVL(SPEOFF,0)<>0)) and EMPNO not  in (select EMPNO  from PKHOTSUM w\
here OVTMYYMM=:b0))))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2357;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
     sqlstm.sqhstl[2] = (unsigned long )5;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workmm;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403))
     {
          printf("ERROR_CODE : %d, 기본인사사항 생성실패3\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 기본인사사항 생성실패3\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

     /* EXEC SQL
     UPDATE PKHOTSUM A
        SET TONGPAY  = (case when OVTMYYMM < :comchdate                        /o2017.01.01이후 초과근무수당 계산할 때 통상임금이 기준시간 226hr->209hro/
                            then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:yearpaynum)
                            else hper.COMMONUTIL.GET_NEWBASEPAY(EMPNO,:yearpaynum) end)
      WHERE OVTMYYMM = :workmm
        AND (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND WRITEMAN ='****' ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set TONGPAY= case  when OVTMYYMM<:b0\
 then hper.COMMONUTIL.GET_OLDBASEPAY(EMPNO,:b1) else hper.COMMONUTIL.GET_NEWB\
ASEPAY(EMPNO,:b1)  end  where ((OVTMYYMM=:b3 and (EMPNO>=:b4 and EMPNO<=:b5))\
 and WRITEMAN='****')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2392;
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
     sqlstm.sqhstv[1] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[1] = (unsigned long )7;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)yearpaynum;
     sqlstm.sqhstl[2] = (unsigned long )7;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)workmm;
     sqlstm.sqhstl[3] = (unsigned long )7;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)frempno;
     sqlstm.sqhstl[4] = (unsigned long )5;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 통상임금 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 통상임금 UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

   /*교휴갯수 UPDATE 20090427 KTH 추가*/
     /* EXEC SQL
     UPDATE  PKHOTSUM A
        SET  SPEOFFDD = (SELECT NVL(SPEOFF,0)
                           FROM PKHDUTY B
                          WHERE A.EMPNO = B.EMPNO
                            AND B.DUYYMM = :workmm)
     WHERE OVTMYYMM = :workmm
       AND (EMPNO >= :frempno AND EMPNO <= :toempno )
       AND EMPNO IN (SELECT EMPNO FROM PKHDUTY
                      WHERE DUYYMM = :workmm
                        AND NVL(SPEOFF,0) <> 0 ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set SPEOFFDD=(select NVL(SPEOFF,0)  \
from PKHDUTY B where (A.EMPNO=B.EMPNO and B.DUYYMM=:b0)) where ((OVTMYYMM=:b0\
 and (EMPNO>=:b2 and EMPNO<=:b3)) and EMPNO in (select EMPNO  from PKHDUTY wh\
ere (DUYYMM=:b0 and NVL(SPEOFF,0)<>0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2431;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
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




     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 교휴갯수 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 교휴갯수UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }

   /*교휴금액 UPDATE 20090427 KTH 추가 */
     /* EXEC SQL
     UPDATE  PKHOTSUM A
        SET  SPEOFFAMT = ceil(NVL(SPEOFFDD,0) * :rephh * NVL(TONGPAY,0) )
      WHERE  OVTMYYMM = :workmm
        AND  (EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  EMPNO IN (SELECT EMPNO FROM PKHDUTY
                        WHERE DUYYMM = :workmm
                          AND NVL(SPEOFF,0) <> 0 ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set SPEOFFAMT=ceil(((NVL(SPEOFFDD,0)\
* :b0)* NVL(TONGPAY,0))) where ((OVTMYYMM=:b1 and (EMPNO>=:b2 and EMPNO<=:b3)\
) and EMPNO in (select EMPNO  from PKHDUTY where (DUYYMM=:b1 and NVL(SPEOFF,0\
)<>0)))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2466;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&rephh;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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
     sqlstm.sqhstv[4] = (unsigned char  *)workmm;
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



     if  ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 교휴금액 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 교휴금액UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }



   /*최종초과수당 UPDATE*/
     /* EXEC SQL
     UPDATE  PKHOTSUM A
        SET  OVTMAMT = NVL(OVERAMT, 0) - NVL(REPOFFAMT, 0)- NVL(SPEOFFAMT, 0),
             WRITETIME = to_char(sysdate,'yyyymmddhh24mi'),
             WRITEMAN  = :jobempno
      WHERE  OVTMYYMM = :workmm
        AND (EMPNO >= :frempno AND EMPNO <= :toempno ) ; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update PKHOTSUM A  set OVTMAMT=((NVL(OVERAMT,0)-NVL(REP\
OFFAMT,0))-NVL(SPEOFFAMT,0)),WRITETIME=to_char(sysdate,'yyyymmddhh24mi'),WRIT\
EMAN=:b0 where (OVTMYYMM=:b1 and (EMPNO>=:b2 and EMPNO<=:b3))";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2501;
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
     sqlstm.sqhstv[1] = (unsigned char  *)workmm;
     sqlstm.sqhstl[1] = (unsigned long )7;
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



     if ((sqlca.sqlcode != 0) && (sqlca.sqlcode != 1403) )
     {
          printf("ERROR_CODE : %d, 최종초과수당 UPDATE 실패\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, 최종초과수당 UPDATE 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          return(FAIL);
     }


     return(SUCCESS);

}



/****************************************************************************
  초과근무월별집계를 수행하는 Procedure2.
 ****************************************************************************/
process_sumstep2()
{
     char  t_empno[4+1]  = "";

     /* EXEC SQL DECLARE cursor3 CURSOR FOR
     SELECT  EMPNO, DAYKIND, SUM(OVTMHH), SUM(OVTMAMT)
       FROM  PKHOTHIS
      WHERE  SUBSTR(OVTMDATE,1,6) = :workmm
        AND  ( EMPNO >= :frempno AND EMPNO <= :toempno )
        AND  ( UPPER(NVL(CONYN,' ')) = 'Y' )
      GROUP  BY EMPNO, DAYKIND
      ORDER  BY EMPNO, DAYKIND; */ 


     /* EXEC SQL OPEN cursor3; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0053;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2532;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)workmm;
     sqlstm.sqhstl[0] = (unsigned long )7;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)frempno;
     sqlstm.sqhstl[1] = (unsigned long )5;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)toempno;
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


     if ((sqlca.sqlcode != 1403) && (sqlca.sqlcode != 0) && (sqlca.sqlcode != -1405))
     {
          printf("ERROR_CODE : %d, OPEN cursor3 Error...\n", sqlca.sqlcode);
          sprintf(log_buff, "ERROR_CODE : %d, OPEN cursor3 Error..\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          /* EXEC SQL CLOSE cursor3; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2559;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


          return(FAIL);
     }


     s_count = f_count = 0;
     while(1)
     {
          /* EXEC SQL FETCH cursor3
          INTO :empno, :daykind, :s_tothh, :s_ovtmamt; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2574;
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
          sqlstm.sqhstv[1] = (unsigned char  *)daykind;
          sqlstm.sqhstl[1] = (unsigned long )2;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[2] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&s_ovtmamt;
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


          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE cursor3; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 38;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )2605;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return(SUCCESS);
          }

          if  (calc_sum2() == SUCCESS)
          {
              if  (strcmp(t_empno,empno) != 0)
                   s_count++;
               sprintf(t_empno,"%s",empno);
          }
          else
          {
               f_count++;
               printf("[집계단계2]에 실패한 EMPNO : %s \n", empno);
               /*sprintf(log_buff, "[집계단계2]에 실패한 EMPNO : %s \n", empno); dsa2000 Rexec 대체*/
                        /*Write_batlog(seqno++, log_buff); */
          }
     }
}

/**************************************************************************
  집계단계2를 처리한다.
 **************************************************************************/
calc_sum2()
{
     if  (strcmp(daykind,"1") == 0 )
     {
          /* EXEC SQL
          UPDATE  PKHOTSUM
             SET
                  OTGENHH = :s_tothh,
                  OTGENAMT = :s_ovtmamt
           WHERE  OVTMYYMM = :workmm AND EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKHOTSUM  set OTGENHH=:b0,OTGENAMT=:b1 wher\
e (OVTMYYMM=:b2 and EMPNO=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2620;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&s_ovtmamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)workmm;
          sqlstm.sqhstl[2] = (unsigned long )7;
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


          if  (sqlca.sqlcode != 0)
          {
               printf("ERROR_CODE : %d, 근무일자별 집계단계1 실패\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, 근무일자별 집계단계1 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                        Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          return(SUCCESS);
     }

     if ((strcmp(daykind,"2") == 0) || (strcmp(daykind,"3") == 0) )
     {
          /* EXEC SQL
          UPDATE  PKHOTSUM
             SET
                  OTSATHH = :s_tothh,
                  OTSATAMT = :s_ovtmamt
           WHERE  OVTMYYMM = :workmm AND EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKHOTSUM  set OTSATHH=:b0,OTSATAMT=:b1 wher\
e (OVTMYYMM=:b2 and EMPNO=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2651;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&s_ovtmamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)workmm;
          sqlstm.sqhstl[2] = (unsigned long )7;
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


          if  (sqlca.sqlcode != 0)
          {
               printf("ERROR_CODE : %d, 근무일자별 집계단계2 실패\n", sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, 근무일자별 집계단계2 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          return(SUCCESS);
     }

     if  (strcmp(daykind,"4") == 0 )
     {
          /* EXEC SQL
          UPDATE  PKHOTSUM
             SET
                  OTHOLIHH = :s_tothh,
                  OTHOLIAMT = :s_ovtmamt
           WHERE  OVTMYYMM = :workmm AND EMPNO = :empno ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 38;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.stmt = "update PKHOTSUM  set OTHOLIHH=:b0,OTHOLIAMT=:b1 wh\
ere (OVTMYYMM=:b2 and EMPNO=:b3)";
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )2682;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqhstv[0] = (unsigned char  *)&s_tothh;
          sqlstm.sqhstl[0] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[0] = (         int  )0;
          sqlstm.sqindv[0] = (         short *)0;
          sqlstm.sqinds[0] = (         int  )0;
          sqlstm.sqharm[0] = (unsigned long )0;
          sqlstm.sqadto[0] = (unsigned short )0;
          sqlstm.sqtdso[0] = (unsigned short )0;
          sqlstm.sqhstv[1] = (unsigned char  *)&s_ovtmamt;
          sqlstm.sqhstl[1] = (unsigned long )sizeof(double);
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)workmm;
          sqlstm.sqhstl[2] = (unsigned long )7;
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


          if  (sqlca.sqlcode != 0)
          {
               printf("ERROR_CODE : %d, 근무일자별 집계단계3 실패\n",sqlca.sqlcode);
               sprintf(log_buff, "ERROR_CODE : %d, 근무일자별 집계단계3 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               return(FAIL);
          }
          return(SUCCESS);
     }
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
          if (*(dest+i) == ' ')
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
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,'YYYYMMDD')\
) into :b2  from DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2713;
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

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =====================================*/
int Write_batlog(int seqno, char *message)
{
     /* EXEC SQL AT log_db
     INSERT INTO PYBATLOG
     VALUES (:log_rundate, :log_progid, :seqno, :log_writeman, :message); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2740;
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
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )2781;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}

pre_PKHOTFWD()
{

    /* EXEC SQL BEGIN DECLARE SECTION; */ 


        int  count = 0, pre_count = 0;
        int  state = 0, pre_state = 0;

        int  i = 0;
        
        char otflags[4];
        char tmp_flag[2];
    /* EXEC SQL END DECLARE SECTION; */ 


     for (i = 0;i < 3; i++)
     {
         //strncpy(tmp_flag,otflags+(i),1);
         /* EXEC SQL
         SELECT DECODE(:i,0,'N',1,'G',2,'O')
           INTO :tmp_flag
           FROM DUAL
         ; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 38;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select DECODE(:b0,0,'N',1,'G',2,'O') into :b1  from\
 DUAL ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )2802;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)&i;
         sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)tmp_flag;
         sqlstm.sqhstl[1] = (unsigned long )2;
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


         
    /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
    //for (i = 0;i < 3; i++)
    //{
         //strncpy(tmp_flag,otflags+(i),1);

         /* 당월 존재여부 체크 */
         /* EXEC SQL
         SELECT COUNT(*),max(STATE)
           INTO :count, :state
           FROM PKHOTFWD
          WHERE EMPNO    = :empno   
            AND OVTMYYMM = :workmm  
            AND OTFLAG   = :tmp_flag
          ORDER BY EMPNO, OVTMYYMM, STATE; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 38;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select count(*)  ,max(STATE) into :b0,:b1  from PKH\
OTFWD where ((EMPNO=:b2 and OVTMYYMM=:b3) and OTFLAG=:b4) order by EMPNO,OVTM\
YYMM,STATE ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )2825;
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
         sqlstm.sqhstv[1] = (unsigned char  *)&state;
         sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
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
         sqlstm.sqhstv[3] = (unsigned char  *)workmm;
         sqlstm.sqhstl[3] = (unsigned long )7;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         short *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned long )0;
         sqlstm.sqadto[3] = (unsigned short )0;
         sqlstm.sqtdso[3] = (unsigned short )0;
         sqlstm.sqhstv[4] = (unsigned char  *)tmp_flag;
         sqlstm.sqhstl[4] = (unsigned long )2;
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



         /* 전월 존재여부 체크 */
         /* EXEC SQL
         SELECT COUNT(*),max(STATE)
           INTO :pre_count, :pre_state
           FROM PKHOTFWD
          WHERE EMPNO    = :empno   
            AND OVTMYYMM = :workmm-1
            AND OTFLAG   = :tmp_flag
          ORDER BY EMPNO, OVTMYYMM, STATE; */ 

{
         struct sqlexd sqlstm;
         sqlstm.sqlvsn = 12;
         sqlstm.arrsiz = 38;
         sqlstm.sqladtp = &sqladt;
         sqlstm.sqltdsp = &sqltds;
         sqlstm.stmt = "select count(*)  ,max(STATE) into :b0,:b1  from PKH\
OTFWD where ((EMPNO=:b2 and OVTMYYMM=(:b3-1)) and OTFLAG=:b4) order by EMPNO,\
OVTMYYMM,STATE ";
         sqlstm.iters = (unsigned int  )1;
         sqlstm.offset = (unsigned int  )2860;
         sqlstm.selerr = (unsigned short)0;
         sqlstm.cud = sqlcud0;
         sqlstm.sqlest = (unsigned char  *)&sqlca;
         sqlstm.sqlety = (unsigned short)4352;
         sqlstm.occurs = (unsigned int  )0;
         sqlstm.sqhstv[0] = (unsigned char  *)&pre_count;
         sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
         sqlstm.sqhsts[0] = (         int  )0;
         sqlstm.sqindv[0] = (         short *)0;
         sqlstm.sqinds[0] = (         int  )0;
         sqlstm.sqharm[0] = (unsigned long )0;
         sqlstm.sqadto[0] = (unsigned short )0;
         sqlstm.sqtdso[0] = (unsigned short )0;
         sqlstm.sqhstv[1] = (unsigned char  *)&pre_state;
         sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
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
         sqlstm.sqhstv[3] = (unsigned char  *)workmm;
         sqlstm.sqhstl[3] = (unsigned long )7;
         sqlstm.sqhsts[3] = (         int  )0;
         sqlstm.sqindv[3] = (         short *)0;
         sqlstm.sqinds[3] = (         int  )0;
         sqlstm.sqharm[3] = (unsigned long )0;
         sqlstm.sqadto[3] = (unsigned short )0;
         sqlstm.sqtdso[3] = (unsigned short )0;
         sqlstm.sqhstv[4] = (unsigned char  *)tmp_flag;
         sqlstm.sqhstl[4] = (unsigned long )2;
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



         /* 당월 없으면 생성 */
         if (count == 0)
         {
             /* 전월 데이터도 없으면 모두 0 */
             if (pre_count == 0)
             {

                  /* EXEC SQL
                  INSERT INTO PKHOTFWD
                  VALUES (:workmm, :empno, 1,
                          0, 0, 0, 0, 0, 0, 0,
                          0, 0, 0, 0, 0, 0, 0,
                          TO_Char(sysdate,'YYYYMMDDHH24MISS'),:jobempno,
                          /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
                          :tmp_flag, 0, 0); */ 

{
                  struct sqlexd sqlstm;
                  sqlstm.sqlvsn = 12;
                  sqlstm.arrsiz = 38;
                  sqlstm.sqladtp = &sqladt;
                  sqlstm.sqltdsp = &sqltds;
                  sqlstm.stmt = "insert into PKHOTFWD  values (:b0,:b1,1,0,\
0,0,0,0,0,0,0,0,0,0,0,0,0,TO_Char(sysdate,'YYYYMMDDHH24MISS'),:b2,:b3,0,0)";
                  sqlstm.iters = (unsigned int  )1;
                  sqlstm.offset = (unsigned int  )2895;
                  sqlstm.cud = sqlcud0;
                  sqlstm.sqlest = (unsigned char  *)&sqlca;
                  sqlstm.sqlety = (unsigned short)4352;
                  sqlstm.occurs = (unsigned int  )0;
                  sqlstm.sqhstv[0] = (unsigned char  *)workmm;
                  sqlstm.sqhstl[0] = (unsigned long )7;
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
                  sqlstm.sqhstv[2] = (unsigned char  *)jobempno;
                  sqlstm.sqhstl[2] = (unsigned long )5;
                  sqlstm.sqhsts[2] = (         int  )0;
                  sqlstm.sqindv[2] = (         short *)0;
                  sqlstm.sqinds[2] = (         int  )0;
                  sqlstm.sqharm[2] = (unsigned long )0;
                  sqlstm.sqadto[2] = (unsigned short )0;
                  sqlstm.sqtdso[2] = (unsigned short )0;
                  sqlstm.sqhstv[3] = (unsigned char  *)tmp_flag;
                  sqlstm.sqhstl[3] = (unsigned long )2;
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



                  if (sqlca.sqlcode != 0)
                  {
                      printf("ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode);
                      sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                      Write_batlog(seqno++, log_buff);
                      return(FAIL);
                  }
             }
             /* 전월 데이터 있으면 조회 후 전,당월 이월합에 Insert */
             else
             {

                  /* EXEC SQL
                  SELECT nvl(NXT_GENEXT, 0), nvl(NXT_HOLIEXT, 0), nvl(NXT_NIGHT, 0),
                         nvl(NXT_HOLI, 0), nvl(NXT_MEAL, 0), nvl(NXT_REST, 0), nvl(NXT_SPREST, 0),
                         /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
                         nvl(NXT_REST_H)
                    INTO :pre_genextsum, :pre_holiextsum, :pre_nightsum,
                         :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum,
                         :pre_restsum_h
                    FROM PKHOTFWD
                   WHERE EMPNO    = :empno   
                     AND OVTMYYMM = :workmm-1
                     AND OTFLAG   = :tmp_flag; */ 

{
                  struct sqlexd sqlstm;
                  sqlstm.sqlvsn = 12;
                  sqlstm.arrsiz = 38;
                  sqlstm.sqladtp = &sqladt;
                  sqlstm.sqltdsp = &sqltds;
                  sqlstm.stmt = "select nvl(NXT_GENEXT,0) ,nvl(NXT_HOLIEXT,\
0) ,nvl(NXT_NIGHT,0) ,nvl(NXT_HOLI,0) ,nvl(NXT_MEAL,0) ,nvl(NXT_REST,0) ,nvl(\
NXT_SPREST,0) ,nvl(NXT_REST_H) into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7  from PKH\
OTFWD where ((EMPNO=:b8 and OVTMYYMM=(:b9-1)) and OTFLAG=:b10)";
                  sqlstm.iters = (unsigned int  )1;
                  sqlstm.offset = (unsigned int  )2926;
                  sqlstm.selerr = (unsigned short)0;
                  sqlstm.cud = sqlcud0;
                  sqlstm.sqlest = (unsigned char  *)&sqlca;
                  sqlstm.sqlety = (unsigned short)4352;
                  sqlstm.occurs = (unsigned int  )0;
                  sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
                  sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[0] = (         int  )0;
                  sqlstm.sqindv[0] = (         short *)0;
                  sqlstm.sqinds[0] = (         int  )0;
                  sqlstm.sqharm[0] = (unsigned long )0;
                  sqlstm.sqadto[0] = (unsigned short )0;
                  sqlstm.sqtdso[0] = (unsigned short )0;
                  sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
                  sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[1] = (         int  )0;
                  sqlstm.sqindv[1] = (         short *)0;
                  sqlstm.sqinds[1] = (         int  )0;
                  sqlstm.sqharm[1] = (unsigned long )0;
                  sqlstm.sqadto[1] = (unsigned short )0;
                  sqlstm.sqtdso[1] = (unsigned short )0;
                  sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
                  sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[2] = (         int  )0;
                  sqlstm.sqindv[2] = (         short *)0;
                  sqlstm.sqinds[2] = (         int  )0;
                  sqlstm.sqharm[2] = (unsigned long )0;
                  sqlstm.sqadto[2] = (unsigned short )0;
                  sqlstm.sqtdso[2] = (unsigned short )0;
                  sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
                  sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[3] = (         int  )0;
                  sqlstm.sqindv[3] = (         short *)0;
                  sqlstm.sqinds[3] = (         int  )0;
                  sqlstm.sqharm[3] = (unsigned long )0;
                  sqlstm.sqadto[3] = (unsigned short )0;
                  sqlstm.sqtdso[3] = (unsigned short )0;
                  sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
                  sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[4] = (         int  )0;
                  sqlstm.sqindv[4] = (         short *)0;
                  sqlstm.sqinds[4] = (         int  )0;
                  sqlstm.sqharm[4] = (unsigned long )0;
                  sqlstm.sqadto[4] = (unsigned short )0;
                  sqlstm.sqtdso[4] = (unsigned short )0;
                  sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
                  sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[5] = (         int  )0;
                  sqlstm.sqindv[5] = (         short *)0;
                  sqlstm.sqinds[5] = (         int  )0;
                  sqlstm.sqharm[5] = (unsigned long )0;
                  sqlstm.sqadto[5] = (unsigned short )0;
                  sqlstm.sqtdso[5] = (unsigned short )0;
                  sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
                  sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[6] = (         int  )0;
                  sqlstm.sqindv[6] = (         short *)0;
                  sqlstm.sqinds[6] = (         int  )0;
                  sqlstm.sqharm[6] = (unsigned long )0;
                  sqlstm.sqadto[6] = (unsigned short )0;
                  sqlstm.sqtdso[6] = (unsigned short )0;
                  sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum_h;
                  sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[7] = (         int  )0;
                  sqlstm.sqindv[7] = (         short *)0;
                  sqlstm.sqinds[7] = (         int  )0;
                  sqlstm.sqharm[7] = (unsigned long )0;
                  sqlstm.sqadto[7] = (unsigned short )0;
                  sqlstm.sqtdso[7] = (unsigned short )0;
                  sqlstm.sqhstv[8] = (unsigned char  *)empno;
                  sqlstm.sqhstl[8] = (unsigned long )5;
                  sqlstm.sqhsts[8] = (         int  )0;
                  sqlstm.sqindv[8] = (         short *)0;
                  sqlstm.sqinds[8] = (         int  )0;
                  sqlstm.sqharm[8] = (unsigned long )0;
                  sqlstm.sqadto[8] = (unsigned short )0;
                  sqlstm.sqtdso[8] = (unsigned short )0;
                  sqlstm.sqhstv[9] = (unsigned char  *)workmm;
                  sqlstm.sqhstl[9] = (unsigned long )7;
                  sqlstm.sqhsts[9] = (         int  )0;
                  sqlstm.sqindv[9] = (         short *)0;
                  sqlstm.sqinds[9] = (         int  )0;
                  sqlstm.sqharm[9] = (unsigned long )0;
                  sqlstm.sqadto[9] = (unsigned short )0;
                  sqlstm.sqtdso[9] = (unsigned short )0;
                  sqlstm.sqhstv[10] = (unsigned char  *)tmp_flag;
                  sqlstm.sqhstl[10] = (unsigned long )2;
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



                  /* EXEC SQL
                  INSERT INTO PKHOTFWD
                  VALUES (:workmm, :empno, 1,
                          :pre_genextsum, :pre_holiextsum, :pre_nightsum, :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum,
                          0, 0, 0, 0, 0, 0, 0,
                          TO_Char(sysdate,'YYYYMMDDHH24MISS'),:jobempno,
                          /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
                          :tmp_flag, 0, 0); */ 

{
                  struct sqlexd sqlstm;
                  sqlstm.sqlvsn = 12;
                  sqlstm.arrsiz = 38;
                  sqlstm.sqladtp = &sqladt;
                  sqlstm.sqltdsp = &sqltds;
                  sqlstm.stmt = "insert into PKHOTFWD  values (:b0,:b1,1,:b\
2,:b3,:b4,:b5,:b6,:b7,:b8,0,0,0,0,0,0,0,TO_Char(sysdate,'YYYYMMDDHH24MISS'),:\
b9,:b10,0,0)";
                  sqlstm.iters = (unsigned int  )1;
                  sqlstm.offset = (unsigned int  )2985;
                  sqlstm.cud = sqlcud0;
                  sqlstm.sqlest = (unsigned char  *)&sqlca;
                  sqlstm.sqlety = (unsigned short)4352;
                  sqlstm.occurs = (unsigned int  )0;
                  sqlstm.sqhstv[0] = (unsigned char  *)workmm;
                  sqlstm.sqhstl[0] = (unsigned long )7;
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
                  sqlstm.sqhstv[2] = (unsigned char  *)&pre_genextsum;
                  sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[2] = (         int  )0;
                  sqlstm.sqindv[2] = (         short *)0;
                  sqlstm.sqinds[2] = (         int  )0;
                  sqlstm.sqharm[2] = (unsigned long )0;
                  sqlstm.sqadto[2] = (unsigned short )0;
                  sqlstm.sqtdso[2] = (unsigned short )0;
                  sqlstm.sqhstv[3] = (unsigned char  *)&pre_holiextsum;
                  sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[3] = (         int  )0;
                  sqlstm.sqindv[3] = (         short *)0;
                  sqlstm.sqinds[3] = (         int  )0;
                  sqlstm.sqharm[3] = (unsigned long )0;
                  sqlstm.sqadto[3] = (unsigned short )0;
                  sqlstm.sqtdso[3] = (unsigned short )0;
                  sqlstm.sqhstv[4] = (unsigned char  *)&pre_nightsum;
                  sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[4] = (         int  )0;
                  sqlstm.sqindv[4] = (         short *)0;
                  sqlstm.sqinds[4] = (         int  )0;
                  sqlstm.sqharm[4] = (unsigned long )0;
                  sqlstm.sqadto[4] = (unsigned short )0;
                  sqlstm.sqtdso[4] = (unsigned short )0;
                  sqlstm.sqhstv[5] = (unsigned char  *)&pre_holisum;
                  sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[5] = (         int  )0;
                  sqlstm.sqindv[5] = (         short *)0;
                  sqlstm.sqinds[5] = (         int  )0;
                  sqlstm.sqharm[5] = (unsigned long )0;
                  sqlstm.sqadto[5] = (unsigned short )0;
                  sqlstm.sqtdso[5] = (unsigned short )0;
                  sqlstm.sqhstv[6] = (unsigned char  *)&pre_mealsum;
                  sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[6] = (         int  )0;
                  sqlstm.sqindv[6] = (         short *)0;
                  sqlstm.sqinds[6] = (         int  )0;
                  sqlstm.sqharm[6] = (unsigned long )0;
                  sqlstm.sqadto[6] = (unsigned short )0;
                  sqlstm.sqtdso[6] = (unsigned short )0;
                  sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum;
                  sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[7] = (         int  )0;
                  sqlstm.sqindv[7] = (         short *)0;
                  sqlstm.sqinds[7] = (         int  )0;
                  sqlstm.sqharm[7] = (unsigned long )0;
                  sqlstm.sqadto[7] = (unsigned short )0;
                  sqlstm.sqtdso[7] = (unsigned short )0;
                  sqlstm.sqhstv[8] = (unsigned char  *)&pre_sprestsum;
                  sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
                  sqlstm.sqhsts[8] = (         int  )0;
                  sqlstm.sqindv[8] = (         short *)0;
                  sqlstm.sqinds[8] = (         int  )0;
                  sqlstm.sqharm[8] = (unsigned long )0;
                  sqlstm.sqadto[8] = (unsigned short )0;
                  sqlstm.sqtdso[8] = (unsigned short )0;
                  sqlstm.sqhstv[9] = (unsigned char  *)jobempno;
                  sqlstm.sqhstl[9] = (unsigned long )5;
                  sqlstm.sqhsts[9] = (         int  )0;
                  sqlstm.sqindv[9] = (         short *)0;
                  sqlstm.sqinds[9] = (         int  )0;
                  sqlstm.sqharm[9] = (unsigned long )0;
                  sqlstm.sqadto[9] = (unsigned short )0;
                  sqlstm.sqtdso[9] = (unsigned short )0;
                  sqlstm.sqhstv[10] = (unsigned char  *)tmp_flag;
                  sqlstm.sqhstl[10] = (unsigned long )2;
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



                  if (sqlca.sqlcode != 0)
                  {
                    printf("ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode);
                    sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                    Write_batlog(seqno++, log_buff);
                    return(FAIL);
                  }

             }
         }
         /* 당월 데이터가 있으면 집계위해 초기화 */
         else
         {
             if (state != 2)
             {
                 /* 전월 데이터도 없으면 모두 0 */
                 if (pre_count == 0)
                 {

                       /* EXEC SQL
                       UPDATE PKHOTFWD
                          SET STATE           = 1
                             ,PRE_GENEXTSUM   = 0
                             ,PRE_HOLIEXTSUM  = 0
                             ,PRE_NIGHTSUM    = 0
                             ,PRE_HOLISUM     = 0
                             ,PRE_MEALSUM     = 0
                             ,PRE_RESTSUM     = 0
                             ,PRE_SPRESTSUM   = 0
                             /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
                             ,PRE_RESTSUM_H   = 0
                             ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
                             ,WRITEMAN        = TO_Char(:jobempno)
                             /o 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee o/
                             ,OTFLAG          = :tmp_flag
                       WHERE EMPNO    = :empno   
                         AND OVTMYYMM = :workmm  
                         AND OTFLAG   = :tmp_flag; */ 

{
                       struct sqlexd sqlstm;
                       sqlstm.sqlvsn = 12;
                       sqlstm.arrsiz = 38;
                       sqlstm.sqladtp = &sqladt;
                       sqlstm.sqltdsp = &sqltds;
                       sqlstm.stmt = "update PKHOTFWD  set STATE=1,PRE_GENE\
XTSUM=0,PRE_HOLIEXTSUM=0,PRE_NIGHTSUM=0,PRE_HOLISUM=0,PRE_MEALSUM=0,PRE_RESTS\
UM=0,PRE_SPRESTSUM=0,PRE_RESTSUM_H=0,WRITETIME=TO_Char(sysdate,'YYYYMMDDHH24M\
ISS'),WRITEMAN=TO_Char(:b0),OTFLAG=:b1 where ((EMPNO=:b2 and OVTMYYMM=:b3) an\
d OTFLAG=:b1)";
                       sqlstm.iters = (unsigned int  )1;
                       sqlstm.offset = (unsigned int  )3044;
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
                       sqlstm.sqhstv[1] = (unsigned char  *)tmp_flag;
                       sqlstm.sqhstl[1] = (unsigned long )2;
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
                       sqlstm.sqhstv[3] = (unsigned char  *)workmm;
                       sqlstm.sqhstl[3] = (unsigned long )7;
                       sqlstm.sqhsts[3] = (         int  )0;
                       sqlstm.sqindv[3] = (         short *)0;
                       sqlstm.sqinds[3] = (         int  )0;
                       sqlstm.sqharm[3] = (unsigned long )0;
                       sqlstm.sqadto[3] = (unsigned short )0;
                       sqlstm.sqtdso[3] = (unsigned short )0;
                       sqlstm.sqhstv[4] = (unsigned char  *)tmp_flag;
                       sqlstm.sqhstl[4] = (unsigned long )2;
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



                       if (sqlca.sqlcode != 0)
                       {
                           printf("ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode);
                           sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                           Write_batlog(seqno++, log_buff);
                           return(FAIL);
                       }

                 }
                 /* 전월 데이터 있으면 조회 후 전,당월 이월합에 update */
                 else
                 {
                       /* EXEC SQL
                       SELECT nvl(NXT_GENEXT, 0), nvl(NXT_HOLIEXT, 0), nvl(NXT_NIGHT, 0),
                              nvl(NXT_HOLI, 0), nvl(NXT_MEAL, 0), nvl(NXT_REST, 0), nvl(NXT_SPREST, 0),
                              /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
                              nvl(NXT_REST_H)
                         INTO :pre_genextsum, :pre_holiextsum, :pre_nightsum,
                              :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum,
                              :pre_restsum_h
                         FROM PKHOTFWD
                        WHERE EMPNO    = :empno   
                          AND OVTMYYMM = :workmm-1
                          AND OTFLAG   = :tmp_flag; */ 

{
                       struct sqlexd sqlstm;
                       sqlstm.sqlvsn = 12;
                       sqlstm.arrsiz = 38;
                       sqlstm.sqladtp = &sqladt;
                       sqlstm.sqltdsp = &sqltds;
                       sqlstm.stmt = "select nvl(NXT_GENEXT,0) ,nvl(NXT_HOL\
IEXT,0) ,nvl(NXT_NIGHT,0) ,nvl(NXT_HOLI,0) ,nvl(NXT_MEAL,0) ,nvl(NXT_REST,0) \
,nvl(NXT_SPREST,0) ,nvl(NXT_REST_H) into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7  fro\
m PKHOTFWD where ((EMPNO=:b8 and OVTMYYMM=(:b9-1)) and OTFLAG=:b10)";
                       sqlstm.iters = (unsigned int  )1;
                       sqlstm.offset = (unsigned int  )3079;
                       sqlstm.selerr = (unsigned short)0;
                       sqlstm.cud = sqlcud0;
                       sqlstm.sqlest = (unsigned char  *)&sqlca;
                       sqlstm.sqlety = (unsigned short)4352;
                       sqlstm.occurs = (unsigned int  )0;
                       sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
                       sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[0] = (         int  )0;
                       sqlstm.sqindv[0] = (         short *)0;
                       sqlstm.sqinds[0] = (         int  )0;
                       sqlstm.sqharm[0] = (unsigned long )0;
                       sqlstm.sqadto[0] = (unsigned short )0;
                       sqlstm.sqtdso[0] = (unsigned short )0;
                       sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
                       sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[1] = (         int  )0;
                       sqlstm.sqindv[1] = (         short *)0;
                       sqlstm.sqinds[1] = (         int  )0;
                       sqlstm.sqharm[1] = (unsigned long )0;
                       sqlstm.sqadto[1] = (unsigned short )0;
                       sqlstm.sqtdso[1] = (unsigned short )0;
                       sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
                       sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[2] = (         int  )0;
                       sqlstm.sqindv[2] = (         short *)0;
                       sqlstm.sqinds[2] = (         int  )0;
                       sqlstm.sqharm[2] = (unsigned long )0;
                       sqlstm.sqadto[2] = (unsigned short )0;
                       sqlstm.sqtdso[2] = (unsigned short )0;
                       sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
                       sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[3] = (         int  )0;
                       sqlstm.sqindv[3] = (         short *)0;
                       sqlstm.sqinds[3] = (         int  )0;
                       sqlstm.sqharm[3] = (unsigned long )0;
                       sqlstm.sqadto[3] = (unsigned short )0;
                       sqlstm.sqtdso[3] = (unsigned short )0;
                       sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
                       sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[4] = (         int  )0;
                       sqlstm.sqindv[4] = (         short *)0;
                       sqlstm.sqinds[4] = (         int  )0;
                       sqlstm.sqharm[4] = (unsigned long )0;
                       sqlstm.sqadto[4] = (unsigned short )0;
                       sqlstm.sqtdso[4] = (unsigned short )0;
                       sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
                       sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[5] = (         int  )0;
                       sqlstm.sqindv[5] = (         short *)0;
                       sqlstm.sqinds[5] = (         int  )0;
                       sqlstm.sqharm[5] = (unsigned long )0;
                       sqlstm.sqadto[5] = (unsigned short )0;
                       sqlstm.sqtdso[5] = (unsigned short )0;
                       sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
                       sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[6] = (         int  )0;
                       sqlstm.sqindv[6] = (         short *)0;
                       sqlstm.sqinds[6] = (         int  )0;
                       sqlstm.sqharm[6] = (unsigned long )0;
                       sqlstm.sqadto[6] = (unsigned short )0;
                       sqlstm.sqtdso[6] = (unsigned short )0;
                       sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum_h;
                       sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[7] = (         int  )0;
                       sqlstm.sqindv[7] = (         short *)0;
                       sqlstm.sqinds[7] = (         int  )0;
                       sqlstm.sqharm[7] = (unsigned long )0;
                       sqlstm.sqadto[7] = (unsigned short )0;
                       sqlstm.sqtdso[7] = (unsigned short )0;
                       sqlstm.sqhstv[8] = (unsigned char  *)empno;
                       sqlstm.sqhstl[8] = (unsigned long )5;
                       sqlstm.sqhsts[8] = (         int  )0;
                       sqlstm.sqindv[8] = (         short *)0;
                       sqlstm.sqinds[8] = (         int  )0;
                       sqlstm.sqharm[8] = (unsigned long )0;
                       sqlstm.sqadto[8] = (unsigned short )0;
                       sqlstm.sqtdso[8] = (unsigned short )0;
                       sqlstm.sqhstv[9] = (unsigned char  *)workmm;
                       sqlstm.sqhstl[9] = (unsigned long )7;
                       sqlstm.sqhsts[9] = (         int  )0;
                       sqlstm.sqindv[9] = (         short *)0;
                       sqlstm.sqinds[9] = (         int  )0;
                       sqlstm.sqharm[9] = (unsigned long )0;
                       sqlstm.sqadto[9] = (unsigned short )0;
                       sqlstm.sqtdso[9] = (unsigned short )0;
                       sqlstm.sqhstv[10] = (unsigned char  *)tmp_flag;
                       sqlstm.sqhstl[10] = (unsigned long )2;
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



                       /* EXEC SQL
                       UPDATE PKHOTFWD
                          SET STATE           = 1
                             ,PRE_GENEXTSUM   = :pre_genextsum
                             ,PRE_HOLIEXTSUM  = :pre_holiextsum
                             ,PRE_NIGHTSUM    = :pre_nightsum
                             ,PRE_HOLISUM     = :pre_holisum
                             ,PRE_MEALSUM     = :pre_mealsum
                             ,PRE_RESTSUM     = :pre_restsum
                             ,PRE_SPRESTSUM   = :pre_sprestsum
                             /o 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee o/
                             ,PRE_RESTSUM_H   = :pre_restsum_h
                             ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
                             ,WRITEMAN        = :jobempno
                             /o 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee o/
                             ,OTFLAG          = :tmp_flag
                       WHERE EMPNO    = :empno   
                         AND OVTMYYMM = :workmm  
                         AND OTFLAG   = :tmp_flag; */ 

{
                       struct sqlexd sqlstm;
                       sqlstm.sqlvsn = 12;
                       sqlstm.arrsiz = 38;
                       sqlstm.sqladtp = &sqladt;
                       sqlstm.sqltdsp = &sqltds;
                       sqlstm.stmt = "update PKHOTFWD  set STATE=1,PRE_GENE\
XTSUM=:b0,PRE_HOLIEXTSUM=:b1,PRE_NIGHTSUM=:b2,PRE_HOLISUM=:b3,PRE_MEALSUM=:b4\
,PRE_RESTSUM=:b5,PRE_SPRESTSUM=:b6,PRE_RESTSUM_H=:b7,WRITETIME=TO_Char(sysdat\
e,'YYYYMMDDHH24MISS'),WRITEMAN=:b8,OTFLAG=:b9 where ((EMPNO=:b10 and OVTMYYMM\
=:b11) and OTFLAG=:b9)";
                       sqlstm.iters = (unsigned int  )1;
                       sqlstm.offset = (unsigned int  )3138;
                       sqlstm.cud = sqlcud0;
                       sqlstm.sqlest = (unsigned char  *)&sqlca;
                       sqlstm.sqlety = (unsigned short)4352;
                       sqlstm.occurs = (unsigned int  )0;
                       sqlstm.sqhstv[0] = (unsigned char  *)&pre_genextsum;
                       sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[0] = (         int  )0;
                       sqlstm.sqindv[0] = (         short *)0;
                       sqlstm.sqinds[0] = (         int  )0;
                       sqlstm.sqharm[0] = (unsigned long )0;
                       sqlstm.sqadto[0] = (unsigned short )0;
                       sqlstm.sqtdso[0] = (unsigned short )0;
                       sqlstm.sqhstv[1] = (unsigned char  *)&pre_holiextsum;
                       sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[1] = (         int  )0;
                       sqlstm.sqindv[1] = (         short *)0;
                       sqlstm.sqinds[1] = (         int  )0;
                       sqlstm.sqharm[1] = (unsigned long )0;
                       sqlstm.sqadto[1] = (unsigned short )0;
                       sqlstm.sqtdso[1] = (unsigned short )0;
                       sqlstm.sqhstv[2] = (unsigned char  *)&pre_nightsum;
                       sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[2] = (         int  )0;
                       sqlstm.sqindv[2] = (         short *)0;
                       sqlstm.sqinds[2] = (         int  )0;
                       sqlstm.sqharm[2] = (unsigned long )0;
                       sqlstm.sqadto[2] = (unsigned short )0;
                       sqlstm.sqtdso[2] = (unsigned short )0;
                       sqlstm.sqhstv[3] = (unsigned char  *)&pre_holisum;
                       sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[3] = (         int  )0;
                       sqlstm.sqindv[3] = (         short *)0;
                       sqlstm.sqinds[3] = (         int  )0;
                       sqlstm.sqharm[3] = (unsigned long )0;
                       sqlstm.sqadto[3] = (unsigned short )0;
                       sqlstm.sqtdso[3] = (unsigned short )0;
                       sqlstm.sqhstv[4] = (unsigned char  *)&pre_mealsum;
                       sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[4] = (         int  )0;
                       sqlstm.sqindv[4] = (         short *)0;
                       sqlstm.sqinds[4] = (         int  )0;
                       sqlstm.sqharm[4] = (unsigned long )0;
                       sqlstm.sqadto[4] = (unsigned short )0;
                       sqlstm.sqtdso[4] = (unsigned short )0;
                       sqlstm.sqhstv[5] = (unsigned char  *)&pre_restsum;
                       sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[5] = (         int  )0;
                       sqlstm.sqindv[5] = (         short *)0;
                       sqlstm.sqinds[5] = (         int  )0;
                       sqlstm.sqharm[5] = (unsigned long )0;
                       sqlstm.sqadto[5] = (unsigned short )0;
                       sqlstm.sqtdso[5] = (unsigned short )0;
                       sqlstm.sqhstv[6] = (unsigned char  *)&pre_sprestsum;
                       sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[6] = (         int  )0;
                       sqlstm.sqindv[6] = (         short *)0;
                       sqlstm.sqinds[6] = (         int  )0;
                       sqlstm.sqharm[6] = (unsigned long )0;
                       sqlstm.sqadto[6] = (unsigned short )0;
                       sqlstm.sqtdso[6] = (unsigned short )0;
                       sqlstm.sqhstv[7] = (unsigned char  *)&pre_restsum_h;
                       sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
                       sqlstm.sqhsts[7] = (         int  )0;
                       sqlstm.sqindv[7] = (         short *)0;
                       sqlstm.sqinds[7] = (         int  )0;
                       sqlstm.sqharm[7] = (unsigned long )0;
                       sqlstm.sqadto[7] = (unsigned short )0;
                       sqlstm.sqtdso[7] = (unsigned short )0;
                       sqlstm.sqhstv[8] = (unsigned char  *)jobempno;
                       sqlstm.sqhstl[8] = (unsigned long )5;
                       sqlstm.sqhsts[8] = (         int  )0;
                       sqlstm.sqindv[8] = (         short *)0;
                       sqlstm.sqinds[8] = (         int  )0;
                       sqlstm.sqharm[8] = (unsigned long )0;
                       sqlstm.sqadto[8] = (unsigned short )0;
                       sqlstm.sqtdso[8] = (unsigned short )0;
                       sqlstm.sqhstv[9] = (unsigned char  *)tmp_flag;
                       sqlstm.sqhstl[9] = (unsigned long )2;
                       sqlstm.sqhsts[9] = (         int  )0;
                       sqlstm.sqindv[9] = (         short *)0;
                       sqlstm.sqinds[9] = (         int  )0;
                       sqlstm.sqharm[9] = (unsigned long )0;
                       sqlstm.sqadto[9] = (unsigned short )0;
                       sqlstm.sqtdso[9] = (unsigned short )0;
                       sqlstm.sqhstv[10] = (unsigned char  *)empno;
                       sqlstm.sqhstl[10] = (unsigned long )5;
                       sqlstm.sqhsts[10] = (         int  )0;
                       sqlstm.sqindv[10] = (         short *)0;
                       sqlstm.sqinds[10] = (         int  )0;
                       sqlstm.sqharm[10] = (unsigned long )0;
                       sqlstm.sqadto[10] = (unsigned short )0;
                       sqlstm.sqtdso[10] = (unsigned short )0;
                       sqlstm.sqhstv[11] = (unsigned char  *)workmm;
                       sqlstm.sqhstl[11] = (unsigned long )7;
                       sqlstm.sqhsts[11] = (         int  )0;
                       sqlstm.sqindv[11] = (         short *)0;
                       sqlstm.sqinds[11] = (         int  )0;
                       sqlstm.sqharm[11] = (unsigned long )0;
                       sqlstm.sqadto[11] = (unsigned short )0;
                       sqlstm.sqtdso[11] = (unsigned short )0;
                       sqlstm.sqhstv[12] = (unsigned char  *)tmp_flag;
                       sqlstm.sqhstl[12] = (unsigned long )2;
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



                       if (sqlca.sqlcode != 0)
                       {
                           printf("ERROR_CODE : %d, PKHOTFWD 초기화단계 실패2\n", sqlca.sqlcode);
                           sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 초기화단계 실패2\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                           Write_batlog(seqno++, log_buff);
                           return(FAIL);
                       }

                 }
             }
         }
         //return(SUCCESS);
    }
    /* 당월 없으면 생성 */
    //if (count == 0)
    //{
    //    /* 전월 데이터도 없으면 모두 0 */
    //    if (pre_count == 0)
    //    {
    //        /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
    //        for (i = 0;i < 3; i++)
    //        {
    //             strncpy(tmp_flag,otflags+(i),1);
    //
    //             EXEC SQL
    //             INSERT INTO PKHOTFWD
    //             VALUES (:workmm, :empno, 1,
    //                     0, 0, 0, 0, 0, 0, 0,
    //                     0, 0, 0, 0, 0, 0, 0,
    //                     TO_Char(sysdate,'YYYYMMDDHH24MISS'),:jobempno,
    //                     /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
    //                     :tmp_flag, 0, 0);
    //
    //             if (sqlca.sqlcode != 0)
    //             {
    //                 printf("ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode);
    //                 sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
    //                 Write_batlog(seqno++, log_buff);
    //                 return(FAIL);
    //             }
    //        }
    //        return(SUCCESS);
    //    }
    //    /* 전월 데이터 있으면 조회 후 전,당월 이월합에 Insert */
    //    else
    //    {
    //        /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
    //        for (i = 0;i < 3; i++)
    //        {
    //             strncpy(tmp_flag,otflags+(i),1);
    //
    //             EXEC SQL
    //             SELECT nvl(NXT_GENEXT, 0), nvl(NXT_HOLIEXT, 0), nvl(NXT_NIGHT, 0),
    //                    nvl(NXT_HOLI, 0), nvl(NXT_MEAL, 0), nvl(NXT_REST, 0), nvl(NXT_SPREST, 0),
    //                    /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
    //                    nvl(NXT_REST_H)
    //               INTO :pre_genextsum, :pre_holiextsum, :pre_nightsum,
    //                    :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum,
    //                    :pre_restsum_h
    //               FROM PKHOTFWD
    //              WHERE EMPNO    = :empno
    //                AND OVTMYYMM = (:workmm-1)
    //                AND OTFLAG = :tmp_flag;
    //
    //             EXEC SQL
    //             INSERT INTO PKHOTFWD
    //             VALUES (:workmm, :empno, 1,
    //                     :pre_genextsum, :pre_holiextsum, :pre_nightsum, :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum,
    //                     0, 0, 0, 0, 0, 0, 0,
    //                     TO_Char(sysdate,'YYYYMMDDHH24MISS'),:jobempno,
    //                     /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
    //                     :tmp_flag, 0, 0);
    //
    //             if (sqlca.sqlcode != 0)
    //             {
    //               printf("ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode);
    //               sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 생성단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
    //               Write_batlog(seqno++, log_buff);
    //               return(FAIL);
    //             }
    //             return(SUCCESS);
    //        }
    //    }
    //}
    ///* 당월 데이터가 있으면 집계위해 초기화 */
    //else
    //{
    //    if (state != 2)
    //    {
    //        /* 전월 데이터도 없으면 모두 0 */
    //        if (pre_count == 0)
    //        {
    //             /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
    //             for (i = 0;i < 3; i++)
    //             {
    //                  strncpy(tmp_flag,otflags+(i),1);
    //
    //                  EXEC SQL
    //                  UPDATE PKHOTFWD
    //                     SET STATE           = 1
    //                        ,PRE_GENEXTSUM   = 0
    //                        ,PRE_HOLIEXTSUM  = 0
    //                        ,PRE_NIGHTSUM    = 0
    //                        ,PRE_HOLISUM     = 0
    //                        ,PRE_MEALSUM     = 0
    //                        ,PRE_RESTSUM     = 0
    //                        ,PRE_SPRESTSUM   = 0
    //                        /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
    //                        ,PRE_RESTSUM_H   = 0
    //                        ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
    //                        ,WRITEMAN        = TO_Char(:jobempno)
    //                        /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
    //                        ,OTFLAG          = :tmp_flag
    //                  WHERE EMPNO    = :empno
    //                    AND OVTMYYMM = :workmm
    //                    AND OTFLAG = :tmp_flag;
    //
    //                  if (sqlca.sqlcode != 0)
    //                  {
    //                      printf("ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode);
    //                      sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 초기화단계 실패\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
    //                      Write_batlog(seqno++, log_buff);
    //                      return(FAIL);
    //                  }
    //                  return(SUCCESS);
    //             }
    //        }
    //        /* 전월 데이터 있으면 조회 후 전,당월 이월합에 update */
    //        else
    //        {
    //             /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
    //             for (i = 0;i < 3; i++)
    //             {
    //                  strncpy(tmp_flag,otflags+(i),1);
    //
    //                  EXEC SQL
    //                  SELECT nvl(NXT_GENEXT, 0), nvl(NXT_HOLIEXT, 0), nvl(NXT_NIGHT, 0),
    //                         nvl(NXT_HOLI, 0), nvl(NXT_MEAL, 0), nvl(NXT_REST, 0), nvl(NXT_SPREST, 0),
    //                         /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
    //                         nvl(NXT_REST_H)
    //                    INTO :pre_genextsum, :pre_holiextsum, :pre_nightsum,
    //                         :pre_holisum, :pre_mealsum, :pre_restsum, :pre_sprestsum,
    //                         :pre_restsum_h
    //                    FROM PKHOTFWD
    //                   WHERE EMPNO    = :empno
    //                     AND OVTMYYMM = (:workmm-1)
    //                     AND OTFLAG   = :tmp_flag;
    //
    //                  EXEC SQL
    //                  UPDATE PKHOTFWD
    //                     SET STATE           = 1
    //                        ,PRE_GENEXTSUM   = :pre_genextsum
    //                        ,PRE_HOLIEXTSUM  = :pre_holiextsum
    //                        ,PRE_NIGHTSUM    = :pre_nightsum
    //                        ,PRE_HOLISUM     = :pre_holisum
    //                        ,PRE_MEALSUM     = :pre_mealsum
    //                        ,PRE_RESTSUM     = :pre_restsum
    //                        ,PRE_SPRESTSUM   = :pre_sprestsum
    //                        /* 초근제외(초근휴일) 추가 - 2018.08.21 SangMoon Lee */
    //                        ,PRE_RESTSUM_H   = :pre_restsum_h
    //                        ,WRITETIME       = TO_Char(sysdate,'YYYYMMDDHH24MISS')
    //                        ,WRITEMAN        = :jobempno
    //                        /* 근무제구분(otflag) 추가 - 2018.08.21 SangMoon Lee */
    //                        ,OTFLAG          = :tmp_flag
    //                  WHERE EMPNO    = :empno
    //                    AND OVTMYYMM = :workmm
    //                    AND OTFLAG   = :tmp_flag;
    //
    //                  if (sqlca.sqlcode != 0)
    //                  {
    //                      printf("ERROR_CODE : %d, PKHOTFWD 초기화단계 실패2\n", sqlca.sqlcode);
    //                      sprintf(log_buff, "ERROR_CODE : %d, PKHOTFWD 초기화단계 실패2\n", sqlca.sqlcode); /*dsa2000 Rexec 대체*/
    //                      Write_batlog(seqno++, log_buff);
    //                      return(FAIL);
    //                  }
    //                  return(SUCCESS);
    //             }
    //        }
    //    }
    //}
}

print_Lastamt()
{

  /* EXEC SQL BEGIN DECLARE SECTION; */ 

  	int last_ovtmamt, last_ovtmamt_Y = 0;
  /* EXEC SQL END DECLARE SECTION; */ 


  /* EXEC SQL
  SELECT MAX(OVTMAMT), MAX(OVTMAMT_Y)
    INTO :last_ovtmamt, :last_ovtmamt_Y
    FROM
         (
         SELECT NVL(SUM(OVTMAMT),0) OVTMAMT,0 OVTMAMT_Y
           FROM PKHOTSUM
          WHERE OVTMYYMM = :workmm
            AND EMPNO >= :frempno AND EMPNO <= :toempno
            AND EMPNO NOT LIKE 'Y%'
         UNION
         SELECT 0,NVL(SUM(OVTMAMT),0)
           FROM PKHOTSUM
          WHERE OVTMYYMM = :workmm
            AND EMPNO >= :frempno AND EMPNO <= :toempno
            AND EMPNO LIKE 'Y%'
         )
  ; */ 

{
  struct sqlexd sqlstm;
  sqlstm.sqlvsn = 12;
  sqlstm.arrsiz = 38;
  sqlstm.sqladtp = &sqladt;
  sqlstm.sqltdsp = &sqltds;
  sqlstm.stmt = "select max(OVTMAMT) ,max(OVTMAMT_Y) into :b0,:b1  from (se\
lect NVL(sum(OVTMAMT),0) OVTMAMT ,0 OVTMAMT_Y  from PKHOTSUM where (((OVTMYYM\
M=:b2 and EMPNO>=:b3) and EMPNO<=:b4) and EMPNO not like 'Y%') union select 0\
 ,NVL(sum(OVTMAMT),0)  from PKHOTSUM where (((OVTMYYMM=:b2 and EMPNO>=:b3) an\
d EMPNO<=:b4) and EMPNO like 'Y%')) ";
  sqlstm.iters = (unsigned int  )1;
  sqlstm.offset = (unsigned int  )3205;
  sqlstm.selerr = (unsigned short)0;
  sqlstm.cud = sqlcud0;
  sqlstm.sqlest = (unsigned char  *)&sqlca;
  sqlstm.sqlety = (unsigned short)4352;
  sqlstm.occurs = (unsigned int  )0;
  sqlstm.sqhstv[0] = (unsigned char  *)&last_ovtmamt;
  sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
  sqlstm.sqhsts[0] = (         int  )0;
  sqlstm.sqindv[0] = (         short *)0;
  sqlstm.sqinds[0] = (         int  )0;
  sqlstm.sqharm[0] = (unsigned long )0;
  sqlstm.sqadto[0] = (unsigned short )0;
  sqlstm.sqtdso[0] = (unsigned short )0;
  sqlstm.sqhstv[1] = (unsigned char  *)&last_ovtmamt_Y;
  sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
  sqlstm.sqhsts[1] = (         int  )0;
  sqlstm.sqindv[1] = (         short *)0;
  sqlstm.sqinds[1] = (         int  )0;
  sqlstm.sqharm[1] = (unsigned long )0;
  sqlstm.sqadto[1] = (unsigned short )0;
  sqlstm.sqtdso[1] = (unsigned short )0;
  sqlstm.sqhstv[2] = (unsigned char  *)workmm;
  sqlstm.sqhstl[2] = (unsigned long )7;
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
  sqlstm.sqhstv[5] = (unsigned char  *)workmm;
  sqlstm.sqhstl[5] = (unsigned long )7;
  sqlstm.sqhsts[5] = (         int  )0;
  sqlstm.sqindv[5] = (         short *)0;
  sqlstm.sqinds[5] = (         int  )0;
  sqlstm.sqharm[5] = (unsigned long )0;
  sqlstm.sqadto[5] = (unsigned short )0;
  sqlstm.sqtdso[5] = (unsigned short )0;
  sqlstm.sqhstv[6] = (unsigned char  *)frempno;
  sqlstm.sqhstl[6] = (unsigned long )5;
  sqlstm.sqhsts[6] = (         int  )0;
  sqlstm.sqindv[6] = (         short *)0;
  sqlstm.sqinds[6] = (         int  )0;
  sqlstm.sqharm[6] = (unsigned long )0;
  sqlstm.sqadto[6] = (unsigned short )0;
  sqlstm.sqtdso[6] = (unsigned short )0;
  sqlstm.sqhstv[7] = (unsigned char  *)toempno;
  sqlstm.sqhstl[7] = (unsigned long )5;
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



  /* 정규직 초과근무 이월수당 합산 */
  printf("\n 정규직 전월 이월수당 합산 =======================");
  sprintf(log_buff, "\n 정규직 전월 이월수당 합산 ======================="); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);

  printf("\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt);
  sprintf(log_buff,"\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);

  /* 계약직 초과근무 이월수당 합산 */
  printf("\n 계약직 전월 이월수당 합산 =======================");
  sprintf(log_buff, "\n 계약직 전월 이월수당 합산 ======================="); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);

  printf("\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt_Y);
  sprintf(log_buff,"\n 총 전월 이월수당 합산액 : %d \n",last_ovtmamt_Y); /*dsa2000 Rexec 대체*/
  Write_batlog(seqno++, log_buff);
}

void CreateLog()
{
     char  curdatetime[20+1]="";
     char  *logdir;
     logdir = hinsa_home();
     /*printf("logdir : %s", logdir);*/
     strcat(logdir,"/log/proc/pkg3071g_N/");

     /* EXEC SQL
     SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
       INTO   :curdatetime
       FROM   DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 38;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0  fr\
om DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )3252;
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
