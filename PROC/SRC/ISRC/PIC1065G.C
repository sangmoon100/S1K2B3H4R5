
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
    "pic1065g.pc"
};


static unsigned int sqlctx = 149347;


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
   unsigned char  *sqhstv[97];
   unsigned long  sqhstl[97];
            int   sqhsts[97];
            short *sqindv[97];
            int   sqinds[97];
   unsigned long  sqharm[97];
   unsigned long  *sqharc[97];
   unsigned short  sqadto[97];
   unsigned short  sqtdso[97];
} sqlstm = {12,97};

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
5,0,0,1,97,0,4,304,0,0,2,0,0,1,0,2,97,0,0,2,97,0,0,
28,0,0,2,45,0,2,319,0,0,1,1,0,1,0,1,97,0,0,
47,0,0,3,58,0,3,330,0,0,1,1,0,1,0,1,97,0,0,
66,0,0,4,308,0,3,340,0,0,1,1,0,1,0,1,97,0,0,
85,0,0,5,85,0,4,437,0,0,2,0,0,1,0,2,9,0,0,2,9,0,0,
108,0,0,6,97,0,4,442,0,0,3,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,
135,0,0,7,73,0,4,447,0,0,1,0,0,1,0,2,9,0,0,
154,0,0,8,101,0,4,452,0,0,1,0,0,1,0,2,9,0,0,
173,0,0,9,117,0,4,457,0,0,1,0,0,1,0,2,9,0,0,
192,0,0,10,94,0,4,462,0,0,2,1,0,1,0,2,9,0,0,1,9,0,0,
215,0,0,11,227,0,4,468,0,0,6,1,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,1,
9,0,0,
254,0,0,12,85,0,4,476,0,0,2,0,0,1,0,2,9,0,0,2,9,0,0,
277,0,0,13,0,0,17,552,0,0,1,1,0,1,0,1,97,0,0,
296,0,0,13,0,0,45,554,0,0,0,0,0,1,0,
311,0,0,13,0,0,15,558,0,0,0,0,0,1,0,
326,0,0,13,0,0,13,570,0,0,45,0,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,
9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,3,0,0,2,9,0,0,2,9,0,0,
2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,9,0,0,2,9,0,
0,2,9,0,0,2,9,0,0,2,9,0,0,2,4,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,
0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,3,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,
9,0,0,
521,0,0,13,0,0,15,583,0,0,0,0,0,1,0,
536,0,0,13,0,0,15,590,0,0,0,0,0,1,0,
551,0,0,14,67,0,5,601,0,0,1,1,0,1,0,1,9,0,0,
570,0,0,15,0,0,29,602,0,0,0,0,0,1,0,
585,0,0,16,224,0,5,620,0,0,9,9,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,0,0,
1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
636,0,0,17,0,0,29,628,0,0,0,0,0,1,0,
651,0,0,18,19,0,1,664,0,0,0,0,0,1,0,
666,0,0,19,225,0,5,679,0,0,9,9,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,0,0,
1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
717,0,0,20,0,0,29,693,0,0,0,0,0,1,0,
732,0,0,21,22,0,43,705,0,0,0,0,0,1,0,
747,0,0,22,78,0,5,719,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
770,0,0,23,0,0,29,724,0,0,0,0,0,1,0,
785,0,0,24,1491,0,4,739,0,0,97,1,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
2,3,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,
0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,
0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,
9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,3,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,3,0,0,2,3,0,0,2,3,0,
0,2,3,0,0,2,9,0,0,2,9,0,0,2,3,0,0,2,3,0,0,2,3,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,
0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,
9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,4,0,0,
2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,
0,2,9,0,0,2,9,0,0,2,9,0,0,1,97,0,0,
1188,0,0,25,230,0,4,785,0,0,15,2,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,
2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,2,9,0,0,1,9,0,0,1,97,0,
0,
1263,0,0,26,75,0,4,858,0,0,2,1,0,1,0,2,9,0,0,1,9,0,0,
1286,0,0,27,74,0,4,918,0,0,3,2,0,1,0,2,97,0,0,1,97,0,0,1,97,0,0,
1313,0,0,28,101,0,4,1041,0,0,5,2,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,1,9,0,0,1,9,
0,0,
1348,0,0,29,268,0,4,1106,0,0,7,4,0,1,0,1,97,0,0,1,97,0,0,2,3,0,0,2,3,0,0,2,3,0,
0,1,97,0,0,1,97,0,0,
1391,0,0,30,75,0,4,1130,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
1414,0,0,31,77,0,4,1137,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,3,0,0,
1441,0,0,32,75,0,4,1654,0,0,3,2,0,1,0,2,9,0,0,1,9,0,0,1,9,0,0,
1468,0,0,33,160,0,5,1719,0,0,7,7,0,1,0,1,9,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,
0,1,9,0,0,1,9,0,0,
1511,0,0,34,372,0,4,1733,0,0,4,1,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,1,9,0,0,
1542,0,0,35,362,0,3,1798,0,0,19,19,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,3,
0,0,1,3,0,0,1,97,0,0,1,9,0,0,1,97,0,0,
1633,0,0,36,372,0,4,1820,0,0,4,1,0,1,0,2,3,0,0,2,3,0,0,2,3,0,0,1,9,0,0,
1664,0,0,37,49,0,4,1875,0,0,3,2,0,1,0,1,9,0,0,1,9,0,0,2,97,0,0,
1691,0,0,38,49,0,4,1876,0,0,3,2,0,1,0,1,9,0,0,1,9,0,0,2,97,0,0,
1718,0,0,39,82,0,4,2007,0,0,4,1,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,1,9,0,0,
1749,0,0,40,135,0,4,2035,0,0,5,2,0,1,0,2,9,0,0,2,9,0,0,2,9,0,0,1,9,0,0,1,9,0,0,
1784,0,0,41,42,0,4,2064,0,0,1,1,0,1,0,1,9,0,0,
1803,0,0,42,613,0,3,2074,0,0,41,41,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,
0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,
9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
1,3,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
1982,0,0,43,2530,0,5,2108,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
2005,0,0,44,596,0,5,2212,0,0,40,40,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,
0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,
9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,9,0,0,
1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
2180,0,0,45,396,0,5,2237,0,0,28,28,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,3,0,0,1,9,0,0,1,9,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,9,0,0,1,9,
0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,
9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
2307,0,0,46,439,0,5,2258,0,0,27,27,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,4,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,
0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,0,0,1,9,0,0,1,9,0,0,1,
9,0,0,1,9,0,0,1,9,0,0,
2430,0,0,47,79,0,4,2291,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
2453,0,0,48,57,0,2,2295,0,0,2,2,0,1,0,1,97,0,0,1,9,0,0,
2476,0,0,49,68,0,3,2313,0,0,2,2,0,1,0,1,97,0,0,1,9,0,0,
2499,0,0,50,77,0,4,2346,0,0,3,2,0,1,0,1,9,0,0,1,9,0,0,2,3,0,0,
2526,0,0,51,77,0,4,2352,0,0,3,2,0,1,0,1,97,0,0,1,9,0,0,2,3,0,0,
2553,0,0,52,77,0,4,2370,0,0,3,2,0,1,0,1,9,0,0,1,97,0,0,2,3,0,0,
2580,0,0,53,77,0,4,2376,0,0,3,2,0,1,0,1,97,0,0,1,97,0,0,2,3,0,0,
2607,0,0,54,222,0,5,2397,0,0,15,15,0,1,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,
0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,3,0,0,1,97,0,0,1,9,
0,0,
2682,0,0,55,81,0,4,2416,0,0,2,1,0,1,0,1,97,0,0,2,97,0,0,
2705,0,0,56,212,0,5,2423,0,0,9,9,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,0,
0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
2756,0,0,57,113,0,4,2438,0,0,3,2,0,1,0,2,9,0,0,1,9,0,0,1,9,0,0,
2783,0,0,58,266,0,3,2453,0,0,3,3,0,1,0,1,97,0,0,1,97,0,0,1,9,0,0,
2810,0,0,59,113,0,3,2472,0,0,2,2,0,1,0,1,9,0,0,1,97,0,0,
2833,0,0,60,105,0,3,2485,0,0,1,1,0,1,0,1,9,0,0,
2852,0,0,61,121,0,5,2501,0,0,2,2,0,1,0,1,97,0,0,1,9,0,0,
2875,0,0,62,134,0,5,2518,0,0,2,2,0,1,0,1,97,0,0,1,9,0,0,
2898,0,0,63,181,0,5,2545,0,0,4,4,0,1,0,1,97,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
2929,0,0,64,60,0,2,2573,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
2952,0,0,65,60,0,2,2586,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
2975,0,0,66,58,0,2,2597,0,0,2,2,0,1,0,1,9,0,0,1,9,0,0,
2998,0,0,67,181,0,5,2607,0,0,4,4,0,1,0,1,97,0,0,1,9,0,0,1,9,0,0,1,9,0,0,
3029,0,0,68,310,0,3,2628,0,0,18,18,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,
0,0,1,9,0,0,1,9,0,0,1,97,0,0,
3116,0,0,69,298,0,5,2647,0,0,17,17,0,1,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,
0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,9,0,0,1,97,
0,0,1,9,0,0,1,9,0,0,
3199,0,0,70,0,0,17,2686,0,0,1,1,0,1,0,1,97,0,0,
3218,0,0,70,0,0,45,2688,0,0,0,0,0,1,0,
3233,0,0,70,0,0,15,2692,0,0,0,0,0,1,0,
3248,0,0,70,0,0,13,2703,0,0,2,0,0,1,0,2,9,0,0,2,9,0,0,
3271,0,0,71,21,0,1,2721,0,0,0,0,0,1,0,
3286,0,0,72,0,0,24,2725,0,0,1,1,0,1,0,1,97,0,0,
3305,0,0,73,0,0,24,2747,0,0,1,1,0,1,0,1,97,0,0,
3324,0,0,74,0,0,24,2756,0,0,1,1,0,1,0,1,97,0,0,
3343,0,0,75,21,0,1,2763,0,0,0,0,0,1,0,
3358,0,0,76,85,0,4,2788,0,0,3,1,0,1,0,2,97,0,0,2,3,0,0,1,9,0,0,
3385,0,0,77,104,0,4,2804,0,0,1,0,0,1,0,2,97,0,0,
3404,0,0,78,0,0,24,2822,0,0,1,1,0,1,0,1,97,0,0,
3423,0,0,79,0,0,24,2836,0,0,1,1,0,1,0,1,97,0,0,
3442,0,0,80,139,0,3,2846,0,0,5,5,0,1,0,1,97,0,0,1,9,0,0,1,3,0,0,1,9,0,0,1,97,0,
0,
3477,0,0,81,74,0,4,2998,0,0,2,1,0,1,0,2,3,0,0,1,9,0,0,
3500,0,0,82,86,0,4,3002,0,0,3,1,0,1,0,2,97,0,0,2,97,0,0,1,9,0,0,
3527,0,0,83,136,0,4,3008,0,0,3,1,0,1,0,2,97,0,0,2,97,0,0,1,9,0,0,
3554,0,0,84,81,0,4,3012,0,0,2,1,0,1,0,2,97,0,0,1,97,0,0,
3577,0,0,85,0,0,24,3553,0,0,1,1,0,1,0,1,97,0,0,
3596,0,0,86,0,0,29,3565,0,0,0,0,0,1,0,
3611,0,0,87,0,0,24,4096,0,0,1,1,0,1,0,1,97,0,0,
3630,0,0,88,0,0,29,4108,0,0,0,0,0,1,0,
3645,0,0,89,0,0,17,4119,0,0,1,1,0,1,0,1,97,0,0,
3664,0,0,89,0,0,45,4121,0,0,0,0,0,1,0,
3679,0,0,89,0,0,13,4128,0,0,1,0,0,1,0,2,97,0,0,
3698,0,0,89,0,0,15,4132,0,0,0,0,0,1,0,
3713,0,0,90,0,0,29,4133,0,0,0,0,0,1,0,
3728,0,0,89,0,0,15,4138,0,0,0,0,0,1,0,
3743,0,0,91,0,0,24,4672,0,0,1,1,0,1,0,1,97,0,0,
3762,0,0,89,0,0,15,4676,0,0,0,0,0,1,0,
3777,0,0,92,0,0,24,5203,0,0,1,1,0,1,0,1,97,0,0,
3796,0,0,89,0,0,15,5207,0,0,0,0,0,1,0,
3811,0,0,93,88,0,3,5225,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,3,0,0,1,97,0,0,1,97,
0,0,
3846,0,0,94,0,0,29,5230,0,0,0,0,0,1,0,
};


/*-------------------------------------------------mv pic1065g ~/HINSA/proc/bin/Ibin
    PROGRAM-NAME    : pic1065g.pc(인사발령사항반영)
    SYSTEM-NAME     : 종합인사정보
    SUBSYSTEM-NAME  : 인사
    Programmer      : 고도화
    Version         : 31.12
    Date            : 2018.10.
    Update Contents
    버전    수정일    수정자   관련근거                 수정내용
 -------------------------------------------------------------------------------
    2018.05부터 종합인사고도화 프로젝트 수행 중 델파이 -> Pro*C로 재개발 및 기능 추가
    1. 발령사항 중 사번변경이 발생하는 발령[신규채용(111), 선임(121)]은 사번변경 적용이 필요한 테이블의 해당사번 자료를 
       신규사번으로 복사 입력(Copy_Empno()), 복수사번관리(PYMEMPNO) 테이블에 마스터 사번 생성 또는 추가하여 사번 관리(Ins_Mempno())
    2. 작업대상 발령사항 중 첫번째 발령사항의 조직차수가 인사변수 테이블(PIMVARI)의 조직차수 보다 클 경우 해당 테이블 수정(연간 조직개편 용도)
    3. 모든 발령사항에 대해 MYHR공지사항 테이블(EHR_PHNOTICE)에 등록하여 공지할 수 있도록 추가(Ins_Notice())
 -------------------------------------------------------------------------------*/
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

#define  DEBUG      0

/*----------------------------------------------*
 * Current data save & Condition save Variable  *
 *----------------------------------------------*/
/* EXEC SQL BEGIN DECLARE SECTION; */ 

    /* 인사업무 관련 전역변수 init_variable()참고 */
    /* varchar    hisfryymm[6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } hisfryymm;
   
    /* varchar    histoyymm[6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } histoyymm;

    /* varchar    edupstateyn[1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } edupstateyn;

    /* varchar    jupstateyn[1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } jupstateyn;

    /* varchar    hupstateyn[1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } hupstateyn;

    /* varchar    Edeptcode[6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } Edeptcode;

    /* varchar    Erabasdate[8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } Erabasdate;

    /* varchar    Eanupdyn[1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } Eanupdyn;

    /* varchar    Eempno[4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } Eempno;

    /* varchar    exjob1[2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } exjob1;

    /* varchar    exjob2[2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } exjob2;
		
    /* varchar    exjob3[2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } exjob3;

    /* varchar    exjob4[2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } exjob4;

    /* varchar    exjob5[2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } exjob5;

    /* varchar    oldAnnono[8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } oldAnnono;

    /* varchar    oldorgnum[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } oldorgnum;

    /* varchar    payrachdate[8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } payrachdate;


    typedef struct HINSA_pehremas {
        /* varchar empno         [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } empno;
  /* 사번 */
        /* varchar jobgun        [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } jobgun;
  /* 직군 */
        /* varchar orgnum        [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } orgnum;
  /* 조직차수 */
        /* varchar deptcode      [5+1]; */ 
struct { unsigned short len; unsigned char arr[6]; } deptcode;
  /* 부서코드 */
        /* varchar pstate        [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } pstate;
  /* 인사상태 */
        /* varchar paycl         [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } paycl;
  /* BAND */
        /* varchar payra         [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } payra;
  /* 직책 */
        /* varchar jobpayra      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } jobpayra;
  /* 근무직책 */
        /* varchar trdate        [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } trdate;
  /* 현부서발령일 */
        /* varchar reconyn       [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } reconyn;
  /* 목표수립대상여부 */
        /* varchar e1existyn     [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } e1existyn;
  /* 1차평가자 실제존재여부 */
        /* varchar e2existyn     [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } e2existyn;
  /* 2차평가자 실제존재여부 */
        /* varchar e1empno       [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } e1empno;
  /* 1차평가자사번 */
        /* varchar e2empno       [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } e2empno;
  /* 2차평가자사번 */
        /* varchar prjexcode     [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } prjexcode;
 
        /* varchar prjexfrdate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } prjexfrdate;
 
        /* varchar prjextodate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } prjextodate;

    } ts_pehremas;

    typedef struct HINSA_pimpmas {
        /* varchar empno         [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } empno;
     /* 사원번호 */
        /* varchar korname       [12+1]; */ 
struct { unsigned short len; unsigned char arr[13]; } korname;
    /* 성명 */
        /* varchar pstate        [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } pstate;
     /* 인사상태 */
        /* varchar pstateyn      [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } pstateyn;
     /* 현원포함여부 */
        /* varchar paycl         [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } paycl;
     /* 직급 */
        int     paygr              ;     /* 호봉  -- 일반직과 임원만 실제 사용. */
        /* varchar payra         [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } payra;
     /* 직책 */
        /* varchar jobpayra      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } jobpayra;
     /* 근무직책 */         //31.14  2001.08.20 shm 추가
        /* varchar orgnum        [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } orgnum;
     /* 조직차수 */
        /* varchar deptcode      [5+1]; */ 
struct { unsigned short len; unsigned char arr[6]; } deptcode;
     /* 부서코드 */
        /* varchar fieldcode     [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } fieldcode;
     /* 소속부문 */
        /* varchar boncode       [5+1]; */ 
struct { unsigned short len; unsigned char arr[6]; } boncode;
     /* 본부코드 */
        /* varchar fincode       [5+1]; */ 
struct { unsigned short len; unsigned char arr[6]; } fincode;
     /* 재무부서 */
        /* varchar paydunm       [30+1]; */ 
struct { unsigned short len; unsigned char arr[31]; } paydunm;
    /* 직책명 */
        /* varchar realtrdate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } realtrdate;
     /* 전보일 */
        /* varchar offtrdate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } offtrdate;
     /* 조직전보일 */
        /* varchar payrayn       [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } payrayn;
     /* 보임여부 */
        /* varchar jobpayrayn    [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } jobpayrayn;
     /* 근무부서보임여부 */ //31.14  2001.08.30 shm 추가
        /* varchar cpayradate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } cpayradate;
     /* 보임일 */
        /* varchar jobdept       [5+1]; */ 
struct { unsigned short len; unsigned char arr[6]; } jobdept;
     /* 근무부서 */
        /* varchar jobplace      [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } jobplace;
     /* 근무지 */
        /* varchar orgempdate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } orgempdate;
     /* 입사일 */
        /* varchar empdate       [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } empdate;
     /* 최초입사일 */
        /* varchar cardate       [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } cardate;
     /* 경력일 */
        /* varchar juminid       [14+1]; */ 
struct { unsigned short len; unsigned char arr[15]; } juminid;
    /* 주민번호 */
        /* varchar cpaycldate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } cpaycldate;
     /* 승격일 */
        /* varchar paycldate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } paycldate;
     /* 직급일 */
        /* varchar reppaycl      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } reppaycl;
     /* 직무대리직급 */
        /* varchar reppayfrdate  [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } reppayfrdate;
     /*     "       기간 */
        /* varchar reppaytodate  [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } reppaytodate;
     /*     "            */
        /* varchar apdpaydunm    [30+1]; */ 
struct { unsigned short len; unsigned char arr[31]; } apdpaydunm;
    /* 겸직직책명 */
        /* varchar apdpayfrdate  [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } apdpayfrdate;
     /* 겸직일 From */
        /* varchar apdpaytodate  [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } apdpaytodate;
     /*    "   to */
        /* varchar actpaydunm    [30+1]; */ 
struct { unsigned short len; unsigned char arr[31]; } actpaydunm;
    /* 직무대행직책 */
        /* varchar actpayfrdate  [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } actpayfrdate;
     /*      "  일 from */
        /* varchar actpaytodate  [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } actpaytodate;
     /*      "     to */
        /* varchar lragrdate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lragrdate;
     /* 최종장기승호일 */
        /* varchar remark        [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } remark;
     /* 특기사항 */
        /* varchar empcode       [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } empcode;
     /* 입사구분 */
        /* varchar emppaycl      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } emppaycl;
     /* 입사BAND */
        int     emppaygr           ;     /* 입사호봉 - 일반직과 임원만 실제 사용. */
        /* varchar empjobline    [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } empjobline;
     /* 입사직렬 */
        /* varchar jobgun        [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } jobgun;
     /* 직군 */
        /* varchar jobgundate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } jobgundate;
     /* 직군일 */
        /* varchar jobline       [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } jobline;
     /* 직렬 */
        /* varchar joblinedate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } joblinedate;
     /* 직렬일 */
        /* varchar nogubun       [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } nogubun;
     /* 노조원구분 */
        /* varchar lancode       [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } lancode;
     /* 최종발령구분 */
        /* varchar lannono       [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lannono;
     /* 최종발령번호 */
        /* varchar lanfrdate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lanfrdate;
     /* 최종발령일 from */
        /* varchar lantodate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lantodate;
     /* 최종발령일 to */
        int     exdutcnt           ;     /* 총근속제외횟수 */
        int     exdutyy            ;     /* 총근속제외년수 */
        int     exdutmm            ;     /*      "    월수 */
        int     exdutdd            ;     /*      "    일수 */
        /* varchar lexfrdate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lexfrdate;
     /* 최종근속제외기간 from */
        /* varchar lextodate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lextodate;
     /*        "         to  */
        int     lexduyy            ;     /*        "         년수 */
        int     lexdumm            ;     /*        "         월수 */
        int     lexdudd            ;     /*        "         일수 */
        /* varchar lrkind        [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } lrkind;
     /* 휴직구분 */
        /* varchar lrfrdate      [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lrfrdate;
     /* 휴직기간 from */
        /* varchar lrtodate      [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lrtodate;
     /*    "     to */
        /* varchar lvfrdate      [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lvfrdate;
     /* 휴직중휴가기간 from */
        /* varchar lvtodate      [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lvtodate;
     /*    "           to */
        /* varchar lsekind       [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } lsekind;
     /* 파견구분 */
        /* varchar lsefrdate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lsefrdate;
     /* 파견기간 from */
        /* varchar lsetodate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } lsetodate;
     /* 파견기간 to */
        /* varchar lseplace      [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } lseplace;
    /* 파견기관 */
        /* varchar lsesayu       [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } lsesayu;
    /* 파견목적 */
        /* varchar lsecont       [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } lsecont;
    /* 연락처 */
        /* varchar hugubun       [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } hugubun;
     /* 휴가구분 */
        /* varchar hufrdate      [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } hufrdate;
     /* 휴가기간 from */
        /* varchar hutodate      [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } hutodate;
     /* 휴가기간 to */
        /* varchar retdate       [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } retdate;
     /* 퇴사일자 */
        /* varchar retgubun      [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } retgubun;
     /* 퇴사구분 */
        /* varchar retsayu1      [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } retsayu1;
     /* 퇴사사유-1 */
        /* varchar retsayu2      [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } retsayu2;
     /*     "   -2 */
        /* varchar retcont       [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } retcont;
    /* 연락처 */
        /* varchar otdufrdate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } otdufrdate;
     /* 재임(계약)기간 from */
        /* varchar otdutodate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } otdutodate;
     /*     "          to */
        /* varchar tcontr        [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } tcontr;
     /* 계약방법 */
        double  tcontramt          ;     /* 계약금액 */
        /* varchar ttype         [20+1]; */ 
struct { unsigned short len; unsigned char arr[21]; } ttype;
    /* 근무형태 */
        /* varchar tjobduty      [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } tjobduty;
    /* 담당직무 */
        /* varchar tcond         [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } tcond;
    /* 기타조건 */
        /* varchar tcompany      [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } tcompany;
     /* 파견업체코드 */
        /* varchar edugubun      [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } edugubun;
     /* 교육구분 */
        /* varchar eduplace      [30+1]; */ 
struct { unsigned short len; unsigned char arr[31]; } eduplace;
    /* 교육기관 */
        /* varchar educourse     [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } educourse;
    /* 교육과정 */
        /* varchar edufrdate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } edufrdate;
     /* 교육기간  From */
        /* varchar edutodate     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } edutodate;
     /*     "     to */
        /* varchar edudufrdate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } edudufrdate;
     /* 교육의무복무기간  From */
        /* varchar edudutodate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } edudutodate;
     /*     "             to */
        /* varchar eduarea       [10+1]; */ 
struct { unsigned short len; unsigned char arr[11]; } eduarea;
    /* 교육지역 */
        /* varchar educont       [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } educont;
    /* 연락처 */
    } ts_pimpmas;

    typedef struct HINSA_Qanno {
        /* varchar empno       [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } empno;

        /* varchar korname     [12+1]; */ 
struct { unsigned short len; unsigned char arr[13]; } korname;

        /* varchar annono      [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } annono;

        /* varchar anseqno     [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } anseqno;

        /* varchar anfrdate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } anfrdate;

        /* varchar antodate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } antodate;

        /* varchar ancode      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } ancode;

        /* varchar andetcode   [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } andetcode;

        /* varchar orgnum      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } orgnum;

        /* varchar deptcode    [6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } deptcode;

        /* varchar paycl       [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } paycl;

        /* varchar payra       [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } payra;

        int     paygr            ;
        /* varchar jobgun      [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } jobgun;

        /* varchar jobline     [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } jobline;

        /* varchar mark1       [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } mark1;

        /* varchar mark2       [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } mark2;

        /* varchar mark3       [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } mark3;

        /* varchar addeptcode  [6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } addeptcode;

        /* varchar adpayra     [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } adpayra;

        int     rpaygr           ;
        int     lpaygr           ;
        int     spaygr           ;
        /* varchar hofrdate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } hofrdate;

        /* varchar hotodate    [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } hotodate;

        /* varchar retsayu1    [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } retsayu1;

        /* varchar retsayu2    [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } retsayu2;

        /* varchar tcontr      [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } tcontr;

        double  tcontramt        ;
        /* varchar tjobduty    [40+1]; */ 
struct { unsigned short len; unsigned char arr[41]; } tjobduty;

        /* varchar tcompany    [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } tcompany;

        /* varchar ttype       [20+1]; */ 
struct { unsigned short len; unsigned char arr[21]; } ttype;

        /* varchar bannono     [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } bannono;

        /* varchar banfrdate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } banfrdate;

        /* varchar bantodate   [8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } bantodate;

        /* varchar bancode     [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } bancode;

        /* varchar bandetcode  [2+1]; */ 
struct { unsigned short len; unsigned char arr[3]; } bandetcode;

        /* varchar borgnum     [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } borgnum;

        /* varchar bdeptcode   [6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } bdeptcode;

        /* varchar bpaycl      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } bpaycl;

        int     bpaygr           ;
        /* varchar bpayra      [3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } bpayra;

        /* varchar anupdyn     [1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } anupdyn;

        /* varchar anresdate   [14+1]; */ 
struct { unsigned short len; unsigned char arr[15]; } anresdate;
        
        /* varchar oldempno    [4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } oldempno;

    } ts_Qanno;

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


char   jobTime[15+1];     /* log기록을 위한 작업시간 저장 */
char   jobProgram[15+1];  /* log기록을 위한 Program ID 저장 */
char   jobEmpno[4+1];     /* 작업자사번 */
char   jobAnnono[8+1];    /* 작업발령번호 */
char   curDate[8+1];      /* 작업일 */
char   agilecode1[1+1]; 
char   agilecode2[1+1];
    
/* 업적평가마스터 저장 Record */
static ts_pehremas G_res;
static ts_pehremas *GP_res;

/* 인사마스터 저장 Record */
static ts_pimpmas G_mas;
static ts_pimpmas *GP_mas;

/* 발령사항 CURSOR 저장 Record */
static ts_Qanno G_anno;
static ts_Qanno *GP_anno;

/* Error Message */
char logText[800+1];
int  logCount = 0;
char logSaveText[10][800+1];
int  logSavecount = 0;

int  ReadAnno = 0;              /* 읽은 건수 */
int  AccessAnno = 0;            /* 처리 건수 */
int  CancelAnno = 0;            /* 취소 건수 */
int  ErrorAnno = 0;             /* Error 건수 */

void init_variable(int);                                    /* 변수 초기화 */
void Proc_anno(int);                                        /* 발령사항 처리 */
int  AssignMaster(char *);                                  /* 인사마스터 조회 */
int  AssignPehremas(char *);                                /* 업적평가마스터 조회 */
void Payrayn_Check(void);                                   /* 보임여부 체크 */
char *Paydunm_Check(char *, char *, char *, char *, char *); /* 직책명 구하기 */
void Deptcode_Check(void);                                  /* 차수및 부서변경 처리 */
void QdeptDisp();                                           /* 부서코드의 정보를 찾아서 Record에 저장 */
void Payra_check(void);                                     /* 직무대리일 처리 */
char *DateCalc(int, char *, char *);                        /* 날짜 계산하는 공통 함수 */
void Ancode_Check(void);                                    /* 발령구분별 작업 처리 */
int  Exdu_Check(void);                                      /* 근속제외를 수정 */
void Pstate_Check(void);                                    /* 인사상태 */
int  Save_anno();                                           /* 인사발령화일을 저장 */
int  Copy_Empno();                                          /* 사번 변경 발령 건의 관련 자료 복사 */
int  Ins_Mempno();                                          /* 복수사번 관리 테이블에 저장 */
void Ins_Notice();                                          /* 발령내용을 MYHR공지사항 테이블에 등록 */
char *CalExduMinus(char *, char *, char *);                 /* 근속기간 빼기 루틴 */
char *PasString(char *, char, int);                         /* 구분자로 문자열 분리후 해당 순번의 문자열 반환 */
void logWrite(char *);                                      /* 프로그램 실행 로그 저장 */
void logSave(char *);                                       /* 안내성 실행 로그 저장 */

main(argc,argv)
int argc; 
char *argv[];
{ 
    int iJob = 0;
    
    // 프로그램 호출방법 정리
    // 1. Cron에서 호출, 예)pic1065g 1 
    // 2. Delphi에서 호출(for 작업일자로 작업), 예)pic1065g 2 20180101(작업일자) 1001(사번) pic1065g(프로그램id) 201801011230(로그시간)
    // 3. Delphi에서 호출(for 발령번호로 작업), 예)pic1065g 3 20190058(발령번호) 1001(사번) pic1065g(프로그램id) 201801011231(로그시간)  pic1065g 3 20190058 1001 pic1065g 201903130000
    iJob = atoi(argv[1]);  //호출 유형 구분
    
    if ((iJob < 1) || (iJob > 3))   //작업 구분이 1,2,3이 아닐 경우
    {
        printf("[pic1065g]인사발령사항 반영 프로그램 실행 조건이 틀림.\n");
        hinsa_log_print(0,"[pic1065g]인사발령사항 반영 프로그램 실행 조건이 틀림.");
        hinsa_exit(0,"=====[작업종료]====="); 
    }

    hinsa_db_connect();

    /* 인사업무 기본 설정 조회, 전역변수 초기화 */
    init_variable(0);
    
    /* 작업일자, 로그기록시간 저장 */
    /* EXEC SQL 
    SELECT TO_CHAR(SYSDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD') 
      INTO :curDate, :jobTime 
      FROM DUAL; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDD') ,TO_CHAR(SYSDATE,'YYY\
YMMDDHH24MISSD') into :b0,:b1  from DUAL ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )5;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)curDate;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)jobTime;
    sqlstm.sqhstl[1] = (unsigned long )16;
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


    
    switch (iJob) {
        case 1:
            strcpy(jobEmpno,   "CRON");
            strcpy(jobProgram, "pic1065g");
            
            /*===============================================================================
             HINT조직도 관리를 위한 PIMPMAS 백업 작업
             2018.12.27. insa2hint.pc에 있던 로직을 옮겨옴(종합인사 고도화시 pic1065g.pc에서 예약발령이 이루어지므로 예약발령 전 백업하기 위하여)
            ===============================================================================*/
            printf("[pic1065g] PIMPMAS_HINT 백업 시작......\n");
            /* EXEC SQL
            Delete From PIMPMAS_HINT 
             Where Workdate = :curDate; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 2;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "delete  from PIMPMAS_HINT  where Workdate=:b0";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )28;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)curDate;
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
                 STRINIT(&logText);
                 sprintf(logText, "pimpmas_hint Delete Error!! : %s", SQLERRM);
                 hinsa_log_print(0, logText);
            }                 
              
            /* EXEC SQL  
            INSERT INTO PIMPMAS_HINT
            SELECT :curDate, A.* FROM PIMPMAS A; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 2;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "insert into PIMPMAS_HINT  select :b0 ,A.*  from \
PIMPMAS A ";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )47;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)curDate;
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
            {    STRINIT(&logText);
                 sprintf(logText, "pimpmas_hint Insert Error!!~1 : %s", SQLERRM);
                 hinsa_log_print(0, logText);
            }  
            
            /* EXEC SQL  
            INSERT INTO PIMPMAS_HINT
	                (WORKDATE, EMPNO, KORNAME, ORGNUM, DEPTCODE, JUMINID, RETCONT, Offitel, EMPDATE, RETDATE, SKEMAIL, PAYRA)  
            SELECT :curDate, EMPNO, KNAME,   ORGNUM, DEPTCODE, JUMINID, HANDP,   OTEL,    EMPDATE, RETDATE, SKEMAIL, PAYRA
              FROM PZSUBMAS
             Where Empno in (select distinct empno from poskmail where empno like 'U%'); */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 2;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "insert into PIMPMAS_HINT (WORKDATE,EMPNO,KORNAME\
,ORGNUM,DEPTCODE,JUMINID,RETCONT,Offitel,EMPDATE,RETDATE,SKEMAIL,PAYRA)select\
 :b0 ,EMPNO ,KNAME ,ORGNUM ,DEPTCODE ,JUMINID ,HANDP ,OTEL ,EMPDATE ,RETDATE \
,SKEMAIL ,PAYRA  from PZSUBMAS where Empno in (select distinct empno  from po\
skmail where empno like 'U%')";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )66;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)curDate;
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
            {    STRINIT(&logText);
                 sprintf(logText, "pimpmas_hint Insert Error!!~2 : %s", SQLERRM);
                 hinsa_log_print(0, logText);
            } /*2018.12.27 End ********************************************************************************/

            break;
            
        case 2:
            strcpy(curDate,    argv[2]);
            strcpy(jobEmpno,   argv[3]);
            strcpy(jobProgram, argv[4]);
            strcpy(jobTime,    argv[5]);
            break;
            
        case 3:
            strcpy(jobAnnono,  argv[2]);
            strcpy(jobEmpno,   argv[3]);
            strcpy(jobProgram, argv[4]);
            strcpy(jobTime,    argv[5]);
            break;
    }

    STRINIT(&logText);
    sprintf(logText, "[요약]인사발령사항 반영 프로그램 시작...");
    logWrite(logText);

    STRINIT(&logText);
    sprintf(logText, "작업유형[%d] 작업일[%s] 발령번호[%s] 작업자[%s] ProgramID[%s] 로그생성시간[%s]", 
                     iJob, curDate, jobAnnono, jobEmpno, jobProgram, jobTime);
    logWrite(logText);
    printf("[pic1065g] %s\n",logText);

    Proc_anno(iJob);    //발령사항 반영

    logWrite("[요약]인사발령사항 반영 프로그램 종료..");
    
    hinsa_exit(0,"=====[작업종료]====="); 
}

/* 인사업무 기본설정 조회, 전역변수 초기화 */
void init_variable(int iKind)
{ 
    /* 업적평가마스터 Record 초기화 */
    memset(&G_res,0x00,sizeof(G_res));
    GP_res = &G_res;
    /* 인사마스터 Record 초기화 */
    memset(&G_mas,0x00,sizeof(G_mas));
    GP_mas = &G_mas;
    /* 발령사항 CURSOR Record 초기화 */
    memset(&G_anno,0x00,sizeof(G_anno));
    GP_anno = &G_anno;

    if (iKind == 1) return;

    STRINIT(&jobProgram);    /* 작업 Program ID */
    STRINIT(&jobTime);       /* 작업시간 */
    STRINIT(&jobEmpno);      /* 작업자사번 */
    STRINIT(&jobAnnono);     /* 작업발령번호 */
    STRINIT(&curDate);       /* 작업일From */
    STRINIT(&agilecode1);
    STRINIT(&agilecode2);
    
    /* 인사업무 기본 설정 값 저장용 변수 */
    STRINIT(&hisfryymm);     /* 인사 이력보관 시작월 */
    STRINIT(&histoyymm);     /* 인사 이력보관 최종월 */
    STRINIT(&edupstateyn);   /* 파견교육현원포함여부 */
    STRINIT(&jupstateyn);    /* 정직자현원포함여부 */
    STRINIT(&hupstateyn);    /* 휴직자현원포함여부 */
    STRINIT(&Edeptcode);     /* 파견/교육 별도부서 */
    STRINIT(&Erabasdate);    /* 업적평가 기준일 */
    STRINIT(&Eanupdyn);      /* 인사발령 경신 여부 */
    STRINIT(&Eempno);        /* 평가 담당자 */
    STRINIT(&exjob1);        /* 업적평가 제외 직군1 */
    STRINIT(&exjob2);        /* 업적평가 제외 직군2 */
    STRINIT(&exjob3);        /* 업적평가 제외 직군3 */
    STRINIT(&exjob4);        /* 업적평가 제외 직군4 */
    STRINIT(&exjob5);        /* 업적평가 제외 직군5 */
    STRINIT(&oldAnnono);     /* 발령번호 변경 체크 위한 저장 */
    STRINIT(&oldorgnum);     /* 직위체계변경일 */
    STRINIT(&payrachdate);   /* 직위체계변경일 */

    /* 1.1 발령경신최종발령일(value1), 발령경신최종작업일(value2) 조회
    : SQL - select value1,value2 from pimvari where gubun = '30' and sgubun = '0002' , 결과:20180619, 20180619
    : 화면의 "발령반영 최종발령일"에 날짜 표시 */
    /* 프로그램에서 사용되지 않으므로 미적용 */
    
    /*1.2 인사 이력보관 시작월(value1), 인사 이력보관 최종월(value2) 조회 : 전월발령사항은 전월통계자료에 반영하도록 인사이력에 보관
    : SQL - select value1, value2 from pimvari where gubun = '50' and sgubun = '0004', 결과:200103, 201805
    : hisfryymm, histoyymm 저장 */
    /* EXEC SQL SELECT VALUE1, VALUE2 INTO :hisfryymm, :histoyymm FROM PIMVARI WHERE GUBUN = '50' AND SGUBUN = '0004'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 2;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select VALUE1 ,VALUE2 into :b0,:b1  from PIMVARI where (\
GUBUN='50' and SGUBUN='0004')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )85;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&hisfryymm;
    sqlstm.sqhstl[0] = (unsigned long )9;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&histoyymm;
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


    
    /*1.3 파견교육현원포함여부(value2), 정직자현원포함여부(value3), 휴직자현원포함여부(value4) 조회
    : SQL - select value2,value3,value4 from pimvari where gubun = '50' and sgubun = '0003', 결과:Y,Y,Y
    : edupstateyn, jupstateyn, hupstateyn 저장*/
    /* EXEC SQL SELECT VALUE2,VALUE3,VALUE4 INTO :edupstateyn, :jupstateyn, :hupstateyn FROM PIMVARI WHERE GUBUN = '50' AND SGUBUN = '0003'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 3;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select VALUE2 ,VALUE3 ,VALUE4 into :b0,:b1,:b2  from PIM\
VARI where (GUBUN='50' and SGUBUN='0003')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )108;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&edupstateyn;
    sqlstm.sqhstl[0] = (unsigned long )4;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&jupstateyn;
    sqlstm.sqhstl[1] = (unsigned long )4;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&hupstateyn;
    sqlstm.sqhstl[2] = (unsigned long )4;
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


    
    /*1.4 대외파견자의 부서를 파견/교육 별도부서로 지정하기 위해 조회
    : SQL - SELECT VALUE1 FROM PIMVARI WHERE GUBUN = '50' AND SGUBUN = '1001', 결과:CG200
    : Edeptcode 저장*/
    /* EXEC SQL SELECT VALUE1 INTO :Edeptcode FROM PIMVARI WHERE GUBUN = '50' AND SGUBUN = '1001'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 3;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select VALUE1 into :b0  from PIMVARI where (GUBUN='50' a\
nd SGUBUN='1001')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )135;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&Edeptcode;
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


    
    /*1.5 업적평가 기준일 조회
    : SQL - SELECT SGUBUN,VALUE1 FROM PEHREBAS WHERE RABASDATE = '00000000' AND GUBUN = '00' AND SGUBUN = '0001', 결과:0001,20181130
    : Erabasdate(value1) 저장*/
    /* EXEC SQL SELECT VALUE1 INTO :Erabasdate FROM PEHREBAS WHERE RABASDATE = '00000000' AND GUBUN = '00' AND SGUBUN = '0001'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 3;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select VALUE1 into :b0  from PEHREBAS where ((RABASDATE=\
'00000000' and GUBUN='00') and SGUBUN='0001')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )154;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&Erabasdate;
    sqlstm.sqhstl[0] = (unsigned long )11;
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


    
    /*1.6 , 인사발령경신여부 조회
    : SQL - SELECT SGUBUN, NVL(VALUE1,'N') VALUE1 FROM PEHREBAS WHERE RABASDATE = '00000000' AND GUBUN = '00' AND SGUBUN = '0002', 결과:0002, N
    : Eanupdyn(value1) 저장*/
    /* EXEC SQL SELECT NVL(VALUE1,'N') VALUE1 INTO :Eanupdyn FROM PEHREBAS WHERE RABASDATE = '00000000' AND GUBUN = '00' AND SGUBUN = '0002'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 3;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select NVL(VALUE1,'N') VALUE1 into :b0  from PEHREBAS wh\
ere ((RABASDATE='00000000' and GUBUN='00') and SGUBUN='0002')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )173;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&Eanupdyn;
    sqlstm.sqhstl[0] = (unsigned long )4;
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


    
    /*1.7 대외파견자의 평가자를 임시로 인사팀담당자로 함 조회
    : SQL - SELECT VALUE3 FROM PEHREBAS WHERE RABASDATE = '$ERABASDATE' AND GUBUN = '11' AND SGUBUN = '0005' , 결과:2325
    : Eempno(value3) 저장*/
    /* EXEC SQL SELECT VALUE3 INTO :Eempno FROM PEHREBAS WHERE RABASDATE = :Erabasdate AND GUBUN = '11' AND SGUBUN = '0005' ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 3;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select VALUE3 into :b0  from PEHREBAS where ((RABASDATE=\
:b1 and GUBUN='11') and SGUBUN='0005')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )192;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&Eempno;
    sqlstm.sqhstl[0] = (unsigned long )7;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&Erabasdate;
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


    
    /*1.8 업적평가 제외 직군 조회
    : SQL - SELECT NVL(VALUE1,'ZZ') VALUE1,NVL(VALUE2,'ZZ') VALUE2,NVL(VALUE3,'ZZ') VALUE3,NVL(VALUE4,'ZZ') VALUE4, NVL(VALUE5,'ZZ') VALUE5
              FROM PEHREBAS WHERE RABASDATE = '$ERABASDATE' AND GUBUN = '11' AND SGUBUN = '0004', 결과:00,50,80,90,H1
    : exjob1(value1), exjob2(value2), exjob3(value3), exjob4(value4), exjob5(value5) 저장*/
    /* EXEC SQL SELECT NVL(VALUE1,'ZZ') VALUE1,NVL(VALUE2,'ZZ') VALUE2,NVL(VALUE3,'ZZ') VALUE3,NVL(VALUE4,'ZZ') VALUE4, NVL(VALUE5,'ZZ') VALUE5
               INTO :exjob1, :exjob2, :exjob3, :exjob4, :exjob5
               FROM PEHREBAS 
              WHERE RABASDATE = :Erabasdate AND GUBUN = '11' AND SGUBUN = '0004'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 6;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select NVL(VALUE1,'ZZ') VALUE1 ,NVL(VALUE2,'ZZ') VALUE2 \
,NVL(VALUE3,'ZZ') VALUE3 ,NVL(VALUE4,'ZZ') VALUE4 ,NVL(VALUE5,'ZZ') VALUE5 in\
to :b0,:b1,:b2,:b3,:b4  from PEHREBAS where ((RABASDATE=:b5 and GUBUN='11') a\
nd SGUBUN='0004')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )215;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&exjob1;
    sqlstm.sqhstl[0] = (unsigned long )5;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&exjob2;
    sqlstm.sqhstl[1] = (unsigned long )5;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&exjob3;
    sqlstm.sqhstl[2] = (unsigned long )5;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&exjob4;
    sqlstm.sqhstl[3] = (unsigned long )5;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&exjob5;
    sqlstm.sqhstl[4] = (unsigned long )5;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&Erabasdate;
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



    /*1.9 조직차수, 직위체계변경일조회
    : SQL - SELECT VALUE1, VALUE3 FROM PIMVARI WHERE GUBUN = '00' AND SGUBUN = '0001', 결과:H22, 20090213
    : payrachdate(value3) 저장 */
    /* EXEC SQL SELECT VALUE1, VALUE3 INTO :oldorgnum, :payrachdate FROM PIMVARI WHERE GUBUN = '00' AND SGUBUN = '0001' ; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 6;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select VALUE1 ,VALUE3 into :b0,:b1  from PIMVARI where (\
GUBUN='00' and SGUBUN='0001')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )254;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&oldorgnum;
    sqlstm.sqhstl[0] = (unsigned long )6;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&payrachdate;
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



}

/* 발령사항 처리 */
void Proc_anno(int iKind)
{
    int  i = 0;
    char strSql[4096];
    char strEmpno[4+1];
    
    STRINIT(&strSql);
    if ((iKind == 1) || (iKind == 2)) /* CRON, DELPHI(for 작업일자) */
    {
        /* 발령시작일자 또는 발령근거 예약일자가 작업요청 일자인 인사발령사항 조회 */
        sprintf(strSql,"SELECT EMPNO,KORNAME,ANNONO,ANSEQNO,ANFRDATE,ANTODATE,                        \n"
                       "       ANCODE,ANDETCODE,ORGNUM,DEPTCODE,PAYCL,PAYRA,                          \n"
                       "       PAYGR,JOBGUN,JOBLINE,MARK1,MARK2,MARK3,ADDEPTCODE,                     \n"
                       "       ADPAYRA,RPAYGR,LPAYGR,SPAYGR,HOFRDATE,HOTODATE,                        \n"
                       "       RETSAYU1,RETSAYU2,TCONTR,TCONTRAMT,TJOBDUTY,TCOMPANY,                  \n"
                       "       TTYPE,BANNONO,BANFRDATE,BANTODATE,BANCODE,BANDETCODE,                  \n"
                       "       BORGNUM,BDEPTCODE,BPAYCL,BPAYGR,BPAYRA,ANUPDYN,ANRESDATE,OLDEMPNO      \n"
                       "  FROM (                                                                      \n"
                       "     SELECT A.EMPNO,A.KORNAME,A.ANNONO,A.ANSEQNO,A.ANFRDATE,A.ANTODATE,       \n"
                       "            A.ANCODE,A.ANDETCODE,A.ORGNUM,A.DEPTCODE,A.PAYCL,A.PAYRA,         \n"
                       "            A.PAYGR,A.JOBGUN,A.JOBLINE,A.MARK1,A.MARK2,A.MARK3,A.ADDEPTCODE,  \n"
                       "            A.ADPAYRA,A.RPAYGR,A.LPAYGR,A.SPAYGR,A.HOFRDATE,A.HOTODATE,       \n"
                       "            A.RETSAYU1,A.RETSAYU2,A.TCONTR,A.TCONTRAMT,A.TJOBDUTY,A.TCOMPANY, \n"
                       "            A.TTYPE,A.BANNONO,A.BANFRDATE,A.BANTODATE,A.BANCODE,A.BANDETCODE, \n"
                       "            A.BORGNUM,A.BDEPTCODE,A.BPAYCL,A.BPAYGR,A.BPAYRA,A.ANUPDYN,       \n"
                       "            B.ANRESDATE, A.OLDEMPNO                                           \n"
                       "       FROM PIHANNO A,PIHANBA B                                               \n"
                       "      WHERE A.ANNONO = B.ANNONO                                               \n"
                       "        AND A.ANFRDATE = '%s'                                                 \n"
                       "        AND A.ANUPDYN = 'N'                                                   \n"
                       "        AND B.ANRESDATE IS NULL                                               \n"
                       "        AND B.ANUPDATEYN = 'Y'                                                \n"
                       "     UNION ALL                                                                \n"
                       "     SELECT /*+ INDEX( A I1_PIHANNO ) */                                      \n"
                       "            A.EMPNO,A.KORNAME,A.ANNONO,A.ANSEQNO,A.ANFRDATE,A.ANTODATE,       \n"
                       "            A.ANCODE,A.ANDETCODE,A.ORGNUM,A.DEPTCODE,A.PAYCL,A.PAYRA,         \n"
                       "            A.PAYGR,A.JOBGUN,A.JOBLINE,A.MARK1,A.MARK2,A.MARK3,A.ADDEPTCODE,  \n"
                       "            A.ADPAYRA,A.RPAYGR,A.LPAYGR,A.SPAYGR,A.HOFRDATE,A.HOTODATE,       \n"
                       "            A.RETSAYU1,A.RETSAYU2,A.TCONTR,A.TCONTRAMT,A.TJOBDUTY,A.TCOMPANY, \n"
                       "            A.TTYPE,A.BANNONO,A.BANFRDATE,A.BANTODATE,A.BANCODE,A.BANDETCODE, \n"
                       "            A.BORGNUM,A.BDEPTCODE,A.BPAYCL,A.BPAYGR,A.BPAYRA,A.ANUPDYN,       \n"
                       "            B.ANRESDATE, A.OLDEMPNO                                           \n"
                       "       FROM PIHANNO A,PIHANBA B                                               \n"
                       "      WHERE A.ANNONO = B.ANNONO                                               \n"
                       "        AND A.ANUPDYN = 'N'                                                   \n"
                       "        AND B.ANRESDATE = '%s'                                                \n"
                       "        AND B.ANUPDATEYN = 'Y'                                                \n"
                       " ) M                                                                          \n"
                       " ORDER BY ANNONO,ANFRDATE,ANSEQNO", curDate, curDate);

    }
    else    /* DELPHI(for 발령번호) */
    {
        /* 작업요청 발령번호에 해당하는 발령사항 조회 */
        sprintf(strSql,"SELECT A.EMPNO,A.KORNAME,A.ANNONO,A.ANSEQNO,A.ANFRDATE,A.ANTODATE,       \n"
                       "       A.ANCODE,A.ANDETCODE,A.ORGNUM,A.DEPTCODE,A.PAYCL,A.PAYRA,         \n"
                       "       A.PAYGR,A.JOBGUN,A.JOBLINE,A.MARK1,A.MARK2,A.MARK3,A.ADDEPTCODE,  \n"
                       "       A.ADPAYRA,A.RPAYGR,A.LPAYGR,A.SPAYGR,A.HOFRDATE,A.HOTODATE,       \n"
                       "       A.RETSAYU1,A.RETSAYU2,A.TCONTR,A.TCONTRAMT,A.TJOBDUTY,A.TCOMPANY, \n"
                       "       A.TTYPE,A.BANNONO,A.BANFRDATE,A.BANTODATE,A.BANCODE,A.BANDETCODE, \n"
                       "       A.BORGNUM,A.BDEPTCODE,A.BPAYCL,A.BPAYGR,A.BPAYRA,A.ANUPDYN,       \n"
                       "       B.ANRESDATE, A.OLDEMPNO                                           \n"
                       "  FROM PIHANNO A,PIHANBA B                                               \n"
                       " WHERE A.ANNONO = B.ANNONO                                               \n"
                       "   AND A.ANNONO = '%s'                                                   \n"
                       "   AND A.ANUPDYN = 'N'                                                   \n"
                       "   AND B.ANUPDATEYN = 'Y'                                                \n"
                       " ORDER BY A.ANNONO,A.ANFRDATE,A.ANSEQNO", jobAnnono);
    }            
if (DEBUG) printf("SQL => [%s][%d]\n", strSql, strlen(strSql));

    /* EXEC SQL PREPARE S FROM :strSql; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 6;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )277;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strSql;
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


    /* EXEC SQL DECLARE cur_anno CURSOR FOR S; */ 

    /* EXEC SQL OPEN cur_anno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 6;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )296;
    sqlstm.selerr = (unsigned short)1;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqcmod = (unsigned int )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    
    if(SQLCODE != SQL_OK)
    {
        /* EXEC SQL CLOSE cur_anno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 6;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )311;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        STRINIT(&logText);
        sprintf(logText, "Cursor Open Fail : %s", SQLERRM);
        logWrite(logText);
        return;
    }
if (DEBUG) printf("test1\n");

    while(TRUE)
    {
        init_variable(1);   // 1.인사마스터 임시변수를 Clear 한다..

        /* EXEC SQL FETCH cur_anno INTO
                :GP_anno->empno,:GP_anno->korname,:GP_anno->annono,:GP_anno->anseqno,:GP_anno->anfrdate,
                :GP_anno->antodate,:GP_anno->ancode,:GP_anno->andetcode,:GP_anno->orgnum,:GP_anno->deptcode,
                :GP_anno->paycl,:GP_anno->payra,:GP_anno->paygr,:GP_anno->jobgun,:GP_anno->jobline,
                :GP_anno->mark1,:GP_anno->mark2,:GP_anno->mark3,:GP_anno->addeptcode,:GP_anno->adpayra,
                :GP_anno->rpaygr,:GP_anno->lpaygr,:GP_anno->spaygr,:GP_anno->hofrdate,:GP_anno->hotodate,
                :GP_anno->retsayu1,:GP_anno->retsayu2,:GP_anno->tcontr,:GP_anno->tcontramt,:GP_anno->tjobduty,
                :GP_anno->tcompany,:GP_anno->ttype,:GP_anno->bannono,:GP_anno->banfrdate,:GP_anno->bantodate,
                :GP_anno->bancode,:GP_anno->bandetcode,:GP_anno->borgnum,:GP_anno->bdeptcode,:GP_anno->bpaycl,
                :GP_anno->bpaygr,:GP_anno->bpayra,:GP_anno->anupdyn,:GP_anno->anresdate,:GP_anno->oldempno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 45;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )326;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqfoff = (         int )0;
        sqlstm.sqfmod = (unsigned int )2;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->empno);
        sqlstm.sqhstl[0] = (unsigned long )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->korname);
        sqlstm.sqhstl[1] = (unsigned long )15;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->annono);
        sqlstm.sqhstl[2] = (unsigned long )11;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&(GP_anno->anseqno);
        sqlstm.sqhstl[3] = (unsigned long )7;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         short *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned long )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (unsigned char  *)&(GP_anno->anfrdate);
        sqlstm.sqhstl[4] = (unsigned long )11;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         short *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned long )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->antodate);
        sqlstm.sqhstl[5] = (unsigned long )11;
        sqlstm.sqhsts[5] = (         int  )0;
        sqlstm.sqindv[5] = (         short *)0;
        sqlstm.sqinds[5] = (         int  )0;
        sqlstm.sqharm[5] = (unsigned long )0;
        sqlstm.sqadto[5] = (unsigned short )0;
        sqlstm.sqtdso[5] = (unsigned short )0;
        sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->ancode);
        sqlstm.sqhstl[6] = (unsigned long )6;
        sqlstm.sqhsts[6] = (         int  )0;
        sqlstm.sqindv[6] = (         short *)0;
        sqlstm.sqinds[6] = (         int  )0;
        sqlstm.sqharm[6] = (unsigned long )0;
        sqlstm.sqadto[6] = (unsigned short )0;
        sqlstm.sqtdso[6] = (unsigned short )0;
        sqlstm.sqhstv[7] = (unsigned char  *)&(GP_anno->andetcode);
        sqlstm.sqhstl[7] = (unsigned long )5;
        sqlstm.sqhsts[7] = (         int  )0;
        sqlstm.sqindv[7] = (         short *)0;
        sqlstm.sqinds[7] = (         int  )0;
        sqlstm.sqharm[7] = (unsigned long )0;
        sqlstm.sqadto[7] = (unsigned short )0;
        sqlstm.sqtdso[7] = (unsigned short )0;
        sqlstm.sqhstv[8] = (unsigned char  *)&(GP_anno->orgnum);
        sqlstm.sqhstl[8] = (unsigned long )6;
        sqlstm.sqhsts[8] = (         int  )0;
        sqlstm.sqindv[8] = (         short *)0;
        sqlstm.sqinds[8] = (         int  )0;
        sqlstm.sqharm[8] = (unsigned long )0;
        sqlstm.sqadto[8] = (unsigned short )0;
        sqlstm.sqtdso[8] = (unsigned short )0;
        sqlstm.sqhstv[9] = (unsigned char  *)&(GP_anno->deptcode);
        sqlstm.sqhstl[9] = (unsigned long )9;
        sqlstm.sqhsts[9] = (         int  )0;
        sqlstm.sqindv[9] = (         short *)0;
        sqlstm.sqinds[9] = (         int  )0;
        sqlstm.sqharm[9] = (unsigned long )0;
        sqlstm.sqadto[9] = (unsigned short )0;
        sqlstm.sqtdso[9] = (unsigned short )0;
        sqlstm.sqhstv[10] = (unsigned char  *)&(GP_anno->paycl);
        sqlstm.sqhstl[10] = (unsigned long )6;
        sqlstm.sqhsts[10] = (         int  )0;
        sqlstm.sqindv[10] = (         short *)0;
        sqlstm.sqinds[10] = (         int  )0;
        sqlstm.sqharm[10] = (unsigned long )0;
        sqlstm.sqadto[10] = (unsigned short )0;
        sqlstm.sqtdso[10] = (unsigned short )0;
        sqlstm.sqhstv[11] = (unsigned char  *)&(GP_anno->payra);
        sqlstm.sqhstl[11] = (unsigned long )6;
        sqlstm.sqhsts[11] = (         int  )0;
        sqlstm.sqindv[11] = (         short *)0;
        sqlstm.sqinds[11] = (         int  )0;
        sqlstm.sqharm[11] = (unsigned long )0;
        sqlstm.sqadto[11] = (unsigned short )0;
        sqlstm.sqtdso[11] = (unsigned short )0;
        sqlstm.sqhstv[12] = (unsigned char  *)&(GP_anno->paygr);
        sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[12] = (         int  )0;
        sqlstm.sqindv[12] = (         short *)0;
        sqlstm.sqinds[12] = (         int  )0;
        sqlstm.sqharm[12] = (unsigned long )0;
        sqlstm.sqadto[12] = (unsigned short )0;
        sqlstm.sqtdso[12] = (unsigned short )0;
        sqlstm.sqhstv[13] = (unsigned char  *)&(GP_anno->jobgun);
        sqlstm.sqhstl[13] = (unsigned long )5;
        sqlstm.sqhsts[13] = (         int  )0;
        sqlstm.sqindv[13] = (         short *)0;
        sqlstm.sqinds[13] = (         int  )0;
        sqlstm.sqharm[13] = (unsigned long )0;
        sqlstm.sqadto[13] = (unsigned short )0;
        sqlstm.sqtdso[13] = (unsigned short )0;
        sqlstm.sqhstv[14] = (unsigned char  *)&(GP_anno->jobline);
        sqlstm.sqhstl[14] = (unsigned long )5;
        sqlstm.sqhsts[14] = (         int  )0;
        sqlstm.sqindv[14] = (         short *)0;
        sqlstm.sqinds[14] = (         int  )0;
        sqlstm.sqharm[14] = (unsigned long )0;
        sqlstm.sqadto[14] = (unsigned short )0;
        sqlstm.sqtdso[14] = (unsigned short )0;
        sqlstm.sqhstv[15] = (unsigned char  *)&(GP_anno->mark1);
        sqlstm.sqhstl[15] = (unsigned long )43;
        sqlstm.sqhsts[15] = (         int  )0;
        sqlstm.sqindv[15] = (         short *)0;
        sqlstm.sqinds[15] = (         int  )0;
        sqlstm.sqharm[15] = (unsigned long )0;
        sqlstm.sqadto[15] = (unsigned short )0;
        sqlstm.sqtdso[15] = (unsigned short )0;
        sqlstm.sqhstv[16] = (unsigned char  *)&(GP_anno->mark2);
        sqlstm.sqhstl[16] = (unsigned long )43;
        sqlstm.sqhsts[16] = (         int  )0;
        sqlstm.sqindv[16] = (         short *)0;
        sqlstm.sqinds[16] = (         int  )0;
        sqlstm.sqharm[16] = (unsigned long )0;
        sqlstm.sqadto[16] = (unsigned short )0;
        sqlstm.sqtdso[16] = (unsigned short )0;
        sqlstm.sqhstv[17] = (unsigned char  *)&(GP_anno->mark3);
        sqlstm.sqhstl[17] = (unsigned long )43;
        sqlstm.sqhsts[17] = (         int  )0;
        sqlstm.sqindv[17] = (         short *)0;
        sqlstm.sqinds[17] = (         int  )0;
        sqlstm.sqharm[17] = (unsigned long )0;
        sqlstm.sqadto[17] = (unsigned short )0;
        sqlstm.sqtdso[17] = (unsigned short )0;
        sqlstm.sqhstv[18] = (unsigned char  *)&(GP_anno->addeptcode);
        sqlstm.sqhstl[18] = (unsigned long )9;
        sqlstm.sqhsts[18] = (         int  )0;
        sqlstm.sqindv[18] = (         short *)0;
        sqlstm.sqinds[18] = (         int  )0;
        sqlstm.sqharm[18] = (unsigned long )0;
        sqlstm.sqadto[18] = (unsigned short )0;
        sqlstm.sqtdso[18] = (unsigned short )0;
        sqlstm.sqhstv[19] = (unsigned char  *)&(GP_anno->adpayra);
        sqlstm.sqhstl[19] = (unsigned long )6;
        sqlstm.sqhsts[19] = (         int  )0;
        sqlstm.sqindv[19] = (         short *)0;
        sqlstm.sqinds[19] = (         int  )0;
        sqlstm.sqharm[19] = (unsigned long )0;
        sqlstm.sqadto[19] = (unsigned short )0;
        sqlstm.sqtdso[19] = (unsigned short )0;
        sqlstm.sqhstv[20] = (unsigned char  *)&(GP_anno->rpaygr);
        sqlstm.sqhstl[20] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[20] = (         int  )0;
        sqlstm.sqindv[20] = (         short *)0;
        sqlstm.sqinds[20] = (         int  )0;
        sqlstm.sqharm[20] = (unsigned long )0;
        sqlstm.sqadto[20] = (unsigned short )0;
        sqlstm.sqtdso[20] = (unsigned short )0;
        sqlstm.sqhstv[21] = (unsigned char  *)&(GP_anno->lpaygr);
        sqlstm.sqhstl[21] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[21] = (         int  )0;
        sqlstm.sqindv[21] = (         short *)0;
        sqlstm.sqinds[21] = (         int  )0;
        sqlstm.sqharm[21] = (unsigned long )0;
        sqlstm.sqadto[21] = (unsigned short )0;
        sqlstm.sqtdso[21] = (unsigned short )0;
        sqlstm.sqhstv[22] = (unsigned char  *)&(GP_anno->spaygr);
        sqlstm.sqhstl[22] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[22] = (         int  )0;
        sqlstm.sqindv[22] = (         short *)0;
        sqlstm.sqinds[22] = (         int  )0;
        sqlstm.sqharm[22] = (unsigned long )0;
        sqlstm.sqadto[22] = (unsigned short )0;
        sqlstm.sqtdso[22] = (unsigned short )0;
        sqlstm.sqhstv[23] = (unsigned char  *)&(GP_anno->hofrdate);
        sqlstm.sqhstl[23] = (unsigned long )11;
        sqlstm.sqhsts[23] = (         int  )0;
        sqlstm.sqindv[23] = (         short *)0;
        sqlstm.sqinds[23] = (         int  )0;
        sqlstm.sqharm[23] = (unsigned long )0;
        sqlstm.sqadto[23] = (unsigned short )0;
        sqlstm.sqtdso[23] = (unsigned short )0;
        sqlstm.sqhstv[24] = (unsigned char  *)&(GP_anno->hotodate);
        sqlstm.sqhstl[24] = (unsigned long )11;
        sqlstm.sqhsts[24] = (         int  )0;
        sqlstm.sqindv[24] = (         short *)0;
        sqlstm.sqinds[24] = (         int  )0;
        sqlstm.sqharm[24] = (unsigned long )0;
        sqlstm.sqadto[24] = (unsigned short )0;
        sqlstm.sqtdso[24] = (unsigned short )0;
        sqlstm.sqhstv[25] = (unsigned char  *)&(GP_anno->retsayu1);
        sqlstm.sqhstl[25] = (unsigned long )5;
        sqlstm.sqhsts[25] = (         int  )0;
        sqlstm.sqindv[25] = (         short *)0;
        sqlstm.sqinds[25] = (         int  )0;
        sqlstm.sqharm[25] = (unsigned long )0;
        sqlstm.sqadto[25] = (unsigned short )0;
        sqlstm.sqtdso[25] = (unsigned short )0;
        sqlstm.sqhstv[26] = (unsigned char  *)&(GP_anno->retsayu2);
        sqlstm.sqhstl[26] = (unsigned long )5;
        sqlstm.sqhsts[26] = (         int  )0;
        sqlstm.sqindv[26] = (         short *)0;
        sqlstm.sqinds[26] = (         int  )0;
        sqlstm.sqharm[26] = (unsigned long )0;
        sqlstm.sqadto[26] = (unsigned short )0;
        sqlstm.sqtdso[26] = (unsigned short )0;
        sqlstm.sqhstv[27] = (unsigned char  *)&(GP_anno->tcontr);
        sqlstm.sqhstl[27] = (unsigned long )4;
        sqlstm.sqhsts[27] = (         int  )0;
        sqlstm.sqindv[27] = (         short *)0;
        sqlstm.sqinds[27] = (         int  )0;
        sqlstm.sqharm[27] = (unsigned long )0;
        sqlstm.sqadto[27] = (unsigned short )0;
        sqlstm.sqtdso[27] = (unsigned short )0;
        sqlstm.sqhstv[28] = (unsigned char  *)&(GP_anno->tcontramt);
        sqlstm.sqhstl[28] = (unsigned long )sizeof(double);
        sqlstm.sqhsts[28] = (         int  )0;
        sqlstm.sqindv[28] = (         short *)0;
        sqlstm.sqinds[28] = (         int  )0;
        sqlstm.sqharm[28] = (unsigned long )0;
        sqlstm.sqadto[28] = (unsigned short )0;
        sqlstm.sqtdso[28] = (unsigned short )0;
        sqlstm.sqhstv[29] = (unsigned char  *)&(GP_anno->tjobduty);
        sqlstm.sqhstl[29] = (unsigned long )43;
        sqlstm.sqhsts[29] = (         int  )0;
        sqlstm.sqindv[29] = (         short *)0;
        sqlstm.sqinds[29] = (         int  )0;
        sqlstm.sqharm[29] = (unsigned long )0;
        sqlstm.sqadto[29] = (unsigned short )0;
        sqlstm.sqtdso[29] = (unsigned short )0;
        sqlstm.sqhstv[30] = (unsigned char  *)&(GP_anno->tcompany);
        sqlstm.sqhstl[30] = (unsigned long )5;
        sqlstm.sqhsts[30] = (         int  )0;
        sqlstm.sqindv[30] = (         short *)0;
        sqlstm.sqinds[30] = (         int  )0;
        sqlstm.sqharm[30] = (unsigned long )0;
        sqlstm.sqadto[30] = (unsigned short )0;
        sqlstm.sqtdso[30] = (unsigned short )0;
        sqlstm.sqhstv[31] = (unsigned char  *)&(GP_anno->ttype);
        sqlstm.sqhstl[31] = (unsigned long )23;
        sqlstm.sqhsts[31] = (         int  )0;
        sqlstm.sqindv[31] = (         short *)0;
        sqlstm.sqinds[31] = (         int  )0;
        sqlstm.sqharm[31] = (unsigned long )0;
        sqlstm.sqadto[31] = (unsigned short )0;
        sqlstm.sqtdso[31] = (unsigned short )0;
        sqlstm.sqhstv[32] = (unsigned char  *)&(GP_anno->bannono);
        sqlstm.sqhstl[32] = (unsigned long )11;
        sqlstm.sqhsts[32] = (         int  )0;
        sqlstm.sqindv[32] = (         short *)0;
        sqlstm.sqinds[32] = (         int  )0;
        sqlstm.sqharm[32] = (unsigned long )0;
        sqlstm.sqadto[32] = (unsigned short )0;
        sqlstm.sqtdso[32] = (unsigned short )0;
        sqlstm.sqhstv[33] = (unsigned char  *)&(GP_anno->banfrdate);
        sqlstm.sqhstl[33] = (unsigned long )11;
        sqlstm.sqhsts[33] = (         int  )0;
        sqlstm.sqindv[33] = (         short *)0;
        sqlstm.sqinds[33] = (         int  )0;
        sqlstm.sqharm[33] = (unsigned long )0;
        sqlstm.sqadto[33] = (unsigned short )0;
        sqlstm.sqtdso[33] = (unsigned short )0;
        sqlstm.sqhstv[34] = (unsigned char  *)&(GP_anno->bantodate);
        sqlstm.sqhstl[34] = (unsigned long )11;
        sqlstm.sqhsts[34] = (         int  )0;
        sqlstm.sqindv[34] = (         short *)0;
        sqlstm.sqinds[34] = (         int  )0;
        sqlstm.sqharm[34] = (unsigned long )0;
        sqlstm.sqadto[34] = (unsigned short )0;
        sqlstm.sqtdso[34] = (unsigned short )0;
        sqlstm.sqhstv[35] = (unsigned char  *)&(GP_anno->bancode);
        sqlstm.sqhstl[35] = (unsigned long )6;
        sqlstm.sqhsts[35] = (         int  )0;
        sqlstm.sqindv[35] = (         short *)0;
        sqlstm.sqinds[35] = (         int  )0;
        sqlstm.sqharm[35] = (unsigned long )0;
        sqlstm.sqadto[35] = (unsigned short )0;
        sqlstm.sqtdso[35] = (unsigned short )0;
        sqlstm.sqhstv[36] = (unsigned char  *)&(GP_anno->bandetcode);
        sqlstm.sqhstl[36] = (unsigned long )5;
        sqlstm.sqhsts[36] = (         int  )0;
        sqlstm.sqindv[36] = (         short *)0;
        sqlstm.sqinds[36] = (         int  )0;
        sqlstm.sqharm[36] = (unsigned long )0;
        sqlstm.sqadto[36] = (unsigned short )0;
        sqlstm.sqtdso[36] = (unsigned short )0;
        sqlstm.sqhstv[37] = (unsigned char  *)&(GP_anno->borgnum);
        sqlstm.sqhstl[37] = (unsigned long )6;
        sqlstm.sqhsts[37] = (         int  )0;
        sqlstm.sqindv[37] = (         short *)0;
        sqlstm.sqinds[37] = (         int  )0;
        sqlstm.sqharm[37] = (unsigned long )0;
        sqlstm.sqadto[37] = (unsigned short )0;
        sqlstm.sqtdso[37] = (unsigned short )0;
        sqlstm.sqhstv[38] = (unsigned char  *)&(GP_anno->bdeptcode);
        sqlstm.sqhstl[38] = (unsigned long )9;
        sqlstm.sqhsts[38] = (         int  )0;
        sqlstm.sqindv[38] = (         short *)0;
        sqlstm.sqinds[38] = (         int  )0;
        sqlstm.sqharm[38] = (unsigned long )0;
        sqlstm.sqadto[38] = (unsigned short )0;
        sqlstm.sqtdso[38] = (unsigned short )0;
        sqlstm.sqhstv[39] = (unsigned char  *)&(GP_anno->bpaycl);
        sqlstm.sqhstl[39] = (unsigned long )6;
        sqlstm.sqhsts[39] = (         int  )0;
        sqlstm.sqindv[39] = (         short *)0;
        sqlstm.sqinds[39] = (         int  )0;
        sqlstm.sqharm[39] = (unsigned long )0;
        sqlstm.sqadto[39] = (unsigned short )0;
        sqlstm.sqtdso[39] = (unsigned short )0;
        sqlstm.sqhstv[40] = (unsigned char  *)&(GP_anno->bpaygr);
        sqlstm.sqhstl[40] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[40] = (         int  )0;
        sqlstm.sqindv[40] = (         short *)0;
        sqlstm.sqinds[40] = (         int  )0;
        sqlstm.sqharm[40] = (unsigned long )0;
        sqlstm.sqadto[40] = (unsigned short )0;
        sqlstm.sqtdso[40] = (unsigned short )0;
        sqlstm.sqhstv[41] = (unsigned char  *)&(GP_anno->bpayra);
        sqlstm.sqhstl[41] = (unsigned long )6;
        sqlstm.sqhsts[41] = (         int  )0;
        sqlstm.sqindv[41] = (         short *)0;
        sqlstm.sqinds[41] = (         int  )0;
        sqlstm.sqharm[41] = (unsigned long )0;
        sqlstm.sqadto[41] = (unsigned short )0;
        sqlstm.sqtdso[41] = (unsigned short )0;
        sqlstm.sqhstv[42] = (unsigned char  *)&(GP_anno->anupdyn);
        sqlstm.sqhstl[42] = (unsigned long )4;
        sqlstm.sqhsts[42] = (         int  )0;
        sqlstm.sqindv[42] = (         short *)0;
        sqlstm.sqinds[42] = (         int  )0;
        sqlstm.sqharm[42] = (unsigned long )0;
        sqlstm.sqadto[42] = (unsigned short )0;
        sqlstm.sqtdso[42] = (unsigned short )0;
        sqlstm.sqhstv[43] = (unsigned char  *)&(GP_anno->anresdate);
        sqlstm.sqhstl[43] = (unsigned long )17;
        sqlstm.sqhsts[43] = (         int  )0;
        sqlstm.sqindv[43] = (         short *)0;
        sqlstm.sqinds[43] = (         int  )0;
        sqlstm.sqharm[43] = (unsigned long )0;
        sqlstm.sqadto[43] = (unsigned short )0;
        sqlstm.sqtdso[43] = (unsigned short )0;
        sqlstm.sqhstv[44] = (unsigned char  *)&(GP_anno->oldempno);
        sqlstm.sqhstl[44] = (unsigned long )7;
        sqlstm.sqhsts[44] = (         int  )0;
        sqlstm.sqindv[44] = (         short *)0;
        sqlstm.sqinds[44] = (         int  )0;
        sqlstm.sqharm[44] = (unsigned long )0;
        sqlstm.sqadto[44] = (unsigned short )0;
        sqlstm.sqtdso[44] = (unsigned short )0;
        sqlstm.sqphsv = sqlstm.sqhstv;
        sqlstm.sqphsl = sqlstm.sqhstl;
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
            /* EXEC SQL CLOSE cur_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )521;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            if (ReadAnno == 0) logWrite("Data not found!!");
            else Ins_Notice();      //마지막 발령번호를 MYHR공지사항 테이블에 등록 2018.08.24
            break;
        }
        else if (SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )536;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&logText);
            sprintf(logText, "Cursor Fetch Error : %s", SQLERRM);
            logWrite(logText);
            return;
        }
        ReadAnno ++;    //조회 숫자 +1

        /* 첫번째 Row처리시 인사변수(PIMVARI)테이블의 조직차수와 비교하여 발령차수가 더 크다면 인사변수테이블의 조직차수 변경 2018.08.24. */
        if ((strcmp(oldorgnum.arr, GP_anno->orgnum.arr) < 0) && (ReadAnno == 1))
        {
            /* EXEC SQL UPDATE PIMVARI SET VALUE1 = :GP_anno->orgnum WHERE GUBUN = '00' AND SGUBUN = '0001' ; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "update PIMVARI  set VALUE1=:b0 where (GUBUN='00'\
 and SGUBUN='0001')";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )551;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->orgnum);
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


            /* EXEC SQL COMMIT WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )570;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        }
        
if (DEBUG)  printf("test2\n");

        /* 발령코드 체크 (신규:'111',선임:'121',재선임:'124',계약:'131',재계약:'134',위촉:'141') */
        /* 2. 신규채용,선임,재선임,계약,재계약이 아닐경우에만 데이타를 인사마스터에서 읽는다. */
        if ((strcmp(GP_anno->ancode.arr,"111") != 0) && (strcmp(GP_anno->ancode.arr,"121") != 0) && 
            (strcmp(GP_anno->ancode.arr,"124") != 0) && (strcmp(GP_anno->ancode.arr,"131") != 0) && 
            (strcmp(GP_anno->ancode.arr,"134") != 0) && (strcmp(GP_anno->ancode.arr,"141") != 0))
        {
            if (AssignMaster((char *)GP_anno->empno.arr) == 0) logWrite(logText);     /* 인사마스터 조회하여 Record 입력 */
            if (AssignPehremas((char *)GP_anno->empno.arr) == 0) logWrite(logText);   /* 업적평가마스터 조회하여 Record 입력 */
        }
        /* 발령구분이 임명(253),임명해제(258) 인 경우 발령사항 테이블 UPDATE 후 SKIP */
        if ((strcmp(GP_anno->ancode.arr,"253") == 0) || (strcmp(GP_anno->ancode.arr,"258") == 0)) 
        {
            AccessAnno++;
            /* EXEC SQL
        		UPDATE PIHANNO 
        		   SET bannono = :GP_mas->lannono, banfrdate = :GP_mas->lanfrdate, bantodate = :GP_mas->lantodate,
        			     bancode = :GP_mas->lancode, anupdyn = 'Y', anupdtime = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'),
        			     comgubun = '3', writeemp = :jobEmpno
        		 WHERE empno = :GP_anno->empno AND annono = :GP_anno->annono 
        		   AND anfrdate = :GP_anno->anfrdate AND ancode = :GP_anno->ancode; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "update PIHANNO  set bannono=:b0,banfrdate=:b1,ba\
ntodate=:b2,bancode=:b3,anupdyn='Y',anupdtime=TO_CHAR(SYSDATE,'YYYYMMDDHH24MI\
SS'),comgubun='3',writeemp=:b4 where (((empno=:b5 and annono=:b6) and anfrdat\
e=:b7) and ancode=:b8)";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )585;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->lannono);
            sqlstm.sqhstl[0] = (unsigned long )11;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->lanfrdate);
            sqlstm.sqhstl[1] = (unsigned long )11;
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->lantodate);
            sqlstm.sqhstl[2] = (unsigned long )11;
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->lancode);
            sqlstm.sqhstl[3] = (unsigned long )6;
            sqlstm.sqhsts[3] = (         int  )0;
            sqlstm.sqindv[3] = (         short *)0;
            sqlstm.sqinds[3] = (         int  )0;
            sqlstm.sqharm[3] = (unsigned long )0;
            sqlstm.sqadto[3] = (unsigned short )0;
            sqlstm.sqtdso[3] = (unsigned short )0;
            sqlstm.sqhstv[4] = (unsigned char  *)jobEmpno;
            sqlstm.sqhstl[4] = (unsigned long )5;
            sqlstm.sqhsts[4] = (         int  )0;
            sqlstm.sqindv[4] = (         short *)0;
            sqlstm.sqinds[4] = (         int  )0;
            sqlstm.sqharm[4] = (unsigned long )0;
            sqlstm.sqadto[4] = (unsigned short )0;
            sqlstm.sqtdso[4] = (unsigned short )0;
            sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->empno);
            sqlstm.sqhstl[5] = (unsigned long )7;
            sqlstm.sqhsts[5] = (         int  )0;
            sqlstm.sqindv[5] = (         short *)0;
            sqlstm.sqinds[5] = (         int  )0;
            sqlstm.sqharm[5] = (unsigned long )0;
            sqlstm.sqadto[5] = (unsigned short )0;
            sqlstm.sqtdso[5] = (unsigned short )0;
            sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->annono);
            sqlstm.sqhstl[6] = (unsigned long )11;
            sqlstm.sqhsts[6] = (         int  )0;
            sqlstm.sqindv[6] = (         short *)0;
            sqlstm.sqinds[6] = (         int  )0;
            sqlstm.sqharm[6] = (unsigned long )0;
            sqlstm.sqadto[6] = (unsigned short )0;
            sqlstm.sqtdso[6] = (unsigned short )0;
            sqlstm.sqhstv[7] = (unsigned char  *)&(GP_anno->anfrdate);
            sqlstm.sqhstl[7] = (unsigned long )11;
            sqlstm.sqhsts[7] = (         int  )0;
            sqlstm.sqindv[7] = (         short *)0;
            sqlstm.sqinds[7] = (         int  )0;
            sqlstm.sqharm[7] = (unsigned long )0;
            sqlstm.sqadto[7] = (unsigned short )0;
            sqlstm.sqtdso[7] = (unsigned short )0;
            sqlstm.sqhstv[8] = (unsigned char  *)&(GP_anno->ancode);
            sqlstm.sqhstl[8] = (unsigned long )6;
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


            
            /* EXEC SQL COMMIT WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )636;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



            continue;
        }
        /* 4. 직업군 체크 : 일반(직업군 복사), 업적평가제외직군(목표수립대상 제외 처리) */
        // DELPHI의 Jobline_Check함수
        if(strcmp(GP_anno->jobgun.arr, "") != 0)
        {
            VC2VC(GP_mas->jobgun, GP_anno->jobgun);
            VC2VC(GP_res->jobgun, GP_anno->jobgun);
            if((strcmp(GP_anno->jobgun.arr, exjob1.arr) == 0) || (strcmp(GP_anno->jobgun.arr, exjob2.arr) == 0) || 
               (strcmp(GP_anno->jobgun.arr, exjob3.arr) == 0) || (strcmp(GP_anno->jobgun.arr, exjob4.arr) == 0) || 
               (strcmp(GP_anno->jobgun.arr, exjob5.arr) == 0))
            {
                STR2VCCOPY(GP_res->reconyn, "N");
                STR2VCCOPY(GP_res->prjexcode, "9");
            }
        }
        /* 발령번호가 변경되면 이전 발령번호의 발령사항을 MYHR공지사항 테이블에 등록 2018.08.24. */
        if (strcmp(oldAnnono.arr, GP_anno->annono.arr) != 0) 
        {
            if (strcmp(oldAnnono.arr, "") != 0) Ins_Notice();
            VC2VC(oldAnnono, GP_anno->annono);
        }

        Payrayn_Check();    // 5. 보임여부 체크 

        Deptcode_Check();   // 6. 현조직차수<>후조직차수 or 현차수 <> 후차수

        Payra_check();      // 7. 현직무대리일 to를 구한다

        Ancode_Check();     // 8. 발령구분별 작업 처리

        Pstate_Check();     // 10. 인사 상태
        
        //조회건별 Transaction 시작 지정
        /* EXEC SQL SAVEPOINT save_anno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 45;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "savepoint save_anno";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )651;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



        if ((strcmp(GP_anno->ancode.arr, "511") == 0) || (strcmp(GP_anno->ancode.arr, "512") == 0) ||
            (strcmp(GP_anno->ancode.arr, "514") == 0) || (strcmp(GP_anno->ancode.arr, "600") == 0) ||
            (strcmp(GP_anno->ancode.arr, "641") == 0))
        {
            STRINIT(&logText);
            if (Exdu_Check() == 0) // 9. 근속제외를 수정한다.
                logSave(logText);  // 기존 델파이 소스에 근속제외 기간 추가 실패에 대한 처리없어서 Log 기록만 수행
        }

        /* 발령구분이 발령정정(915),발령취소(925) 인 경우 발령사항 테이블 UPDATE */
        if ((strcmp(GP_anno->ancode.arr,"915") == 0) || (strcmp(GP_anno->ancode.arr,"925") == 0))
        {
            CancelAnno++;
            /* EXEC SQL
        		UPDATE PIHANNO 
        		   SET bannono = :GP_mas->lannono, banfrdate = :GP_mas->lanfrdate, bantodate = :GP_mas->lantodate,
        			     bancode = :GP_mas->lancode, anupdyn ='Y' ,anupdtime = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD'),
        			     comgubun= '3', writeemp = :jobEmpno
        		 WHERE empno   = :GP_anno->empno 
        		   AND annono  = :GP_anno->annono 
        		   AND anfrdate= :GP_anno->anfrdate 
        		   AND ancode  = :GP_anno->ancode; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "update PIHANNO  set bannono=:b0,banfrdate=:b1,ba\
ntodate=:b2,bancode=:b3,anupdyn='Y',anupdtime=TO_CHAR(SYSDATE,'YYYYMMDDHH24MI\
SSD'),comgubun='3',writeemp=:b4 where (((empno=:b5 and annono=:b6) and anfrda\
te=:b7) and ancode=:b8)";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )666;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->lannono);
            sqlstm.sqhstl[0] = (unsigned long )11;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->lanfrdate);
            sqlstm.sqhstl[1] = (unsigned long )11;
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->lantodate);
            sqlstm.sqhstl[2] = (unsigned long )11;
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->lancode);
            sqlstm.sqhstl[3] = (unsigned long )6;
            sqlstm.sqhsts[3] = (         int  )0;
            sqlstm.sqindv[3] = (         short *)0;
            sqlstm.sqinds[3] = (         int  )0;
            sqlstm.sqharm[3] = (unsigned long )0;
            sqlstm.sqadto[3] = (unsigned short )0;
            sqlstm.sqtdso[3] = (unsigned short )0;
            sqlstm.sqhstv[4] = (unsigned char  *)jobEmpno;
            sqlstm.sqhstl[4] = (unsigned long )5;
            sqlstm.sqhsts[4] = (         int  )0;
            sqlstm.sqindv[4] = (         short *)0;
            sqlstm.sqinds[4] = (         int  )0;
            sqlstm.sqharm[4] = (unsigned long )0;
            sqlstm.sqadto[4] = (unsigned short )0;
            sqlstm.sqtdso[4] = (unsigned short )0;
            sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->empno);
            sqlstm.sqhstl[5] = (unsigned long )7;
            sqlstm.sqhsts[5] = (         int  )0;
            sqlstm.sqindv[5] = (         short *)0;
            sqlstm.sqinds[5] = (         int  )0;
            sqlstm.sqharm[5] = (unsigned long )0;
            sqlstm.sqadto[5] = (unsigned short )0;
            sqlstm.sqtdso[5] = (unsigned short )0;
            sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->annono);
            sqlstm.sqhstl[6] = (unsigned long )11;
            sqlstm.sqhsts[6] = (         int  )0;
            sqlstm.sqindv[6] = (         short *)0;
            sqlstm.sqinds[6] = (         int  )0;
            sqlstm.sqharm[6] = (unsigned long )0;
            sqlstm.sqadto[6] = (unsigned short )0;
            sqlstm.sqtdso[6] = (unsigned short )0;
            sqlstm.sqhstv[7] = (unsigned char  *)&(GP_anno->anfrdate);
            sqlstm.sqhstl[7] = (unsigned long )11;
            sqlstm.sqhsts[7] = (         int  )0;
            sqlstm.sqindv[7] = (         short *)0;
            sqlstm.sqinds[7] = (         int  )0;
            sqlstm.sqharm[7] = (unsigned long )0;
            sqlstm.sqadto[7] = (unsigned short )0;
            sqlstm.sqtdso[7] = (unsigned short )0;
            sqlstm.sqhstv[8] = (unsigned char  *)&(GP_anno->ancode);
            sqlstm.sqhstl[8] = (unsigned long )6;
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

        if (Save_anno())   // 11..15 인사발령화일을 저장한다..
        {
            AccessAnno ++;
            /* EXEC SQL COMMIT WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )717;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   // 1건 저장

            if (logSavecount > 0)
            {
    if (DEBUG)  printf("안내성로그 저장[%d]\n", logSavecount);
                for(i = 0; i < logSavecount; i++)
                    logWrite(logSaveText[i]);
            }
        }
        else
        {
            ErrorAnno ++;       //Error Count + 1
            /* EXEC SQL ROLLBACK TO SAVEPOINT save_anno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 45;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "rollback  to save_anno";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )732;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

   // 1건 취소

            if (strcmp(logText, "") != 0)  //저장 중 발생한 Error Log 기록
                logWrite(logText);
        }
        logSavecount = 0;
            
    } /* End While */

    if (ReadAnno > 0) 
    {
if (DEBUG)  printf("test5 ReadAnno=[%d],curDate[%s]\n", ReadAnno, curDate);

        // 발령경신 최종작업일 수정
        /* EXEC SQL
            UPDATE PIMVARI 
               SET VALUE1 = :curDate, VALUE2 = :curDate
             WHERE GUBUN ='30' AND SGUBUN = '0002'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 45;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update PIMVARI  set VALUE1=:b0,VALUE2=:b0 where (GUB\
UN='30' and SGUBUN='0002')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )747;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)curDate;
        sqlstm.sqhstl[0] = (unsigned long )9;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)curDate;
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


        
        /* EXEC SQL COMMIT WORK; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 45;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )770;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    }
    
    STRINIT(&logText);
    sprintf(logText, "[요약]작업종료 : 조회[%d]취소[%d]에러[%d]처리[%d]", ReadAnno, CancelAnno, ErrorAnno, AccessAnno);
    logWrite(logText);

    return;
}

/* 인사마스터 테이블을 읽어서 Record에 저장 */
int AssignMaster(char *strEmpno)
{
    
    /* 숫자컬럼 문자로 변경하여 RECORD에 저장 부분 미구현 */
    /* EXEC SQL
    SELECT EMPNO,KORNAME,PSTATE,PSTATEYN,PAYCL,TO_CHAR(PAYGR),PAYRA,JOBPAYRA,ORGNUM,DEPTCODE,
           FIELDCODE,BONCODE,FINCODE,PAYDUNM,REALTRDATE,OFFTRDATE,PAYRAYN,JOBPAYRAYN,CPAYRADATE,JOBDEPT,
           JOBPLACE,ORGEMPDATE,EMPDATE,CARDATE,JUMINID,CPAYCLDATE,PAYCLDATE,REPPAYCL,REPPAYFRDATE,REPPAYTODATE,
           APDPAYDUNM,APDPAYFRDATE,APDPAYTODATE,ACTPAYDUNM,ACTPAYFRDATE,ACTPAYTODATE,LRAGRDATE,REMARK,EMPCODE,EMPPAYCL,
           EMPPAYGR,EMPJOBLINE,JOBGUN,JOBGUNDATE,JOBLINE,JOBLINEDATE,NOGUBUN,LANCODE,LANNONO,LANFRDATE,
           LANTODATE,EXDUTCNT,EXDUTYY,EXDUTMM,EXDUTDD,LEXFRDATE,LEXTODATE,LEXDUYY,LEXDUMM,LEXDUDD,
           LRKIND,LRFRDATE,LRTODATE,LVFRDATE,LVTODATE,LSEKIND,LSEFRDATE,LSETODATE,LSEPLACE,LSESAYU,
           LSECONT,HUGUBUN,HUFRDATE,HUTODATE,RETDATE,RETGUBUN,RETSAYU1,RETSAYU2,RETCONT,OTDUFRDATE,
           OTDUTODATE,TCONTR,TCONTRAMT,TTYPE,TJOBDUTY,TCOND,TCOMPANY,EDUGUBUN,EDUPLACE,EDUCOURSE,
           EDUFRDATE,EDUTODATE,EDUDUFRDATE,EDUDUTODATE,EDUAREA,EDUCONT
      INTO :GP_mas->empno,:GP_mas->korname,:GP_mas->pstate,:GP_mas->pstateyn,:GP_mas->paycl,
           :GP_mas->paygr,:GP_mas->payra,:GP_mas->jobpayra,:GP_mas->orgnum,:GP_mas->deptcode,
           :GP_mas->fieldcode,:GP_mas->boncode,:GP_mas->fincode,:GP_mas->paydunm,:GP_mas->realtrdate,
           :GP_mas->offtrdate,:GP_mas->payrayn,:GP_mas->jobpayrayn,:GP_mas->cpayradate,:GP_mas->jobdept,
           :GP_mas->jobplace,:GP_mas->orgempdate,:GP_mas->empdate,:GP_mas->cardate,:GP_mas->juminid,
           :GP_mas->cpaycldate,:GP_mas->paycldate,:GP_mas->reppaycl,:GP_mas->reppayfrdate,:GP_mas->reppaytodate,
           :GP_mas->apdpaydunm,:GP_mas->apdpayfrdate,:GP_mas->apdpaytodate,:GP_mas->actpaydunm,:GP_mas->actpayfrdate,
           :GP_mas->actpaytodate,:GP_mas->lragrdate,:GP_mas->remark,:GP_mas->empcode,:GP_mas->emppaycl,
           :GP_mas->emppaygr,:GP_mas->empjobline,:GP_mas->jobgun,:GP_mas->jobgundate,:GP_mas->jobline,
           :GP_mas->joblinedate,:GP_mas->nogubun,:GP_mas->lancode,:GP_mas->lannono,:GP_mas->lanfrdate,
           :GP_mas->lantodate,:GP_mas->exdutcnt,:GP_mas->exdutyy,:GP_mas->exdutmm,:GP_mas->exdutdd,
           :GP_mas->lexfrdate,:GP_mas->lextodate,:GP_mas->lexduyy,:GP_mas->lexdumm,:GP_mas->lexdudd,
           :GP_mas->lrkind,:GP_mas->lrfrdate,:GP_mas->lrtodate,:GP_mas->lvfrdate,:GP_mas->lvtodate,
           :GP_mas->lsekind,:GP_mas->lsefrdate,:GP_mas->lsetodate,:GP_mas->lseplace,:GP_mas->lsesayu,
           :GP_mas->lsecont,:GP_mas->hugubun,:GP_mas->hufrdate,:GP_mas->hutodate,:GP_mas->retdate,
           :GP_mas->retgubun,:GP_mas->retsayu1,:GP_mas->retsayu2,:GP_mas->retcont,:GP_mas->otdufrdate,
           :GP_mas->otdutodate,:GP_mas->tcontr,:GP_mas->tcontramt,:GP_mas->ttype,:GP_mas->tjobduty,
           :GP_mas->tcond,:GP_mas->tcompany,:GP_mas->edugubun,:GP_mas->eduplace,:GP_mas->educourse,
           :GP_mas->edufrdate,:GP_mas->edutodate,:GP_mas->edudufrdate,:GP_mas->edudutodate,:GP_mas->eduarea,
           :GP_mas->educont
      FROM PIMPMAS 
     WHERE EMPNO = :strEmpno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlbuft((void **)0,
      "select EMPNO ,KORNAME ,PSTATE ,PSTATEYN ,PAYCL ,TO_CHAR(PAYGR) ,PAYRA\
 ,JOBPAYRA ,ORGNUM ,DEPTCODE ,FIELDCODE ,BONCODE ,FINCODE ,PAYDUNM ,REALTRDA\
TE ,OFFTRDATE ,PAYRAYN ,JOBPAYRAYN ,CPAYRADATE ,JOBDEPT ,JOBPLACE ,ORGEMPDAT\
E ,EMPDATE ,CARDATE ,JUMINID ,CPAYCLDATE ,PAYCLDATE ,REPPAYCL ,REPPAYFRDATE \
,REPPAYTODATE ,APDPAYDUNM ,APDPAYFRDATE ,APDPAYTODATE ,ACTPAYDUNM ,ACTPAYFRD\
ATE ,ACTPAYTODATE ,LRAGRDATE ,REMARK ,EMPCODE ,EMPPAYCL ,EMPPAYGR ,EMPJOBLIN\
E ,JOBGUN ,JOBGUNDATE ,JOBLINE ,JOBLINEDATE ,NOGUBUN ,LANCODE ,LANNONO ,LANF\
RDATE ,LANTODATE ,EXDUTCNT ,EXDUTYY ,EXDUTMM ,EXDUTDD ,LEXFRDATE ,LEXTODATE \
,LEXDUYY ,LEXDUMM ,LEXDUDD ,LRKIND ,LRFRDATE ,LRTODATE ,LVFRDATE ,LVTODATE ,\
LSEKIND ,LSEFRDATE ,LSETODATE ,LSEPLACE ,LSESAYU ,LSECONT ,HUGUBUN ,HUFRDATE\
 ,HUTODATE ,RETDATE ,RETGUBUN ,RETSAYU1 ,RETSAYU2 ,RETCONT ,OTDUFRDATE ,OTDU\
TODATE ,TCONTR ,TCONTRAMT ,TTYPE ,TJOBDUTY ,TCOND ,TCOMPANY ,EDUGUBUN ,EDUPL\
ACE ,EDUCOURSE ,EDUFRDATE ,EDUTODATE ,EDUDUFRDATE ,EDUDUTODATE ,EDUAREA ,EDU\
CONT into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:");
    sqlstm.stmt = "b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18,:b19\
,:b20,:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:b30,:b31,:b32,:b33,:b34,:\
b35,:b36,:b37,:b38,:b39,:b40,:b41,:b42,:b43,:b44,:b45,:b46,:b47,:b48,:b49,:b5\
0,:b51,:b52,:b53,:b54,:b55,:b56,:b57,:b58,:b59,:b60,:b61,:b62,:b63,:b64,:b65,\
:b66,:b67,:b68,:b69,:b70,:b71,:b72,:b73,:b74,:b75,:b76,:b77,:b78,:b79,:b80,:b\
81,:b82,:b83,:b84,:b85,:b86,:b87,:b88,:b89,:b90,:b91,:b92,:b93,:b94,:b95  fro\
m PIMPMAS where EMPNO=:b96";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )785;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->empno);
    sqlstm.sqhstl[0] = (unsigned long )7;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->korname);
    sqlstm.sqhstl[1] = (unsigned long )15;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->pstate);
    sqlstm.sqhstl[2] = (unsigned long )5;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->pstateyn);
    sqlstm.sqhstl[3] = (unsigned long )4;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&(GP_mas->paycl);
    sqlstm.sqhstl[4] = (unsigned long )6;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_mas->paygr);
    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&(GP_mas->payra);
    sqlstm.sqhstl[6] = (unsigned long )6;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&(GP_mas->jobpayra);
    sqlstm.sqhstl[7] = (unsigned long )6;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&(GP_mas->orgnum);
    sqlstm.sqhstl[8] = (unsigned long )6;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&(GP_mas->deptcode);
    sqlstm.sqhstl[9] = (unsigned long )8;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)&(GP_mas->fieldcode);
    sqlstm.sqhstl[10] = (unsigned long )6;
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)&(GP_mas->boncode);
    sqlstm.sqhstl[11] = (unsigned long )8;
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)&(GP_mas->fincode);
    sqlstm.sqhstl[12] = (unsigned long )8;
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)&(GP_mas->paydunm);
    sqlstm.sqhstl[13] = (unsigned long )33;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)&(GP_mas->realtrdate);
    sqlstm.sqhstl[14] = (unsigned long )11;
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqhstv[15] = (unsigned char  *)&(GP_mas->offtrdate);
    sqlstm.sqhstl[15] = (unsigned long )11;
    sqlstm.sqhsts[15] = (         int  )0;
    sqlstm.sqindv[15] = (         short *)0;
    sqlstm.sqinds[15] = (         int  )0;
    sqlstm.sqharm[15] = (unsigned long )0;
    sqlstm.sqadto[15] = (unsigned short )0;
    sqlstm.sqtdso[15] = (unsigned short )0;
    sqlstm.sqhstv[16] = (unsigned char  *)&(GP_mas->payrayn);
    sqlstm.sqhstl[16] = (unsigned long )4;
    sqlstm.sqhsts[16] = (         int  )0;
    sqlstm.sqindv[16] = (         short *)0;
    sqlstm.sqinds[16] = (         int  )0;
    sqlstm.sqharm[16] = (unsigned long )0;
    sqlstm.sqadto[16] = (unsigned short )0;
    sqlstm.sqtdso[16] = (unsigned short )0;
    sqlstm.sqhstv[17] = (unsigned char  *)&(GP_mas->jobpayrayn);
    sqlstm.sqhstl[17] = (unsigned long )4;
    sqlstm.sqhsts[17] = (         int  )0;
    sqlstm.sqindv[17] = (         short *)0;
    sqlstm.sqinds[17] = (         int  )0;
    sqlstm.sqharm[17] = (unsigned long )0;
    sqlstm.sqadto[17] = (unsigned short )0;
    sqlstm.sqtdso[17] = (unsigned short )0;
    sqlstm.sqhstv[18] = (unsigned char  *)&(GP_mas->cpayradate);
    sqlstm.sqhstl[18] = (unsigned long )11;
    sqlstm.sqhsts[18] = (         int  )0;
    sqlstm.sqindv[18] = (         short *)0;
    sqlstm.sqinds[18] = (         int  )0;
    sqlstm.sqharm[18] = (unsigned long )0;
    sqlstm.sqadto[18] = (unsigned short )0;
    sqlstm.sqtdso[18] = (unsigned short )0;
    sqlstm.sqhstv[19] = (unsigned char  *)&(GP_mas->jobdept);
    sqlstm.sqhstl[19] = (unsigned long )8;
    sqlstm.sqhsts[19] = (         int  )0;
    sqlstm.sqindv[19] = (         short *)0;
    sqlstm.sqinds[19] = (         int  )0;
    sqlstm.sqharm[19] = (unsigned long )0;
    sqlstm.sqadto[19] = (unsigned short )0;
    sqlstm.sqtdso[19] = (unsigned short )0;
    sqlstm.sqhstv[20] = (unsigned char  *)&(GP_mas->jobplace);
    sqlstm.sqhstl[20] = (unsigned long )5;
    sqlstm.sqhsts[20] = (         int  )0;
    sqlstm.sqindv[20] = (         short *)0;
    sqlstm.sqinds[20] = (         int  )0;
    sqlstm.sqharm[20] = (unsigned long )0;
    sqlstm.sqadto[20] = (unsigned short )0;
    sqlstm.sqtdso[20] = (unsigned short )0;
    sqlstm.sqhstv[21] = (unsigned char  *)&(GP_mas->orgempdate);
    sqlstm.sqhstl[21] = (unsigned long )11;
    sqlstm.sqhsts[21] = (         int  )0;
    sqlstm.sqindv[21] = (         short *)0;
    sqlstm.sqinds[21] = (         int  )0;
    sqlstm.sqharm[21] = (unsigned long )0;
    sqlstm.sqadto[21] = (unsigned short )0;
    sqlstm.sqtdso[21] = (unsigned short )0;
    sqlstm.sqhstv[22] = (unsigned char  *)&(GP_mas->empdate);
    sqlstm.sqhstl[22] = (unsigned long )11;
    sqlstm.sqhsts[22] = (         int  )0;
    sqlstm.sqindv[22] = (         short *)0;
    sqlstm.sqinds[22] = (         int  )0;
    sqlstm.sqharm[22] = (unsigned long )0;
    sqlstm.sqadto[22] = (unsigned short )0;
    sqlstm.sqtdso[22] = (unsigned short )0;
    sqlstm.sqhstv[23] = (unsigned char  *)&(GP_mas->cardate);
    sqlstm.sqhstl[23] = (unsigned long )11;
    sqlstm.sqhsts[23] = (         int  )0;
    sqlstm.sqindv[23] = (         short *)0;
    sqlstm.sqinds[23] = (         int  )0;
    sqlstm.sqharm[23] = (unsigned long )0;
    sqlstm.sqadto[23] = (unsigned short )0;
    sqlstm.sqtdso[23] = (unsigned short )0;
    sqlstm.sqhstv[24] = (unsigned char  *)&(GP_mas->juminid);
    sqlstm.sqhstl[24] = (unsigned long )17;
    sqlstm.sqhsts[24] = (         int  )0;
    sqlstm.sqindv[24] = (         short *)0;
    sqlstm.sqinds[24] = (         int  )0;
    sqlstm.sqharm[24] = (unsigned long )0;
    sqlstm.sqadto[24] = (unsigned short )0;
    sqlstm.sqtdso[24] = (unsigned short )0;
    sqlstm.sqhstv[25] = (unsigned char  *)&(GP_mas->cpaycldate);
    sqlstm.sqhstl[25] = (unsigned long )11;
    sqlstm.sqhsts[25] = (         int  )0;
    sqlstm.sqindv[25] = (         short *)0;
    sqlstm.sqinds[25] = (         int  )0;
    sqlstm.sqharm[25] = (unsigned long )0;
    sqlstm.sqadto[25] = (unsigned short )0;
    sqlstm.sqtdso[25] = (unsigned short )0;
    sqlstm.sqhstv[26] = (unsigned char  *)&(GP_mas->paycldate);
    sqlstm.sqhstl[26] = (unsigned long )11;
    sqlstm.sqhsts[26] = (         int  )0;
    sqlstm.sqindv[26] = (         short *)0;
    sqlstm.sqinds[26] = (         int  )0;
    sqlstm.sqharm[26] = (unsigned long )0;
    sqlstm.sqadto[26] = (unsigned short )0;
    sqlstm.sqtdso[26] = (unsigned short )0;
    sqlstm.sqhstv[27] = (unsigned char  *)&(GP_mas->reppaycl);
    sqlstm.sqhstl[27] = (unsigned long )6;
    sqlstm.sqhsts[27] = (         int  )0;
    sqlstm.sqindv[27] = (         short *)0;
    sqlstm.sqinds[27] = (         int  )0;
    sqlstm.sqharm[27] = (unsigned long )0;
    sqlstm.sqadto[27] = (unsigned short )0;
    sqlstm.sqtdso[27] = (unsigned short )0;
    sqlstm.sqhstv[28] = (unsigned char  *)&(GP_mas->reppayfrdate);
    sqlstm.sqhstl[28] = (unsigned long )11;
    sqlstm.sqhsts[28] = (         int  )0;
    sqlstm.sqindv[28] = (         short *)0;
    sqlstm.sqinds[28] = (         int  )0;
    sqlstm.sqharm[28] = (unsigned long )0;
    sqlstm.sqadto[28] = (unsigned short )0;
    sqlstm.sqtdso[28] = (unsigned short )0;
    sqlstm.sqhstv[29] = (unsigned char  *)&(GP_mas->reppaytodate);
    sqlstm.sqhstl[29] = (unsigned long )11;
    sqlstm.sqhsts[29] = (         int  )0;
    sqlstm.sqindv[29] = (         short *)0;
    sqlstm.sqinds[29] = (         int  )0;
    sqlstm.sqharm[29] = (unsigned long )0;
    sqlstm.sqadto[29] = (unsigned short )0;
    sqlstm.sqtdso[29] = (unsigned short )0;
    sqlstm.sqhstv[30] = (unsigned char  *)&(GP_mas->apdpaydunm);
    sqlstm.sqhstl[30] = (unsigned long )33;
    sqlstm.sqhsts[30] = (         int  )0;
    sqlstm.sqindv[30] = (         short *)0;
    sqlstm.sqinds[30] = (         int  )0;
    sqlstm.sqharm[30] = (unsigned long )0;
    sqlstm.sqadto[30] = (unsigned short )0;
    sqlstm.sqtdso[30] = (unsigned short )0;
    sqlstm.sqhstv[31] = (unsigned char  *)&(GP_mas->apdpayfrdate);
    sqlstm.sqhstl[31] = (unsigned long )11;
    sqlstm.sqhsts[31] = (         int  )0;
    sqlstm.sqindv[31] = (         short *)0;
    sqlstm.sqinds[31] = (         int  )0;
    sqlstm.sqharm[31] = (unsigned long )0;
    sqlstm.sqadto[31] = (unsigned short )0;
    sqlstm.sqtdso[31] = (unsigned short )0;
    sqlstm.sqhstv[32] = (unsigned char  *)&(GP_mas->apdpaytodate);
    sqlstm.sqhstl[32] = (unsigned long )11;
    sqlstm.sqhsts[32] = (         int  )0;
    sqlstm.sqindv[32] = (         short *)0;
    sqlstm.sqinds[32] = (         int  )0;
    sqlstm.sqharm[32] = (unsigned long )0;
    sqlstm.sqadto[32] = (unsigned short )0;
    sqlstm.sqtdso[32] = (unsigned short )0;
    sqlstm.sqhstv[33] = (unsigned char  *)&(GP_mas->actpaydunm);
    sqlstm.sqhstl[33] = (unsigned long )33;
    sqlstm.sqhsts[33] = (         int  )0;
    sqlstm.sqindv[33] = (         short *)0;
    sqlstm.sqinds[33] = (         int  )0;
    sqlstm.sqharm[33] = (unsigned long )0;
    sqlstm.sqadto[33] = (unsigned short )0;
    sqlstm.sqtdso[33] = (unsigned short )0;
    sqlstm.sqhstv[34] = (unsigned char  *)&(GP_mas->actpayfrdate);
    sqlstm.sqhstl[34] = (unsigned long )11;
    sqlstm.sqhsts[34] = (         int  )0;
    sqlstm.sqindv[34] = (         short *)0;
    sqlstm.sqinds[34] = (         int  )0;
    sqlstm.sqharm[34] = (unsigned long )0;
    sqlstm.sqadto[34] = (unsigned short )0;
    sqlstm.sqtdso[34] = (unsigned short )0;
    sqlstm.sqhstv[35] = (unsigned char  *)&(GP_mas->actpaytodate);
    sqlstm.sqhstl[35] = (unsigned long )11;
    sqlstm.sqhsts[35] = (         int  )0;
    sqlstm.sqindv[35] = (         short *)0;
    sqlstm.sqinds[35] = (         int  )0;
    sqlstm.sqharm[35] = (unsigned long )0;
    sqlstm.sqadto[35] = (unsigned short )0;
    sqlstm.sqtdso[35] = (unsigned short )0;
    sqlstm.sqhstv[36] = (unsigned char  *)&(GP_mas->lragrdate);
    sqlstm.sqhstl[36] = (unsigned long )11;
    sqlstm.sqhsts[36] = (         int  )0;
    sqlstm.sqindv[36] = (         short *)0;
    sqlstm.sqinds[36] = (         int  )0;
    sqlstm.sqharm[36] = (unsigned long )0;
    sqlstm.sqadto[36] = (unsigned short )0;
    sqlstm.sqtdso[36] = (unsigned short )0;
    sqlstm.sqhstv[37] = (unsigned char  *)&(GP_mas->remark);
    sqlstm.sqhstl[37] = (unsigned long )5;
    sqlstm.sqhsts[37] = (         int  )0;
    sqlstm.sqindv[37] = (         short *)0;
    sqlstm.sqinds[37] = (         int  )0;
    sqlstm.sqharm[37] = (unsigned long )0;
    sqlstm.sqadto[37] = (unsigned short )0;
    sqlstm.sqtdso[37] = (unsigned short )0;
    sqlstm.sqhstv[38] = (unsigned char  *)&(GP_mas->empcode);
    sqlstm.sqhstl[38] = (unsigned long )5;
    sqlstm.sqhsts[38] = (         int  )0;
    sqlstm.sqindv[38] = (         short *)0;
    sqlstm.sqinds[38] = (         int  )0;
    sqlstm.sqharm[38] = (unsigned long )0;
    sqlstm.sqadto[38] = (unsigned short )0;
    sqlstm.sqtdso[38] = (unsigned short )0;
    sqlstm.sqhstv[39] = (unsigned char  *)&(GP_mas->emppaycl);
    sqlstm.sqhstl[39] = (unsigned long )6;
    sqlstm.sqhsts[39] = (         int  )0;
    sqlstm.sqindv[39] = (         short *)0;
    sqlstm.sqinds[39] = (         int  )0;
    sqlstm.sqharm[39] = (unsigned long )0;
    sqlstm.sqadto[39] = (unsigned short )0;
    sqlstm.sqtdso[39] = (unsigned short )0;
    sqlstm.sqhstv[40] = (unsigned char  *)&(GP_mas->emppaygr);
    sqlstm.sqhstl[40] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[40] = (         int  )0;
    sqlstm.sqindv[40] = (         short *)0;
    sqlstm.sqinds[40] = (         int  )0;
    sqlstm.sqharm[40] = (unsigned long )0;
    sqlstm.sqadto[40] = (unsigned short )0;
    sqlstm.sqtdso[40] = (unsigned short )0;
    sqlstm.sqhstv[41] = (unsigned char  *)&(GP_mas->empjobline);
    sqlstm.sqhstl[41] = (unsigned long )5;
    sqlstm.sqhsts[41] = (         int  )0;
    sqlstm.sqindv[41] = (         short *)0;
    sqlstm.sqinds[41] = (         int  )0;
    sqlstm.sqharm[41] = (unsigned long )0;
    sqlstm.sqadto[41] = (unsigned short )0;
    sqlstm.sqtdso[41] = (unsigned short )0;
    sqlstm.sqhstv[42] = (unsigned char  *)&(GP_mas->jobgun);
    sqlstm.sqhstl[42] = (unsigned long )5;
    sqlstm.sqhsts[42] = (         int  )0;
    sqlstm.sqindv[42] = (         short *)0;
    sqlstm.sqinds[42] = (         int  )0;
    sqlstm.sqharm[42] = (unsigned long )0;
    sqlstm.sqadto[42] = (unsigned short )0;
    sqlstm.sqtdso[42] = (unsigned short )0;
    sqlstm.sqhstv[43] = (unsigned char  *)&(GP_mas->jobgundate);
    sqlstm.sqhstl[43] = (unsigned long )11;
    sqlstm.sqhsts[43] = (         int  )0;
    sqlstm.sqindv[43] = (         short *)0;
    sqlstm.sqinds[43] = (         int  )0;
    sqlstm.sqharm[43] = (unsigned long )0;
    sqlstm.sqadto[43] = (unsigned short )0;
    sqlstm.sqtdso[43] = (unsigned short )0;
    sqlstm.sqhstv[44] = (unsigned char  *)&(GP_mas->jobline);
    sqlstm.sqhstl[44] = (unsigned long )5;
    sqlstm.sqhsts[44] = (         int  )0;
    sqlstm.sqindv[44] = (         short *)0;
    sqlstm.sqinds[44] = (         int  )0;
    sqlstm.sqharm[44] = (unsigned long )0;
    sqlstm.sqadto[44] = (unsigned short )0;
    sqlstm.sqtdso[44] = (unsigned short )0;
    sqlstm.sqhstv[45] = (unsigned char  *)&(GP_mas->joblinedate);
    sqlstm.sqhstl[45] = (unsigned long )11;
    sqlstm.sqhsts[45] = (         int  )0;
    sqlstm.sqindv[45] = (         short *)0;
    sqlstm.sqinds[45] = (         int  )0;
    sqlstm.sqharm[45] = (unsigned long )0;
    sqlstm.sqadto[45] = (unsigned short )0;
    sqlstm.sqtdso[45] = (unsigned short )0;
    sqlstm.sqhstv[46] = (unsigned char  *)&(GP_mas->nogubun);
    sqlstm.sqhstl[46] = (unsigned long )5;
    sqlstm.sqhsts[46] = (         int  )0;
    sqlstm.sqindv[46] = (         short *)0;
    sqlstm.sqinds[46] = (         int  )0;
    sqlstm.sqharm[46] = (unsigned long )0;
    sqlstm.sqadto[46] = (unsigned short )0;
    sqlstm.sqtdso[46] = (unsigned short )0;
    sqlstm.sqhstv[47] = (unsigned char  *)&(GP_mas->lancode);
    sqlstm.sqhstl[47] = (unsigned long )6;
    sqlstm.sqhsts[47] = (         int  )0;
    sqlstm.sqindv[47] = (         short *)0;
    sqlstm.sqinds[47] = (         int  )0;
    sqlstm.sqharm[47] = (unsigned long )0;
    sqlstm.sqadto[47] = (unsigned short )0;
    sqlstm.sqtdso[47] = (unsigned short )0;
    sqlstm.sqhstv[48] = (unsigned char  *)&(GP_mas->lannono);
    sqlstm.sqhstl[48] = (unsigned long )11;
    sqlstm.sqhsts[48] = (         int  )0;
    sqlstm.sqindv[48] = (         short *)0;
    sqlstm.sqinds[48] = (         int  )0;
    sqlstm.sqharm[48] = (unsigned long )0;
    sqlstm.sqadto[48] = (unsigned short )0;
    sqlstm.sqtdso[48] = (unsigned short )0;
    sqlstm.sqhstv[49] = (unsigned char  *)&(GP_mas->lanfrdate);
    sqlstm.sqhstl[49] = (unsigned long )11;
    sqlstm.sqhsts[49] = (         int  )0;
    sqlstm.sqindv[49] = (         short *)0;
    sqlstm.sqinds[49] = (         int  )0;
    sqlstm.sqharm[49] = (unsigned long )0;
    sqlstm.sqadto[49] = (unsigned short )0;
    sqlstm.sqtdso[49] = (unsigned short )0;
    sqlstm.sqhstv[50] = (unsigned char  *)&(GP_mas->lantodate);
    sqlstm.sqhstl[50] = (unsigned long )11;
    sqlstm.sqhsts[50] = (         int  )0;
    sqlstm.sqindv[50] = (         short *)0;
    sqlstm.sqinds[50] = (         int  )0;
    sqlstm.sqharm[50] = (unsigned long )0;
    sqlstm.sqadto[50] = (unsigned short )0;
    sqlstm.sqtdso[50] = (unsigned short )0;
    sqlstm.sqhstv[51] = (unsigned char  *)&(GP_mas->exdutcnt);
    sqlstm.sqhstl[51] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[51] = (         int  )0;
    sqlstm.sqindv[51] = (         short *)0;
    sqlstm.sqinds[51] = (         int  )0;
    sqlstm.sqharm[51] = (unsigned long )0;
    sqlstm.sqadto[51] = (unsigned short )0;
    sqlstm.sqtdso[51] = (unsigned short )0;
    sqlstm.sqhstv[52] = (unsigned char  *)&(GP_mas->exdutyy);
    sqlstm.sqhstl[52] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[52] = (         int  )0;
    sqlstm.sqindv[52] = (         short *)0;
    sqlstm.sqinds[52] = (         int  )0;
    sqlstm.sqharm[52] = (unsigned long )0;
    sqlstm.sqadto[52] = (unsigned short )0;
    sqlstm.sqtdso[52] = (unsigned short )0;
    sqlstm.sqhstv[53] = (unsigned char  *)&(GP_mas->exdutmm);
    sqlstm.sqhstl[53] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[53] = (         int  )0;
    sqlstm.sqindv[53] = (         short *)0;
    sqlstm.sqinds[53] = (         int  )0;
    sqlstm.sqharm[53] = (unsigned long )0;
    sqlstm.sqadto[53] = (unsigned short )0;
    sqlstm.sqtdso[53] = (unsigned short )0;
    sqlstm.sqhstv[54] = (unsigned char  *)&(GP_mas->exdutdd);
    sqlstm.sqhstl[54] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[54] = (         int  )0;
    sqlstm.sqindv[54] = (         short *)0;
    sqlstm.sqinds[54] = (         int  )0;
    sqlstm.sqharm[54] = (unsigned long )0;
    sqlstm.sqadto[54] = (unsigned short )0;
    sqlstm.sqtdso[54] = (unsigned short )0;
    sqlstm.sqhstv[55] = (unsigned char  *)&(GP_mas->lexfrdate);
    sqlstm.sqhstl[55] = (unsigned long )11;
    sqlstm.sqhsts[55] = (         int  )0;
    sqlstm.sqindv[55] = (         short *)0;
    sqlstm.sqinds[55] = (         int  )0;
    sqlstm.sqharm[55] = (unsigned long )0;
    sqlstm.sqadto[55] = (unsigned short )0;
    sqlstm.sqtdso[55] = (unsigned short )0;
    sqlstm.sqhstv[56] = (unsigned char  *)&(GP_mas->lextodate);
    sqlstm.sqhstl[56] = (unsigned long )11;
    sqlstm.sqhsts[56] = (         int  )0;
    sqlstm.sqindv[56] = (         short *)0;
    sqlstm.sqinds[56] = (         int  )0;
    sqlstm.sqharm[56] = (unsigned long )0;
    sqlstm.sqadto[56] = (unsigned short )0;
    sqlstm.sqtdso[56] = (unsigned short )0;
    sqlstm.sqhstv[57] = (unsigned char  *)&(GP_mas->lexduyy);
    sqlstm.sqhstl[57] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[57] = (         int  )0;
    sqlstm.sqindv[57] = (         short *)0;
    sqlstm.sqinds[57] = (         int  )0;
    sqlstm.sqharm[57] = (unsigned long )0;
    sqlstm.sqadto[57] = (unsigned short )0;
    sqlstm.sqtdso[57] = (unsigned short )0;
    sqlstm.sqhstv[58] = (unsigned char  *)&(GP_mas->lexdumm);
    sqlstm.sqhstl[58] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[58] = (         int  )0;
    sqlstm.sqindv[58] = (         short *)0;
    sqlstm.sqinds[58] = (         int  )0;
    sqlstm.sqharm[58] = (unsigned long )0;
    sqlstm.sqadto[58] = (unsigned short )0;
    sqlstm.sqtdso[58] = (unsigned short )0;
    sqlstm.sqhstv[59] = (unsigned char  *)&(GP_mas->lexdudd);
    sqlstm.sqhstl[59] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[59] = (         int  )0;
    sqlstm.sqindv[59] = (         short *)0;
    sqlstm.sqinds[59] = (         int  )0;
    sqlstm.sqharm[59] = (unsigned long )0;
    sqlstm.sqadto[59] = (unsigned short )0;
    sqlstm.sqtdso[59] = (unsigned short )0;
    sqlstm.sqhstv[60] = (unsigned char  *)&(GP_mas->lrkind);
    sqlstm.sqhstl[60] = (unsigned long )5;
    sqlstm.sqhsts[60] = (         int  )0;
    sqlstm.sqindv[60] = (         short *)0;
    sqlstm.sqinds[60] = (         int  )0;
    sqlstm.sqharm[60] = (unsigned long )0;
    sqlstm.sqadto[60] = (unsigned short )0;
    sqlstm.sqtdso[60] = (unsigned short )0;
    sqlstm.sqhstv[61] = (unsigned char  *)&(GP_mas->lrfrdate);
    sqlstm.sqhstl[61] = (unsigned long )11;
    sqlstm.sqhsts[61] = (         int  )0;
    sqlstm.sqindv[61] = (         short *)0;
    sqlstm.sqinds[61] = (         int  )0;
    sqlstm.sqharm[61] = (unsigned long )0;
    sqlstm.sqadto[61] = (unsigned short )0;
    sqlstm.sqtdso[61] = (unsigned short )0;
    sqlstm.sqhstv[62] = (unsigned char  *)&(GP_mas->lrtodate);
    sqlstm.sqhstl[62] = (unsigned long )11;
    sqlstm.sqhsts[62] = (         int  )0;
    sqlstm.sqindv[62] = (         short *)0;
    sqlstm.sqinds[62] = (         int  )0;
    sqlstm.sqharm[62] = (unsigned long )0;
    sqlstm.sqadto[62] = (unsigned short )0;
    sqlstm.sqtdso[62] = (unsigned short )0;
    sqlstm.sqhstv[63] = (unsigned char  *)&(GP_mas->lvfrdate);
    sqlstm.sqhstl[63] = (unsigned long )11;
    sqlstm.sqhsts[63] = (         int  )0;
    sqlstm.sqindv[63] = (         short *)0;
    sqlstm.sqinds[63] = (         int  )0;
    sqlstm.sqharm[63] = (unsigned long )0;
    sqlstm.sqadto[63] = (unsigned short )0;
    sqlstm.sqtdso[63] = (unsigned short )0;
    sqlstm.sqhstv[64] = (unsigned char  *)&(GP_mas->lvtodate);
    sqlstm.sqhstl[64] = (unsigned long )11;
    sqlstm.sqhsts[64] = (         int  )0;
    sqlstm.sqindv[64] = (         short *)0;
    sqlstm.sqinds[64] = (         int  )0;
    sqlstm.sqharm[64] = (unsigned long )0;
    sqlstm.sqadto[64] = (unsigned short )0;
    sqlstm.sqtdso[64] = (unsigned short )0;
    sqlstm.sqhstv[65] = (unsigned char  *)&(GP_mas->lsekind);
    sqlstm.sqhstl[65] = (unsigned long )5;
    sqlstm.sqhsts[65] = (         int  )0;
    sqlstm.sqindv[65] = (         short *)0;
    sqlstm.sqinds[65] = (         int  )0;
    sqlstm.sqharm[65] = (unsigned long )0;
    sqlstm.sqadto[65] = (unsigned short )0;
    sqlstm.sqtdso[65] = (unsigned short )0;
    sqlstm.sqhstv[66] = (unsigned char  *)&(GP_mas->lsefrdate);
    sqlstm.sqhstl[66] = (unsigned long )11;
    sqlstm.sqhsts[66] = (         int  )0;
    sqlstm.sqindv[66] = (         short *)0;
    sqlstm.sqinds[66] = (         int  )0;
    sqlstm.sqharm[66] = (unsigned long )0;
    sqlstm.sqadto[66] = (unsigned short )0;
    sqlstm.sqtdso[66] = (unsigned short )0;
    sqlstm.sqhstv[67] = (unsigned char  *)&(GP_mas->lsetodate);
    sqlstm.sqhstl[67] = (unsigned long )11;
    sqlstm.sqhsts[67] = (         int  )0;
    sqlstm.sqindv[67] = (         short *)0;
    sqlstm.sqinds[67] = (         int  )0;
    sqlstm.sqharm[67] = (unsigned long )0;
    sqlstm.sqadto[67] = (unsigned short )0;
    sqlstm.sqtdso[67] = (unsigned short )0;
    sqlstm.sqhstv[68] = (unsigned char  *)&(GP_mas->lseplace);
    sqlstm.sqhstl[68] = (unsigned long )43;
    sqlstm.sqhsts[68] = (         int  )0;
    sqlstm.sqindv[68] = (         short *)0;
    sqlstm.sqinds[68] = (         int  )0;
    sqlstm.sqharm[68] = (unsigned long )0;
    sqlstm.sqadto[68] = (unsigned short )0;
    sqlstm.sqtdso[68] = (unsigned short )0;
    sqlstm.sqhstv[69] = (unsigned char  *)&(GP_mas->lsesayu);
    sqlstm.sqhstl[69] = (unsigned long )43;
    sqlstm.sqhsts[69] = (         int  )0;
    sqlstm.sqindv[69] = (         short *)0;
    sqlstm.sqinds[69] = (         int  )0;
    sqlstm.sqharm[69] = (unsigned long )0;
    sqlstm.sqadto[69] = (unsigned short )0;
    sqlstm.sqtdso[69] = (unsigned short )0;
    sqlstm.sqhstv[70] = (unsigned char  *)&(GP_mas->lsecont);
    sqlstm.sqhstl[70] = (unsigned long )43;
    sqlstm.sqhsts[70] = (         int  )0;
    sqlstm.sqindv[70] = (         short *)0;
    sqlstm.sqinds[70] = (         int  )0;
    sqlstm.sqharm[70] = (unsigned long )0;
    sqlstm.sqadto[70] = (unsigned short )0;
    sqlstm.sqtdso[70] = (unsigned short )0;
    sqlstm.sqhstv[71] = (unsigned char  *)&(GP_mas->hugubun);
    sqlstm.sqhstl[71] = (unsigned long )5;
    sqlstm.sqhsts[71] = (         int  )0;
    sqlstm.sqindv[71] = (         short *)0;
    sqlstm.sqinds[71] = (         int  )0;
    sqlstm.sqharm[71] = (unsigned long )0;
    sqlstm.sqadto[71] = (unsigned short )0;
    sqlstm.sqtdso[71] = (unsigned short )0;
    sqlstm.sqhstv[72] = (unsigned char  *)&(GP_mas->hufrdate);
    sqlstm.sqhstl[72] = (unsigned long )11;
    sqlstm.sqhsts[72] = (         int  )0;
    sqlstm.sqindv[72] = (         short *)0;
    sqlstm.sqinds[72] = (         int  )0;
    sqlstm.sqharm[72] = (unsigned long )0;
    sqlstm.sqadto[72] = (unsigned short )0;
    sqlstm.sqtdso[72] = (unsigned short )0;
    sqlstm.sqhstv[73] = (unsigned char  *)&(GP_mas->hutodate);
    sqlstm.sqhstl[73] = (unsigned long )11;
    sqlstm.sqhsts[73] = (         int  )0;
    sqlstm.sqindv[73] = (         short *)0;
    sqlstm.sqinds[73] = (         int  )0;
    sqlstm.sqharm[73] = (unsigned long )0;
    sqlstm.sqadto[73] = (unsigned short )0;
    sqlstm.sqtdso[73] = (unsigned short )0;
    sqlstm.sqhstv[74] = (unsigned char  *)&(GP_mas->retdate);
    sqlstm.sqhstl[74] = (unsigned long )11;
    sqlstm.sqhsts[74] = (         int  )0;
    sqlstm.sqindv[74] = (         short *)0;
    sqlstm.sqinds[74] = (         int  )0;
    sqlstm.sqharm[74] = (unsigned long )0;
    sqlstm.sqadto[74] = (unsigned short )0;
    sqlstm.sqtdso[74] = (unsigned short )0;
    sqlstm.sqhstv[75] = (unsigned char  *)&(GP_mas->retgubun);
    sqlstm.sqhstl[75] = (unsigned long )5;
    sqlstm.sqhsts[75] = (         int  )0;
    sqlstm.sqindv[75] = (         short *)0;
    sqlstm.sqinds[75] = (         int  )0;
    sqlstm.sqharm[75] = (unsigned long )0;
    sqlstm.sqadto[75] = (unsigned short )0;
    sqlstm.sqtdso[75] = (unsigned short )0;
    sqlstm.sqhstv[76] = (unsigned char  *)&(GP_mas->retsayu1);
    sqlstm.sqhstl[76] = (unsigned long )5;
    sqlstm.sqhsts[76] = (         int  )0;
    sqlstm.sqindv[76] = (         short *)0;
    sqlstm.sqinds[76] = (         int  )0;
    sqlstm.sqharm[76] = (unsigned long )0;
    sqlstm.sqadto[76] = (unsigned short )0;
    sqlstm.sqtdso[76] = (unsigned short )0;
    sqlstm.sqhstv[77] = (unsigned char  *)&(GP_mas->retsayu2);
    sqlstm.sqhstl[77] = (unsigned long )5;
    sqlstm.sqhsts[77] = (         int  )0;
    sqlstm.sqindv[77] = (         short *)0;
    sqlstm.sqinds[77] = (         int  )0;
    sqlstm.sqharm[77] = (unsigned long )0;
    sqlstm.sqadto[77] = (unsigned short )0;
    sqlstm.sqtdso[77] = (unsigned short )0;
    sqlstm.sqhstv[78] = (unsigned char  *)&(GP_mas->retcont);
    sqlstm.sqhstl[78] = (unsigned long )43;
    sqlstm.sqhsts[78] = (         int  )0;
    sqlstm.sqindv[78] = (         short *)0;
    sqlstm.sqinds[78] = (         int  )0;
    sqlstm.sqharm[78] = (unsigned long )0;
    sqlstm.sqadto[78] = (unsigned short )0;
    sqlstm.sqtdso[78] = (unsigned short )0;
    sqlstm.sqhstv[79] = (unsigned char  *)&(GP_mas->otdufrdate);
    sqlstm.sqhstl[79] = (unsigned long )11;
    sqlstm.sqhsts[79] = (         int  )0;
    sqlstm.sqindv[79] = (         short *)0;
    sqlstm.sqinds[79] = (         int  )0;
    sqlstm.sqharm[79] = (unsigned long )0;
    sqlstm.sqadto[79] = (unsigned short )0;
    sqlstm.sqtdso[79] = (unsigned short )0;
    sqlstm.sqhstv[80] = (unsigned char  *)&(GP_mas->otdutodate);
    sqlstm.sqhstl[80] = (unsigned long )11;
    sqlstm.sqhsts[80] = (         int  )0;
    sqlstm.sqindv[80] = (         short *)0;
    sqlstm.sqinds[80] = (         int  )0;
    sqlstm.sqharm[80] = (unsigned long )0;
    sqlstm.sqadto[80] = (unsigned short )0;
    sqlstm.sqtdso[80] = (unsigned short )0;
    sqlstm.sqhstv[81] = (unsigned char  *)&(GP_mas->tcontr);
    sqlstm.sqhstl[81] = (unsigned long )4;
    sqlstm.sqhsts[81] = (         int  )0;
    sqlstm.sqindv[81] = (         short *)0;
    sqlstm.sqinds[81] = (         int  )0;
    sqlstm.sqharm[81] = (unsigned long )0;
    sqlstm.sqadto[81] = (unsigned short )0;
    sqlstm.sqtdso[81] = (unsigned short )0;
    sqlstm.sqhstv[82] = (unsigned char  *)&(GP_mas->tcontramt);
    sqlstm.sqhstl[82] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[82] = (         int  )0;
    sqlstm.sqindv[82] = (         short *)0;
    sqlstm.sqinds[82] = (         int  )0;
    sqlstm.sqharm[82] = (unsigned long )0;
    sqlstm.sqadto[82] = (unsigned short )0;
    sqlstm.sqtdso[82] = (unsigned short )0;
    sqlstm.sqhstv[83] = (unsigned char  *)&(GP_mas->ttype);
    sqlstm.sqhstl[83] = (unsigned long )23;
    sqlstm.sqhsts[83] = (         int  )0;
    sqlstm.sqindv[83] = (         short *)0;
    sqlstm.sqinds[83] = (         int  )0;
    sqlstm.sqharm[83] = (unsigned long )0;
    sqlstm.sqadto[83] = (unsigned short )0;
    sqlstm.sqtdso[83] = (unsigned short )0;
    sqlstm.sqhstv[84] = (unsigned char  *)&(GP_mas->tjobduty);
    sqlstm.sqhstl[84] = (unsigned long )43;
    sqlstm.sqhsts[84] = (         int  )0;
    sqlstm.sqindv[84] = (         short *)0;
    sqlstm.sqinds[84] = (         int  )0;
    sqlstm.sqharm[84] = (unsigned long )0;
    sqlstm.sqadto[84] = (unsigned short )0;
    sqlstm.sqtdso[84] = (unsigned short )0;
    sqlstm.sqhstv[85] = (unsigned char  *)&(GP_mas->tcond);
    sqlstm.sqhstl[85] = (unsigned long )43;
    sqlstm.sqhsts[85] = (         int  )0;
    sqlstm.sqindv[85] = (         short *)0;
    sqlstm.sqinds[85] = (         int  )0;
    sqlstm.sqharm[85] = (unsigned long )0;
    sqlstm.sqadto[85] = (unsigned short )0;
    sqlstm.sqtdso[85] = (unsigned short )0;
    sqlstm.sqhstv[86] = (unsigned char  *)&(GP_mas->tcompany);
    sqlstm.sqhstl[86] = (unsigned long )5;
    sqlstm.sqhsts[86] = (         int  )0;
    sqlstm.sqindv[86] = (         short *)0;
    sqlstm.sqinds[86] = (         int  )0;
    sqlstm.sqharm[86] = (unsigned long )0;
    sqlstm.sqadto[86] = (unsigned short )0;
    sqlstm.sqtdso[86] = (unsigned short )0;
    sqlstm.sqhstv[87] = (unsigned char  *)&(GP_mas->edugubun);
    sqlstm.sqhstl[87] = (unsigned long )5;
    sqlstm.sqhsts[87] = (         int  )0;
    sqlstm.sqindv[87] = (         short *)0;
    sqlstm.sqinds[87] = (         int  )0;
    sqlstm.sqharm[87] = (unsigned long )0;
    sqlstm.sqadto[87] = (unsigned short )0;
    sqlstm.sqtdso[87] = (unsigned short )0;
    sqlstm.sqhstv[88] = (unsigned char  *)&(GP_mas->eduplace);
    sqlstm.sqhstl[88] = (unsigned long )33;
    sqlstm.sqhsts[88] = (         int  )0;
    sqlstm.sqindv[88] = (         short *)0;
    sqlstm.sqinds[88] = (         int  )0;
    sqlstm.sqharm[88] = (unsigned long )0;
    sqlstm.sqadto[88] = (unsigned short )0;
    sqlstm.sqtdso[88] = (unsigned short )0;
    sqlstm.sqhstv[89] = (unsigned char  *)&(GP_mas->educourse);
    sqlstm.sqhstl[89] = (unsigned long )43;
    sqlstm.sqhsts[89] = (         int  )0;
    sqlstm.sqindv[89] = (         short *)0;
    sqlstm.sqinds[89] = (         int  )0;
    sqlstm.sqharm[89] = (unsigned long )0;
    sqlstm.sqadto[89] = (unsigned short )0;
    sqlstm.sqtdso[89] = (unsigned short )0;
    sqlstm.sqhstv[90] = (unsigned char  *)&(GP_mas->edufrdate);
    sqlstm.sqhstl[90] = (unsigned long )11;
    sqlstm.sqhsts[90] = (         int  )0;
    sqlstm.sqindv[90] = (         short *)0;
    sqlstm.sqinds[90] = (         int  )0;
    sqlstm.sqharm[90] = (unsigned long )0;
    sqlstm.sqadto[90] = (unsigned short )0;
    sqlstm.sqtdso[90] = (unsigned short )0;
    sqlstm.sqhstv[91] = (unsigned char  *)&(GP_mas->edutodate);
    sqlstm.sqhstl[91] = (unsigned long )11;
    sqlstm.sqhsts[91] = (         int  )0;
    sqlstm.sqindv[91] = (         short *)0;
    sqlstm.sqinds[91] = (         int  )0;
    sqlstm.sqharm[91] = (unsigned long )0;
    sqlstm.sqadto[91] = (unsigned short )0;
    sqlstm.sqtdso[91] = (unsigned short )0;
    sqlstm.sqhstv[92] = (unsigned char  *)&(GP_mas->edudufrdate);
    sqlstm.sqhstl[92] = (unsigned long )11;
    sqlstm.sqhsts[92] = (         int  )0;
    sqlstm.sqindv[92] = (         short *)0;
    sqlstm.sqinds[92] = (         int  )0;
    sqlstm.sqharm[92] = (unsigned long )0;
    sqlstm.sqadto[92] = (unsigned short )0;
    sqlstm.sqtdso[92] = (unsigned short )0;
    sqlstm.sqhstv[93] = (unsigned char  *)&(GP_mas->edudutodate);
    sqlstm.sqhstl[93] = (unsigned long )11;
    sqlstm.sqhsts[93] = (         int  )0;
    sqlstm.sqindv[93] = (         short *)0;
    sqlstm.sqinds[93] = (         int  )0;
    sqlstm.sqharm[93] = (unsigned long )0;
    sqlstm.sqadto[93] = (unsigned short )0;
    sqlstm.sqtdso[93] = (unsigned short )0;
    sqlstm.sqhstv[94] = (unsigned char  *)&(GP_mas->eduarea);
    sqlstm.sqhstl[94] = (unsigned long )13;
    sqlstm.sqhsts[94] = (         int  )0;
    sqlstm.sqindv[94] = (         short *)0;
    sqlstm.sqinds[94] = (         int  )0;
    sqlstm.sqharm[94] = (unsigned long )0;
    sqlstm.sqadto[94] = (unsigned short )0;
    sqlstm.sqtdso[94] = (unsigned short )0;
    sqlstm.sqhstv[95] = (unsigned char  *)&(GP_mas->educont);
    sqlstm.sqhstl[95] = (unsigned long )43;
    sqlstm.sqhsts[95] = (         int  )0;
    sqlstm.sqindv[95] = (         short *)0;
    sqlstm.sqinds[95] = (         int  )0;
    sqlstm.sqharm[95] = (unsigned long )0;
    sqlstm.sqadto[95] = (unsigned short )0;
    sqlstm.sqtdso[95] = (unsigned short )0;
    sqlstm.sqhstv[96] = (unsigned char  *)strEmpno;
    sqlstm.sqhstl[96] = (unsigned long )0;
    sqlstm.sqhsts[96] = (         int  )0;
    sqlstm.sqindv[96] = (         short *)0;
    sqlstm.sqinds[96] = (         int  )0;
    sqlstm.sqharm[96] = (unsigned long )0;
    sqlstm.sqadto[96] = (unsigned short )0;
    sqlstm.sqtdso[96] = (unsigned short )0;
    sqlstm.sqphsv = sqlstm.sqhstv;
    sqlstm.sqphsl = sqlstm.sqhstl;
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
        STRINIT(&logText);
        sprintf(logText, "PIMPMAS TABLE READ FAIL!! [%s]", SQLERRM);
        return 0;
    }
    return 1;
}

/* 업적평가마스터 테이블을 읽어서 Record에 저장 */
int AssignPehremas(char *strEmpno)
{
    /* EXEC SQL
        SELECT empno,jobgun,orgnum,deptcode,trdate,paycl,payra,e1empno,e2empno,e1existyn,e2existyn,reconyn,pstate
          INTO :GP_res->empno,:GP_res->jobgun,:GP_res->orgnum,:GP_res->deptcode,
               :GP_res->trdate,:GP_res->paycl,:GP_res->payra,:GP_res->e1empno,
               :GP_res->e2empno,:GP_res->e1existyn,:GP_res->e2existyn,:GP_res->reconyn,
               :GP_res->pstate
          FROM PEHREMAS
         WHERE rabasdate = :Erabasdate
           and empno = :strEmpno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select empno ,jobgun ,orgnum ,deptcode ,trdate ,paycl ,p\
ayra ,e1empno ,e2empno ,e1existyn ,e2existyn ,reconyn ,pstate into :b0,:b1,:b\
2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12  from PEHREMAS where (rabasdate=\
:b13 and empno=:b14)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1188;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&(GP_res->empno);
    sqlstm.sqhstl[0] = (unsigned long )7;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_res->jobgun);
    sqlstm.sqhstl[1] = (unsigned long )5;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_res->orgnum);
    sqlstm.sqhstl[2] = (unsigned long )6;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&(GP_res->deptcode);
    sqlstm.sqhstl[3] = (unsigned long )8;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&(GP_res->trdate);
    sqlstm.sqhstl[4] = (unsigned long )11;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_res->paycl);
    sqlstm.sqhstl[5] = (unsigned long )6;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&(GP_res->payra);
    sqlstm.sqhstl[6] = (unsigned long )6;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&(GP_res->e1empno);
    sqlstm.sqhstl[7] = (unsigned long )7;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&(GP_res->e2empno);
    sqlstm.sqhstl[8] = (unsigned long )7;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&(GP_res->e1existyn);
    sqlstm.sqhstl[9] = (unsigned long )4;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)&(GP_res->e2existyn);
    sqlstm.sqhstl[10] = (unsigned long )4;
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)&(GP_res->reconyn);
    sqlstm.sqhstl[11] = (unsigned long )4;
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)&(GP_res->pstate);
    sqlstm.sqhstl[12] = (unsigned long )5;
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)&Erabasdate;
    sqlstm.sqhstl[13] = (unsigned long )11;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)strEmpno;
    sqlstm.sqhstl[14] = (unsigned long )0;
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



    if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
    {
        STRINIT(&logText);
        sprintf(logText, "PEHREMAS TABLE READ FAIL!! [%s]", SQLERRM);
        return 0;
    }
    return 1;
}

// 31.04
// 현보임여부 체크 & 수정
void Payrayn_Check(void)
{
    /* EXEC SQL BEGIN DECLARE SECTION; */ 

        /* varchar codename[20+1]; */ 
struct { unsigned short len; unsigned char arr[21]; } codename;

    /* EXEC SQL END DECLARE SECTION; */ 

    char strPayra[3+1];
    char strRet[30+1];

    STRINIT(&strPayra);
    VC2STR(strPayra, GP_anno->payra);
    //dsa2000  2018.08.   2008년 직책변경 후 미반영되었던 보임관련 로직 정리.
    //팀장(?)이상 직책은 기존 보임일이 없으면 업데이트 : 중간에 보임해제로 팀원으로 발령시 보임일 삭제.
    //겸무/겸직/파견부서 직책(AdPayra)이 팀장(?) 이상이면 근무부서보임여부만 Y / 보임일은 미반영.
    if ((strcmp(GP_mas->empno.arr, "") == 0) && (strncmp(GP_anno->empno.arr, "M", 1) == 0)) //신규임원이면 발령일을 보임일로.
    {
        STR2VCCOPY(GP_mas->payrayn, "Y");
        STR2VCCOPY(GP_mas->jobpayrayn, "Y");
        VC2VC(GP_mas->cpayradate, GP_anno->anfrdate);
    }
    else if (strncmp(GP_anno->empno.arr, "M", 1) == 0)  //기존임원
    {
        STR2VCCOPY(GP_mas->payrayn, "Y");
        STR2VCCOPY(GP_mas->jobpayrayn, "Y");
    }
    else if (strncmp(GP_anno->payra.arr, "C1", 2) <= 0) //소속직책기준
    {
        STR2VCCOPY(GP_mas->payrayn, "Y");
        //신규 보임자면 업데이트, 기존 보임자면 기존일자 유지. (단, 이후 연속적인 보임자는 보임해제 발령없이 발령작업이 이루어져야 함).
        if (strcmp(GP_mas->cpayradate.arr, "") == 0)
            VC2VC(GP_mas->cpayradate, GP_anno->anfrdate);
        //업적평가마스터 반영 : 발령후 보임자라도 겸직,직무대리,대행,호봉관련 발령일 경우에는 업적평가에 영향이 없다.
        if((strncmp(GP_anno->ancode.arr, "23", 2) != 0) && (strncmp(GP_anno->ancode.arr, "24", 2) != 0) && 
           (strncmp(GP_anno->ancode.arr, "34", 2) != 0) && (strcmp(GP_anno->ancode.arr, "311") != 0) && 
           (strcmp(GP_anno->ancode.arr, "322") != 0) && (strncmp(GP_anno->ancode.arr, "33", 2) != 0))
            STR2VCCOPY(GP_res->reconyn, "N");
    }
    else  // 발령후 팀원이면
    {
        STR2VCCOPY(GP_mas->payrayn, "N");
        //STR2VCCOPY(GP_mas->jobpayrayn, "N");
        STR2VCCOPY(GP_mas->cpayradate, "");        
        
        STR2VCCOPY(GP_res->reconyn, "Y");   //업적평가마스터 반영                
        if(strcmp(GP_res->pstate.arr, "") == 0) STR2VCCOPY(GP_res->pstate, "10");
        
        if((strncmp(GP_anno->empno.arr, "Y", 1) != 0) && (strncmp(GP_anno->empno.arr, "P", 1) != 0) &&
           (strcmp(GP_anno->paycl.arr, "H10") != 0) &&   //dsa2000 2017.01.05. J사번 숫자사번으로 변경에 따른 수정
           (strcmp(GP_res->empno.arr, "") == 0))         //기존 업적평가대상화일에 존재하지 않았던 사원
        {
            if (strcmp(Eanupdyn.arr, "Y") == 0)
            {   /* Log출력 위한 발령내용 조회 */
                STRINIT(&codename);
                /* EXEC SQL SELECT CODENAME INTO :codename FROM PYCCODE WHERE CODEID = 'I300' AND CODENO = :GP_anno->ancode; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "select CODENAME into :b0  from PYCCODE where\
 (CODEID='I300' and CODENO=:b1)";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )1263;
                sqlstm.selerr = (unsigned short)0;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)&codename;
                sqlstm.sqhstl[0] = (unsigned long )23;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->ancode);
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


    
                STRINIT(&logText);
                sprintf(logText, "업적평가 신규추가! 발령번호[%s]발령내용[%s:%s]사원번호[%s]성명[%s]", 
                        GP_anno->annono.arr, GP_anno->ancode.arr, codename.arr, GP_anno->empno.arr, GP_anno->korname.arr);
                logWrite(logText);
            }
        }
    }

    //if ((strncmp(GP_anno->empno.arr, "M", 1) != 0) && (strcmp(GP_anno->adpayra.arr, "") != 0) &&(strncmp(GP_anno->adpayra.arr, "C1", 2) <= 0))
    if ( (strcmp(GP_anno->adpayra.arr, "") != 0) &&     
         (strncmp(GP_anno->adpayra.arr,"C12",3) != 0) &&
         (strncmp(GP_anno->adpayra.arr,"A11",3) >= 0) &&
         (strncmp(GP_anno->adpayra.arr,"C20",3) <= 0))     //dsa2000  2018.11. CL를 제외한 PO까지 근무부서보임자  
    {
        STR2VCCOPY(GP_mas->jobpayrayn, "Y");     if (DEBUG) printf("test91, adpayra[%s],jobpayrayn[%s]\n", GP_anno->adpayra.arr, GP_mas->jobpayrayn.arr);
    }
    
    VC2VC(GP_res->payra, GP_anno->payra);
    VC2VC(GP_res->paycl, GP_anno->paycl);

    if (strcmp(GP_anno->addeptcode.arr, "") != 0)
    if ((strcmp(GP_mas->deptcode.arr, GP_anno->deptcode.arr) != 0) ||
        (strcmp(GP_mas->orgnum.arr, GP_anno->orgnum.arr) != 0) ||
        (strcmp(GP_mas->payra.arr, GP_anno->payra.arr) != 0))   
    {   
        STRINIT(&strRet);
        //현직책명 : 직책명라이브러리
        strcpy(strRet, Paydunm_Check((char *)GP_anno->deptcode.arr, (char *)GP_anno->orgnum.arr, 
                                     (char *)GP_anno->payra.arr, (char *)GP_anno->paycl.arr, (char *)GP_mas->payrayn.arr));         
        STR2VCCOPY(GP_mas->paydunm, strRet);
    }
}

/* 직책명 구하기 */
char *Paydunm_Check(char *sDept, char *sOrgnum, char *sPayra, char *sPaycl, char *sPayrayn)
{
    char deptAbbr[30+1];
    char strDeptAbbr[30+1];
    char strpaydunm[30+1];

    // 임원중 보임이 있으면 직책은 ''
    if (((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) < 0) && (strncmp(sPaycl, "0", 1) == 0)) || //s4 -> BAND
        ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && (strncmp(sPaycl, "A", 1) == 0)))
    {
        if (strcmp(sPayrayn, "Y") == 0) return "";
    }
    else    //직대이후,부장,차장,등의 직책은 ''
    {
        if (((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) < 0) && (strncmp(sPayra, "1", 1) != 0) &&
             (strncmp(sPayra, "2", 1) != 0) && (strncmp(sPayra, "3", 1) != 0) &&
             (strncmp(sPayra, "4", 1) != 0) && (strncmp(sPayra, "5", 1) != 0)) ||
            ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && (strncmp(sPayra, "C", 1) > 0)))
            return "";
    }
    STRINIT(&deptAbbr);
    STRINIT(&strDeptAbbr);
    STRINIT(&strpaydunm);

    /* EXEC SQL
        SELECT DEPTABBR
          INTO :deptAbbr
          FROM PYCDEPT                                                 
         WHERE DEPTCODE = :sDept
           AND ORGNUM   = :sOrgnum; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select DEPTABBR into :b0  from PYCDEPT where (DEPTCODE=:\
b1 and ORGNUM=:b2)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1286;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)deptAbbr;
    sqlstm.sqhstl[0] = (unsigned long )31;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)sDept;
    sqlstm.sqhstl[1] = (unsigned long )0;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)sOrgnum;
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



    if ((SQLCODE != SQL_OK) || (SQLCODE == SQL_NO_DATA))
    {
            STRINIT(&logText);
            sprintf(logText, "부서코드[%s]차수[%s] 조회 실패(Paydunm_Check)", sDept, sOrgnum);
            logWrite(logText);
            return "";
    }
    else 
    {   //직책명 구하기
        hinsa_rtrim(deptAbbr);
        if ( ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) <  0) && ((strncmp(sPayra, "1", 1) == 0) || (strncmp(sPayra, "2", 1) == 0) || (strncmp(sPayra, "4", 1) == 0) || (strncmp(sPaycl, "0", 1) == 0))) || 
             ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && ((strncmp(sPayra, "A51", 3) >= 0) && (strncmp(sPayra, "C11",3) <= 0) || (strncmp(sPaycl, "A", 1) != 0))) )
        {
            if ((strncmp(sPayra, "03", 2) == 0) || (strncmp(sPayra, "2B5", 3) == 0) ||
                (strncmp(sPayra, "A21", 3) == 0) || (strncmp(sPayra, "A91", 3) == 0))
                strcpy(strDeptAbbr, deptAbbr);
            else
                sprintf(strDeptAbbr, "%s장", deptAbbr);
        }
        else
        {
            if (strncmp(sPayra, "C51", 3) == 0)
                sprintf(strDeptAbbr, "%s PL", deptAbbr);
            else if (strncmp(sPayra, "C15", 3) == 0)
                sprintf(strDeptAbbr, "%s장직대", deptAbbr);
        }       
    }
    // -------------------------------------------------------------------------------
    //    버전    수정일    수정자   관련근거                 수정내용
    //    31.10  2000.12.21 윤형식  직책명에러수정         영문자와 한글 혼합일때 copy관련 에러 수정
    // -------------------------------------------------------------------------------
    if (strlen(strDeptAbbr) > 0)
    {   if (DEBUG) printf("test81,직책명[%s]\n", strDeptAbbr);
        STRINIT(&strpaydunm);
        if(((strDeptAbbr[30] >= 'a') && (strDeptAbbr[30] <= 'z')) ||
           ((strDeptAbbr[30] >= 'A') && (strDeptAbbr[30] <= 'Z')) || ((strDeptAbbr[30] == ' ')))
            strncpy(strpaydunm, strDeptAbbr, 30); //영문이나 공백이면 30자리 복사
        else
            strncpy(strpaydunm, strDeptAbbr, 29);
    }
    return strpaydunm;
}

/* 차수및 부서변경 처리 */
void Deptcode_Check()
{
    /* ORGNUM 비교 2002.01.09 SHM */
    if(strcmp(GP_mas->orgnum.arr, GP_anno->orgnum.arr) != 0)
    {
        QdeptDisp();        //현소속부문,재무부서 임시변수 :발령후차수,부서로 부서코드화일에서 읽어서 저장
        if (((strcmp(GP_anno->ancode.arr, "211") == 0) && (strcmp(GP_anno->andetcode.arr, "12") == 0)) ||
           ((strcmp(GP_anno->ancode.arr, "995") == 0) && (strcmp(GP_anno->andetcode.arr, "12") == 0)) ||
           (strcmp(GP_anno->ancode.arr, "935") == 0))
        {
            VC2VC(GP_mas->offtrdate, GP_anno->anfrdate);
        }
        else
        {
            if (((strcmp(GP_anno->ancode.arr, "211") == 0) && (strcmp(GP_anno->andetcode.arr, "11") == 0)) ||
                ((strcmp(GP_anno->ancode.arr, "211") == 0) && (strcmp(GP_anno->andetcode.arr, "13") == 0)))
            {
                VC2VC(GP_mas->offtrdate, GP_anno->anfrdate);
                VC2VC(GP_mas->realtrdate, GP_anno->anfrdate);
            }
            else
            {
                if(strcmp(GP_anno->ancode.arr, "935") != 0)
                {
                    VC2VC(GP_mas->offtrdate, GP_anno->anfrdate);
                    VC2VC(GP_res->trdate, GP_anno->anfrdate);
                    STR2VCCOPY(GP_res->e1existyn, "N");
                    STR2VCCOPY(GP_res->e2existyn, "N");
                }
            }
        }
    }
    /* 발령전후 부서가 다르면.. */
    //부서(인사마스터) <> 발령후 부서(발령화일)
    if (strcmp(GP_mas->deptcode.arr, GP_anno->deptcode.arr) != 0)
    {
        QdeptDisp();    //정규용 추가
        if (((strcmp(GP_anno->ancode.arr, "211") == 0) && (strcmp(GP_anno->andetcode.arr, "12") == 0)) ||
           ((strcmp(GP_anno->ancode.arr, "995") == 0) && (strcmp(GP_anno->andetcode.arr, "12") == 0)))
        {
            VC2VC(GP_mas->offtrdate, GP_anno->anfrdate);
        }
        else
        {
            if (((strcmp(GP_anno->ancode.arr, "211") == 0) && (strcmp(GP_anno->andetcode.arr, "11") == 0)) ||
                ((strcmp(GP_anno->ancode.arr, "211") == 0) && (strcmp(GP_anno->andetcode.arr, "13") == 0)))
            {
                VC2VC(GP_mas->lseplace, GP_anno->mark1);             //사내공모전보시 data관리를 위해.최준영씨 요청 2002.02.01 shm
                VC2VC(GP_mas->realtrdate, GP_anno->anfrdate);
            }
        }
        if (strcmp(GP_anno->ancode.arr, "411") != 0)
            VC2VC(GP_mas->jobdept, GP_anno->deptcode);  // 근무부서할당.
    }
    VC2VC(GP_res->orgnum, GP_anno->orgnum);
    VC2VC(GP_res->deptcode, GP_anno->deptcode);

    if(strcmp(GP_res->trdate.arr, "") == 0)
        VC2VC(GP_res->trdate, GP_mas->realtrdate);
}

/* 부서코드의 정보를 찾아서 Record에 저장 */
void QdeptDisp()
{
    char fieldCode[3+1];
    char finCode[6+1];
    char bonCode[5+1];

    STRINIT(&fieldCode);
    STRINIT(&finCode);
    STRINIT(&bonCode);

    /* EXEC SQL
        SELECT FIELDCODE,FINCODE,BONCODE
          INTO :fieldCode, :finCode, :bonCode
          FROM PYCDEPT
         WHERE DEPTCODE = :GP_anno->deptcode
           AND ORGNUM = :GP_anno->orgnum; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select FIELDCODE ,FINCODE ,BONCODE into :b0,:b1,:b2  fro\
m PYCDEPT where (DEPTCODE=:b3 and ORGNUM=:b4)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1313;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)fieldCode;
    sqlstm.sqhstl[0] = (unsigned long )4;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)finCode;
    sqlstm.sqhstl[1] = (unsigned long )7;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)bonCode;
    sqlstm.sqhstl[2] = (unsigned long )6;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&(GP_anno->deptcode);
    sqlstm.sqhstl[3] = (unsigned long )9;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&(GP_anno->orgnum);
    sqlstm.sqhstl[4] = (unsigned long )6;
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



    if ((SQLCODE != SQL_OK) || (SQLCODE == SQL_NO_DATA))
    {
        STRINIT(&logText);
        sprintf(logText, "부서코드[%s]차수[%s] 조회 실패(Qdeptdisp)", GP_anno->deptcode.arr, GP_anno->orgnum.arr);
        logWrite(logText);
    }
    else
    {
        STR2VCCOPY(GP_mas->fieldcode, fieldCode);
        STR2VCCOPY(GP_mas->fincode, finCode);
        STR2VCCOPY(GP_mas->boncode, bonCode);
    }
}

/* 현직무대리일 to를 구한다 */
void Payra_check()
{

    /* 직급전환, 직급조정, 직무대리해제 2003.11.27 정규용추가 */
    if ((strcmp(GP_anno->ancode.arr, "342") == 0) || (strcmp(GP_anno->ancode.arr, "343") == 0) ||
        (strcmp(GP_anno->ancode.arr, "328") == 0))
    {
        if (strcmp(GP_anno->ancode.arr, "328") == 0)
        {
            if (((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) < 0) && 
                 (strcmp(hinsa_copy((char *)GP_mas->payra.arr, 2, 1), "5", 1) == 0) &&
                 (strncmp(GP_anno->payra.arr, "3", 1) != 0) && (strncmp(GP_anno->payra.arr, "5", 1) != 0)) ||
                ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && (strcmp(GP_mas->payra.arr, "D11") == 0) &&
                 (strcmp(GP_anno->payra.arr, "C15") != 0)))
                STR2VCCOPY(GP_mas->reppaytodate, DateCalc(1, (char *)GP_anno->anfrdate.arr, "")); // 현직무대리일 To 할당
        }
    }
    else
    {
        if (strcmp(GP_mas->payra.arr, GP_anno->payra.arr) != 0)
        {
            if (((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) < 0) &&
                ((strncmp(GP_mas->payra.arr, "3", 1) == 0) || (strncmp(GP_mas->payra.arr, "5", 1) == 0)) &&
                (strncmp(GP_anno->payra.arr, "3", 1) != 0) && (strncmp(GP_anno->payra.arr, "5", 1) != 0)) ||
               ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && (strcmp(GP_mas->payra.arr, "C15") == 0) &&
                (strcmp(GP_anno->payra.arr, "C15") != 0)))
                STR2VCCOPY(GP_mas->reppaytodate, DateCalc(1, (char *)GP_anno->anfrdate.arr, "")); // 직위첫자리가 '3',5' (직무대리직급)면 현직무대리일 To 할당
        }
    }
}

/* 날짜 계산 공통 함수 */
char *DateCalc(int iparm, char *date1, char *date2)
{
    int  iYY = 0;
    int  iMM = 0;
    int  iDD = 0;
    int  calcDay = 0;
    char calcDate[8+1]; /* 날짜 계산 결과 Return */

    STRINIT(&calcDate);
    if((iparm == 0) || (iparm == 2))
    {
        /* EXEC SQL 
            SELECT FLOOR(months / 12) AS years, MOD(months, 12) AS months, 
                   GREATEST(TO_DATE(:date2,'YYYYMMDD') - ADD_MONTHS(TO_DATE(:date1,'YYYYMMDD'), months), 0) + 1 AS days 
              INTO :iYY, :iMM, :iDD
              FROM(SELECT FLOOR(MONTHS_BETWEEN(TO_DATE(:date2, 'YYYYMMDD'), TO_DATE(:date1, 'YYYYMMDD'))) AS months FROM dual); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select FLOOR((months/12)) years ,MOD(months,12) mont\
hs ,(GREATEST((TO_DATE(:b0,'YYYYMMDD')-ADD_MONTHS(TO_DATE(:b1,'YYYYMMDD'),mon\
ths)),0)+1) days into :b2,:b3,:b4  from (select FLOOR(MONTHS_BETWEEN(TO_DATE(\
:b0,'YYYYMMDD'),TO_DATE(:b1,'YYYYMMDD'))) months  from dual ) ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1348;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)date2;
        sqlstm.sqhstl[0] = (unsigned long )0;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)date1;
        sqlstm.sqhstl[1] = (unsigned long )0;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&iYY;
        sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&iMM;
        sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         short *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned long )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (unsigned char  *)&iDD;
        sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         short *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned long )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (unsigned char  *)date2;
        sqlstm.sqhstl[5] = (unsigned long )0;
        sqlstm.sqhsts[5] = (         int  )0;
        sqlstm.sqindv[5] = (         short *)0;
        sqlstm.sqinds[5] = (         int  )0;
        sqlstm.sqharm[5] = (unsigned long )0;
        sqlstm.sqadto[5] = (unsigned short )0;
        sqlstm.sqtdso[5] = (unsigned short )0;
        sqlstm.sqhstv[6] = (unsigned char  *)date1;
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


                
        if (iparm == 0)     //date1, date2의 차이를 년,월,일로 Return (예. date1:20170101, date2:20180202이면 "010101"를 RETURN)
            sprintf(calcDate, "%02d%02d%02d", iYY, iMM, iDD);
        else 
        {
            if (iDD >= 15)
            {
                iMM ++;
                if (iMM == 12)
                {
                    iMM = 0;
                    iYY ++;
                }
            }
            sprintf(calcDate, "%02d%02d", iYY, iMM); //date1, date2의 차이를 년,월로 Return (02년03개월12일 차이)
        }
    }  
    else if (iparm == 1) /* DATE1 -1을 전역변수로 리턴 */
    {
        /* EXEC SQL 
            SELECT TO_CHAR(TO_DATE(:date1, 'yyyymmdd') - 1, 'yyyymmdd')
              INTO :calcDate
              FROM DUAL; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select TO_CHAR((TO_DATE(:b0,'yyyymmdd')-1),'yyyymmdd\
') into :b1  from DUAL ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1391;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)date1;
        sqlstm.sqhstl[0] = (unsigned long )0;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)calcDate;
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


    }
    else if(iparm == 3) /* DATE2 - DATE1의 차이를 전역변수로 리턴 */
    {
        /* EXEC SQL 
            SELECT TO_DATE(:date2, 'yyyymmdd') - TO_DATE(:date1, 'yyyymmdd')
              INTO :calcDay
              FROM DUAL; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select (TO_DATE(:b0,'yyyymmdd')-TO_DATE(:b1,'yyyymmd\
d')) into :b2  from DUAL ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1414;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)date2;
        sqlstm.sqhstl[0] = (unsigned long )0;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)date1;
        sqlstm.sqhstl[1] = (unsigned long )0;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&calcDay;
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



        sprintf(calcDate, "%d", calcDay);
    }
    
    return calcDate;
}

/* 발령구분별 작업 처리 */
void Ancode_Check()
{
    char strCopy[40+1]; //Parsing대상 문자열
    char strPas[40+1];  //Parsing결과 문자열
    char strRet[30+1];

    // 신규채용일 경우
    if (strcmp(GP_anno->ancode.arr, "111") == 0)
    {
        //신규채용일경우
        //현전보일,현조직전보일,현입사일,현직급일,현직군일,현직렬일,최초입사일 : 발령일 From
        //현입사직급,현입사호봉 : 후직급,후호봉
        //현입사구분 : 발령세부구분
        VC2VC(GP_mas->empcode, GP_anno->andetcode);      //발령세부 구분             
        VC2VC(GP_mas->realtrdate, GP_anno->anfrdate);    //발령일 -> 전보일           
        VC2VC(GP_mas->offtrdate, GP_anno->anfrdate);     //발령일 -> 조직전보일       
        VC2VC(GP_mas->empdate, GP_anno->anfrdate);       //발령일 -> 최초입사일       
        VC2VC(GP_mas->orgempdate, GP_anno->anfrdate);    //발령일 -> 입사일(하나로)   
        VC2VC(GP_mas->paycldate, GP_anno->anfrdate);     //발령일 -> 직급일           
        VC2VC(GP_mas->jobgundate, GP_anno->anfrdate);    //발령일 -> 직군일           
        VC2VC(GP_mas->emppaycl, GP_anno->paycl);                                      
        VC2VC(GP_mas->jobpayra, GP_anno->payra);         //31.14 2001.08.31 shm 추가  
        //30.00     98.12.31    김혜진    호봉,직렬 삭제.     하나로신인사재개발
        //=====================================================================
        //Mas.emppaygr   := FormatFloat('00',Qanno.FieldByName('paygr').AsFloat);
        //Mas.empjobline := Qanno.FieldByName('jobline').AsString;
        //Mas.joblinedate:= Qanno.FieldByName('anfrdate').AsString;
        //31.04  신규채용 화일 write, - Res : 평가.
        STR2VCCOPY(GP_res->reconyn, "N");
        STR2VCCOPY(GP_res->prjexcode, "1");
        //2014.12.10.hjku.. I사번 체크는 사번으로.. 오류로 인해 변경..
        //if  copy(Qanno.FieldByName('ancode').AsString,1,1) = 'I' then   //I사번 체크 2007.06.04 shm
        if (strncmp(GP_anno->empno.arr, "I", 1) == 0)
            STR2VCCOPY(GP_res->pstate, "82");
        else
            STR2VCCOPY(GP_res->pstate, "10");
        VC2VC(GP_res->deptcode, GP_anno->deptcode);
        VC2VC(GP_res->orgnum, GP_anno->orgnum);
        VC2VC(GP_res->payra, GP_anno->payra);
        VC2VC(GP_res->paycl, GP_anno->paycl);
        STR2VCCOPY(GP_res->e1empno, "");
        STR2VCCOPY(GP_res->e2empno, "");
        STR2VCCOPY(GP_res->e1existyn, "N");
        STR2VCCOPY(GP_res->e2existyn, "N");
    }
    // 보임해제및 직무대리해제인 경우
    if ((strcmp(GP_anno->ancode.arr, "228") == 0) || (strcmp(GP_anno->ancode.arr, "328") == 0))
    {
        STR2VCCOPY(GP_mas->jobpayrayn, "N");
        STR2VCCOPY(GP_mas->payrayn, "N");
    }
    // 전보,전입일경우
    if ((strcmp(GP_anno->ancode.arr, "211") == 0) || (strcmp(GP_anno->ancode.arr, "251") == 0))
    {
        STR2VCCOPY(GP_mas->pstateyn, "Y");  // 현인사상태 : 재직(10),현현원포함여부 :'Y'
        if (strcmp(GP_anno->ancode.arr, "251") == 0) //전입
        {
            VC2VC(GP_mas->orgempdate, GP_anno->anfrdate);
            STR2VCCOPY(GP_mas->pstate, "10");
            //31.04  신규채용 화일 write,
            STR2VCCOPY(GP_res->reconyn, "N");
            STR2VCCOPY(GP_res->prjexcode, "1");
            VC2VC(GP_res->deptcode, GP_anno->deptcode);
            VC2VC(GP_res->orgnum, GP_anno->orgnum);
            VC2VC(GP_res->payra, GP_anno->payra);
            VC2VC(GP_res->paycl, GP_anno->paycl);
            STR2VCCOPY(GP_res->e1empno, "");
            STR2VCCOPY(GP_res->e2empno, "");
            STR2VCCOPY(GP_res->e1existyn, "N");
            STR2VCCOPY(GP_res->e2existyn, "N");
        }
        if (strncmp(GP_anno->andetcode.arr, "3", 1) == 0) //세부구분이 교육
        {
            /*현교육구분 : 발령세부구분,현교육기관,현교육과정 : 비고사항을 ","로 분리하여 차례대로 저장
              현교육기관 From,To,현교육지역 : 비고사항을 ","로 분리하여 차례대로저장
              현연락처 : 비고 3
              현인사상태 : 발령세부구분 
              현원포함여부 : 파견/교육훈련포함여부 */
            STR2VCCOPY(GP_mas->edugubun, PasString((char *)GP_anno->mark3.arr,',',2));  //Mark3 Parsing
            STR2VCCOPY(GP_mas->educont, PasString((char *)GP_anno->mark3.arr,',',1));   
            STR2VCCOPY(GP_mas->eduplace, PasString((char *)GP_anno->mark1.arr,',',1));  //Mark1 Parsing
            STR2VCCOPY(GP_mas->educourse, PasString((char *)GP_anno->mark1.arr,',',2)); 
            STR2VCCOPY(GP_mas->edufrdate, PasString((char *)GP_anno->mark2.arr,',',1)); //Mark2 Parsing
            STR2VCCOPY(GP_mas->edutodate, PasString((char *)GP_anno->mark2.arr,',',2)); 
            STR2VCCOPY(GP_mas->eduarea, PasString((char *)GP_anno->mark2.arr,',',3));   
            VC2VC(GP_mas->pstate, GP_anno->andetcode);
            VC2VC(GP_mas->pstateyn, edupstateyn);  // 파견/교육현원포함여부
            VC2VC(GP_mas->edudufrdate, GP_anno->hofrdate);
            VC2VC(GP_mas->edudutodate, GP_anno->hotodate);
            STR2VCCOPY(GP_res->e1existyn, "Y");
            STR2VCCOPY(GP_res->e2existyn, "Y");
            VC2VC(GP_res->e1empno, Eempno);
            STR2VCCOPY(GP_res->e2empno, "");
            VC2VC(GP_res->pstate, GP_anno->andetcode);
            VC2VC(GP_res->deptcode, Edeptcode);
        }
    }
    // 겸직일 경우
    if (strcmp(GP_anno->ancode.arr, "233") == 0)
    {
        //현겸직직책명 : 직책명 lib(후부서(발령사항부서),겸직부서,겸직직위)
        //현겸직일 from,to : 발령일 from,to
        STRINIT(&strRet);
        strcpy(strRet, Paydunm_Check((char *)GP_anno->addeptcode.arr, (char *)GP_anno->orgnum.arr, 
                                     (char *)GP_anno->adpayra.arr, (char *)GP_anno->paycl.arr, (char *)GP_mas->payrayn.arr));
        STR2VCCOPY(GP_mas->apdpaydunm, strRet);
        VC2VC(GP_mas->apdpayfrdate, GP_anno->anfrdate);
        VC2VC(GP_mas->apdpaytodate, GP_anno->antodate);
    }
    // 겸직해제일 경우
    if (strcmp(GP_anno->ancode.arr, "238") == 0)
    {
        //현겸직일 to : 발령일 from을 1일 감소한다..}
        //Mas.apdpaytodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
        // 임현수대리님의 요청으로 겸직정보 삭제..CH.K.J. 수정(2005.11.21.)
        STR2VCCOPY(GP_mas->apdpaydunm, "");
        STR2VCCOPY(GP_mas->apdpayfrdate, "");
        STR2VCCOPY(GP_mas->apdpaytodate, "");
    }
    // 직무대행일 경우
    if (strcmp(GP_anno->ancode.arr, "243") == 0)
    {
        //현직무대행직책명 : 직책명 lib(대행부서,후차수,대행직위)
        //현직무대행일 from,to : 발령일 from,to
        STRINIT(&strRet);
        strcpy(strRet, Paydunm_Check((char *)GP_anno->addeptcode.arr, (char *)GP_anno->orgnum.arr, 
                                     (char *)GP_anno->adpayra.arr, (char *)GP_anno->paycl.arr, (char *)GP_mas->payrayn.arr));         
        STR2VCCOPY(GP_mas->actpaydunm, strRet);
        VC2VC(GP_mas->actpayfrdate, GP_anno->anfrdate);
        VC2VC(GP_mas->actpaytodate, GP_anno->antodate);
    }
    // 직무대행해제일 경우
    if (strcmp(GP_anno->ancode.arr, "248") == 0)
    {
        //현겸직일 to : 발령일 from을 1일 감소한다..}
        // Mas.actpaytodate := DateCal1(Qanno.FieldByName('anfrdate').AsString);
        // 임현수대리님의 요청으로 겸직정보 삭제..CH.K.J. 수정(2005.11.21.)
        STR2VCCOPY(GP_mas->actpaydunm, "");
        STR2VCCOPY(GP_mas->actpayfrdate, "");
        STR2VCCOPY(GP_mas->actpaytodate, "");
    }
    // 승격일 경우
    if ((strcmp(GP_anno->ancode.arr, "311") == 0) ||
        (strcmp(GP_anno->ancode.arr, "123") == 0))      //임원승격 2001.07.20 shm
    {
        //현승격일,현직급일 : 발령일 from
        VC2VC(GP_mas->cpaycldate, GP_anno->anfrdate);
        VC2VC(GP_mas->paycldate, GP_anno->anfrdate);
    }
    // 직무대리일 경우
    if (strcmp(GP_anno->ancode.arr, "322") == 0)
    {
        //현직무대리직급,현직무대리일 From : 후직급,발령일 from
        /*안써요
        Mas.reppaycl     := copy(Qanno.FieldByName('payra').AsString,1,1)+
                            copy(Qanno.FieldByName('paycl').AsString,2,1); */
        VC2VC(GP_mas->reppayfrdate, GP_anno->anfrdate);
    }
    // 승급/승호일 경우
    if (strncmp(GP_anno->ancode.arr, "33", 2) == 0)
    {
        //현최종장기승호일 : 발령일 from   //장기호봉.
        if (GP_anno->lpaygr > 0)
            VC2VC(GP_mas->lragrdate, GP_anno->anfrdate);
    }
    // 급호조정일 경우
    if (strcmp(GP_anno->ancode.arr, "341") == 0)
    {
        if (strcmp(GP_anno->hofrdate.arr, "") != 0)
        {
            VC2VC(GP_mas->cpaycldate, GP_anno->hofrdate);
            VC2VC(GP_mas->paycldate, GP_anno->hofrdate);
        }
        if (strcmp(GP_anno->hotodate.arr, "") != 0)
            VC2VC(GP_mas->lragrdate, GP_anno->hotodate);
    }
    /* 31.00   98.12.31     김혜진   직급전환발령    하나로신인사재개발
       31.06  2000.01.26    강기우   직급조정발령      ''
    ========================================================================
      현직급,직위 : 발령후직급,직위
      휴직중휴가일from이 null이 아니면
        현직급일,승격일 : 휴직중휴가일from
    */
    // 직급전환(342), 직급조정(343)일 경우
    if ((strcmp(GP_anno->ancode.arr, "342") == 0) ||
        (strcmp(GP_anno->ancode.arr, "343") == 0)) 
    {
        VC2VC(GP_mas->paycl, GP_anno->paycl);
        VC2VC(GP_mas->payra, GP_anno->payra);
        if (strcmp(GP_anno->hofrdate.arr, "") != 0)
        {
            VC2VC(GP_mas->paycldate, GP_anno->hofrdate);
            VC2VC(GP_mas->cpaycldate, GP_anno->hofrdate);
        }
    }
    // 호봉조정일 경우
    if (strcmp(GP_anno->ancode.arr, "346") == 0)
    {
        //현최종장기승호일 : 휴직중휴가일 To
        if (strcmp(GP_anno->hotodate.arr, "") != 0)
            VC2VC(GP_mas->lragrdate, GP_anno->hotodate);
    }
    // 31.02  99.02.08   김혜진   직급부여발령(355)추가. 하나로신인사재개발
    // 직군부여(355)/직군전환(351)/직렬전환(352)일 경우
    if ((strcmp(GP_anno->ancode.arr, "351") == 0) ||
        (strcmp(GP_anno->ancode.arr, "355") == 0) ||
        (strcmp(GP_anno->ancode.arr, "352") == 0)) 
    {
        //현직군일,현직렬일 : 발령일 From
        if ((strcmp(GP_anno->ancode.arr, "351") == 0) ||
            (strcmp(GP_anno->ancode.arr, "355") == 0))
            VC2VC(GP_mas->jobgundate, GP_anno->anfrdate);
    }
    // 파견일 경우
    if (strcmp(GP_anno->ancode.arr, "411") == 0)
    {
        //현파견구분 : 발령세부구분,현파견기간 : 발령일 From,to,현파견기관 : 비고1
        //현파견목적 : 비고 2,현연락처 : 비고 3
        //근무부서   : 겸직부서(사내파견일경우만)
        //파견시 근무지 근무부서 근무지로 수정. 2002.01.15 shm
        VC2VC(GP_mas->lsekind, GP_anno->andetcode);
        VC2VC(GP_mas->lsefrdate, GP_anno->anfrdate);
        VC2VC(GP_mas->lsetodate, GP_anno->antodate);
        VC2VC(GP_mas->jobdept, GP_anno->deptcode);
        VC2VC(GP_mas->lseplace, GP_anno->mark1);
        VC2VC(GP_mas->lsesayu, GP_anno->mark2);
        if ((strcmp(GP_anno->andetcode.arr, "21") == 0) &&
            (strcmp(GP_anno->adpayra.arr, "") != 0))             //2001.12.05 shm 추가
            VC2VC(GP_mas->jobpayra, GP_anno->adpayra);
        else
            VC2VC(GP_mas->jobpayra, GP_anno->payra);
            
        if (strcmp(GP_anno->andetcode.arr, "24") == 0)          //2001.12.05 shm 자매파견
            STR2VCCOPY(GP_mas->jobpayrayn, "N");
            
//        if (((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) < 0) && (strcmp(GP_anno->adpayra.arr, "2C") == 0)) ||
//           ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && (strcmp(GP_anno->adpayra.arr, "C11") == 0)))        //31.16 정규용
        if ( (strcmp(GP_anno->adpayra.arr, "") != 0) &&     
            (strncmp(GP_anno->adpayra.arr,"C12",3) != 0) &&
            (strncmp(GP_anno->adpayra.arr,"A11",3) >= 0) &&
            (strncmp(GP_anno->adpayra.arr,"C20",3) <= 0))     //CL를 제외한 PO까지 근무부서보임자  dsa2000  2018.11
            STR2VCCOPY(GP_mas->jobpayrayn, "Y");
        else
            STR2VCCOPY(GP_mas->jobpayrayn, "N");
           
        //31.04
        VC2VC(GP_mas->deptcode, GP_anno->addeptcode);
        if (strcmp(GP_anno->adpayra.arr, "") != 0)
            VC2VC(GP_res->payra, GP_anno->adpayra);
        if (strcmp(GP_mas->jobpayra.arr, "") == 0)
            VC2VC(GP_mas->jobpayra, GP_anno->payra);
        if (strcmp(GP_anno->andetcode.arr, "21") == 0)
        {
            VC2VC(GP_mas->jobdept, GP_anno->addeptcode);
            STR2VCCOPY(GP_res->e1existyn, "N");
            STR2VCCOPY(GP_res->e2existyn, "N");
            VC2VC(GP_res->trdate, GP_anno->anfrdate);
        }
        else        //31.04 대외파견등일 경우
        {
            STR2VCCOPY(GP_res->e1existyn, "Y");
            STR2VCCOPY(GP_res->e2existyn, "Y");
            VC2VC(GP_res->e1empno, Eempno);
            STR2VCCOPY(GP_res->e2empno, "");
            VC2VC(GP_res->deptcode, Edeptcode);
            VC2VC(GP_res->trdate, GP_anno->anfrdate);
        }
    }
    // 파견연장일 경우
    if (strcmp(GP_anno->ancode.arr, "412") == 0)
    {
        //현파견구분 : 발령세부구분,현파견기간 : 발령일 to,현파견기관 : 비고1
        //현파견목적 : 비고 2,현연락처 : 비고 3
        //근무부서   : 겸직부서(사내퍄견일경우만)
        VC2VC(GP_mas->lsekind, GP_anno->andetcode);
        VC2VC(GP_mas->lsetodate, GP_anno->antodate);
        VC2VC(GP_mas->lseplace, GP_anno->mark1);
        VC2VC(GP_mas->lsesayu, GP_anno->mark2);

//        if (((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) < 0) && (strcmp(GP_anno->adpayra.arr, "2C") == 0)) ||
//           ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && (strcmp(GP_anno->adpayra.arr, "C11") == 0)))        //31.16 정규용
        if ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && 
            (strcmp(GP_anno->adpayra.arr, "C12") != 0) && (strcmp(GP_anno->adpayra.arr, "C20") <= 0))//CL를 제외한 PO까지 근무부서보임자  dsa2000  2018.11
            STR2VCCOPY(GP_mas->jobpayrayn, "Y");
        else
            STR2VCCOPY(GP_mas->jobpayrayn, "N");
            
        if (strcmp(GP_anno->andetcode.arr, "21") == 0)
            VC2VC(GP_mas->jobdept, GP_anno->addeptcode);
    }
    // 파견복귀일 경우
    if (strcmp(GP_anno->ancode.arr, "414") == 0)
    {
        //현파견기간 to : 발령일을 From 을 1을 감소,
        //실근무부서(JOBDEPT)를 원래부서(DEPTCODE)와 동일하게 변경
        STR2VCCOPY(GP_mas->lsetodate, DateCalc(1, (char *)GP_anno->anfrdate.arr, ""));
        VC2VC(GP_mas->jobdept, GP_anno->deptcode);
        VC2VC(GP_res->deptcode, GP_anno->deptcode);
        VC2VC(GP_res->payra, GP_anno->payra);
        VC2VC(GP_res->trdate, GP_mas->realtrdate);
        STR2VCCOPY(GP_res->e1existyn, "N");
        STR2VCCOPY(GP_res->e2existyn, "N");
    }
    // 휴직일 경우
    if (strcmp(GP_anno->ancode.arr, "511") == 0)
    {
       // 현휴직구분:발령세부구분,현휴직기간 from,to:발령일 from,to,
       // 현휴직중휴가기간 : 휴직중 휴가일 from,to
        VC2VC(GP_mas->lrkind, GP_anno->andetcode);
        VC2VC(GP_mas->lrfrdate, GP_anno->anfrdate);
        VC2VC(GP_mas->lrtodate, GP_anno->antodate);
        VC2VC(GP_mas->lvfrdate, GP_anno->hofrdate);
        VC2VC(GP_mas->lvtodate, GP_anno->hotodate);
        STR2VCCOPY(GP_res->reconyn, "N");
        STR2VCCOPY(GP_res->prjexcode, "3");
        VC2VC(GP_res->prjexfrdate, GP_anno->anfrdate);
        VC2VC(GP_res->prjextodate, GP_anno->antodate);
    }
    // 휴직연장일 경우
    if (strcmp(GP_anno->ancode.arr, "512") == 0)
    {
        // 현휴직구분:발령세부구분,현휴직기간 to:발령일to,
        // 현휴직중휴가기간 : 휴직중 휴가일 from,to
        VC2VC(GP_mas->lrkind, GP_anno->andetcode);
        VC2VC(GP_mas->lrtodate, GP_anno->antodate);
        VC2VC(GP_mas->lvfrdate, GP_anno->hofrdate);
        VC2VC(GP_mas->lvtodate, GP_anno->hotodate);
        STR2VCCOPY(GP_res->reconyn, "N");
        STR2VCCOPY(GP_res->prjexcode, "3");
        VC2VC(GP_res->prjextodate, GP_anno->antodate);
    }
    // 휴직복귀일 경우
    if (strcmp(GP_anno->ancode.arr, "514") == 0)
    {
        // 현휴직기간 to : 발령일을 From 을 1을 감소
        STR2VCCOPY(GP_mas->lrtodate, DateCalc(1, (char *)GP_anno->anfrdate.arr, ""));
        VC2VC(GP_res->deptcode, GP_anno->deptcode);
        VC2VC(GP_res->payra, GP_anno->payra);
        VC2VC(GP_res->paycl, GP_anno->paycl);
        VC2VC(GP_res->trdate, GP_mas->realtrdate);
        STR2VCCOPY(GP_res->e1existyn, "N");
        STR2VCCOPY(GP_res->e2existyn, "N");
    }
    // 징계일 경우
    if (((strcmp(GP_anno->ancode.arr, "600") == 0) && (strcmp(GP_anno->andetcode.arr, "61") == 0)) ||
         (strcmp(GP_anno->ancode.arr, "619") == 0) ||
        ((strcmp(GP_anno->ancode.arr, "600") == 0) && (strcmp(GP_anno->andetcode.arr, "62") == 0)) ||
         (strcmp(GP_anno->ancode.arr, "629") == 0))
    {
        // 현퇴사일,현퇴사사유1,2,현연락처 : 발령일 from,퇴사사유1,2,비고2
        // 현퇴사구분 : 널일겨우 (발령세부구분), 아닐경우 (발령구분 2) 
        VC2VC(GP_mas->retdate, GP_anno->anfrdate);
        if (strcmp(GP_anno->andetcode.arr, "") != 0)
            VC2VC(GP_mas->retgubun, GP_anno->andetcode);
        else
        {
            STRINIT(&strCopy);
            strncpy(strCopy, GP_anno->ancode.arr, 2);
            STR2VCCOPY(GP_mas->retgubun, strCopy);
        }            
        VC2VC(GP_mas->retsayu1, GP_anno->retsayu1);
        VC2VC(GP_mas->retsayu2, GP_anno->retsayu2);
        STR2VCCOPY(GP_res->reconyn, "N");
    }
    // 강직일 경우 : 2009년 로직 미구현

    // 면직/전적일 경우
    if ((strcmp(GP_anno->ancode.arr, "819") == 0) ||
        (strcmp(GP_anno->ancode.arr, "809") == 0))
    {
        // 현퇴사일,현퇴사구분,현퇴사사유1,2,현연락처 : 발령일 from,발령세부구분,퇴사사유1,2,비고2
        if (strcmp(GP_anno->ancode.arr, "809") == 0)
            VC2VC(GP_mas->retdate, GP_anno->anfrdate);
        else
        {
            VC2VC(GP_mas->retdate, GP_anno->anfrdate);
            VC2VC(GP_mas->retgubun, GP_anno->andetcode);
            VC2VC(GP_mas->retsayu1, GP_anno->retsayu1);
            VC2VC(GP_mas->retsayu2, GP_anno->retsayu2);
            STR2VCCOPY(GP_res->reconyn, "N");
        }
    }
    // 임시직에 관한사항
    if ((strcmp(GP_anno->ancode.arr, "121") == 0) ||        // 선임    
        (strcmp(GP_anno->ancode.arr, "124") == 0) ||        // 재선임  
        (strcmp(GP_anno->ancode.arr, "131") == 0) ||        // 계약    
        (strcmp(GP_anno->ancode.arr, "134") == 0) ||        // 재계약  
        (strcmp(GP_anno->ancode.arr, "141") == 0))          // 위촉    
    {
        // 현입사일,현입사직급,현입사호봉,현재임기간from,to,현직렬일,현직군일 :
        // 발령일 from,후직급,후호봉,발령일 from,to,발령일 from,from;
        VC2VC(GP_mas->orgempdate, GP_anno->anfrdate);
        VC2VC(GP_mas->emppaycl, GP_anno->paycl);
        VC2VC(GP_mas->jobpayra, GP_anno->payra);        //31.14 2001.08.31 shm 추가
        VC2VC(GP_mas->jobgundate, GP_anno->anfrdate);
        VC2VC(GP_mas->empcode, GP_anno->andetcode);
        VC2VC(GP_mas->paycldate, GP_anno->anfrdate);
        VC2VC(GP_mas->otdufrdate, GP_anno->anfrdate);
        VC2VC(GP_mas->otdutodate, GP_anno->antodate);
        // 30.08 일반직 자동화.
        if (strncmp(GP_anno->empno.arr, "Y", 1) == 0)
        {
            GP_mas->emppaygr = GP_anno->paygr;
            GP_mas->paygr = GP_anno->paygr;
            
        }
        if ((strcmp(GP_anno->ancode.arr, "131") == 0) ||    // 계약   
            (strcmp(GP_anno->ancode.arr, "134") == 0) ||    // 재계약 
            (strcmp(GP_anno->ancode.arr, "141") == 0))      // 위촉   
        {
            if (strcmp(GP_anno->tcontr.arr, "") != 0)
                VC2VC(GP_mas->tcontr, GP_anno->tcontr);
            //30.08 일반직시 계약금약 '0'처리 허용.
            if ((GP_anno->tcontramt > 0) ||
                ((GP_anno->tcontramt == 0) && (strncmp(GP_anno->empno.arr, "Y", 1) == 0)))
                GP_mas->tcontramt = GP_anno->tcontramt;
            if ((GP_anno->paygr == 0) && (strncmp(GP_anno->empno.arr, "Y", 1) == 0))
                GP_mas->paygr = GP_anno->paygr;             //일반직시 호봉 입력.
            if (strcmp(GP_anno->ttype.arr, "") != 0)
                VC2VC(GP_mas->ttype, GP_anno->ttype);       //근무 형태.
            if (strcmp(GP_anno->tjobduty.arr, "") != 0)
                VC2VC(GP_mas->tjobduty, GP_anno->tjobduty); //일반직(직무 코드)-따로error처리(X)
            if (strcmp(GP_anno->mark1.arr, "") != 0)
                VC2VC(GP_mas->tcond, GP_anno->mark1);       //비고1 - 계약직은 기타조건.
        }
        if ((strcmp(GP_anno->ancode.arr, "121") == 0) ||    // 선임 
            (strcmp(GP_anno->ancode.arr, "131") == 0) ||    // 계약 
            (strcmp(GP_anno->ancode.arr, "141") == 0))      // 위촉 
            VC2VC(GP_mas->empdate, GP_anno->anfrdate);
    }
    // 연임,승진,승진연임,계약연장,계약변경,전환의 경우
    if ((strcmp(GP_anno->ancode.arr, "122") == 0) ||        // 연임
        (strcmp(GP_anno->ancode.arr, "125") == 0) ||        // 승진연임
        (strcmp(GP_anno->ancode.arr, "132") == 0) ||        // 계약연장
        (strcmp(GP_anno->ancode.arr, "711") == 0))          // 계약변경
    {
        // 현재임기간 : 발령일from,to | 계약사항
        VC2VC(GP_mas->otdufrdate, GP_anno->anfrdate);
        if (strcmp(GP_anno->antodate.arr, "") != 0)
            VC2VC(GP_mas->otdutodate, GP_anno->antodate);
        if ((strcmp(GP_anno->ancode.arr, "132") == 0) ||    // 계약연장
            (strcmp(GP_anno->ancode.arr, "711") == 0))      // 계약변경
        {
            if (strcmp(GP_anno->tcontr.arr, "") != 0)
                VC2VC(GP_mas->tcontr, GP_anno->tcontr); //계약 방법.
            //일반직시 계약금약 '0'처리 허용
            if ((GP_anno->tcontramt > 0) ||
                ((GP_anno->tcontramt = 0) && (strncmp(GP_anno->empno.arr, "Y", 1) == 0)))
                GP_mas->tcontramt = GP_anno->tcontramt;
            
            if ((GP_anno->paygr == 0) && (strncmp(GP_anno->empno.arr, "Y", 1) == 0))
                GP_mas->paygr = GP_anno->paygr;          //일반직시 호봉 입력.
            if (strcmp(GP_anno->ttype.arr, "") != 0)
                VC2VC(GP_mas->ttype, GP_anno->ttype);       //근무 형태.
            if (strcmp(GP_anno->tjobduty.arr, "") != 0)
                VC2VC(GP_mas->tjobduty, GP_anno->tjobduty); //일반직(직무 코드)-따로error처리(X)
            if (strcmp(GP_anno->mark1.arr, "") != 0)
                VC2VC(GP_mas->tcond, GP_anno->mark1);       //비고1
        }
    }
    // 해임,계약해지,위촉해지의 경우
    if ((strcmp(GP_anno->ancode.arr, "829") == 0) ||        // 퇴임
        (strcmp(GP_anno->ancode.arr, "849") == 0) ||        // 위촉해지
        (strcmp(GP_anno->ancode.arr, "839") == 0))          // 계약해지
    {
        // 현퇴사일,연락처 : 발령일 from,비고 2
        VC2VC(GP_mas->otdutodate, GP_anno->anfrdate);
        VC2VC(GP_mas->retdate, GP_anno->anfrdate);
        VC2VC(GP_mas->retsayu1, GP_anno->retsayu1);
        VC2VC(GP_mas->retsayu2, GP_anno->retsayu2);
        STR2VCCOPY(GP_res->reconyn, "N");
        if (strcmp(GP_anno->ancode.arr, "829") == 0)
            STR2VCCOPY(GP_mas->retgubun, "95");
        else
            STR2VCCOPY(GP_mas->retgubun, "97");
    }
    // 부서변동의 경우
    if (strcmp(GP_anno->ancode.arr, "712") == 0)
    {
        if (strcmp(GP_anno->tjobduty.arr, "") != 0)
            VC2VC(GP_mas->tjobduty, GP_anno->tjobduty);
    }
    /*-------------------------------------------------------------------------------
        버전    수정일    수정자   관련근거          수정내용
        1.02  1998.4.20   김혜진   전(98.4.11)  계약,재계약,부서변동,계약변경,계약해지
                                                발령에서 파견업체 추가.
     -------------------------------------------------------------------------------*/
    if ((strcmp(GP_anno->ancode.arr, "131") == 0) ||        // 계약
        (strcmp(GP_anno->ancode.arr, "132") == 0) ||        // 계약연장
        (strcmp(GP_anno->ancode.arr, "134") == 0) ||        // 재계약
        (strcmp(GP_anno->ancode.arr, "711") == 0) ||        // 계약변경
        (strcmp(GP_anno->ancode.arr, "712") == 0) ||        // 부서변동
        (strcmp(GP_anno->ancode.arr, "839") == 0))          // 계약해지
    {
        if (strcmp(GP_anno->tcompany.arr, "") != 0)
            VC2VC(GP_mas->tcompany, GP_anno->tcompany);
    }
    // 담당지정 경우
    if (strcmp(GP_anno->ancode.arr, "975") == 0)    // 담당지정 추가 shm 2002.02.28
    {
        VC2VC(GP_mas->paycl, GP_anno->paycl);
        VC2VC(GP_mas->payra, GP_anno->payra);
        STR2VCCOPY(GP_mas->payrayn, "Y");
    }
    // 근무지 읽기..
    /* EXEC SQL SELECT PLACECODE INTO :GP_mas->jobplace 
               FROM PYCDEPT 
              WHERE DEPTCODE = :GP_mas->jobdept 
                AND ORGNUM = :GP_res->orgnum; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select PLACECODE into :b0  from PYCDEPT where (DEPTCODE=\
:b1 and ORGNUM=:b2)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1441;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->jobplace);
    sqlstm.sqhstl[0] = (unsigned long )5;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->jobdept);
    sqlstm.sqhstl[1] = (unsigned long )8;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_res->orgnum);
    sqlstm.sqhstl[2] = (unsigned long )6;
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


    if (SQLCODE != SQL_OK)
    {
        STRINIT(&logText);
        sprintf(logText, "근무지 조회 실패!! 부서코드[%s],차수[%s].", GP_mas->jobdept.arr, GP_res->orgnum.arr);
        logWrite(logText);
    }

    return;
}

//근속제외를 수정한다
int Exdu_Check()
{
    char strAncode[3+1];
    char strDate[8+1];
    char strTodate[8+1];
    char strRet[6+1];
    char strCnt[3+1];
    char sYY[2+1];
    char sMM[2+1];
    char sDD[2+1];

    STRINIT(&logText);
    if ((strcmp(GP_anno->ancode.arr, "511") == 0) || (strcmp(GP_anno->ancode.arr, "512") == 0))
    {
        if ((strcmp(GP_anno->andetcode.arr, "71") == 0) ||              //공상휴직 or (병역휴직 and 1994년이후자)이거나...  --하나로 통신중.
            ((strcmp(GP_anno->andetcode.arr, "73") == 0) && (strcmp(GP_anno->anfrdate.arr, "19940915") >= 0)) ||
            ((strcmp(GP_anno->andetcode.arr, "76") == 0) && (strcmp(GP_anno->anfrdate.arr, "19961118") >= 0)))
            return 1;
    }
    if (strcmp(GP_anno->ancode.arr, "514") == 0) //복직인 경우.
    {
        if ((strcmp(GP_mas->pstate.arr, "71") == 0) ||          //인사상태가 공상휴직이거나.
            ((strcmp(GP_mas->pstate.arr, "73") == 0) && (strcmp(GP_mas->lrfrdate.arr, "19940915") >= 0)) ||     //병역휴직 and 1994년이후자 이거나....
            (((strcmp(GP_mas->pstate.arr, "76") == 0) || (strcmp(GP_mas->pstate.arr, "76") == 0)) &&             //1996년이후에 출산 or 육아휴직
             (strcmp(GP_mas->lrfrdate.arr, "19961118") >= 0)))
            return 1;
    }
    if ((strcmp(GP_anno->ancode.arr, "600") == 0) && (strcmp(GP_anno->andetcode.arr, "64") != 0)) //징계발령은 모두 제외.(정직만 근속기간을 계산.)
        return 1;

    //1. 근속제외루틴 발령구분 = 복직일경우 발령일 from이 현최종근속제외기간 to 보다 작을 경우
    if (strcmp(GP_anno->ancode.arr, "514") == 0)
    {
        if (strcmp(GP_anno->anfrdate.arr, GP_mas->lextodate.arr) < 0)
        {
            // 현최종근속제외기간 To : 발령일 from을 1일 감소한다.
            // 현총근속제외년/월/일수 : 현최종근속제외년/월/일수를 감한다.
            // 현최종근속제외년/월/일수 : 현최종근속제외기간 from,to를 다시계산한다.
            // 현총근속제외년/월/일수 : 현최종근속제외년/월/일수를 더한다.
            // 사원번호, 현최종근속제외기간from을 key로하여 근속제외내역화일을 수정한다.
            // 근속재외기간 To ; 현최종근속제외기간 To
            // 근속재외년/월/일수 : 최종근속제외년/월/일수
            STR2VCCOPY(GP_mas->lextodate, DateCalc(1, (char *)GP_anno->anfrdate.arr, ""));
            // 근속제외관리화일의 자료를 수정한다..
            STRINIT(&strRet);
            strcpy(strRet, DateCalc(0, (char *)GP_mas->lexfrdate.arr, (char *)GP_mas->lextodate.arr));
            GP_mas->lexduyy = atoi(hinsa_copy(strRet, 1, 2));
            GP_mas->lexdumm = atoi(hinsa_copy(strRet, 3, 2));
            GP_mas->lexdudd = atoi(hinsa_copy(strRet, 5, 2));
            
            /* EXEC SQL
                UPDATE PIHEXDU 
                   SET EXTODATE = :GP_mas->lextodate, EXDUYY = :GP_mas->lexduyy,
                       EXDUMM   = :GP_mas->lexdumm,   EXDUDD = :GP_mas->lexdudd,
                       WRITETIME = to_char(sysdate,'YYYYMMDDHH24MISSD'), WRITEEMP = :jobEmpno
                 WHERE EMPNO    = :GP_mas->empno 
                   AND EXFRDATE = :GP_mas->lexfrdate; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "update PIHEXDU  set EXTODATE=:b0,EXDUYY=:b1,EXDU\
MM=:b2,EXDUDD=:b3,WRITETIME=to_char(sysdate,'YYYYMMDDHH24MISSD'),WRITEEMP=:b4\
 where (EMPNO=:b5 and EXFRDATE=:b6)";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )1468;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->lextodate);
            sqlstm.sqhstl[0] = (unsigned long )11;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->lexduyy);
            sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->lexdumm);
            sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->lexdudd);
            sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
            sqlstm.sqhsts[3] = (         int  )0;
            sqlstm.sqindv[3] = (         short *)0;
            sqlstm.sqinds[3] = (         int  )0;
            sqlstm.sqharm[3] = (unsigned long )0;
            sqlstm.sqadto[3] = (unsigned short )0;
            sqlstm.sqtdso[3] = (unsigned short )0;
            sqlstm.sqhstv[4] = (unsigned char  *)jobEmpno;
            sqlstm.sqhstl[4] = (unsigned long )5;
            sqlstm.sqhsts[4] = (         int  )0;
            sqlstm.sqindv[4] = (         short *)0;
            sqlstm.sqinds[4] = (         int  )0;
            sqlstm.sqharm[4] = (unsigned long )0;
            sqlstm.sqadto[4] = (unsigned short )0;
            sqlstm.sqtdso[4] = (unsigned short )0;
            sqlstm.sqhstv[5] = (unsigned char  *)&(GP_mas->empno);
            sqlstm.sqhstl[5] = (unsigned long )7;
            sqlstm.sqhsts[5] = (         int  )0;
            sqlstm.sqindv[5] = (         short *)0;
            sqlstm.sqinds[5] = (         int  )0;
            sqlstm.sqharm[5] = (unsigned long )0;
            sqlstm.sqadto[5] = (unsigned short )0;
            sqlstm.sqtdso[5] = (unsigned short )0;
            sqlstm.sqhstv[6] = (unsigned char  *)&(GP_mas->lexfrdate);
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


            if (SQLCODE != SQL_OK)
            {
                sprintf(logText, "근속제외내역 수정 실패!! 사번[%s],성명[%s],제외기간From[%s],Error[%s]", 
                                 GP_mas->empno.arr, GP_mas->korname.arr, GP_mas->lexfrdate.arr, SQLERRM);
                return 0;
            }

            /* EXEC SQL
                SELECT CASE WHEN MM >= 12 THEN YY + (MM / 12) ELSE YY END AS YY,
                       CASE WHEN MM >= 12 THEN MOD(MM, 12)    ELSE MM END AS MM,
                       DD
                  INTO :GP_mas->exdutyy, :GP_mas->exdutmm, :GP_mas->exdutdd
                  FROM (SELECT YY, CASE WHEN DD >= 30 THEN MM + (DD / 30) ELSE MM END AS MM,
                                   CASE WHEN DD >= 30 THEN MOD(DD, 30)    ELSE DD END AS DD
                          FROM (SELECT SUM(EXDUYY) YY, SUM(EXDUMM) MM, SUM(EXDUDD) DD 
                                  FROM PIHEXDU
                                 WHERE EMPNO = :GP_mas->empno
                                   AND EXENTYN ='Y')); */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "select  case  when MM>=12 then (YY+(MM/12)) else\
 YY  end  YY , case  when MM>=12 then MOD(MM,12) else MM  end  MM ,DD into :b\
0,:b1,:b2  from (select YY , case  when DD>=30 then (MM+(DD/30)) else MM  end\
  MM , case  when DD>=30 then MOD(DD,30) else DD  end  DD  from (select sum(E\
XDUYY) YY ,sum(EXDUMM) MM ,sum(EXDUDD) DD  from PIHEXDU where (EMPNO=:b3 and \
EXENTYN='Y')) ) ";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )1511;
            sqlstm.selerr = (unsigned short)0;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->exdutyy);
            sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->exdutmm);
            sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->exdutdd);
            sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->empno);
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


            if (SQLCODE != SQL_OK)
            {
                sprintf(logText, "근속제외내역 조회 실패!! 사번[%s],성명[%s]", GP_mas->empno.arr, GP_mas->korname.arr);
                return 0;
            }
            return 1;
        }
        else
            return 1;
    }
    //2. 현 최종근속제외기간 From,to :발령일 From,to
    VC2VC(GP_mas->lexfrdate, GP_anno->anfrdate);
    VC2VC(GP_mas->lextodate, GP_anno->antodate);
    //3. 현 최종근속제외기간 년/월/일수 : 현근속제외기간 From,To로 다시계산 
    STRINIT(&strRet);
    strcpy(strRet, DateCalc(0, (char *)GP_mas->lexfrdate.arr, (char *)GP_mas->lextodate.arr));
    GP_mas->lexduyy = atoi(hinsa_copy(strRet, 1, 2));
    GP_mas->lexdumm = atoi(hinsa_copy(strRet, 3, 2));
    GP_mas->lexdudd = atoi(hinsa_copy(strRet, 5, 2));
    //4. 근속제외루틴 (발령구분 = 휴직,휴직연장일경우
    //   휴직중휴가일 from이 space가 아니고 휴직중휴가일이 space가 아니면
    if ((strcmp(GP_anno->ancode.arr, "511") == 0) || (strcmp(GP_anno->ancode.arr, "512") == 0))
    {
        if ((strcmp(GP_anno->hofrdate.arr, "") != 0) && (strcmp(GP_anno->hotodate.arr, "") != 0))
        {
            STRINIT(&strRet);
            STRINIT(&sYY);
            STRINIT(&sMM);
            STRINIT(&sDD);
            strcpy(strRet, DateCalc(0, (char *)GP_anno->hofrdate.arr, (char *)GP_anno->hotodate.arr));
            strcpy(sYY, hinsa_copy(strRet, 1, 2));
            strcpy(sMM, hinsa_copy(strRet, 3, 2));
            strcpy(sDD, hinsa_copy(strRet, 5, 2));
            STRINIT(&strRet);
            strcpy(strRet, CalExduMinus(sYY, sMM, sDD));
            GP_mas->lexduyy = atoi(hinsa_copy(strRet, 1, 2));
            GP_mas->lexdumm = atoi(hinsa_copy(strRet, 3, 2));
            GP_mas->lexdudd = atoi(hinsa_copy(strRet, 5, 2));
        }
    }
    //7.근속제외내역화일에 자료를 저장한다.
    //사원번호 : 사원번호, 성명 : 성명,근속제외기간 from,to : 현최종근속제외기간 from,to
    //조직차수,부서코드,직급,호봉,직위 : 발령후 데이타
    //발령번호:발령번호,발령일 from,to : 발령일 from,to,발령구분 : 발령구분
    //근속제외제외기간 년/월/일수 : 현최종근속제외 년.월./일수 
    //근속제외포함여부,승격관련여부,승호관련여부 : Y
    //근속제외구분 : 발령구분이 정직(641)이면 발령구분 그렇지 않으면 발령세부구분
    //근속제외비고 : 비고 1
    STRINIT(&strAncode);
    if (strcmp(GP_anno->ancode.arr, "641") == 0)
        VC2STR(strAncode, GP_anno->ancode);
    else
        VC2STR(strAncode, GP_anno->andetcode);
    
    /* EXEC SQL
        INSERT INTO PIHEXDU  
            (EMPNO,KORNAME,EXFRDATE,EXTODATE,ORGNUM,DEPTCODE,PAYCL,PAYGR,PAYRA,EXANNONO,
             EXANFRDATE,EXANTODATE,EXANCODE,EXDUYY,EXDUMM,EXDUDD,EXENTYN,EXCODE,EXBIGO,EXRASYN,
             EXRAGRYN,EXINGOYN,WRITETIME,WRITEEMP) 
        VALUES 
            (:GP_anno->empno, :GP_anno->korname, :GP_mas->lexfrdate, :GP_mas->lextodate, :GP_anno->orgnum, 
             :GP_anno->deptcode, :GP_anno->paycl, :GP_anno->paygr, :GP_anno->payra, :GP_anno->annono, 
             :GP_anno->anfrdate, :GP_anno->antodate, :GP_anno->ancode, :GP_mas->lexduyy, 
             :GP_mas->lexdumm, :GP_mas->lexdudd, 'Y', :strAncode, :GP_anno->mark1,
             'Y','Y','Y', TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD'), :jobEmpno); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PIHEXDU (EMPNO,KORNAME,EXFRDATE,EXTODATE,ORG\
NUM,DEPTCODE,PAYCL,PAYGR,PAYRA,EXANNONO,EXANFRDATE,EXANTODATE,EXANCODE,EXDUYY\
,EXDUMM,EXDUDD,EXENTYN,EXCODE,EXBIGO,EXRASYN,EXRAGRYN,EXINGOYN,WRITETIME,WRIT\
EEMP) values (:b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b1\
4,:b15,'Y',:b16,:b17,'Y','Y','Y',TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),:b18)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1542;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->empno);
    sqlstm.sqhstl[0] = (unsigned long )7;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->korname);
    sqlstm.sqhstl[1] = (unsigned long )15;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->lexfrdate);
    sqlstm.sqhstl[2] = (unsigned long )11;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->lextodate);
    sqlstm.sqhstl[3] = (unsigned long )11;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&(GP_anno->orgnum);
    sqlstm.sqhstl[4] = (unsigned long )6;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->deptcode);
    sqlstm.sqhstl[5] = (unsigned long )9;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->paycl);
    sqlstm.sqhstl[6] = (unsigned long )6;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&(GP_anno->paygr);
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&(GP_anno->payra);
    sqlstm.sqhstl[8] = (unsigned long )6;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&(GP_anno->annono);
    sqlstm.sqhstl[9] = (unsigned long )11;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)&(GP_anno->anfrdate);
    sqlstm.sqhstl[10] = (unsigned long )11;
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)&(GP_anno->antodate);
    sqlstm.sqhstl[11] = (unsigned long )11;
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)&(GP_anno->ancode);
    sqlstm.sqhstl[12] = (unsigned long )6;
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)&(GP_mas->lexduyy);
    sqlstm.sqhstl[13] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)&(GP_mas->lexdumm);
    sqlstm.sqhstl[14] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqhstv[15] = (unsigned char  *)&(GP_mas->lexdudd);
    sqlstm.sqhstl[15] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[15] = (         int  )0;
    sqlstm.sqindv[15] = (         short *)0;
    sqlstm.sqinds[15] = (         int  )0;
    sqlstm.sqharm[15] = (unsigned long )0;
    sqlstm.sqadto[15] = (unsigned short )0;
    sqlstm.sqtdso[15] = (unsigned short )0;
    sqlstm.sqhstv[16] = (unsigned char  *)strAncode;
    sqlstm.sqhstl[16] = (unsigned long )4;
    sqlstm.sqhsts[16] = (         int  )0;
    sqlstm.sqindv[16] = (         short *)0;
    sqlstm.sqinds[16] = (         int  )0;
    sqlstm.sqharm[16] = (unsigned long )0;
    sqlstm.sqadto[16] = (unsigned short )0;
    sqlstm.sqtdso[16] = (unsigned short )0;
    sqlstm.sqhstv[17] = (unsigned char  *)&(GP_anno->mark1);
    sqlstm.sqhstl[17] = (unsigned long )43;
    sqlstm.sqhsts[17] = (         int  )0;
    sqlstm.sqindv[17] = (         short *)0;
    sqlstm.sqinds[17] = (         int  )0;
    sqlstm.sqharm[17] = (unsigned long )0;
    sqlstm.sqadto[17] = (unsigned short )0;
    sqlstm.sqtdso[17] = (unsigned short )0;
    sqlstm.sqhstv[18] = (unsigned char  *)jobEmpno;
    sqlstm.sqhstl[18] = (unsigned long )5;
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


    if (SQLCODE != SQL_OK)
    {
        sprintf(logText, "근속제외내역 테이블 입력 실패!! 사번[%s],성명[%s],제외기간From[%s],Error[%s]", 
                         GP_anno->empno.arr, GP_anno->korname.arr, GP_mas->lexfrdate.arr, SQLERRM);
        return 0;
    }

    //5.현총근속제외횟수 1증가
    GP_mas->exdutcnt = GP_mas->exdutcnt + 1;
    //6.현총근속제외 년/월/일수 : 현최종근속제외 년/월/일수를 더한다.
    //calexdu함수를 SQL문으로 대체
    /* EXEC SQL
        SELECT CASE WHEN MM >= 12 THEN YY + (MM / 12) ELSE YY END AS YY,
               CASE WHEN MM >= 12 THEN MOD(MM, 12) ELSE MM END AS MM,
               DD
          INTO :GP_mas->exdutyy, :GP_mas->exdutmm, :GP_mas->exdutdd
          FROM (SELECT YY, CASE WHEN DD >= 30 THEN MM + (DD / 30) ELSE MM END AS MM,
                           CASE WHEN DD >= 30 THEN MOD(DD, 30) ELSE DD END AS DD
                  FROM (SELECT SUM(EXDUYY) YY, SUM(EXDUMM) MM, SUM(EXDUDD) DD 
                          FROM PIHEXDU
                         WHERE EMPNO = :GP_mas->empno
                           AND EXENTYN ='Y')); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select  case  when MM>=12 then (YY+(MM/12)) else YY  end\
  YY , case  when MM>=12 then MOD(MM,12) else MM  end  MM ,DD into :b0,:b1,:b\
2  from (select YY , case  when DD>=30 then (MM+(DD/30)) else MM  end  MM , c\
ase  when DD>=30 then MOD(DD,30) else DD  end  DD  from (select sum(EXDUYY) Y\
Y ,sum(EXDUMM) MM ,sum(EXDUDD) DD  from PIHEXDU where (EMPNO=:b3 and EXENTYN=\
'Y')) ) ";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )1633;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->exdutyy);
    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->exdutmm);
    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->exdutdd);
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->empno);
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


    if (SQLCODE != SQL_OK)
    {
        sprintf(logText, "근속제외내역 조회 실패!! 사번[%s],성명[%s]", GP_mas->empno.arr, GP_mas->korname.arr);
        return 0;
    }
    return 1;
}

//인사상태 처리
void Pstate_Check()
{    
    //1.발령일 from이 시스템보다 크거나 발령구분이 전보,전입일경우는 루틴종료
    if ((strcmp(GP_anno->anfrdate.arr, curDate) > 0) || (strcmp(GP_anno->ancode.arr, "211") == 0) ||
        (strcmp(GP_anno->ancode.arr, "251") == 0) || (strcmp(GP_anno->ancode.arr, "935") == 0) ||
        (strcmp(GP_anno->ancode.arr, "311") == 0) || (strcmp(GP_anno->ancode.arr, "337") == 0) ||
        (strcmp(GP_anno->ancode.arr, "342") == 0) || (strcmp(GP_anno->ancode.arr, "343") == 0) ||
        (strcmp(GP_anno->ancode.arr, "995") == 0) || (strcmp(GP_anno->ancode.arr, "955") == 0) ||
        (strcmp(GP_anno->ancode.arr, "712") == 0))
        return;

    //2014.12.10.hjku.. I사번 체크는 사번으로.. 오류로 인해 변경..
    //if  copy(Qanno.FieldByName('ancode').AsString,1,1) = 'I' then   //I사번 체크 2007.06.04 shm
    if (strncmp(GP_anno->empno.arr, "I", 1) == 0)                     //I사번 현원포함안함
    {
        STR2VCCOPY(GP_mas->pstate, "82");
        STR2VCCOPY(GP_mas->pstateyn, "N");
    }
    else
    {   
        STR2VCCOPY(GP_mas->pstate, "10");
        STR2VCCOPY(GP_mas->pstateyn, "Y");
    }
    //2.발령구분 첫번째 = '1' 이면 현인사상태 : 재직,현원포함여부 'Y'
    if (strncmp(GP_anno->ancode.arr, "1", 1) == 0)
        return;
    //2.발령구분이 파견,파견연장일경우 현인사상태 : 발령세부구분,
    //                                 현원포함여부 : 파견/교육현원포함여부
    if ((strcmp(GP_anno->ancode.arr, "411") == 0) || (strcmp(GP_anno->ancode.arr, "412") == 0))
    {
        VC2VC(GP_mas->pstate, GP_anno->andetcode);
        VC2VC(GP_mas->pstateyn, edupstateyn);
        VC2VC(GP_res->pstate, GP_anno->andetcode);
        
        //2019.03.Add 파견부서(Addeptcode), 피파견부서(Deptcode)가 모두 Agile조직(트라이브,챕터,스쿼드)인 경우 인사상태를 “재직”으로
        /* EXEC SQL Select Func_Tribegb(:GP_anno->orgnum,:GP_anno->deptcode) Into :agilecode1 From Dual; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select Func_Tribegb(:b0,:b1) into :b2  from Dual ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1664;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->orgnum);
        sqlstm.sqhstl[0] = (unsigned long )6;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->deptcode);
        sqlstm.sqhstl[1] = (unsigned long )9;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)agilecode1;
        sqlstm.sqhstl[2] = (unsigned long )2;
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


        /* EXEC SQL Select Func_Tribegb(:GP_anno->orgnum,:GP_anno->addeptcode) Into :agilecode2 From Dual; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select Func_Tribegb(:b0,:b1) into :b2  from Dual ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1691;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->orgnum);
        sqlstm.sqhstl[0] = (unsigned long )6;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->addeptcode);
        sqlstm.sqhstl[1] = (unsigned long )9;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)agilecode2;
        sqlstm.sqhstl[2] = (unsigned long )2;
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



        if ((strcmp(agilecode1, "2") == 0) && (strcmp(agilecode1, "2") == 0))
        {
        	STR2VCCOPY(GP_mas->pstateyn, "Y"); 
          STR2VCCOPY(GP_mas->pstate, "10");
          STR2VCCOPY(GP_mas->pstate, "10");
        }//2019.03.Add............................................................
        
    }
    //2.발령구분이 휴직,휴직연장일경우 현입사상태 : 발령세부구분,
    //                                 현원포함여부 : 휴직자현원포함여부
    if ((strcmp(GP_anno->ancode.arr, "511") == 0) || (strcmp(GP_anno->ancode.arr, "512") == 0))
    {
        VC2VC(GP_mas->pstate, GP_anno->andetcode);
        VC2VC(GP_mas->pstateyn, hupstateyn);
        VC2VC(GP_res->pstate, GP_anno->andetcode);
    }
    //2.발령구분이 정직,징계 and 발령세부구분이 정직이면 인사상태 : 정직
    //                                                   현원포함여부 : 정직자현원포함여부
    if ((strcmp(GP_anno->ancode.arr, "641") == 0) || 
        ((strcmp(GP_anno->ancode.arr, "600") == 0) && (strcmp(GP_anno->andetcode.arr, "64") == 0)))
    {
        STR2VCCOPY(GP_mas->pstate, "60");
        VC2VC(GP_mas->pstateyn, jupstateyn);
    }
    //2.발령구분이 저직해고,권고사직,징계 and 발령세부구분 징계해고(61) 이면  현인사상태 : 징계면직, 현현원포함여부 : 'N'
    if ((strcmp(GP_anno->ancode.arr, "619") == 0) || (strcmp(GP_anno->ancode.arr, "629") == 0) || 
        ((strcmp(GP_anno->ancode.arr, "600") == 0) && (strcmp(GP_anno->andetcode.arr, "61") == 0)))
    {
        //발령구분이 징계 and 발령세부구분 권고사직(62)인 경우는 나중에 사직서 받아서 의면면직 처리.
        //루틴에서 뺌 2009.07.10 0884 이승철매니저 요청
        //    ((Qanno.FieldByName('ancode').AsString = '600') and
        //     (Qanno.FieldByName('andetcode').AsString = '62')) then
        STR2VCCOPY(GP_mas->pstate, "94");
        STR2VCCOPY(GP_mas->pstate, "N");
        STR2VCCOPY(GP_res->pstate, "94");
    }
    //2.발령구분이 면직일경우 현인사상태 : 발령세부구분,현원포함여부 'N'
    if ((strcmp(GP_anno->ancode.arr, "819") == 0) || (strcmp(GP_anno->ancode.arr, "809") == 0))
    {
        VC2VC(GP_mas->pstate, GP_anno->andetcode);
        STR2VCCOPY(GP_mas->pstateyn, "N");
        VC2VC(GP_res->pstate, GP_anno->andetcode);
    }
    //2.발령구분이 해임일경우 현인사상태 : 해임,현원포함여부 'N'
    if (strcmp(GP_anno->ancode.arr, "829") == 0)
    {
        STR2VCCOPY(GP_mas->pstate, "95");
        STR2VCCOPY(GP_mas->pstateyn, "N");
        STR2VCCOPY(GP_res->pstate, "95");
    }
    //2.발령구분이 계약해지일경우 현인사상태 : 계약해지,현원포함여부 'N'
    if (strcmp(GP_anno->ancode.arr, "839") == 0)
    {
        STR2VCCOPY(GP_mas->pstate, "97");
        STR2VCCOPY(GP_mas->pstateyn, "N");
        STR2VCCOPY(GP_res->pstate, "97");
    }
    //2.발령구분이 대기발령(461)일경우: 인사상태->대기발령
    if (strcmp(GP_anno->ancode.arr, "461") == 0)
        STR2VCCOPY(GP_mas->pstate, "40");
}

//인사발령화일을 저장
int Save_anno()
{
    /* EXEC SQL BEGIN DECLARE SECTION; */ 

        /* varchar strJobdept[6+1]; */ 
struct { unsigned short len; unsigned char arr[7]; } strJobdept;

        /* varchar strEmpno[4+1]; */ 
struct { unsigned short len; unsigned char arr[5]; } strEmpno;

        /* varchar strKorname[12+1]; */ 
struct { unsigned short len; unsigned char arr[13]; } strKorname;

        /* varchar strPayrayn[1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } strPayrayn;

        /* varchar strJobpayrayn[1+1]; */ 
struct { unsigned short len; unsigned char arr[2]; } strJobpayrayn;

        /* varchar ancode1[3+1]; */ 
struct { unsigned short len; unsigned char arr[4]; } ancode1;

        /* varchar annono1[8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } annono1;

        /* varchar anfrdate1[8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } anfrdate1;

        /* varchar antodate1[8+1]; */ 
struct { unsigned short len; unsigned char arr[9]; } antodate1;

    /* EXEC SQL END DECLARE SECTION; */ 

    int  iCnt;
    int  iErrcnt;
    int  iCol[13];
    char strGrpid[4+1];
    char strMM[6+1];
    char strDD[8+1];
    char strJumin[14+1];
    char strDate[8+1];
    char sRetday[6+1];
    char strTargetid[20+1];

    //인사발령화일의 발령구분,발령번호,발령일 from,to를 임시변수에 저장
    STRINIT(&ancode1);
    STRINIT(&annono1);
    STRINIT(&anfrdate1);
    STRINIT(&antodate1);
    VC2VC(ancode1, GP_mas->lancode);
    VC2VC(annono1, GP_mas->lannono);
    VC2VC(anfrdate1, GP_mas->lanfrdate);
    VC2VC(antodate1, GP_mas->lantodate);

    //최종발령사항에 인사발령화일의 발령후의 발령구분,번호,발령일을 저장
    if (strcmp(GP_anno->ancode.arr, "935") != 0)
    {
        VC2VC(GP_mas->lancode, GP_anno->ancode);
        VC2VC(GP_mas->lannono, GP_anno->annono);
        VC2VC(GP_mas->lanfrdate, GP_anno->anfrdate);
        VC2VC(GP_mas->lantodate, GP_anno->antodate);
    }
    //현차수,현소속,현직위,현직급,현호봉 : 발령후 사항을 저장
    VC2VC(GP_mas->empno, GP_anno->empno);
    VC2VC(GP_mas->korname, GP_anno->korname);
    VC2VC(GP_mas->payra, GP_anno->payra);
    if (((strcmp(GP_anno->ancode.arr, "411") == 0) ||(strcmp(GP_anno->ancode.arr, "412") == 0) ||
        (strcmp(GP_anno->ancode.arr, "243") == 0)) &&       //직무대행시 2009.03.24 jissi
        (strcmp(GP_anno->adpayra.arr, "") != 0))
         VC2VC(GP_mas->jobpayra, GP_anno->adpayra);
  //else VC2VC(GP_mas->jobpayra, GP_anno->payra);  2019.03.13 else문 삭제 (CL, PO직책시 오류 발생으로 주석처리함, 즉,인사마스터jobpayra 유지. dsa2000 
        
    if (strcmp(GP_anno->andetcode.arr, "24") == 0)
        VC2VC(GP_mas->jobpayra, GP_anno->payra);
        
    if (strcmp(GP_mas->jobpayra.arr, "") == 0)
        VC2VC(GP_mas->jobpayra, GP_anno->payra);
        
    if (strcmp(GP_mas->jobpayrayn.arr, "") == 0)
        STR2VCCOPY(GP_mas->jobpayrayn, "N");
        
    if ((strcmp(GP_anno->ancode.arr, "342") == 0) || (strcmp(GP_anno->ancode.arr, "343") == 0))
    {
        STRINIT(&strJobdept);
        STRINIT(&strPayrayn);
        STRINIT(&strJobpayrayn);
        /* EXEC SQL
            SELECT JOBDEPT, PAYRAYN, JOBPAYRAYN
              INTO :strJobdept, :strPayrayn, :strJobpayrayn
              FROM PIMPMAS                  
             WHERE EMPNO = :GP_mas->empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select JOBDEPT ,PAYRAYN ,JOBPAYRAYN into :b0,:b1,:b2\
  from PIMPMAS where EMPNO=:b3";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1718;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&strJobdept;
        sqlstm.sqhstl[0] = (unsigned long )9;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&strPayrayn;
        sqlstm.sqhstl[1] = (unsigned long )4;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&strJobpayrayn;
        sqlstm.sqhstl[2] = (unsigned long )4;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->empno);
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


        if (SQLCODE != SQL_NO_DATA)
        {
            if (strcmp(GP_anno->addeptcode.arr, "") == 0)
            {
                VC2VC(GP_mas->jobdept, strJobdept);
                VC2VC(GP_mas->payrayn, strPayrayn);
                VC2VC(GP_mas->jobpayrayn, strJobpayrayn);
            }
        }
    }
    VC2VC(GP_mas->paycl, GP_anno->paycl);
    VC2VC(GP_mas->deptcode, GP_anno->deptcode);
    VC2VC(GP_mas->orgnum, GP_anno->orgnum);
    // 보임자이며, 퇴임코드가 아닌경우
    if ((strcmp(GP_mas->jobpayrayn.arr, "Y") == 0) && (strcmp(GP_anno->ancode.arr, "829") != 0))
    {
if(DEBUG) printf("보임자check=[%s]ancode[%s]\n", GP_mas->jobpayrayn.arr, GP_anno->ancode.arr);
if(DEBUG) printf("test11 보임자code=[%s]dept[%s],org[%s]\n", GP_anno->ancode.arr, GP_mas->jobdept.arr, GP_mas->orgnum.arr );
    
        STRINIT(&strJobdept);
        STRINIT(&strEmpno);
        STRINIT(&strKorname);
        //기존 보임자가 존재하는지 확인
        /* EXEC SQL
            SELECT JOBDEPT, EMPNO, KORNAME  
              INTO :strJobdept, :strEmpno, :strKorname
              FROM PIMPMAS                  
             WHERE JOBDEPT    = :GP_mas->jobdept
               AND ORGNUM     = :GP_mas->orgnum
               AND PSTATE     < '80'      
               AND JOBPAYRAYN = 'Y'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select JOBDEPT ,EMPNO ,KORNAME into :b0,:b1,:b2  fro\
m PIMPMAS where (((JOBDEPT=:b3 and ORGNUM=:b4) and PSTATE<'80') and JOBPAYRAY\
N='Y')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1749;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&strJobdept;
        sqlstm.sqhstl[0] = (unsigned long )9;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&strEmpno;
        sqlstm.sqhstl[1] = (unsigned long )7;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&strKorname;
        sqlstm.sqhstl[2] = (unsigned long )15;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->jobdept);
        sqlstm.sqhstl[3] = (unsigned long )8;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         short *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned long )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (unsigned char  *)&(GP_mas->orgnum);
        sqlstm.sqhstl[4] = (unsigned long )6;
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


        if ((SQLCODE == SQL_OK) && (sqlca.sqlerrd[2] > 0) && (strcmp(GP_mas->empno.arr, (char *)strEmpno.arr) != 0))
        {
            STRINIT(&logText);
            sprintf(logText, "부서코드[%s],사번[%s],성명[%s] 현근무부서 보임자입니다.", (char *)strJobdept.arr, (char *)strEmpno.arr, (char *)strKorname.arr);
            return 0;
        }
    }
    /*2019.01.30. M2 BAND의 경우 승격일 & Band기준일 미사용하여 삭제. 유훈일M*/
    if ( (strcmp(GP_anno->paycl.arr, "C31") == 0) || (strcmp(GP_anno->paycl.arr, "C33") == 0) )
    {
    	STRINIT(&GP_mas->cpaycldate);
    	STRINIT(&GP_mas->paycldate);
    }/*******************************/
        
    //발령구분에 따라 자료를 생성 및 저장한다..
    //신규(111	신규채용, 121	선임, 124	재선임, 131	계약,134	재계약, 141	위촉)
    if ((strcmp(GP_anno->ancode.arr, "111") == 0) || (strcmp(GP_anno->ancode.arr, "121") == 0) ||
        (strcmp(GP_anno->ancode.arr, "124") == 0) || (strcmp(GP_anno->ancode.arr, "131") == 0) ||
        (strcmp(GP_anno->ancode.arr, "134") == 0) || (strcmp(GP_anno->ancode.arr, "141") == 0))
    {
        //기존사원이 존재하는지 검사.
        /* EXEC SQL SELECT EMPNO FROM PIMPMAS WHERE EMPNO = :GP_mas->empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select EMPNO  from PIMPMAS where EMPNO=:b0";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1784;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->empno);
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


        if ((SQLCODE == SQL_OK) && (sqlca.sqlerrd[2] > 0))
        {
            STRINIT(&logText);
            sprintf(logText, "사번[%s],성명[%s] 기존사원이 존재합니다.", GP_anno->empno.arr, GP_anno->korname.arr);
            return 0;
        }
        /* 일반직 사원의 경력일 조정 로직이 2005년 삭제되어 해당 부분 제외하고 처리 */
        //31.08 저장전. 일반직경우 수습이아닌걸로 셋팅.
        //33.00 일반직(Y---)사원 경력일 default값(입사일-400) 넣는 부분 삭제(인사팀 임현수)
        /* EXEC SQL 
            INSERT INTO PIMPMAS ( EMPNO         ,KORNAME        ,JOBPAYRA,   JOBPAYRAYN,
                                  PSTATE        ,PSTATEYN       ,PAYCL,
                                  PAYGR         ,PAYRA          ,ORGNUM,
                                  DEPTCODE      ,FIELDCODE      ,PAYDUNM,
                                  REALTRDATE    ,OFFTRDATE      ,PAYRAYN,
                                  CPAYRADATE    ,JOBPLACE       ,EMPDATE,
                                  CPAYCLDATE    ,PAYCLDATE      ,REPPAYCL,
                                  REPPAYFRDATE  ,REPPAYTODATE   ,APDPAYDUNM,
                                  ACTPAYFRDATE  ,ACTPAYTODATE   ,ACTPAYDUNM,
                                  APDPAYFRDATE  ,APDPAYTODATE   ,LRAGRDATE,
                                  REMARK        ,EMPCODE        ,EMPPAYCL,
                                  EMPPAYGR      ,JOBGUN         ,JOBGUNDATE,
                                  JOBLINE       ,JOBLINEDATE    ,NOGUBUN,    EMPJOBLINE)
            VALUES (:GP_mas->empno, :GP_mas->korname, :GP_mas->jobpayra, :GP_mas->jobpayrayn,
                    :GP_mas->pstate, :GP_mas->pstateyn, :GP_mas->paycl, :GP_mas->paygr,
                    :GP_mas->payra, :GP_mas->orgnum, :GP_mas->deptcode, :GP_mas->fieldcode,                         
                    :GP_mas->paydunm, :GP_mas->realtrdate, :GP_mas->offtrdate, :GP_mas->payrayn,                    
                    :GP_mas->cpayradate, :GP_mas->jobplace, :GP_mas->empdate, :GP_mas->cpaycldate,                  
                    :GP_mas->paycldate, :GP_mas->reppaycl, :GP_mas->reppayfrdate, :GP_mas->reppaytodate,            
                    :GP_mas->apdpaydunm, :GP_mas->actpayfrdate, :GP_mas->actpaytodate, :GP_mas->actpaydunm,         
                    :GP_mas->apdpayfrdate, :GP_mas->apdpaytodate, :GP_mas->lragrdate, :GP_mas->remark,              
                    :GP_mas->empcode, :GP_mas->emppaycl, :GP_mas->paygr, :GP_mas->jobgun, :GP_mas->jobgundate,
                    :GP_mas->jobline, :GP_mas->joblinedate, :GP_mas->nogubun, :GP_mas->empjobline); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into PIMPMAS (EMPNO,KORNAME,JOBPAYRA,JOBPAYRA\
YN,PSTATE,PSTATEYN,PAYCL,PAYGR,PAYRA,ORGNUM,DEPTCODE,FIELDCODE,PAYDUNM,REALTR\
DATE,OFFTRDATE,PAYRAYN,CPAYRADATE,JOBPLACE,EMPDATE,CPAYCLDATE,PAYCLDATE,REPPA\
YCL,REPPAYFRDATE,REPPAYTODATE,APDPAYDUNM,ACTPAYFRDATE,ACTPAYTODATE,ACTPAYDUNM\
,APDPAYFRDATE,APDPAYTODATE,LRAGRDATE,REMARK,EMPCODE,EMPPAYCL,EMPPAYGR,JOBGUN,\
JOBGUNDATE,JOBLINE,JOBLINEDATE,NOGUBUN,EMPJOBLINE) values (:b0,:b1,:b2,:b3,:b\
4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,:b17,:b18,:b19,:b20,\
:b21,:b22,:b23,:b24,:b25,:b26,:b27,:b28,:b29,:b30,:b31,:b32,:b33,:b7,:b35,:b3\
6,:b37,:b38,:b39,:b40)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )1803;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->empno);
        sqlstm.sqhstl[0] = (unsigned long )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->korname);
        sqlstm.sqhstl[1] = (unsigned long )15;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->jobpayra);
        sqlstm.sqhstl[2] = (unsigned long )6;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->jobpayrayn);
        sqlstm.sqhstl[3] = (unsigned long )4;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         short *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned long )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (unsigned char  *)&(GP_mas->pstate);
        sqlstm.sqhstl[4] = (unsigned long )5;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         short *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned long )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (unsigned char  *)&(GP_mas->pstateyn);
        sqlstm.sqhstl[5] = (unsigned long )4;
        sqlstm.sqhsts[5] = (         int  )0;
        sqlstm.sqindv[5] = (         short *)0;
        sqlstm.sqinds[5] = (         int  )0;
        sqlstm.sqharm[5] = (unsigned long )0;
        sqlstm.sqadto[5] = (unsigned short )0;
        sqlstm.sqtdso[5] = (unsigned short )0;
        sqlstm.sqhstv[6] = (unsigned char  *)&(GP_mas->paycl);
        sqlstm.sqhstl[6] = (unsigned long )6;
        sqlstm.sqhsts[6] = (         int  )0;
        sqlstm.sqindv[6] = (         short *)0;
        sqlstm.sqinds[6] = (         int  )0;
        sqlstm.sqharm[6] = (unsigned long )0;
        sqlstm.sqadto[6] = (unsigned short )0;
        sqlstm.sqtdso[6] = (unsigned short )0;
        sqlstm.sqhstv[7] = (unsigned char  *)&(GP_mas->paygr);
        sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[7] = (         int  )0;
        sqlstm.sqindv[7] = (         short *)0;
        sqlstm.sqinds[7] = (         int  )0;
        sqlstm.sqharm[7] = (unsigned long )0;
        sqlstm.sqadto[7] = (unsigned short )0;
        sqlstm.sqtdso[7] = (unsigned short )0;
        sqlstm.sqhstv[8] = (unsigned char  *)&(GP_mas->payra);
        sqlstm.sqhstl[8] = (unsigned long )6;
        sqlstm.sqhsts[8] = (         int  )0;
        sqlstm.sqindv[8] = (         short *)0;
        sqlstm.sqinds[8] = (         int  )0;
        sqlstm.sqharm[8] = (unsigned long )0;
        sqlstm.sqadto[8] = (unsigned short )0;
        sqlstm.sqtdso[8] = (unsigned short )0;
        sqlstm.sqhstv[9] = (unsigned char  *)&(GP_mas->orgnum);
        sqlstm.sqhstl[9] = (unsigned long )6;
        sqlstm.sqhsts[9] = (         int  )0;
        sqlstm.sqindv[9] = (         short *)0;
        sqlstm.sqinds[9] = (         int  )0;
        sqlstm.sqharm[9] = (unsigned long )0;
        sqlstm.sqadto[9] = (unsigned short )0;
        sqlstm.sqtdso[9] = (unsigned short )0;
        sqlstm.sqhstv[10] = (unsigned char  *)&(GP_mas->deptcode);
        sqlstm.sqhstl[10] = (unsigned long )8;
        sqlstm.sqhsts[10] = (         int  )0;
        sqlstm.sqindv[10] = (         short *)0;
        sqlstm.sqinds[10] = (         int  )0;
        sqlstm.sqharm[10] = (unsigned long )0;
        sqlstm.sqadto[10] = (unsigned short )0;
        sqlstm.sqtdso[10] = (unsigned short )0;
        sqlstm.sqhstv[11] = (unsigned char  *)&(GP_mas->fieldcode);
        sqlstm.sqhstl[11] = (unsigned long )6;
        sqlstm.sqhsts[11] = (         int  )0;
        sqlstm.sqindv[11] = (         short *)0;
        sqlstm.sqinds[11] = (         int  )0;
        sqlstm.sqharm[11] = (unsigned long )0;
        sqlstm.sqadto[11] = (unsigned short )0;
        sqlstm.sqtdso[11] = (unsigned short )0;
        sqlstm.sqhstv[12] = (unsigned char  *)&(GP_mas->paydunm);
        sqlstm.sqhstl[12] = (unsigned long )33;
        sqlstm.sqhsts[12] = (         int  )0;
        sqlstm.sqindv[12] = (         short *)0;
        sqlstm.sqinds[12] = (         int  )0;
        sqlstm.sqharm[12] = (unsigned long )0;
        sqlstm.sqadto[12] = (unsigned short )0;
        sqlstm.sqtdso[12] = (unsigned short )0;
        sqlstm.sqhstv[13] = (unsigned char  *)&(GP_mas->realtrdate);
        sqlstm.sqhstl[13] = (unsigned long )11;
        sqlstm.sqhsts[13] = (         int  )0;
        sqlstm.sqindv[13] = (         short *)0;
        sqlstm.sqinds[13] = (         int  )0;
        sqlstm.sqharm[13] = (unsigned long )0;
        sqlstm.sqadto[13] = (unsigned short )0;
        sqlstm.sqtdso[13] = (unsigned short )0;
        sqlstm.sqhstv[14] = (unsigned char  *)&(GP_mas->offtrdate);
        sqlstm.sqhstl[14] = (unsigned long )11;
        sqlstm.sqhsts[14] = (         int  )0;
        sqlstm.sqindv[14] = (         short *)0;
        sqlstm.sqinds[14] = (         int  )0;
        sqlstm.sqharm[14] = (unsigned long )0;
        sqlstm.sqadto[14] = (unsigned short )0;
        sqlstm.sqtdso[14] = (unsigned short )0;
        sqlstm.sqhstv[15] = (unsigned char  *)&(GP_mas->payrayn);
        sqlstm.sqhstl[15] = (unsigned long )4;
        sqlstm.sqhsts[15] = (         int  )0;
        sqlstm.sqindv[15] = (         short *)0;
        sqlstm.sqinds[15] = (         int  )0;
        sqlstm.sqharm[15] = (unsigned long )0;
        sqlstm.sqadto[15] = (unsigned short )0;
        sqlstm.sqtdso[15] = (unsigned short )0;
        sqlstm.sqhstv[16] = (unsigned char  *)&(GP_mas->cpayradate);
        sqlstm.sqhstl[16] = (unsigned long )11;
        sqlstm.sqhsts[16] = (         int  )0;
        sqlstm.sqindv[16] = (         short *)0;
        sqlstm.sqinds[16] = (         int  )0;
        sqlstm.sqharm[16] = (unsigned long )0;
        sqlstm.sqadto[16] = (unsigned short )0;
        sqlstm.sqtdso[16] = (unsigned short )0;
        sqlstm.sqhstv[17] = (unsigned char  *)&(GP_mas->jobplace);
        sqlstm.sqhstl[17] = (unsigned long )5;
        sqlstm.sqhsts[17] = (         int  )0;
        sqlstm.sqindv[17] = (         short *)0;
        sqlstm.sqinds[17] = (         int  )0;
        sqlstm.sqharm[17] = (unsigned long )0;
        sqlstm.sqadto[17] = (unsigned short )0;
        sqlstm.sqtdso[17] = (unsigned short )0;
        sqlstm.sqhstv[18] = (unsigned char  *)&(GP_mas->empdate);
        sqlstm.sqhstl[18] = (unsigned long )11;
        sqlstm.sqhsts[18] = (         int  )0;
        sqlstm.sqindv[18] = (         short *)0;
        sqlstm.sqinds[18] = (         int  )0;
        sqlstm.sqharm[18] = (unsigned long )0;
        sqlstm.sqadto[18] = (unsigned short )0;
        sqlstm.sqtdso[18] = (unsigned short )0;
        sqlstm.sqhstv[19] = (unsigned char  *)&(GP_mas->cpaycldate);
        sqlstm.sqhstl[19] = (unsigned long )11;
        sqlstm.sqhsts[19] = (         int  )0;
        sqlstm.sqindv[19] = (         short *)0;
        sqlstm.sqinds[19] = (         int  )0;
        sqlstm.sqharm[19] = (unsigned long )0;
        sqlstm.sqadto[19] = (unsigned short )0;
        sqlstm.sqtdso[19] = (unsigned short )0;
        sqlstm.sqhstv[20] = (unsigned char  *)&(GP_mas->paycldate);
        sqlstm.sqhstl[20] = (unsigned long )11;
        sqlstm.sqhsts[20] = (         int  )0;
        sqlstm.sqindv[20] = (         short *)0;
        sqlstm.sqinds[20] = (         int  )0;
        sqlstm.sqharm[20] = (unsigned long )0;
        sqlstm.sqadto[20] = (unsigned short )0;
        sqlstm.sqtdso[20] = (unsigned short )0;
        sqlstm.sqhstv[21] = (unsigned char  *)&(GP_mas->reppaycl);
        sqlstm.sqhstl[21] = (unsigned long )6;
        sqlstm.sqhsts[21] = (         int  )0;
        sqlstm.sqindv[21] = (         short *)0;
        sqlstm.sqinds[21] = (         int  )0;
        sqlstm.sqharm[21] = (unsigned long )0;
        sqlstm.sqadto[21] = (unsigned short )0;
        sqlstm.sqtdso[21] = (unsigned short )0;
        sqlstm.sqhstv[22] = (unsigned char  *)&(GP_mas->reppayfrdate);
        sqlstm.sqhstl[22] = (unsigned long )11;
        sqlstm.sqhsts[22] = (         int  )0;
        sqlstm.sqindv[22] = (         short *)0;
        sqlstm.sqinds[22] = (         int  )0;
        sqlstm.sqharm[22] = (unsigned long )0;
        sqlstm.sqadto[22] = (unsigned short )0;
        sqlstm.sqtdso[22] = (unsigned short )0;
        sqlstm.sqhstv[23] = (unsigned char  *)&(GP_mas->reppaytodate);
        sqlstm.sqhstl[23] = (unsigned long )11;
        sqlstm.sqhsts[23] = (         int  )0;
        sqlstm.sqindv[23] = (         short *)0;
        sqlstm.sqinds[23] = (         int  )0;
        sqlstm.sqharm[23] = (unsigned long )0;
        sqlstm.sqadto[23] = (unsigned short )0;
        sqlstm.sqtdso[23] = (unsigned short )0;
        sqlstm.sqhstv[24] = (unsigned char  *)&(GP_mas->apdpaydunm);
        sqlstm.sqhstl[24] = (unsigned long )33;
        sqlstm.sqhsts[24] = (         int  )0;
        sqlstm.sqindv[24] = (         short *)0;
        sqlstm.sqinds[24] = (         int  )0;
        sqlstm.sqharm[24] = (unsigned long )0;
        sqlstm.sqadto[24] = (unsigned short )0;
        sqlstm.sqtdso[24] = (unsigned short )0;
        sqlstm.sqhstv[25] = (unsigned char  *)&(GP_mas->actpayfrdate);
        sqlstm.sqhstl[25] = (unsigned long )11;
        sqlstm.sqhsts[25] = (         int  )0;
        sqlstm.sqindv[25] = (         short *)0;
        sqlstm.sqinds[25] = (         int  )0;
        sqlstm.sqharm[25] = (unsigned long )0;
        sqlstm.sqadto[25] = (unsigned short )0;
        sqlstm.sqtdso[25] = (unsigned short )0;
        sqlstm.sqhstv[26] = (unsigned char  *)&(GP_mas->actpaytodate);
        sqlstm.sqhstl[26] = (unsigned long )11;
        sqlstm.sqhsts[26] = (         int  )0;
        sqlstm.sqindv[26] = (         short *)0;
        sqlstm.sqinds[26] = (         int  )0;
        sqlstm.sqharm[26] = (unsigned long )0;
        sqlstm.sqadto[26] = (unsigned short )0;
        sqlstm.sqtdso[26] = (unsigned short )0;
        sqlstm.sqhstv[27] = (unsigned char  *)&(GP_mas->actpaydunm);
        sqlstm.sqhstl[27] = (unsigned long )33;
        sqlstm.sqhsts[27] = (         int  )0;
        sqlstm.sqindv[27] = (         short *)0;
        sqlstm.sqinds[27] = (         int  )0;
        sqlstm.sqharm[27] = (unsigned long )0;
        sqlstm.sqadto[27] = (unsigned short )0;
        sqlstm.sqtdso[27] = (unsigned short )0;
        sqlstm.sqhstv[28] = (unsigned char  *)&(GP_mas->apdpayfrdate);
        sqlstm.sqhstl[28] = (unsigned long )11;
        sqlstm.sqhsts[28] = (         int  )0;
        sqlstm.sqindv[28] = (         short *)0;
        sqlstm.sqinds[28] = (         int  )0;
        sqlstm.sqharm[28] = (unsigned long )0;
        sqlstm.sqadto[28] = (unsigned short )0;
        sqlstm.sqtdso[28] = (unsigned short )0;
        sqlstm.sqhstv[29] = (unsigned char  *)&(GP_mas->apdpaytodate);
        sqlstm.sqhstl[29] = (unsigned long )11;
        sqlstm.sqhsts[29] = (         int  )0;
        sqlstm.sqindv[29] = (         short *)0;
        sqlstm.sqinds[29] = (         int  )0;
        sqlstm.sqharm[29] = (unsigned long )0;
        sqlstm.sqadto[29] = (unsigned short )0;
        sqlstm.sqtdso[29] = (unsigned short )0;
        sqlstm.sqhstv[30] = (unsigned char  *)&(GP_mas->lragrdate);
        sqlstm.sqhstl[30] = (unsigned long )11;
        sqlstm.sqhsts[30] = (         int  )0;
        sqlstm.sqindv[30] = (         short *)0;
        sqlstm.sqinds[30] = (         int  )0;
        sqlstm.sqharm[30] = (unsigned long )0;
        sqlstm.sqadto[30] = (unsigned short )0;
        sqlstm.sqtdso[30] = (unsigned short )0;
        sqlstm.sqhstv[31] = (unsigned char  *)&(GP_mas->remark);
        sqlstm.sqhstl[31] = (unsigned long )5;
        sqlstm.sqhsts[31] = (         int  )0;
        sqlstm.sqindv[31] = (         short *)0;
        sqlstm.sqinds[31] = (         int  )0;
        sqlstm.sqharm[31] = (unsigned long )0;
        sqlstm.sqadto[31] = (unsigned short )0;
        sqlstm.sqtdso[31] = (unsigned short )0;
        sqlstm.sqhstv[32] = (unsigned char  *)&(GP_mas->empcode);
        sqlstm.sqhstl[32] = (unsigned long )5;
        sqlstm.sqhsts[32] = (         int  )0;
        sqlstm.sqindv[32] = (         short *)0;
        sqlstm.sqinds[32] = (         int  )0;
        sqlstm.sqharm[32] = (unsigned long )0;
        sqlstm.sqadto[32] = (unsigned short )0;
        sqlstm.sqtdso[32] = (unsigned short )0;
        sqlstm.sqhstv[33] = (unsigned char  *)&(GP_mas->emppaycl);
        sqlstm.sqhstl[33] = (unsigned long )6;
        sqlstm.sqhsts[33] = (         int  )0;
        sqlstm.sqindv[33] = (         short *)0;
        sqlstm.sqinds[33] = (         int  )0;
        sqlstm.sqharm[33] = (unsigned long )0;
        sqlstm.sqadto[33] = (unsigned short )0;
        sqlstm.sqtdso[33] = (unsigned short )0;
        sqlstm.sqhstv[34] = (unsigned char  *)&(GP_mas->paygr);
        sqlstm.sqhstl[34] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[34] = (         int  )0;
        sqlstm.sqindv[34] = (         short *)0;
        sqlstm.sqinds[34] = (         int  )0;
        sqlstm.sqharm[34] = (unsigned long )0;
        sqlstm.sqadto[34] = (unsigned short )0;
        sqlstm.sqtdso[34] = (unsigned short )0;
        sqlstm.sqhstv[35] = (unsigned char  *)&(GP_mas->jobgun);
        sqlstm.sqhstl[35] = (unsigned long )5;
        sqlstm.sqhsts[35] = (         int  )0;
        sqlstm.sqindv[35] = (         short *)0;
        sqlstm.sqinds[35] = (         int  )0;
        sqlstm.sqharm[35] = (unsigned long )0;
        sqlstm.sqadto[35] = (unsigned short )0;
        sqlstm.sqtdso[35] = (unsigned short )0;
        sqlstm.sqhstv[36] = (unsigned char  *)&(GP_mas->jobgundate);
        sqlstm.sqhstl[36] = (unsigned long )11;
        sqlstm.sqhsts[36] = (         int  )0;
        sqlstm.sqindv[36] = (         short *)0;
        sqlstm.sqinds[36] = (         int  )0;
        sqlstm.sqharm[36] = (unsigned long )0;
        sqlstm.sqadto[36] = (unsigned short )0;
        sqlstm.sqtdso[36] = (unsigned short )0;
        sqlstm.sqhstv[37] = (unsigned char  *)&(GP_mas->jobline);
        sqlstm.sqhstl[37] = (unsigned long )5;
        sqlstm.sqhsts[37] = (         int  )0;
        sqlstm.sqindv[37] = (         short *)0;
        sqlstm.sqinds[37] = (         int  )0;
        sqlstm.sqharm[37] = (unsigned long )0;
        sqlstm.sqadto[37] = (unsigned short )0;
        sqlstm.sqtdso[37] = (unsigned short )0;
        sqlstm.sqhstv[38] = (unsigned char  *)&(GP_mas->joblinedate);
        sqlstm.sqhstl[38] = (unsigned long )11;
        sqlstm.sqhsts[38] = (         int  )0;
        sqlstm.sqindv[38] = (         short *)0;
        sqlstm.sqinds[38] = (         int  )0;
        sqlstm.sqharm[38] = (unsigned long )0;
        sqlstm.sqadto[38] = (unsigned short )0;
        sqlstm.sqtdso[38] = (unsigned short )0;
        sqlstm.sqhstv[39] = (unsigned char  *)&(GP_mas->nogubun);
        sqlstm.sqhstl[39] = (unsigned long )5;
        sqlstm.sqhsts[39] = (         int  )0;
        sqlstm.sqindv[39] = (         short *)0;
        sqlstm.sqinds[39] = (         int  )0;
        sqlstm.sqharm[39] = (unsigned long )0;
        sqlstm.sqadto[39] = (unsigned short )0;
        sqlstm.sqtdso[39] = (unsigned short )0;
        sqlstm.sqhstv[40] = (unsigned char  *)&(GP_mas->empjobline);
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


        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "신입사원 입력 실패!! 사번[%s],성명[%s],Error=[%s]", GP_mas->empno.arr, GP_mas->korname.arr, SQLERRM);
            return 0;
        }
        /* 종합인사시스템 고도화(2018)에서 추가, 신규발령이며 사번변경 발령의 경우 */
        if (((strcmp(GP_anno->ancode.arr, "111") == 0) || (strcmp(GP_anno->ancode.arr, "121") == 0)) &&
            (strcmp(GP_anno->oldempno.arr, "") != 0))
        {
            /* EXEC SQL
            
            -- EMPDATE, EMPCODE, EMPPAYCL 요청에서 제외함(신규에서 들어가는 항목)
            
                  UPDATE PIMPMAS A
                     SET (
                          A.empschgr     ,                 
                          A.bcaryy      ,A.bcarmm       ,A.cardate       ,
                          A.chnname     ,A.engname      ,A.eldsonyn      ,
                          A.marrigeyn   ,A.juminid      ,A.korage        , 
                          A.usaage      ,A.sex          ,
                          A.holdname    ,A.holdrel      ,A.housetype     ,
                          A.health      ,A.bohunyn      ,A.bornarea      ,
                          A.regaddr     ,A.curaddr      ,A.zipno         ,
                          A.telno       ,A.religion     ,A.habit         ,
                          A.ability     ,A.blood        ,A.height        ,
                          A.weight      ,A.armykind     ,A.armycl        ,
                          A.armyfield   ,A.armyfrdate   ,A.armytodate    ,
                          A.armydis     ,A.armyex       ,A.lschgr        ,
                          A.lschdeg     ,A.lschcode     ,A.lschnm        ,
                          A.lmajorcode  ,A.lschfrym     ,A.lschgrym      ,
                          A.unicode     ,A.unimajor     ,A.unifrym       ,
                          A.unigrym     ,A.lschmajnm    ,A.lschtopic     ,
                          A.lickind     ,A.licgr        ,A.licgetdate    ,
                          A.licalkind   ,A.licalgr      ,A.licalgetdate  ,
                          A.licalfield  ,A.licaldate    ,A.licbigo       ,
                          A.toeicscore  ,A.toeicfull    ,A.toeicdate     ,
                          A.jptscore    ,A.jptfull      ,A.jptdate       ,
                          A.edugubun    ,A.eduplace     ,A.educourse     ,
                          A.edufrdate   ,A.edutodate    ,A.eduarea       ,
                          A.educont     ,A.edudufrdate  ,A.edudutodate   ,
                          A.bohungubun  ,A.bohunnm      ,A.bohunrel      ,
                          A.bohunno     ,A.bohunbran    ,A.scgubun       ,
                          A.scentdate   ,A.scpredate    ,A.scenddate     ,
                          A.sctermyn    ,A.scexyy       ,A.scexmm        ,
                          A.scexdd      ,A.scexcause    ,A.obskind       ,
                          A.obsgr       ,A.obsstate     ,A.retcont       ,
                          A.e_mail      ,A.birthday     ,A.birthgubun    ,
                          A.weddingdate ,A.groupempdate ,A.groupcompany  ,
                          A.skemail     ,A.offitel      ,A.imwondate     ,
                          A.rolelevel   ,A.rolelvdate   ,A.country       ,
                          A.nation      ,A.npeople      ,A.region        ,
                          A.postno      ,A.address      ,A.curnation     ,
                          A.curregion
                          )  = 
                 (SELECT  B.empschgr     ,
                          B.bcaryy      ,B.bcarmm       ,B.cardate       ,
                          B.chnname     ,B.engname      ,B.eldsonyn      ,
                          B.marrigeyn   ,B.juminid      ,B.korage        , 
                          B.usaage      ,B.sex          ,
                          B.holdname    ,B.holdrel      ,B.housetype     ,
                          B.health      ,B.bohunyn      ,B.bornarea      ,
                          B.regaddr     ,B.curaddr      ,B.zipno         ,
                          B.telno       ,B.religion     ,B.habit         ,
                          B.ability     ,B.blood        ,B.height        ,
                          B.weight      ,B.armykind     ,B.armycl        ,
                          B.armyfield   ,B.armyfrdate   ,B.armytodate    ,
                          B.armydis     ,B.armyex       ,B.lschgr        ,
                          B.lschdeg     ,B.lschcode     ,B.lschnm        ,
                          B.lmajorcode  ,B.lschfrym     ,B.lschgrym      ,
                          B.unicode     ,B.unimajor     ,B.unifrym       ,
                          B.unigrym     ,B.lschmajnm    ,B.lschtopic     ,
                          B.lickind     ,B.licgr        ,B.licgetdate    ,
                          B.licalkind   ,B.licalgr      ,B.licalgetdate  ,
                          B.licalfield  ,B.licaldate    ,B.licbigo       ,
                          B.toeicscore  ,B.toeicfull    ,B.toeicdate     ,
                          B.jptscore    ,B.jptfull      ,B.jptdate       ,
                          B.edugubun    ,B.eduplace     ,B.educourse     ,
                          B.edufrdate   ,B.edutodate    ,B.eduarea       ,
                          B.educont     ,B.edudufrdate  ,B.edudutodate   ,
                          B.bohungubun  ,B.bohunnm      ,B.bohunrel      ,
                          B.bohunno     ,B.bohunbran    ,B.scgubun       ,
                          B.scentdate   ,B.scpredate    ,B.scenddate     ,
                          B.sctermyn    ,B.scexyy       ,B.scexmm        ,
                          B.scexdd      ,B.scexcause    ,B.obskind       ,
                          B.obsgr       ,B.obsstate     ,B.retcont       ,
                          B.e_mail      ,B.birthday     ,B.birthgubun    ,
                          B.weddingdate ,B.groupempdate ,B.groupcompany  ,
                          B.skemail     ,B.offitel      ,B.imwondate     ,
                          B.rolelevel   ,B.rolelvdate   ,B.country       ,
                          B.nation      ,B.npeople      ,B.region        ,
                          B.postno      ,B.address      ,B.curnation     ,
                          B.curregion
                     FROM PIMPMAS B
                    WHERE B.EMPNO = :GP_anno->oldempno
                  )
                    WHERE A.EMPNO = :GP_anno->empno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlbuft((void **)0,
              "update PIMPMAS A  set (A.empschgr,A.bcaryy,A.bcarmm,A.cardate\
,A.chnname,A.engname,A.eldsonyn,A.marrigeyn,A.juminid,A.korage,A.usaage,A.se\
x,A.holdname,A.holdrel,A.housetype,A.health,A.bohunyn,A.bornarea,A.regaddr,A\
.curaddr,A.zipno,A.telno,A.religion,A.habit,A.ability,A.blood,A.height,A.wei\
ght,A.armykind,A.armycl,A.armyfield,A.armyfrdate,A.armytodate,A.armydis,A.ar\
myex,A.lschgr,A.lschdeg,A.lschcode,A.lschnm,A.lmajorcode,A.lschfrym,A.lschgr\
ym,A.unicode,A.unimajor,A.unifrym,A.unigrym,A.lschmajnm,A.lschtopic,A.lickin\
d,A.licgr,A.licgetdate,A.licalkind,A.licalgr,A.licalgetdate,A.licalfield,A.l\
icaldate,A.licbigo,A.toeicscore,A.toeicfull,A.toeicdate,A.jptscore,A.jptfull\
,A.jptdate,A.edugubun,A.eduplace,A.educourse,A.edufrdate,A.edutodate,A.eduar\
ea,A.educont,A.edudufrdate,A.edudutodate,A.bohungubun,A.bohunnm,A.bohunrel,A\
.bohunno,A.bohunbran,A.scgubun,A.scentdate,A.scpredate,A.scenddate,A.sctermy\
n,A.scexyy,A.scexmm,A.scexdd,A.scexcause,A.obskind,A.obsgr,A.obsstate,A.retc\
ont,A.e_mail,A.birthday,A.birthgubun,A.weddingdate,");
            sqlbuft((void **)0,
              "A.groupempdate,A.groupcompany,A.skemail,A.offitel,A.imwondate\
,A.rolelevel,A.rolelvdate,A.country,A.nation,A.npeople,A.region,A.postno,A.a\
ddress,A.curnation,A.curregion)=(select B.empschgr ,B.bcaryy ,B.bcarmm ,B.ca\
rdate ,B.chnname ,B.engname ,B.eldsonyn ,B.marrigeyn ,B.juminid ,B.korage ,B\
.usaage ,B.sex ,B.holdname ,B.holdrel ,B.housetype ,B.health ,B.bohunyn ,B.b\
ornarea ,B.regaddr ,B.curaddr ,B.zipno ,B.telno ,B.religion ,B.habit ,B.abil\
ity ,B.blood ,B.height ,B.weight ,B.armykind ,B.armycl ,B.armyfield ,B.armyf\
rdate ,B.armytodate ,B.armydis ,B.armyex ,B.lschgr ,B.lschdeg ,B.lschcode ,B\
.lschnm ,B.lmajorcode ,B.lschfrym ,B.lschgrym ,B.unicode ,B.unimajor ,B.unif\
rym ,B.unigrym ,B.lschmajnm ,B.lschtopic ,B.lickind ,B.licgr ,B.licgetdate ,\
B.licalkind ,B.licalgr ,B.licalgetdate ,B.licalfield ,B.licaldate ,B.licbigo\
 ,B.toeicscore ,B.toeicfull ,B.toeicdate ,B.jptscore ,B.jptfull ,B.jptdate ,\
B.edugubun ,B.eduplace ,B.educourse ,B.edufrdate ,B.edutodate ,B.eduarea ,B.\
educont ,B.edudufrdate ,B.edudutodate ,B.bohungubun");
            sqlstm.stmt = " ,B.bohunnm ,B.bohunrel ,B.bohunno ,B.bohunbran \
,B.scgubun ,B.scentdate ,B.scpredate ,B.scenddate ,B.sctermyn ,B.scexyy ,B.sc\
exmm ,B.scexdd ,B.scexcause ,B.obskind ,B.obsgr ,B.obsstate ,B.retcont ,B.e_m\
ail ,B.birthday ,B.birthgubun ,B.weddingdate ,B.groupempdate ,B.groupcompany \
,B.skemail ,B.offitel ,B.imwondate ,B.rolelevel ,B.rolelvdate ,B.country ,B.n\
ation ,B.npeople ,B.region ,B.postno ,B.address ,B.curnation ,B.curregion  fr\
om PIMPMAS B where B.EMPNO=:b0) where A.EMPNO=:b1";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )1982;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->oldempno);
            sqlstm.sqhstl[0] = (unsigned long )7;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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



            if (SQLCODE != SQL_OK)
            {
                STRINIT(&logText);
                sprintf(logText, "인사마스터 수정4 실패!! 사번[%s],성명[%s],Error=[%s]", GP_mas->empno.arr, GP_mas->korname.arr, SQLERRM);
                return 0;
            }

            /* 해당 사원의 관련테이블[PIMSCHO(학력사항),PIMFAMI(가족사항),PIMREWA(포상)] 자료를 신규사번으로 복사 */
            if (Copy_Empno() == 0) return 0;
            /* 복수사번 관리(PYMEMPNO)에 등록 */
            if (Ins_Mempno() == 0) return 0;
        }
    }
    else
    {
        //신규아닐시에...
        /* EXEC SQL
            UPDATE PIMPMAS 
               SET pstate = :GP_mas->pstate, pstateyn = :GP_mas->pstateyn, paycl = :GP_mas->paycl,
                   paygr  = :GP_mas->paygr, payra = :GP_mas->payra, orgnum = :GP_mas->orgnum,
                   jobpayra = :GP_mas->jobpayra, jobpayrayn = :GP_mas->jobpayrayn,
                   deptcode    = :GP_mas->deptcode, fieldcode = :GP_mas->fieldcode, paydunm = :GP_mas->paydunm,
                   realtrdate  = :GP_mas->realtrdate,offtrdate = :GP_mas->offtrdate,payrayn = :GP_mas->payrayn,
                   cpayradate  = :GP_mas->cpayradate, jobplace = :GP_mas->jobplace,empdate = :GP_mas->empdate,
                   cpaycldate  = :GP_mas->cpaycldate,paycldate = :GP_mas->paycldate,reppaycl = :GP_mas->reppaycl,
                   reppayfrdate= :GP_mas->reppayfrdate,reppaytodate = :GP_mas->reppaytodate,apdpaydunm = :GP_mas->apdpaydunm,
                   actpayfrdate= :GP_mas->actpayfrdate,actpaytodate = :GP_mas->actpaytodate,actpaydunm = :GP_mas->actpaydunm,
                   apdpayfrdate= :GP_mas->apdpayfrdate, apdpaytodate = :GP_mas->apdpaytodate,lragrdate = :GP_mas->lragrdate,
                   remark      = :GP_mas->remark, empcode = :GP_mas->empcode, emppaycl = :GP_mas->emppaycl,
                   emppaygr    = :GP_mas->emppaygr, jobgun = :GP_mas->jobgun, jobgundate= :GP_mas->jobgundate,
                   jobline     = :GP_mas->jobline, joblinedate = :GP_mas->joblinedate, nogubun = :GP_mas->nogubun,
                   empjobline  = :GP_mas->empjobline
             WHERE EMPNO = :GP_mas->empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update PIMPMAS  set pstate=:b0,pstateyn=:b1,paycl=:b\
2,paygr=:b3,payra=:b4,orgnum=:b5,jobpayra=:b6,jobpayrayn=:b7,deptcode=:b8,fie\
ldcode=:b9,paydunm=:b10,realtrdate=:b11,offtrdate=:b12,payrayn=:b13,cpayradat\
e=:b14,jobplace=:b15,empdate=:b16,cpaycldate=:b17,paycldate=:b18,reppaycl=:b1\
9,reppayfrdate=:b20,reppaytodate=:b21,apdpaydunm=:b22,actpayfrdate=:b23,actpa\
ytodate=:b24,actpaydunm=:b25,apdpayfrdate=:b26,apdpaytodate=:b27,lragrdate=:b\
28,remark=:b29,empcode=:b30,emppaycl=:b31,emppaygr=:b32,jobgun=:b33,jobgundat\
e=:b34,jobline=:b35,joblinedate=:b36,nogubun=:b37,empjobline=:b38 where EMPNO\
=:b39";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2005;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->pstate);
        sqlstm.sqhstl[0] = (unsigned long )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->pstateyn);
        sqlstm.sqhstl[1] = (unsigned long )4;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->paycl);
        sqlstm.sqhstl[2] = (unsigned long )6;
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->paygr);
        sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         short *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned long )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (unsigned char  *)&(GP_mas->payra);
        sqlstm.sqhstl[4] = (unsigned long )6;
        sqlstm.sqhsts[4] = (         int  )0;
        sqlstm.sqindv[4] = (         short *)0;
        sqlstm.sqinds[4] = (         int  )0;
        sqlstm.sqharm[4] = (unsigned long )0;
        sqlstm.sqadto[4] = (unsigned short )0;
        sqlstm.sqtdso[4] = (unsigned short )0;
        sqlstm.sqhstv[5] = (unsigned char  *)&(GP_mas->orgnum);
        sqlstm.sqhstl[5] = (unsigned long )6;
        sqlstm.sqhsts[5] = (         int  )0;
        sqlstm.sqindv[5] = (         short *)0;
        sqlstm.sqinds[5] = (         int  )0;
        sqlstm.sqharm[5] = (unsigned long )0;
        sqlstm.sqadto[5] = (unsigned short )0;
        sqlstm.sqtdso[5] = (unsigned short )0;
        sqlstm.sqhstv[6] = (unsigned char  *)&(GP_mas->jobpayra);
        sqlstm.sqhstl[6] = (unsigned long )6;
        sqlstm.sqhsts[6] = (         int  )0;
        sqlstm.sqindv[6] = (         short *)0;
        sqlstm.sqinds[6] = (         int  )0;
        sqlstm.sqharm[6] = (unsigned long )0;
        sqlstm.sqadto[6] = (unsigned short )0;
        sqlstm.sqtdso[6] = (unsigned short )0;
        sqlstm.sqhstv[7] = (unsigned char  *)&(GP_mas->jobpayrayn);
        sqlstm.sqhstl[7] = (unsigned long )4;
        sqlstm.sqhsts[7] = (         int  )0;
        sqlstm.sqindv[7] = (         short *)0;
        sqlstm.sqinds[7] = (         int  )0;
        sqlstm.sqharm[7] = (unsigned long )0;
        sqlstm.sqadto[7] = (unsigned short )0;
        sqlstm.sqtdso[7] = (unsigned short )0;
        sqlstm.sqhstv[8] = (unsigned char  *)&(GP_mas->deptcode);
        sqlstm.sqhstl[8] = (unsigned long )8;
        sqlstm.sqhsts[8] = (         int  )0;
        sqlstm.sqindv[8] = (         short *)0;
        sqlstm.sqinds[8] = (         int  )0;
        sqlstm.sqharm[8] = (unsigned long )0;
        sqlstm.sqadto[8] = (unsigned short )0;
        sqlstm.sqtdso[8] = (unsigned short )0;
        sqlstm.sqhstv[9] = (unsigned char  *)&(GP_mas->fieldcode);
        sqlstm.sqhstl[9] = (unsigned long )6;
        sqlstm.sqhsts[9] = (         int  )0;
        sqlstm.sqindv[9] = (         short *)0;
        sqlstm.sqinds[9] = (         int  )0;
        sqlstm.sqharm[9] = (unsigned long )0;
        sqlstm.sqadto[9] = (unsigned short )0;
        sqlstm.sqtdso[9] = (unsigned short )0;
        sqlstm.sqhstv[10] = (unsigned char  *)&(GP_mas->paydunm);
        sqlstm.sqhstl[10] = (unsigned long )33;
        sqlstm.sqhsts[10] = (         int  )0;
        sqlstm.sqindv[10] = (         short *)0;
        sqlstm.sqinds[10] = (         int  )0;
        sqlstm.sqharm[10] = (unsigned long )0;
        sqlstm.sqadto[10] = (unsigned short )0;
        sqlstm.sqtdso[10] = (unsigned short )0;
        sqlstm.sqhstv[11] = (unsigned char  *)&(GP_mas->realtrdate);
        sqlstm.sqhstl[11] = (unsigned long )11;
        sqlstm.sqhsts[11] = (         int  )0;
        sqlstm.sqindv[11] = (         short *)0;
        sqlstm.sqinds[11] = (         int  )0;
        sqlstm.sqharm[11] = (unsigned long )0;
        sqlstm.sqadto[11] = (unsigned short )0;
        sqlstm.sqtdso[11] = (unsigned short )0;
        sqlstm.sqhstv[12] = (unsigned char  *)&(GP_mas->offtrdate);
        sqlstm.sqhstl[12] = (unsigned long )11;
        sqlstm.sqhsts[12] = (         int  )0;
        sqlstm.sqindv[12] = (         short *)0;
        sqlstm.sqinds[12] = (         int  )0;
        sqlstm.sqharm[12] = (unsigned long )0;
        sqlstm.sqadto[12] = (unsigned short )0;
        sqlstm.sqtdso[12] = (unsigned short )0;
        sqlstm.sqhstv[13] = (unsigned char  *)&(GP_mas->payrayn);
        sqlstm.sqhstl[13] = (unsigned long )4;
        sqlstm.sqhsts[13] = (         int  )0;
        sqlstm.sqindv[13] = (         short *)0;
        sqlstm.sqinds[13] = (         int  )0;
        sqlstm.sqharm[13] = (unsigned long )0;
        sqlstm.sqadto[13] = (unsigned short )0;
        sqlstm.sqtdso[13] = (unsigned short )0;
        sqlstm.sqhstv[14] = (unsigned char  *)&(GP_mas->cpayradate);
        sqlstm.sqhstl[14] = (unsigned long )11;
        sqlstm.sqhsts[14] = (         int  )0;
        sqlstm.sqindv[14] = (         short *)0;
        sqlstm.sqinds[14] = (         int  )0;
        sqlstm.sqharm[14] = (unsigned long )0;
        sqlstm.sqadto[14] = (unsigned short )0;
        sqlstm.sqtdso[14] = (unsigned short )0;
        sqlstm.sqhstv[15] = (unsigned char  *)&(GP_mas->jobplace);
        sqlstm.sqhstl[15] = (unsigned long )5;
        sqlstm.sqhsts[15] = (         int  )0;
        sqlstm.sqindv[15] = (         short *)0;
        sqlstm.sqinds[15] = (         int  )0;
        sqlstm.sqharm[15] = (unsigned long )0;
        sqlstm.sqadto[15] = (unsigned short )0;
        sqlstm.sqtdso[15] = (unsigned short )0;
        sqlstm.sqhstv[16] = (unsigned char  *)&(GP_mas->empdate);
        sqlstm.sqhstl[16] = (unsigned long )11;
        sqlstm.sqhsts[16] = (         int  )0;
        sqlstm.sqindv[16] = (         short *)0;
        sqlstm.sqinds[16] = (         int  )0;
        sqlstm.sqharm[16] = (unsigned long )0;
        sqlstm.sqadto[16] = (unsigned short )0;
        sqlstm.sqtdso[16] = (unsigned short )0;
        sqlstm.sqhstv[17] = (unsigned char  *)&(GP_mas->cpaycldate);
        sqlstm.sqhstl[17] = (unsigned long )11;
        sqlstm.sqhsts[17] = (         int  )0;
        sqlstm.sqindv[17] = (         short *)0;
        sqlstm.sqinds[17] = (         int  )0;
        sqlstm.sqharm[17] = (unsigned long )0;
        sqlstm.sqadto[17] = (unsigned short )0;
        sqlstm.sqtdso[17] = (unsigned short )0;
        sqlstm.sqhstv[18] = (unsigned char  *)&(GP_mas->paycldate);
        sqlstm.sqhstl[18] = (unsigned long )11;
        sqlstm.sqhsts[18] = (         int  )0;
        sqlstm.sqindv[18] = (         short *)0;
        sqlstm.sqinds[18] = (         int  )0;
        sqlstm.sqharm[18] = (unsigned long )0;
        sqlstm.sqadto[18] = (unsigned short )0;
        sqlstm.sqtdso[18] = (unsigned short )0;
        sqlstm.sqhstv[19] = (unsigned char  *)&(GP_mas->reppaycl);
        sqlstm.sqhstl[19] = (unsigned long )6;
        sqlstm.sqhsts[19] = (         int  )0;
        sqlstm.sqindv[19] = (         short *)0;
        sqlstm.sqinds[19] = (         int  )0;
        sqlstm.sqharm[19] = (unsigned long )0;
        sqlstm.sqadto[19] = (unsigned short )0;
        sqlstm.sqtdso[19] = (unsigned short )0;
        sqlstm.sqhstv[20] = (unsigned char  *)&(GP_mas->reppayfrdate);
        sqlstm.sqhstl[20] = (unsigned long )11;
        sqlstm.sqhsts[20] = (         int  )0;
        sqlstm.sqindv[20] = (         short *)0;
        sqlstm.sqinds[20] = (         int  )0;
        sqlstm.sqharm[20] = (unsigned long )0;
        sqlstm.sqadto[20] = (unsigned short )0;
        sqlstm.sqtdso[20] = (unsigned short )0;
        sqlstm.sqhstv[21] = (unsigned char  *)&(GP_mas->reppaytodate);
        sqlstm.sqhstl[21] = (unsigned long )11;
        sqlstm.sqhsts[21] = (         int  )0;
        sqlstm.sqindv[21] = (         short *)0;
        sqlstm.sqinds[21] = (         int  )0;
        sqlstm.sqharm[21] = (unsigned long )0;
        sqlstm.sqadto[21] = (unsigned short )0;
        sqlstm.sqtdso[21] = (unsigned short )0;
        sqlstm.sqhstv[22] = (unsigned char  *)&(GP_mas->apdpaydunm);
        sqlstm.sqhstl[22] = (unsigned long )33;
        sqlstm.sqhsts[22] = (         int  )0;
        sqlstm.sqindv[22] = (         short *)0;
        sqlstm.sqinds[22] = (         int  )0;
        sqlstm.sqharm[22] = (unsigned long )0;
        sqlstm.sqadto[22] = (unsigned short )0;
        sqlstm.sqtdso[22] = (unsigned short )0;
        sqlstm.sqhstv[23] = (unsigned char  *)&(GP_mas->actpayfrdate);
        sqlstm.sqhstl[23] = (unsigned long )11;
        sqlstm.sqhsts[23] = (         int  )0;
        sqlstm.sqindv[23] = (         short *)0;
        sqlstm.sqinds[23] = (         int  )0;
        sqlstm.sqharm[23] = (unsigned long )0;
        sqlstm.sqadto[23] = (unsigned short )0;
        sqlstm.sqtdso[23] = (unsigned short )0;
        sqlstm.sqhstv[24] = (unsigned char  *)&(GP_mas->actpaytodate);
        sqlstm.sqhstl[24] = (unsigned long )11;
        sqlstm.sqhsts[24] = (         int  )0;
        sqlstm.sqindv[24] = (         short *)0;
        sqlstm.sqinds[24] = (         int  )0;
        sqlstm.sqharm[24] = (unsigned long )0;
        sqlstm.sqadto[24] = (unsigned short )0;
        sqlstm.sqtdso[24] = (unsigned short )0;
        sqlstm.sqhstv[25] = (unsigned char  *)&(GP_mas->actpaydunm);
        sqlstm.sqhstl[25] = (unsigned long )33;
        sqlstm.sqhsts[25] = (         int  )0;
        sqlstm.sqindv[25] = (         short *)0;
        sqlstm.sqinds[25] = (         int  )0;
        sqlstm.sqharm[25] = (unsigned long )0;
        sqlstm.sqadto[25] = (unsigned short )0;
        sqlstm.sqtdso[25] = (unsigned short )0;
        sqlstm.sqhstv[26] = (unsigned char  *)&(GP_mas->apdpayfrdate);
        sqlstm.sqhstl[26] = (unsigned long )11;
        sqlstm.sqhsts[26] = (         int  )0;
        sqlstm.sqindv[26] = (         short *)0;
        sqlstm.sqinds[26] = (         int  )0;
        sqlstm.sqharm[26] = (unsigned long )0;
        sqlstm.sqadto[26] = (unsigned short )0;
        sqlstm.sqtdso[26] = (unsigned short )0;
        sqlstm.sqhstv[27] = (unsigned char  *)&(GP_mas->apdpaytodate);
        sqlstm.sqhstl[27] = (unsigned long )11;
        sqlstm.sqhsts[27] = (         int  )0;
        sqlstm.sqindv[27] = (         short *)0;
        sqlstm.sqinds[27] = (         int  )0;
        sqlstm.sqharm[27] = (unsigned long )0;
        sqlstm.sqadto[27] = (unsigned short )0;
        sqlstm.sqtdso[27] = (unsigned short )0;
        sqlstm.sqhstv[28] = (unsigned char  *)&(GP_mas->lragrdate);
        sqlstm.sqhstl[28] = (unsigned long )11;
        sqlstm.sqhsts[28] = (         int  )0;
        sqlstm.sqindv[28] = (         short *)0;
        sqlstm.sqinds[28] = (         int  )0;
        sqlstm.sqharm[28] = (unsigned long )0;
        sqlstm.sqadto[28] = (unsigned short )0;
        sqlstm.sqtdso[28] = (unsigned short )0;
        sqlstm.sqhstv[29] = (unsigned char  *)&(GP_mas->remark);
        sqlstm.sqhstl[29] = (unsigned long )5;
        sqlstm.sqhsts[29] = (         int  )0;
        sqlstm.sqindv[29] = (         short *)0;
        sqlstm.sqinds[29] = (         int  )0;
        sqlstm.sqharm[29] = (unsigned long )0;
        sqlstm.sqadto[29] = (unsigned short )0;
        sqlstm.sqtdso[29] = (unsigned short )0;
        sqlstm.sqhstv[30] = (unsigned char  *)&(GP_mas->empcode);
        sqlstm.sqhstl[30] = (unsigned long )5;
        sqlstm.sqhsts[30] = (         int  )0;
        sqlstm.sqindv[30] = (         short *)0;
        sqlstm.sqinds[30] = (         int  )0;
        sqlstm.sqharm[30] = (unsigned long )0;
        sqlstm.sqadto[30] = (unsigned short )0;
        sqlstm.sqtdso[30] = (unsigned short )0;
        sqlstm.sqhstv[31] = (unsigned char  *)&(GP_mas->emppaycl);
        sqlstm.sqhstl[31] = (unsigned long )6;
        sqlstm.sqhsts[31] = (         int  )0;
        sqlstm.sqindv[31] = (         short *)0;
        sqlstm.sqinds[31] = (         int  )0;
        sqlstm.sqharm[31] = (unsigned long )0;
        sqlstm.sqadto[31] = (unsigned short )0;
        sqlstm.sqtdso[31] = (unsigned short )0;
        sqlstm.sqhstv[32] = (unsigned char  *)&(GP_mas->emppaygr);
        sqlstm.sqhstl[32] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[32] = (         int  )0;
        sqlstm.sqindv[32] = (         short *)0;
        sqlstm.sqinds[32] = (         int  )0;
        sqlstm.sqharm[32] = (unsigned long )0;
        sqlstm.sqadto[32] = (unsigned short )0;
        sqlstm.sqtdso[32] = (unsigned short )0;
        sqlstm.sqhstv[33] = (unsigned char  *)&(GP_mas->jobgun);
        sqlstm.sqhstl[33] = (unsigned long )5;
        sqlstm.sqhsts[33] = (         int  )0;
        sqlstm.sqindv[33] = (         short *)0;
        sqlstm.sqinds[33] = (         int  )0;
        sqlstm.sqharm[33] = (unsigned long )0;
        sqlstm.sqadto[33] = (unsigned short )0;
        sqlstm.sqtdso[33] = (unsigned short )0;
        sqlstm.sqhstv[34] = (unsigned char  *)&(GP_mas->jobgundate);
        sqlstm.sqhstl[34] = (unsigned long )11;
        sqlstm.sqhsts[34] = (         int  )0;
        sqlstm.sqindv[34] = (         short *)0;
        sqlstm.sqinds[34] = (         int  )0;
        sqlstm.sqharm[34] = (unsigned long )0;
        sqlstm.sqadto[34] = (unsigned short )0;
        sqlstm.sqtdso[34] = (unsigned short )0;
        sqlstm.sqhstv[35] = (unsigned char  *)&(GP_mas->jobline);
        sqlstm.sqhstl[35] = (unsigned long )5;
        sqlstm.sqhsts[35] = (         int  )0;
        sqlstm.sqindv[35] = (         short *)0;
        sqlstm.sqinds[35] = (         int  )0;
        sqlstm.sqharm[35] = (unsigned long )0;
        sqlstm.sqadto[35] = (unsigned short )0;
        sqlstm.sqtdso[35] = (unsigned short )0;
        sqlstm.sqhstv[36] = (unsigned char  *)&(GP_mas->joblinedate);
        sqlstm.sqhstl[36] = (unsigned long )11;
        sqlstm.sqhsts[36] = (         int  )0;
        sqlstm.sqindv[36] = (         short *)0;
        sqlstm.sqinds[36] = (         int  )0;
        sqlstm.sqharm[36] = (unsigned long )0;
        sqlstm.sqadto[36] = (unsigned short )0;
        sqlstm.sqtdso[36] = (unsigned short )0;
        sqlstm.sqhstv[37] = (unsigned char  *)&(GP_mas->nogubun);
        sqlstm.sqhstl[37] = (unsigned long )5;
        sqlstm.sqhsts[37] = (         int  )0;
        sqlstm.sqindv[37] = (         short *)0;
        sqlstm.sqinds[37] = (         int  )0;
        sqlstm.sqharm[37] = (unsigned long )0;
        sqlstm.sqadto[37] = (unsigned short )0;
        sqlstm.sqtdso[37] = (unsigned short )0;
        sqlstm.sqhstv[38] = (unsigned char  *)&(GP_mas->empjobline);
        sqlstm.sqhstl[38] = (unsigned long )5;
        sqlstm.sqhsts[38] = (         int  )0;
        sqlstm.sqindv[38] = (         short *)0;
        sqlstm.sqinds[38] = (         int  )0;
        sqlstm.sqharm[38] = (unsigned long )0;
        sqlstm.sqadto[38] = (unsigned short )0;
        sqlstm.sqtdso[38] = (unsigned short )0;
        sqlstm.sqhstv[39] = (unsigned char  *)&(GP_mas->empno);
        sqlstm.sqhstl[39] = (unsigned long )7;
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


        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "인사마스터 수정1 실패!! 사번[%s],성명[%s],Error=[%s]", GP_mas->empno.arr, GP_mas->korname.arr, SQLERRM);
            return 0;
        }
    }
    // 추가,수정 공통 루틴(신규발령이든,다른발령이든.)..........................................................
    /* EXEC SQL
        UPDATE PIMPMAS
           SET lancode = :GP_mas->lancode, lannono = :GP_mas->lannono, lanfrdate = :GP_mas->lanfrdate,
               lantodate = :GP_mas->lantodate, exdutcnt = :GP_mas->exdutcnt, exdutyy = :GP_mas->exdutyy,
               exdutmm = :GP_mas->exdutmm, exdutdd = :GP_mas->exdutdd, lexfrdate = :GP_mas->lexfrdate,
               lextodate  = :GP_mas->lextodate, lexduyy = :GP_mas->lexduyy, lexdumm = :GP_mas->lexdumm,
               lexdudd  = :GP_mas->lexdudd, lrkind = :GP_mas->lrkind, lrfrdate = :GP_mas->lrfrdate,
               lrtodate = :GP_mas->lrtodate, lvfrdate = :GP_mas->lvfrdate, lvtodate = :GP_mas->lvtodate,
               lsekind  = :GP_mas->lsekind,  lsefrdate = :GP_mas->lsefrdate,lsetodate = :GP_mas->lsetodate,
               lseplace = :GP_mas->lseplace, lsesayu = :GP_mas->lsesayu, lsecont = :GP_mas->lsecont,
               hugubun  = :GP_mas->hugubun, hufrdate = :GP_mas->hufrdate, hutodate = :GP_mas->hutodate
         WHERE EMPNO = :GP_mas->empno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update PIMPMAS  set lancode=:b0,lannono=:b1,lanfrdate=:b\
2,lantodate=:b3,exdutcnt=:b4,exdutyy=:b5,exdutmm=:b6,exdutdd=:b7,lexfrdate=:b\
8,lextodate=:b9,lexduyy=:b10,lexdumm=:b11,lexdudd=:b12,lrkind=:b13,lrfrdate=:\
b14,lrtodate=:b15,lvfrdate=:b16,lvtodate=:b17,lsekind=:b18,lsefrdate=:b19,lse\
todate=:b20,lseplace=:b21,lsesayu=:b22,lsecont=:b23,hugubun=:b24,hufrdate=:b2\
5,hutodate=:b26 where EMPNO=:b27";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )2180;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->lancode);
    sqlstm.sqhstl[0] = (unsigned long )6;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->lannono);
    sqlstm.sqhstl[1] = (unsigned long )11;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->lanfrdate);
    sqlstm.sqhstl[2] = (unsigned long )11;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->lantodate);
    sqlstm.sqhstl[3] = (unsigned long )11;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&(GP_mas->exdutcnt);
    sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_mas->exdutyy);
    sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&(GP_mas->exdutmm);
    sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&(GP_mas->exdutdd);
    sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&(GP_mas->lexfrdate);
    sqlstm.sqhstl[8] = (unsigned long )11;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&(GP_mas->lextodate);
    sqlstm.sqhstl[9] = (unsigned long )11;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)&(GP_mas->lexduyy);
    sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)&(GP_mas->lexdumm);
    sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)&(GP_mas->lexdudd);
    sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)&(GP_mas->lrkind);
    sqlstm.sqhstl[13] = (unsigned long )5;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)&(GP_mas->lrfrdate);
    sqlstm.sqhstl[14] = (unsigned long )11;
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqhstv[15] = (unsigned char  *)&(GP_mas->lrtodate);
    sqlstm.sqhstl[15] = (unsigned long )11;
    sqlstm.sqhsts[15] = (         int  )0;
    sqlstm.sqindv[15] = (         short *)0;
    sqlstm.sqinds[15] = (         int  )0;
    sqlstm.sqharm[15] = (unsigned long )0;
    sqlstm.sqadto[15] = (unsigned short )0;
    sqlstm.sqtdso[15] = (unsigned short )0;
    sqlstm.sqhstv[16] = (unsigned char  *)&(GP_mas->lvfrdate);
    sqlstm.sqhstl[16] = (unsigned long )11;
    sqlstm.sqhsts[16] = (         int  )0;
    sqlstm.sqindv[16] = (         short *)0;
    sqlstm.sqinds[16] = (         int  )0;
    sqlstm.sqharm[16] = (unsigned long )0;
    sqlstm.sqadto[16] = (unsigned short )0;
    sqlstm.sqtdso[16] = (unsigned short )0;
    sqlstm.sqhstv[17] = (unsigned char  *)&(GP_mas->lvtodate);
    sqlstm.sqhstl[17] = (unsigned long )11;
    sqlstm.sqhsts[17] = (         int  )0;
    sqlstm.sqindv[17] = (         short *)0;
    sqlstm.sqinds[17] = (         int  )0;
    sqlstm.sqharm[17] = (unsigned long )0;
    sqlstm.sqadto[17] = (unsigned short )0;
    sqlstm.sqtdso[17] = (unsigned short )0;
    sqlstm.sqhstv[18] = (unsigned char  *)&(GP_mas->lsekind);
    sqlstm.sqhstl[18] = (unsigned long )5;
    sqlstm.sqhsts[18] = (         int  )0;
    sqlstm.sqindv[18] = (         short *)0;
    sqlstm.sqinds[18] = (         int  )0;
    sqlstm.sqharm[18] = (unsigned long )0;
    sqlstm.sqadto[18] = (unsigned short )0;
    sqlstm.sqtdso[18] = (unsigned short )0;
    sqlstm.sqhstv[19] = (unsigned char  *)&(GP_mas->lsefrdate);
    sqlstm.sqhstl[19] = (unsigned long )11;
    sqlstm.sqhsts[19] = (         int  )0;
    sqlstm.sqindv[19] = (         short *)0;
    sqlstm.sqinds[19] = (         int  )0;
    sqlstm.sqharm[19] = (unsigned long )0;
    sqlstm.sqadto[19] = (unsigned short )0;
    sqlstm.sqtdso[19] = (unsigned short )0;
    sqlstm.sqhstv[20] = (unsigned char  *)&(GP_mas->lsetodate);
    sqlstm.sqhstl[20] = (unsigned long )11;
    sqlstm.sqhsts[20] = (         int  )0;
    sqlstm.sqindv[20] = (         short *)0;
    sqlstm.sqinds[20] = (         int  )0;
    sqlstm.sqharm[20] = (unsigned long )0;
    sqlstm.sqadto[20] = (unsigned short )0;
    sqlstm.sqtdso[20] = (unsigned short )0;
    sqlstm.sqhstv[21] = (unsigned char  *)&(GP_mas->lseplace);
    sqlstm.sqhstl[21] = (unsigned long )43;
    sqlstm.sqhsts[21] = (         int  )0;
    sqlstm.sqindv[21] = (         short *)0;
    sqlstm.sqinds[21] = (         int  )0;
    sqlstm.sqharm[21] = (unsigned long )0;
    sqlstm.sqadto[21] = (unsigned short )0;
    sqlstm.sqtdso[21] = (unsigned short )0;
    sqlstm.sqhstv[22] = (unsigned char  *)&(GP_mas->lsesayu);
    sqlstm.sqhstl[22] = (unsigned long )43;
    sqlstm.sqhsts[22] = (         int  )0;
    sqlstm.sqindv[22] = (         short *)0;
    sqlstm.sqinds[22] = (         int  )0;
    sqlstm.sqharm[22] = (unsigned long )0;
    sqlstm.sqadto[22] = (unsigned short )0;
    sqlstm.sqtdso[22] = (unsigned short )0;
    sqlstm.sqhstv[23] = (unsigned char  *)&(GP_mas->lsecont);
    sqlstm.sqhstl[23] = (unsigned long )43;
    sqlstm.sqhsts[23] = (         int  )0;
    sqlstm.sqindv[23] = (         short *)0;
    sqlstm.sqinds[23] = (         int  )0;
    sqlstm.sqharm[23] = (unsigned long )0;
    sqlstm.sqadto[23] = (unsigned short )0;
    sqlstm.sqtdso[23] = (unsigned short )0;
    sqlstm.sqhstv[24] = (unsigned char  *)&(GP_mas->hugubun);
    sqlstm.sqhstl[24] = (unsigned long )5;
    sqlstm.sqhsts[24] = (         int  )0;
    sqlstm.sqindv[24] = (         short *)0;
    sqlstm.sqinds[24] = (         int  )0;
    sqlstm.sqharm[24] = (unsigned long )0;
    sqlstm.sqadto[24] = (unsigned short )0;
    sqlstm.sqtdso[24] = (unsigned short )0;
    sqlstm.sqhstv[25] = (unsigned char  *)&(GP_mas->hufrdate);
    sqlstm.sqhstl[25] = (unsigned long )11;
    sqlstm.sqhsts[25] = (         int  )0;
    sqlstm.sqindv[25] = (         short *)0;
    sqlstm.sqinds[25] = (         int  )0;
    sqlstm.sqharm[25] = (unsigned long )0;
    sqlstm.sqadto[25] = (unsigned short )0;
    sqlstm.sqtdso[25] = (unsigned short )0;
    sqlstm.sqhstv[26] = (unsigned char  *)&(GP_mas->hutodate);
    sqlstm.sqhstl[26] = (unsigned long )11;
    sqlstm.sqhsts[26] = (         int  )0;
    sqlstm.sqindv[26] = (         short *)0;
    sqlstm.sqinds[26] = (         int  )0;
    sqlstm.sqharm[26] = (unsigned long )0;
    sqlstm.sqadto[26] = (unsigned short )0;
    sqlstm.sqtdso[26] = (unsigned short )0;
    sqlstm.sqhstv[27] = (unsigned char  *)&(GP_mas->empno);
    sqlstm.sqhstl[27] = (unsigned long )7;
    sqlstm.sqhsts[27] = (         int  )0;
    sqlstm.sqindv[27] = (         short *)0;
    sqlstm.sqinds[27] = (         int  )0;
    sqlstm.sqharm[27] = (unsigned long )0;
    sqlstm.sqadto[27] = (unsigned short )0;
    sqlstm.sqtdso[27] = (unsigned short )0;
    sqlstm.sqphsv = sqlstm.sqhstv;
    sqlstm.sqphsl = sqlstm.sqhstl;
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
        STRINIT(&logText);
        sprintf(logText, "인사마스터 수정2 실패!! 사번[%s],성명[%s],Error=[%s]", GP_mas->empno.arr, GP_mas->korname.arr, SQLERRM);
        return 0;
    }
    //버전    수정일    수정자   관련근거          수정내용
    //1.02  1998.4.20   김혜진   전(98.4.11)  계약,재계약,부서변동,계약변경,계약해지
    //                                        발령에서 파견업체(tcompany) 추가.
    /* EXEC SQL
        UPDATE PIMPMAS
           SET retdate     = :GP_mas->retdate, retgubun = :GP_mas->retgubun, retsayu1 = :GP_mas->retsayu1,
               retsayu2    = :GP_mas->retsayu2, otdufrdate = :GP_mas->otdufrdate,
               otdutodate  = :GP_mas->otdutodate, tcontr = :GP_mas->tcontr, tcontramt = :GP_mas->tcontramt,
               ttype       = :GP_mas->ttype, tjobduty = :GP_mas->tjobduty, tcond = :GP_mas->tcond, tcompany = :GP_mas->tcompany,
               edugubun    = :GP_mas->edugubun, eduplace = :GP_mas->eduplace, educourse = :GP_mas->educourse,
               edufrdate   = :GP_mas->edufrdate, edutodate = :GP_mas->edutodate, eduarea = :GP_mas->eduarea,
               edudufrdate = :GP_mas->edudufrdate, edudutodate = :GP_mas->edudutodate,
               educont     = :GP_mas->educont, writetime = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD'), writeemp = :jobEmpno,
               fincode     = :GP_mas->fincode, boncode = :GP_mas->boncode, jobdept = :GP_mas->jobdept,
               orgempdate  = :GP_mas->orgempdate
         WHERE empno = :GP_mas->empno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update PIMPMAS  set retdate=:b0,retgubun=:b1,retsayu1=:b\
2,retsayu2=:b3,otdufrdate=:b4,otdutodate=:b5,tcontr=:b6,tcontramt=:b7,ttype=:\
b8,tjobduty=:b9,tcond=:b10,tcompany=:b11,edugubun=:b12,eduplace=:b13,educours\
e=:b14,edufrdate=:b15,edutodate=:b16,eduarea=:b17,edudufrdate=:b18,edudutodat\
e=:b19,educont=:b20,writetime=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),writeemp=:\
b21,fincode=:b22,boncode=:b23,jobdept=:b24,orgempdate=:b25 where empno=:b26";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )2307;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->retdate);
    sqlstm.sqhstl[0] = (unsigned long )11;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->retgubun);
    sqlstm.sqhstl[1] = (unsigned long )5;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_mas->retsayu1);
    sqlstm.sqhstl[2] = (unsigned long )5;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->retsayu2);
    sqlstm.sqhstl[3] = (unsigned long )5;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)&(GP_mas->otdufrdate);
    sqlstm.sqhstl[4] = (unsigned long )11;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_mas->otdutodate);
    sqlstm.sqhstl[5] = (unsigned long )11;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&(GP_mas->tcontr);
    sqlstm.sqhstl[6] = (unsigned long )4;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&(GP_mas->tcontramt);
    sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&(GP_mas->ttype);
    sqlstm.sqhstl[8] = (unsigned long )23;
    sqlstm.sqhsts[8] = (         int  )0;
    sqlstm.sqindv[8] = (         short *)0;
    sqlstm.sqinds[8] = (         int  )0;
    sqlstm.sqharm[8] = (unsigned long )0;
    sqlstm.sqadto[8] = (unsigned short )0;
    sqlstm.sqtdso[8] = (unsigned short )0;
    sqlstm.sqhstv[9] = (unsigned char  *)&(GP_mas->tjobduty);
    sqlstm.sqhstl[9] = (unsigned long )43;
    sqlstm.sqhsts[9] = (         int  )0;
    sqlstm.sqindv[9] = (         short *)0;
    sqlstm.sqinds[9] = (         int  )0;
    sqlstm.sqharm[9] = (unsigned long )0;
    sqlstm.sqadto[9] = (unsigned short )0;
    sqlstm.sqtdso[9] = (unsigned short )0;
    sqlstm.sqhstv[10] = (unsigned char  *)&(GP_mas->tcond);
    sqlstm.sqhstl[10] = (unsigned long )43;
    sqlstm.sqhsts[10] = (         int  )0;
    sqlstm.sqindv[10] = (         short *)0;
    sqlstm.sqinds[10] = (         int  )0;
    sqlstm.sqharm[10] = (unsigned long )0;
    sqlstm.sqadto[10] = (unsigned short )0;
    sqlstm.sqtdso[10] = (unsigned short )0;
    sqlstm.sqhstv[11] = (unsigned char  *)&(GP_mas->tcompany);
    sqlstm.sqhstl[11] = (unsigned long )5;
    sqlstm.sqhsts[11] = (         int  )0;
    sqlstm.sqindv[11] = (         short *)0;
    sqlstm.sqinds[11] = (         int  )0;
    sqlstm.sqharm[11] = (unsigned long )0;
    sqlstm.sqadto[11] = (unsigned short )0;
    sqlstm.sqtdso[11] = (unsigned short )0;
    sqlstm.sqhstv[12] = (unsigned char  *)&(GP_mas->edugubun);
    sqlstm.sqhstl[12] = (unsigned long )5;
    sqlstm.sqhsts[12] = (         int  )0;
    sqlstm.sqindv[12] = (         short *)0;
    sqlstm.sqinds[12] = (         int  )0;
    sqlstm.sqharm[12] = (unsigned long )0;
    sqlstm.sqadto[12] = (unsigned short )0;
    sqlstm.sqtdso[12] = (unsigned short )0;
    sqlstm.sqhstv[13] = (unsigned char  *)&(GP_mas->eduplace);
    sqlstm.sqhstl[13] = (unsigned long )33;
    sqlstm.sqhsts[13] = (         int  )0;
    sqlstm.sqindv[13] = (         short *)0;
    sqlstm.sqinds[13] = (         int  )0;
    sqlstm.sqharm[13] = (unsigned long )0;
    sqlstm.sqadto[13] = (unsigned short )0;
    sqlstm.sqtdso[13] = (unsigned short )0;
    sqlstm.sqhstv[14] = (unsigned char  *)&(GP_mas->educourse);
    sqlstm.sqhstl[14] = (unsigned long )43;
    sqlstm.sqhsts[14] = (         int  )0;
    sqlstm.sqindv[14] = (         short *)0;
    sqlstm.sqinds[14] = (         int  )0;
    sqlstm.sqharm[14] = (unsigned long )0;
    sqlstm.sqadto[14] = (unsigned short )0;
    sqlstm.sqtdso[14] = (unsigned short )0;
    sqlstm.sqhstv[15] = (unsigned char  *)&(GP_mas->edufrdate);
    sqlstm.sqhstl[15] = (unsigned long )11;
    sqlstm.sqhsts[15] = (         int  )0;
    sqlstm.sqindv[15] = (         short *)0;
    sqlstm.sqinds[15] = (         int  )0;
    sqlstm.sqharm[15] = (unsigned long )0;
    sqlstm.sqadto[15] = (unsigned short )0;
    sqlstm.sqtdso[15] = (unsigned short )0;
    sqlstm.sqhstv[16] = (unsigned char  *)&(GP_mas->edutodate);
    sqlstm.sqhstl[16] = (unsigned long )11;
    sqlstm.sqhsts[16] = (         int  )0;
    sqlstm.sqindv[16] = (         short *)0;
    sqlstm.sqinds[16] = (         int  )0;
    sqlstm.sqharm[16] = (unsigned long )0;
    sqlstm.sqadto[16] = (unsigned short )0;
    sqlstm.sqtdso[16] = (unsigned short )0;
    sqlstm.sqhstv[17] = (unsigned char  *)&(GP_mas->eduarea);
    sqlstm.sqhstl[17] = (unsigned long )13;
    sqlstm.sqhsts[17] = (         int  )0;
    sqlstm.sqindv[17] = (         short *)0;
    sqlstm.sqinds[17] = (         int  )0;
    sqlstm.sqharm[17] = (unsigned long )0;
    sqlstm.sqadto[17] = (unsigned short )0;
    sqlstm.sqtdso[17] = (unsigned short )0;
    sqlstm.sqhstv[18] = (unsigned char  *)&(GP_mas->edudufrdate);
    sqlstm.sqhstl[18] = (unsigned long )11;
    sqlstm.sqhsts[18] = (         int  )0;
    sqlstm.sqindv[18] = (         short *)0;
    sqlstm.sqinds[18] = (         int  )0;
    sqlstm.sqharm[18] = (unsigned long )0;
    sqlstm.sqadto[18] = (unsigned short )0;
    sqlstm.sqtdso[18] = (unsigned short )0;
    sqlstm.sqhstv[19] = (unsigned char  *)&(GP_mas->edudutodate);
    sqlstm.sqhstl[19] = (unsigned long )11;
    sqlstm.sqhsts[19] = (         int  )0;
    sqlstm.sqindv[19] = (         short *)0;
    sqlstm.sqinds[19] = (         int  )0;
    sqlstm.sqharm[19] = (unsigned long )0;
    sqlstm.sqadto[19] = (unsigned short )0;
    sqlstm.sqtdso[19] = (unsigned short )0;
    sqlstm.sqhstv[20] = (unsigned char  *)&(GP_mas->educont);
    sqlstm.sqhstl[20] = (unsigned long )43;
    sqlstm.sqhsts[20] = (         int  )0;
    sqlstm.sqindv[20] = (         short *)0;
    sqlstm.sqinds[20] = (         int  )0;
    sqlstm.sqharm[20] = (unsigned long )0;
    sqlstm.sqadto[20] = (unsigned short )0;
    sqlstm.sqtdso[20] = (unsigned short )0;
    sqlstm.sqhstv[21] = (unsigned char  *)jobEmpno;
    sqlstm.sqhstl[21] = (unsigned long )5;
    sqlstm.sqhsts[21] = (         int  )0;
    sqlstm.sqindv[21] = (         short *)0;
    sqlstm.sqinds[21] = (         int  )0;
    sqlstm.sqharm[21] = (unsigned long )0;
    sqlstm.sqadto[21] = (unsigned short )0;
    sqlstm.sqtdso[21] = (unsigned short )0;
    sqlstm.sqhstv[22] = (unsigned char  *)&(GP_mas->fincode);
    sqlstm.sqhstl[22] = (unsigned long )8;
    sqlstm.sqhsts[22] = (         int  )0;
    sqlstm.sqindv[22] = (         short *)0;
    sqlstm.sqinds[22] = (         int  )0;
    sqlstm.sqharm[22] = (unsigned long )0;
    sqlstm.sqadto[22] = (unsigned short )0;
    sqlstm.sqtdso[22] = (unsigned short )0;
    sqlstm.sqhstv[23] = (unsigned char  *)&(GP_mas->boncode);
    sqlstm.sqhstl[23] = (unsigned long )8;
    sqlstm.sqhsts[23] = (         int  )0;
    sqlstm.sqindv[23] = (         short *)0;
    sqlstm.sqinds[23] = (         int  )0;
    sqlstm.sqharm[23] = (unsigned long )0;
    sqlstm.sqadto[23] = (unsigned short )0;
    sqlstm.sqtdso[23] = (unsigned short )0;
    sqlstm.sqhstv[24] = (unsigned char  *)&(GP_mas->jobdept);
    sqlstm.sqhstl[24] = (unsigned long )8;
    sqlstm.sqhsts[24] = (         int  )0;
    sqlstm.sqindv[24] = (         short *)0;
    sqlstm.sqinds[24] = (         int  )0;
    sqlstm.sqharm[24] = (unsigned long )0;
    sqlstm.sqadto[24] = (unsigned short )0;
    sqlstm.sqtdso[24] = (unsigned short )0;
    sqlstm.sqhstv[25] = (unsigned char  *)&(GP_mas->orgempdate);
    sqlstm.sqhstl[25] = (unsigned long )11;
    sqlstm.sqhsts[25] = (         int  )0;
    sqlstm.sqindv[25] = (         short *)0;
    sqlstm.sqinds[25] = (         int  )0;
    sqlstm.sqharm[25] = (unsigned long )0;
    sqlstm.sqadto[25] = (unsigned short )0;
    sqlstm.sqtdso[25] = (unsigned short )0;
    sqlstm.sqhstv[26] = (unsigned char  *)&(GP_mas->empno);
    sqlstm.sqhstl[26] = (unsigned long )7;
    sqlstm.sqhsts[26] = (         int  )0;
    sqlstm.sqindv[26] = (         short *)0;
    sqlstm.sqinds[26] = (         int  )0;
    sqlstm.sqharm[26] = (unsigned long )0;
    sqlstm.sqadto[26] = (unsigned short )0;
    sqlstm.sqtdso[26] = (unsigned short )0;
    sqlstm.sqphsv = sqlstm.sqhstv;
    sqlstm.sqphsl = sqlstm.sqhstl;
    sqlstm.sqphss = sqlstm.sqhsts;
    sqlstm.sqpind = sqlstm.sqindv;
    sqlstm.sqpins = sqlstm.sqinds;
    sqlstm.sqparm = sqlstm.sqharm;
    sqlstm.sqparc = sqlstm.sqharc;
    sqlstm.sqpadto = sqlstm.sqadto;
    sqlstm.sqptdso = sqlstm.sqtdso;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    if ((SQLCODE == SQL_OK) && (sqlca.sqlerrd[2] <= 0))
    {
        STRINIT(&logText);
        sprintf(logText, "인사마스터 수정3 실패!! 사번[%s],성명[%s],Error=[%s]", GP_mas->empno.arr, GP_mas->korname.arr, SQLERRM);
        return 0;
    }
    // 신규 추가 2018.08
    if (strcmp(GP_mas->juminid.arr, "") == 0)
    {
        STRINIT(&logText);
        sprintf(logText, "[요약]주민등록번호 입력 필요!! 사번[%s],성명[%s]", GP_mas->empno.arr, GP_mas->korname.arr);
        logSave(logText);
    }
    //인사발령화일을 수정한다..
    if ((strncmp(GP_anno->anfrdate.arr, hisfryymm.arr, 6) >= 0) && (strncmp(GP_anno->anfrdate.arr, histoyymm.arr, 6) <= 0))
    {
        //이력월, 이력월말일
        STRINIT(&strMM);
        STRINIT(&strDD);
        strncpy(strMM, GP_anno->anfrdate.arr, 6);
        /* EXEC SQL SELECT TO_CHAR(LAST_DAY(TO_DATE(:strMM, 'YYYYMM')), 'YYYYMMDD') 
                   INTO :strDD  FROM DUAL; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select TO_CHAR(LAST_DAY(TO_DATE(:b0,'YYYYMM')),'YYYY\
MMDD') into :b1  from DUAL ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2430;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strMM;
        sqlstm.sqhstl[0] = (unsigned long )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)strDD;
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



        // 기존자료 삭제 후 재입력
        /* EXEC SQL DELETE FROM PIHPMAS 
                  WHERE WORKYYMM >= :strMM 
                    AND EMPNO = :GP_anno->empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "delete  from PIHPMAS  where (WORKYYMM>=:b0 and EMPNO\
=:b1)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2453;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strMM;
        sqlstm.sqhstl[0] = (unsigned long )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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


        if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
        {
            STRINIT(&logText);
            sprintf(logText, "인사마스터_이력 삭제 후 재입력 실패!! 사번[%s],성명[%s],Error=[%s]", GP_anno->empno.arr, GP_anno->korname.arr, SQLERRM);
            return 0;
        }
        while(strcmp(strMM, histoyymm.arr) <= 0)
        {
            iErrcnt = 0;
            // "인사마스터_이력"의 수정을 위한 임시 숫자 변수, 총 13개 컬럼
            // [0]한국식나이,[1]미국식나이,[2]근속기간년,[3]근속기간월,[4]근속기간일,[5]총재직일,[6]재급기간년,[7]재급기간월,
            // [8]재급기간일,[9]총재급일,[10]하나로군속기간년,[11]하나로군속기간월,[12]하나로군속기간일
            for (iCnt = 0; iCnt < 13; iCnt++)
                iCol[iCnt] = 0;
                
            /* EXEC SQL
                INSERT INTO PIHPMAS
                SELECT :strMM, A.* 
                  FROM PIMPMAS A
                 WHERE EMPNO = :GP_anno->empno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "insert into PIHPMAS  select :b0 ,A.*  from PIMPM\
AS A where EMPNO=:b1";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )2476;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)strMM;
            sqlstm.sqhstl[0] = (unsigned long )7;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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


            if (SQLCODE != SQL_OK)
            {
                STRINIT(&logText);
                sprintf(logText, "인사마스터_이력 입력 실패!! 작업년월[%s],사번[%s],성명[%s],Error=[%s]", strMM, GP_anno->empno.arr, GP_anno->korname.arr, SQLERRM);
                return 0;
            }
            // 나이 계산
            STRINIT(&strJumin);
            STRINIT(&strDate);
            VC2STR(strJumin, GP_mas->juminid);
            if      ((strncmp(hinsa_copy(strJumin, 8, 1), "1") == 0) || (strncmp(hinsa_copy(strJumin, 8, 1), "2") == 0))
                sprintf(strDate, "19%s", hinsa_copy(strJumin, 1, 6));
            else if ((strncmp(hinsa_copy(strJumin, 8, 1), "3") == 0) || (strncmp(hinsa_copy(strJumin, 8, 1), "4") == 0))
                sprintf(strDate, "20%s", hinsa_copy(strJumin, 1, 6));
            else
                strcpy(strDate, "00000000");
            // 나이 계산
            if (strcmp(strDate, "00000000") != 0)
            {
                iCol[0] = atoi(hinsa_copy(strMM, 1, 4)) - atoi(hinsa_copy(strDate, 1, 4));  //한국식나이
                iCol[1] = atoi(hinsa_copy(DateCalc(0, strDate, strDD), 1, 2));              //미국식나이
            }

            // 근속일 계산
            STRINIT(&sRetday);
            if (strcmp(GP_mas->retdate.arr, "") != 0)       
            {   
                strcpy(sRetday, DateCalc(0, (char *)GP_mas->empdate.arr, (char *)GP_mas->retdate.arr));
                /* EXEC SQL SELECT TO_DATE(:GP_mas->retdate, 'YYYYMMDD') - TO_DATE(:GP_mas->empdate, 'YYYYMMDD') 
                           INTO :iCol[5] FROM DUAL; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,\
'YYYYMMDD')) into :b2  from DUAL ";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2499;
                sqlstm.selerr = (unsigned short)0;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->retdate);
                sqlstm.sqhstl[0] = (unsigned long )11;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->empdate);
                sqlstm.sqhstl[1] = (unsigned long )11;
                sqlstm.sqhsts[1] = (         int  )0;
                sqlstm.sqindv[1] = (         short *)0;
                sqlstm.sqinds[1] = (         int  )0;
                sqlstm.sqharm[1] = (unsigned long )0;
                sqlstm.sqadto[1] = (unsigned short )0;
                sqlstm.sqtdso[1] = (unsigned short )0;
                sqlstm.sqhstv[2] = (unsigned char  *)&iCol[5];
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

         //총재직일
            }
            else
            {
                strcpy(sRetday, DateCalc(0, (char *)GP_mas->empdate.arr, (char *)strDD));
                /* EXEC SQL SELECT TO_DATE(:strDD, 'YYYYMMDD') - TO_DATE(:GP_mas->empdate, 'YYYYMMDD') 
                           INTO :iCol[5] FROM DUAL; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,\
'YYYYMMDD')) into :b2  from DUAL ";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2526;
                sqlstm.selerr = (unsigned short)0;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)strDD;
                sqlstm.sqhstl[0] = (unsigned long )9;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)&(GP_mas->empdate);
                sqlstm.sqhstl[1] = (unsigned long )11;
                sqlstm.sqhsts[1] = (         int  )0;
                sqlstm.sqindv[1] = (         short *)0;
                sqlstm.sqinds[1] = (         int  )0;
                sqlstm.sqharm[1] = (unsigned long )0;
                sqlstm.sqadto[1] = (unsigned short )0;
                sqlstm.sqtdso[1] = (unsigned short )0;
                sqlstm.sqhstv[2] = (unsigned char  *)&iCol[5];
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

         //총재직일
            }
            if (strcmp(sRetday, "000000") == 0) iErrcnt ++; //
            iCol[2] = atoi(hinsa_copy(sRetday, 1, 2));      //근속기간년
            iCol[3] = atoi(hinsa_copy(sRetday, 3, 2));      //근속기간월
            iCol[4] = atoi(hinsa_copy(sRetday, 5, 2));      //근속기간일
            // 재급일 계산
            STRINIT(&strDate);
            if ((strcmp(GP_mas->cardate.arr, "") != 0) &&
                (strcmp(GP_mas->empdate.arr, GP_mas->paycldate.arr) == 0))
                VC2STR(strDate, GP_mas->cardate);
            else
                VC2STR(strDate, GP_mas->paycldate);
            STRINIT(&sRetday);
            if (strcmp(GP_mas->retdate.arr, "") != 0)   // 재직자는 todate, 퇴사자는 퇴사일
            {   
                strcpy(sRetday, DateCalc(0, (char *)strDate, (char *)GP_mas->retdate.arr));
                /* EXEC SQL SELECT TO_DATE(:GP_mas->retdate, 'YYYYMMDD') - TO_DATE(:strDate, 'YYYYMMDD') 
                           INTO :iCol[9] FROM DUAL; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,\
'YYYYMMDD')) into :b2  from DUAL ";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2553;
                sqlstm.selerr = (unsigned short)0;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)&(GP_mas->retdate);
                sqlstm.sqhstl[0] = (unsigned long )11;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)strDate;
                sqlstm.sqhstl[1] = (unsigned long )9;
                sqlstm.sqhsts[1] = (         int  )0;
                sqlstm.sqindv[1] = (         short *)0;
                sqlstm.sqinds[1] = (         int  )0;
                sqlstm.sqharm[1] = (unsigned long )0;
                sqlstm.sqadto[1] = (unsigned short )0;
                sqlstm.sqtdso[1] = (unsigned short )0;
                sqlstm.sqhstv[2] = (unsigned char  *)&iCol[9];
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

         //총재급일
            }
            else
            {
                strcpy(sRetday, DateCalc(0, (char *)strDate, (char *)strDD));
                /* EXEC SQL SELECT TO_DATE(:strDD, 'YYYYMMDD') - TO_DATE(:strDate, 'YYYYMMDD') 
                           INTO :iCol[9] FROM DUAL; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "select (TO_DATE(:b0,'YYYYMMDD')-TO_DATE(:b1,\
'YYYYMMDD')) into :b2  from DUAL ";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2580;
                sqlstm.selerr = (unsigned short)0;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)strDD;
                sqlstm.sqhstl[0] = (unsigned long )9;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)strDate;
                sqlstm.sqhstl[1] = (unsigned long )9;
                sqlstm.sqhsts[1] = (         int  )0;
                sqlstm.sqindv[1] = (         short *)0;
                sqlstm.sqinds[1] = (         int  )0;
                sqlstm.sqharm[1] = (unsigned long )0;
                sqlstm.sqadto[1] = (unsigned short )0;
                sqlstm.sqtdso[1] = (unsigned short )0;
                sqlstm.sqhstv[2] = (unsigned char  *)&iCol[9];
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

         //총재급일
            }
            if (strcmp(sRetday, "000000") == 0) iErrcnt ++; //
            iCol[6] = atoi(hinsa_copy(sRetday, 1, 2));      //재급기간년
            iCol[7] = atoi(hinsa_copy(sRetday, 3, 2));      //재급기간월
            iCol[8] = atoi(hinsa_copy(sRetday, 5, 2));      //재급기간일
            // 하나로 근속일 계산
            STRINIT(&sRetday);
            if (strcmp(GP_mas->retdate.arr, "") != 0)
                strcpy(sRetday, DateCalc(0, (char *)GP_mas->orgempdate.arr, (char *)GP_mas->retdate.arr));
            else
                strcpy(sRetday, DateCalc(0, (char *)GP_mas->orgempdate.arr, (char *)strDD));
            
            if (strcmp(sRetday, "000000") == 0) iErrcnt ++; //
            iCol[10] = atoi(hinsa_copy(sRetday, 1, 2));      //하나로군속기간년
            iCol[11] = atoi(hinsa_copy(sRetday, 3, 2));      //하나로군속기간월
            iCol[12] = atoi(hinsa_copy(sRetday, 5, 2));      //하나로군속기간일

            if (iErrcnt == 0)   // 에러 없을때만 저장
            {
                /* EXEC SQL
                    UPDATE PIHPMAS
                       SET KORAGE     = :iCol[0],  USAAGE     = :iCol[1], 
                           COMDUYY    = :iCol[2],  COMDUMM    = :iCol[3], 
                           COMDUDD    = :iCol[4],  TOTCOMDUDD = :iCol[5], 
                           PAYCLYY    = :iCol[6],  PAYCLMM    = :iCol[7], 
                           PAYCLDD    = :iCol[8],  TOTPAYCLDD = :iCol[9],
                           HANADUYY   = :iCol[10], HANADUMM   = :iCol[11],
                           HANADUDD   = :iCol[12]
                     WHERE WORKYYMM   = :strMM
                       AND EMPNO      = :GP_anno->empno; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "update PIHPMAS  set KORAGE=:b0,USAAGE=:b1,CO\
MDUYY=:b2,COMDUMM=:b3,COMDUDD=:b4,TOTCOMDUDD=:b5,PAYCLYY=:b6,PAYCLMM=:b7,PAYC\
LDD=:b8,TOTPAYCLDD=:b9,HANADUYY=:b10,HANADUMM=:b11,HANADUDD=:b12 where (WORKY\
YMM=:b13 and EMPNO=:b14)";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2607;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)&iCol[0];
                sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)&iCol[1];
                sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[1] = (         int  )0;
                sqlstm.sqindv[1] = (         short *)0;
                sqlstm.sqinds[1] = (         int  )0;
                sqlstm.sqharm[1] = (unsigned long )0;
                sqlstm.sqadto[1] = (unsigned short )0;
                sqlstm.sqtdso[1] = (unsigned short )0;
                sqlstm.sqhstv[2] = (unsigned char  *)&iCol[2];
                sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[2] = (         int  )0;
                sqlstm.sqindv[2] = (         short *)0;
                sqlstm.sqinds[2] = (         int  )0;
                sqlstm.sqharm[2] = (unsigned long )0;
                sqlstm.sqadto[2] = (unsigned short )0;
                sqlstm.sqtdso[2] = (unsigned short )0;
                sqlstm.sqhstv[3] = (unsigned char  *)&iCol[3];
                sqlstm.sqhstl[3] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[3] = (         int  )0;
                sqlstm.sqindv[3] = (         short *)0;
                sqlstm.sqinds[3] = (         int  )0;
                sqlstm.sqharm[3] = (unsigned long )0;
                sqlstm.sqadto[3] = (unsigned short )0;
                sqlstm.sqtdso[3] = (unsigned short )0;
                sqlstm.sqhstv[4] = (unsigned char  *)&iCol[4];
                sqlstm.sqhstl[4] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[4] = (         int  )0;
                sqlstm.sqindv[4] = (         short *)0;
                sqlstm.sqinds[4] = (         int  )0;
                sqlstm.sqharm[4] = (unsigned long )0;
                sqlstm.sqadto[4] = (unsigned short )0;
                sqlstm.sqtdso[4] = (unsigned short )0;
                sqlstm.sqhstv[5] = (unsigned char  *)&iCol[5];
                sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[5] = (         int  )0;
                sqlstm.sqindv[5] = (         short *)0;
                sqlstm.sqinds[5] = (         int  )0;
                sqlstm.sqharm[5] = (unsigned long )0;
                sqlstm.sqadto[5] = (unsigned short )0;
                sqlstm.sqtdso[5] = (unsigned short )0;
                sqlstm.sqhstv[6] = (unsigned char  *)&iCol[6];
                sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[6] = (         int  )0;
                sqlstm.sqindv[6] = (         short *)0;
                sqlstm.sqinds[6] = (         int  )0;
                sqlstm.sqharm[6] = (unsigned long )0;
                sqlstm.sqadto[6] = (unsigned short )0;
                sqlstm.sqtdso[6] = (unsigned short )0;
                sqlstm.sqhstv[7] = (unsigned char  *)&iCol[7];
                sqlstm.sqhstl[7] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[7] = (         int  )0;
                sqlstm.sqindv[7] = (         short *)0;
                sqlstm.sqinds[7] = (         int  )0;
                sqlstm.sqharm[7] = (unsigned long )0;
                sqlstm.sqadto[7] = (unsigned short )0;
                sqlstm.sqtdso[7] = (unsigned short )0;
                sqlstm.sqhstv[8] = (unsigned char  *)&iCol[8];
                sqlstm.sqhstl[8] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[8] = (         int  )0;
                sqlstm.sqindv[8] = (         short *)0;
                sqlstm.sqinds[8] = (         int  )0;
                sqlstm.sqharm[8] = (unsigned long )0;
                sqlstm.sqadto[8] = (unsigned short )0;
                sqlstm.sqtdso[8] = (unsigned short )0;
                sqlstm.sqhstv[9] = (unsigned char  *)&iCol[9];
                sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[9] = (         int  )0;
                sqlstm.sqindv[9] = (         short *)0;
                sqlstm.sqinds[9] = (         int  )0;
                sqlstm.sqharm[9] = (unsigned long )0;
                sqlstm.sqadto[9] = (unsigned short )0;
                sqlstm.sqtdso[9] = (unsigned short )0;
                sqlstm.sqhstv[10] = (unsigned char  *)&iCol[10];
                sqlstm.sqhstl[10] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[10] = (         int  )0;
                sqlstm.sqindv[10] = (         short *)0;
                sqlstm.sqinds[10] = (         int  )0;
                sqlstm.sqharm[10] = (unsigned long )0;
                sqlstm.sqadto[10] = (unsigned short )0;
                sqlstm.sqtdso[10] = (unsigned short )0;
                sqlstm.sqhstv[11] = (unsigned char  *)&iCol[11];
                sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[11] = (         int  )0;
                sqlstm.sqindv[11] = (         short *)0;
                sqlstm.sqinds[11] = (         int  )0;
                sqlstm.sqharm[11] = (unsigned long )0;
                sqlstm.sqadto[11] = (unsigned short )0;
                sqlstm.sqtdso[11] = (unsigned short )0;
                sqlstm.sqhstv[12] = (unsigned char  *)&iCol[12];
                sqlstm.sqhstl[12] = (unsigned long )sizeof(int);
                sqlstm.sqhsts[12] = (         int  )0;
                sqlstm.sqindv[12] = (         short *)0;
                sqlstm.sqinds[12] = (         int  )0;
                sqlstm.sqharm[12] = (unsigned long )0;
                sqlstm.sqadto[12] = (unsigned short )0;
                sqlstm.sqtdso[12] = (unsigned short )0;
                sqlstm.sqhstv[13] = (unsigned char  *)strMM;
                sqlstm.sqhstl[13] = (unsigned long )7;
                sqlstm.sqhsts[13] = (         int  )0;
                sqlstm.sqindv[13] = (         short *)0;
                sqlstm.sqinds[13] = (         int  )0;
                sqlstm.sqharm[13] = (unsigned long )0;
                sqlstm.sqadto[13] = (unsigned short )0;
                sqlstm.sqtdso[13] = (unsigned short )0;
                sqlstm.sqhstv[14] = (unsigned char  *)&(GP_anno->empno);
                sqlstm.sqhstl[14] = (unsigned long )7;
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


                if (SQLCODE != SQL_OK)
                {
                    STRINIT(&logText);
                    sprintf(logText, "인사마스터_이력 테이블 수정 실패!! 사번[%s],성명[%s],Error[%s]", GP_anno->empno.arr, GP_anno->korname.arr, SQLERRM);
                    return 0;
                }
            }
            STRINIT(&sRetday);
            /* EXEC SQL SELECT TO_CHAR(ADD_MONTHS(TO_DATE(:strMM, 'YYYYMM'), 1), 'YYYYMM') 
                       INTO :sRetday 
                       FROM DUAL; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "select TO_CHAR(ADD_MONTHS(TO_DATE(:b0,'YYYYMM'),\
1),'YYYYMM') into :b1  from DUAL ";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )2682;
            sqlstm.selerr = (unsigned short)0;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)strMM;
            sqlstm.sqhstl[0] = (unsigned long )7;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)sRetday;
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


            strcpy(strMM, sRetday);
        } 
    }
    //발령전 발령번호,발령일 from,to,발령구분,경신여부:Y,경신일시 : 시스템일시
    /* EXEC SQL
        UPDATE PIHANNO 
           SET BANNONO = :annono1, BANFRDATE = :anfrdate1, BANTODATE = :antodate1,
               BANCODE = :ancode1, ANUPDYN = 'Y', ANUPDTIME = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD'), WRITEEMP = :jobEmpno
         WHERE EMPNO   = :GP_anno->empno
           AND ANNONO  = :GP_anno->annono
           AND ANFRDATE= :GP_anno->anfrdate
           AND ANCODE  = :GP_anno->ancode; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "update PIHANNO  set BANNONO=:b0,BANFRDATE=:b1,BANTODATE=\
:b2,BANCODE=:b3,ANUPDYN='Y',ANUPDTIME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),WR\
ITEEMP=:b4 where (((EMPNO=:b5 and ANNONO=:b6) and ANFRDATE=:b7) and ANCODE=:b\
8)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )2705;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&annono1;
    sqlstm.sqhstl[0] = (unsigned long )11;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&anfrdate1;
    sqlstm.sqhstl[1] = (unsigned long )11;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&antodate1;
    sqlstm.sqhstl[2] = (unsigned long )11;
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)&ancode1;
    sqlstm.sqhstl[3] = (unsigned long )6;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)jobEmpno;
    sqlstm.sqhstl[4] = (unsigned long )5;
    sqlstm.sqhsts[4] = (         int  )0;
    sqlstm.sqindv[4] = (         short *)0;
    sqlstm.sqinds[4] = (         int  )0;
    sqlstm.sqharm[4] = (unsigned long )0;
    sqlstm.sqadto[4] = (unsigned short )0;
    sqlstm.sqtdso[4] = (unsigned short )0;
    sqlstm.sqhstv[5] = (unsigned char  *)&(GP_anno->empno);
    sqlstm.sqhstl[5] = (unsigned long )7;
    sqlstm.sqhsts[5] = (         int  )0;
    sqlstm.sqindv[5] = (         short *)0;
    sqlstm.sqinds[5] = (         int  )0;
    sqlstm.sqharm[5] = (unsigned long )0;
    sqlstm.sqadto[5] = (unsigned short )0;
    sqlstm.sqtdso[5] = (unsigned short )0;
    sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->annono);
    sqlstm.sqhstl[6] = (unsigned long )11;
    sqlstm.sqhsts[6] = (         int  )0;
    sqlstm.sqindv[6] = (         short *)0;
    sqlstm.sqinds[6] = (         int  )0;
    sqlstm.sqharm[6] = (unsigned long )0;
    sqlstm.sqadto[6] = (unsigned short )0;
    sqlstm.sqtdso[6] = (unsigned short )0;
    sqlstm.sqhstv[7] = (unsigned char  *)&(GP_anno->anfrdate);
    sqlstm.sqhstl[7] = (unsigned long )11;
    sqlstm.sqhsts[7] = (         int  )0;
    sqlstm.sqindv[7] = (         short *)0;
    sqlstm.sqinds[7] = (         int  )0;
    sqlstm.sqharm[7] = (unsigned long )0;
    sqlstm.sqadto[7] = (unsigned short )0;
    sqlstm.sqtdso[7] = (unsigned short )0;
    sqlstm.sqhstv[8] = (unsigned char  *)&(GP_anno->ancode);
    sqlstm.sqhstl[8] = (unsigned long )6;
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


    if (SQLCODE != SQL_OK)
    {
        STRINIT(&logText);
        sprintf(logText, "인사발령 테이블 수정  실패!! 사번[%s],성명[%s],발령번호[%s]", GP_anno->empno.arr, GP_anno->korname.arr, GP_anno->annono.arr);
        return 0;
    }
    STRINIT(&strEmpno);
    /* EXEC SQL
        SELECT EMPNO
          INTO :strEmpno
          FROM PIMPMAS      
         WHERE NOT EXISTS(SELECT * FROM PYMENUUSER WHERE EMPNO = :GP_anno->empno)
           AND EMPNO = :GP_anno->empno; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select EMPNO into :b0  from PIMPMAS where ( not exists (\
select *  from PYMENUUSER where EMPNO=:b1) and EMPNO=:b1)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )2756;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&strEmpno;
    sqlstm.sqhstl[0] = (unsigned long )7;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
    sqlstm.sqhstl[1] = (unsigned long )7;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->empno);
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


                                
    if (strcmp(strEmpno.arr, "") != 0)
    {
        STRINIT(&strGrpid);
        if (strncmp(GP_anno->empno.arr, "M", 1) == 0)
            strcpy(strGrpid, "G003");
        else
            strcpy(strGrpid, "G099");
        //2013.11. 사번을 암호로 저장. 신규시 첫 패스워드는 사번
        /* EXEC SQL
            INSERT INTO PYMENUUSER (GROUPID, EMPNO, KORNAME, PASSWORD, GRADE, PASSTODATE, LOCKYN, WRITETIME, WRITEMAN)
            SELECT :strGrpid, EMPNO, KORNAME, EMPNO, 'EEEEEEEEEE', TO_CHAR(ADD_MONTHS(SYSDATE,3),'YYYYMMDD'), 
                   'N', TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'), :jobEmpno
              FROM PIMPMAS
             WHERE EMPNO = :GP_anno->empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into PYMENUUSER (GROUPID,EMPNO,KORNAME,PASSWO\
RD,GRADE,PASSTODATE,LOCKYN,WRITETIME,WRITEMAN)select :b0 ,EMPNO ,KORNAME ,EMP\
NO ,'EEEEEEEEEE' ,TO_CHAR(ADD_MONTHS(SYSDATE,3),'YYYYMMDD') ,'N' ,TO_CHAR(SYS\
DATE,'YYYYMMDDHH24MISSD') ,:b1  from PIMPMAS where EMPNO=:b2";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2783;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strGrpid;
        sqlstm.sqhstl[0] = (unsigned long )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)jobEmpno;
        sqlstm.sqhstl[1] = (unsigned long )5;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->empno);
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


        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "종합인사사용자관리 테이블 입력  실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
            return 0;
        }
        STRINIT(&strTargetid);
        if (strncmp(GP_anno->empno.arr, "M", 1) == 0)
            strcpy(strTargetid, "ROLE_BM");
        else
            strcpy(strTargetid, "ROLE_USER");
        
        //2017.07.31.hjku.. 신규 발령시 MyHR 일반사용자 권한 등록 요청.. EHR 변재식 차장 요청
        /* EXEC SQL
            INSERT INTO HPER.EHR_LETTNEMPLYRSCRTYESTBS (SCRTY_DTRMN_TRGET_ID, MBER_TY_CODE, AUTHOR_CODE)
            VALUES (:GP_anno->empno, 'USR', :strTargetid); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into HPER.EHR_LETTNEMPLYRSCRTYESTBS (SCRTY_DT\
RMN_TRGET_ID,MBER_TY_CODE,AUTHOR_CODE) values (:b0,'USR',:b1)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2810;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->empno);
        sqlstm.sqhstl[0] = (unsigned long )7;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)strTargetid;
        sqlstm.sqhstl[1] = (unsigned long )21;
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


        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "사용자 권한 매핑 테이블 입력  실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
            return 0;
        }
        
        //dsa2000  2018.10.02  Add  신규입사자 발생시 MyHR 자율책임근무제 대상자관리에 데이터 생성.(이주영과장 요청)
        if (strncmp(GP_anno->empno.arr, "M", 1) != 0)        
        {
        /* EXEC SQL
             INSERT INTO EHR_CHOICEWORK_TARGET(EMPNO,TARGETYN,CORETIMEYN,OTLIMIT,OTREQPER)
             VALUES (:GP_anno->empno, 'Y', 'Y', 20, 10); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into EHR_CHOICEWORK_TARGET (EMPNO,TARGETYN,CO\
RETIMEYN,OTLIMIT,OTREQPER) values (:b0,'Y','Y',20,10)";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2833;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)&(GP_anno->empno);
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
            STRINIT(&logText);
            sprintf(logText, "MyHR 자율책임근무제 대상자관리에 데이터 생성 실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
            return 0;
        } 
        }
    }
        
    // 퇴사시 메뉴 사용 못하게.   작업자:jissi
    if ((strcmp(GP_mas->empno.arr, "") != 0) && (strcmp(GP_mas->pstate.arr, "80") >= 0))
    {
        /* EXEC SQL
            UPDATE PYMENUUSER                                          
               SET LOCKYN    = 'Y',                                  
                   BIGO      = '퇴사',                               
                   WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'), 
                   WRITEMAN  = :jobEmpno                        
             WHERE EMPNO     = :GP_anno->empno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update PYMENUUSER  set LOCKYN='Y',BIGO='퇴사',WRITET\
IME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),WRITEMAN=:b0 where EMPNO=:b1";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2852;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)jobEmpno;
        sqlstm.sqhstl[0] = (unsigned long )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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


        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "종합인사 사용자관리 테이블 수정[80] 실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
            return 0;
        }
    }
    // 2015.01.23.hjku..수습에서 수습해제 발령경신시 그룹ID를 G097에서 일반사용자 그룹인 G099로 변경 요청.. 강륜종 팀장 요청
    if ((strncmp(GP_anno->empno.arr, "M", 1) != 0) && (strcmp(GP_anno->ancode.arr, "288") == 0))
    {
        /* EXEC SQL
            UPDATE PYMENUUSER                                           
               SET GROUPID   = 'G099',                                
                   WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),  
                   WRITEMAN  = :jobEmpno                          
             WHERE EMPNO     = :GP_anno->empno
               AND GROUPID   = 'G097'; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "update PYMENUUSER  set GROUPID='G099',WRITETIME=TO_C\
HAR(SYSDATE,'YYYYMMDDHH24MISSD'),WRITEMAN=:b0 where (EMPNO=:b1 and GROUPID='G\
097')";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )2875;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)jobEmpno;
        sqlstm.sqhstl[0] = (unsigned long )5;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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

                                 
        if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
        {
            STRINIT(&logText);
            sprintf(logText, "종합인사 사용자관리 테이블 수정[288] 실패!! 사번[%s],성명[%s],SQLCODE[%i]", GP_anno->empno.arr, GP_anno->korname.arr, SQLCODE);
            return 0;
        }
    }
    //31.04  업적평가마스터화일의 자료를 경신한다.  KHJ
    if (strcmp(Eanupdyn.arr, "Y") == 0)
    {
        //기존에 없던 사원이고 평가대상자가 아니면 아무것도 하지 않음.
        if ((strcmp(GP_res->empno.arr, "") == 0) && (strcmp(GP_res->reconyn.arr, "N") == 0) && 
            (strcmp(GP_res->prjexcode.arr, "1") != 0))
        {
            //부서,직위,직급이 변경된 발령이면 평가자사항을 변경해야 하므로.
            if ((strcmp(GP_mas->orgnum.arr, GP_res->orgnum.arr) != 0) || 
                (strcmp(GP_mas->deptcode.arr, GP_res->deptcode.arr) != 0) ||
                (strcmp(GP_mas->payra.arr, GP_res->payra.arr) != 0) ||
                (strcmp(GP_mas->paycl.arr, GP_res->paycl.arr) != 0))
            {
                /* EXEC SQL
                    UPDATE PEHREMAS
                       SET E1EXISTYN = 'N',
                           E2EXISTYN = 'N',
                           WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'), 
                           WRITEEMP  = :jobEmpno
                     WHERE RABASDATE = :Erabasdate 
                       AND RECONYN = 'Y' 
                       AND (E1EMPNO = :GP_anno->empno OR E2EMPNO = :GP_anno->empno); */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "update PEHREMAS  set E1EXISTYN='N',E2EXISTYN\
='N',WRITETIME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),WRITEEMP=:b0 where ((RABA\
SDATE=:b1 and RECONYN='Y') and (E1EMPNO=:b2 or E2EMPNO=:b2))";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2898;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)jobEmpno;
                sqlstm.sqhstl[0] = (unsigned long )5;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)&Erabasdate;
                sqlstm.sqhstl[1] = (unsigned long )11;
                sqlstm.sqhsts[1] = (         int  )0;
                sqlstm.sqindv[1] = (         short *)0;
                sqlstm.sqinds[1] = (         int  )0;
                sqlstm.sqharm[1] = (unsigned long )0;
                sqlstm.sqadto[1] = (unsigned short )0;
                sqlstm.sqtdso[1] = (unsigned short )0;
                sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->empno);
                sqlstm.sqhstl[2] = (unsigned long )7;
                sqlstm.sqhsts[2] = (         int  )0;
                sqlstm.sqindv[2] = (         short *)0;
                sqlstm.sqinds[2] = (         int  )0;
                sqlstm.sqharm[2] = (unsigned long )0;
                sqlstm.sqadto[2] = (unsigned short )0;
                sqlstm.sqtdso[2] = (unsigned short )0;
                sqlstm.sqhstv[3] = (unsigned char  *)&(GP_anno->empno);
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


                if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
                {
                    STRINIT(&logText);
                    sprintf(logText, "업적평가 테이블 수정  실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
                    return 0;
                }
            }
        }
        //jissi
        if (((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) < 0) && 
            ((strncmp(GP_res->payra.arr, "5", 1) <= 0) || (strcmp(GP_res->paycl.arr, "0", 1) == 0) ||
             (strcmp(GP_res->paycl.arr, "9", 1) > 0))) ||
            ((strcmp(GP_anno->anfrdate.arr, payrachdate.arr) >= 0) && 
            ((strncmp(GP_res->payra.arr, "C1", 2) <= 0) || (strcmp(GP_res->paycl.arr, "A", 1) == 0) ||
             (strcmp(GP_res->paycl.arr, "D4", 1) > 0))))
        {
            if ((strcmp(GP_res->jobgun.arr, "10") >= 0) && (strcmp(GP_res->jobgun.arr, "30") <= 0))
            {
                //평가테이블
                /* EXEC SQL
                    DELETE FROM PEHREAIM_A 
                     WHERE RABASDATE = :Erabasdate
                       AND EMPNO = :GP_anno->empno; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "delete  from PEHREAIM_A  where (RABASDATE=:b\
0 and EMPNO=:b1)";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2929;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)&Erabasdate;
                sqlstm.sqhstl[0] = (unsigned long )11;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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


                if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
                {
                    STRINIT(&logText);
                    sprintf(logText, "관리직군 목표관리 테이블 수정 실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
                    return 0;
                }
            }
            else if (strcmp(GP_res->jobgun.arr, "40") == 0)
            {
                /* EXEC SQL
                    DELETE FROM PEHREAIM_B
                     WHERE RABASDATE = :Erabasdate
                       AND EMPNO = :GP_anno->empno; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "delete  from PEHREAIM_B  where (RABASDATE=:b\
0 and EMPNO=:b1)";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )2952;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)&Erabasdate;
                sqlstm.sqhstl[0] = (unsigned long )11;
                sqlstm.sqhsts[0] = (         int  )0;
                sqlstm.sqindv[0] = (         short *)0;
                sqlstm.sqinds[0] = (         int  )0;
                sqlstm.sqharm[0] = (unsigned long )0;
                sqlstm.sqadto[0] = (unsigned short )0;
                sqlstm.sqtdso[0] = (unsigned short )0;
                sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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


                if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
                {
                    STRINIT(&logText);                                                  
                    sprintf(logText, "영업직군 목표관리 테이블 수정 실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
                    return 0;
                }
            }
            /* EXEC SQL
                DELETE FROM PEHREMAS
                 WHERE RABASDATE = :Erabasdate
                   AND EMPNO = :GP_anno->empno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "delete  from PEHREMAS  where (RABASDATE=:b0 and \
EMPNO=:b1)";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )2975;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&Erabasdate;
            sqlstm.sqhstl[0] = (unsigned long )11;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
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


            if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
            {
                STRINIT(&logText);                                                  
                sprintf(logText, "업적평가 마스터 테이블 삭제 실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
                return 0;
            }
            /* EXEC SQL
                UPDATE PEHREMAS
                   SET E1EXISTYN = 'N',
                       E2EXISTYN = 'N',
                       WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'), 
                       WRITEEMP  = :jobEmpno 
                 WHERE RABASDATE = :Erabasdate 
                   AND RECONYN = 'Y' 
                   AND (E1EMPNO = :GP_anno->empno OR E2EMPNO = :GP_anno->empno); */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "update PEHREMAS  set E1EXISTYN='N',E2EXISTYN='N'\
,WRITETIME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),WRITEEMP=:b0 where ((RABASDAT\
E=:b1 and RECONYN='Y') and (E1EMPNO=:b2 or E2EMPNO=:b2))";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )2998;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)jobEmpno;
            sqlstm.sqhstl[0] = (unsigned long )5;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&Erabasdate;
            sqlstm.sqhstl[1] = (unsigned long )11;
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->empno);
            sqlstm.sqhstl[2] = (unsigned long )7;
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&(GP_anno->empno);
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


            if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
            {
                STRINIT(&logText);
                sprintf(logText, "업적평가 테이블 수정 실패!! 사번[%s],성명[%s]", GP_anno->empno.arr, GP_anno->korname.arr);
                return 0;
            }
        }
        //신규채용일 경우, 또는 보임자가 보임해제되어 업적평가 대상인 경우  insert.
        if ((strcmp(GP_res->empno.arr, "") == 0) &&
            (((strcmp(GP_res->reconyn.arr, "N") == 0) && (strcmp(GP_res->prjexcode.arr, "1") == 0)) ||
            (strcmp(GP_res->reconyn.arr, "Y") == 0)))
        {
            /* EXEC SQL
                INSERT INTO PEHREMAS
                    (RABASDATE, EMPNO, KORNAME, JOBGUN, ORGNUM, DEPTCODE, PSTATE, PAYCL, PAYRA, EMPDATE, TRDATE, RECONYN,
                     E1EXISTYN, E2EXISTYN, PRJEXCODE, PRJEXFRDATE, PRJEXTODATE, WRITETIME, WRITEEMP)
                VALUES (:Erabasdate, :GP_anno->empno, :GP_anno->korname, :GP_res->jobgun, :GP_res->orgnum, 
                        :GP_res->deptcode, :GP_res->pstate, :GP_res->paycl, :GP_res->payra, 
                        :GP_anno->anfrdate, :GP_res->trdate, :GP_res->reconyn, :GP_res->e1existyn,
                        :GP_res->e2existyn, :GP_res->prjexcode, :GP_res->prjexfrdate, :GP_res->prjextodate,
                        TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'), :jobEmpno ); */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "insert into PEHREMAS (RABASDATE,EMPNO,KORNAME,JO\
BGUN,ORGNUM,DEPTCODE,PSTATE,PAYCL,PAYRA,EMPDATE,TRDATE,RECONYN,E1EXISTYN,E2EX\
ISTYN,PRJEXCODE,PRJEXFRDATE,PRJEXTODATE,WRITETIME,WRITEEMP) values (:b0,:b1,:\
b2,:b3,:b4,:b5,:b6,:b7,:b8,:b9,:b10,:b11,:b12,:b13,:b14,:b15,:b16,TO_CHAR(SYS\
DATE,'YYYYMMDDHH24MISSD'),:b17)";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )3029;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&Erabasdate;
            sqlstm.sqhstl[0] = (unsigned long )11;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
            sqlstm.sqhstl[1] = (unsigned long )7;
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->korname);
            sqlstm.sqhstl[2] = (unsigned long )15;
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&(GP_res->jobgun);
            sqlstm.sqhstl[3] = (unsigned long )5;
            sqlstm.sqhsts[3] = (         int  )0;
            sqlstm.sqindv[3] = (         short *)0;
            sqlstm.sqinds[3] = (         int  )0;
            sqlstm.sqharm[3] = (unsigned long )0;
            sqlstm.sqadto[3] = (unsigned short )0;
            sqlstm.sqtdso[3] = (unsigned short )0;
            sqlstm.sqhstv[4] = (unsigned char  *)&(GP_res->orgnum);
            sqlstm.sqhstl[4] = (unsigned long )6;
            sqlstm.sqhsts[4] = (         int  )0;
            sqlstm.sqindv[4] = (         short *)0;
            sqlstm.sqinds[4] = (         int  )0;
            sqlstm.sqharm[4] = (unsigned long )0;
            sqlstm.sqadto[4] = (unsigned short )0;
            sqlstm.sqtdso[4] = (unsigned short )0;
            sqlstm.sqhstv[5] = (unsigned char  *)&(GP_res->deptcode);
            sqlstm.sqhstl[5] = (unsigned long )8;
            sqlstm.sqhsts[5] = (         int  )0;
            sqlstm.sqindv[5] = (         short *)0;
            sqlstm.sqinds[5] = (         int  )0;
            sqlstm.sqharm[5] = (unsigned long )0;
            sqlstm.sqadto[5] = (unsigned short )0;
            sqlstm.sqtdso[5] = (unsigned short )0;
            sqlstm.sqhstv[6] = (unsigned char  *)&(GP_res->pstate);
            sqlstm.sqhstl[6] = (unsigned long )5;
            sqlstm.sqhsts[6] = (         int  )0;
            sqlstm.sqindv[6] = (         short *)0;
            sqlstm.sqinds[6] = (         int  )0;
            sqlstm.sqharm[6] = (unsigned long )0;
            sqlstm.sqadto[6] = (unsigned short )0;
            sqlstm.sqtdso[6] = (unsigned short )0;
            sqlstm.sqhstv[7] = (unsigned char  *)&(GP_res->paycl);
            sqlstm.sqhstl[7] = (unsigned long )6;
            sqlstm.sqhsts[7] = (         int  )0;
            sqlstm.sqindv[7] = (         short *)0;
            sqlstm.sqinds[7] = (         int  )0;
            sqlstm.sqharm[7] = (unsigned long )0;
            sqlstm.sqadto[7] = (unsigned short )0;
            sqlstm.sqtdso[7] = (unsigned short )0;
            sqlstm.sqhstv[8] = (unsigned char  *)&(GP_res->payra);
            sqlstm.sqhstl[8] = (unsigned long )6;
            sqlstm.sqhsts[8] = (         int  )0;
            sqlstm.sqindv[8] = (         short *)0;
            sqlstm.sqinds[8] = (         int  )0;
            sqlstm.sqharm[8] = (unsigned long )0;
            sqlstm.sqadto[8] = (unsigned short )0;
            sqlstm.sqtdso[8] = (unsigned short )0;
            sqlstm.sqhstv[9] = (unsigned char  *)&(GP_anno->anfrdate);
            sqlstm.sqhstl[9] = (unsigned long )11;
            sqlstm.sqhsts[9] = (         int  )0;
            sqlstm.sqindv[9] = (         short *)0;
            sqlstm.sqinds[9] = (         int  )0;
            sqlstm.sqharm[9] = (unsigned long )0;
            sqlstm.sqadto[9] = (unsigned short )0;
            sqlstm.sqtdso[9] = (unsigned short )0;
            sqlstm.sqhstv[10] = (unsigned char  *)&(GP_res->trdate);
            sqlstm.sqhstl[10] = (unsigned long )11;
            sqlstm.sqhsts[10] = (         int  )0;
            sqlstm.sqindv[10] = (         short *)0;
            sqlstm.sqinds[10] = (         int  )0;
            sqlstm.sqharm[10] = (unsigned long )0;
            sqlstm.sqadto[10] = (unsigned short )0;
            sqlstm.sqtdso[10] = (unsigned short )0;
            sqlstm.sqhstv[11] = (unsigned char  *)&(GP_res->reconyn);
            sqlstm.sqhstl[11] = (unsigned long )4;
            sqlstm.sqhsts[11] = (         int  )0;
            sqlstm.sqindv[11] = (         short *)0;
            sqlstm.sqinds[11] = (         int  )0;
            sqlstm.sqharm[11] = (unsigned long )0;
            sqlstm.sqadto[11] = (unsigned short )0;
            sqlstm.sqtdso[11] = (unsigned short )0;
            sqlstm.sqhstv[12] = (unsigned char  *)&(GP_res->e1existyn);
            sqlstm.sqhstl[12] = (unsigned long )4;
            sqlstm.sqhsts[12] = (         int  )0;
            sqlstm.sqindv[12] = (         short *)0;
            sqlstm.sqinds[12] = (         int  )0;
            sqlstm.sqharm[12] = (unsigned long )0;
            sqlstm.sqadto[12] = (unsigned short )0;
            sqlstm.sqtdso[12] = (unsigned short )0;
            sqlstm.sqhstv[13] = (unsigned char  *)&(GP_res->e2existyn);
            sqlstm.sqhstl[13] = (unsigned long )4;
            sqlstm.sqhsts[13] = (         int  )0;
            sqlstm.sqindv[13] = (         short *)0;
            sqlstm.sqinds[13] = (         int  )0;
            sqlstm.sqharm[13] = (unsigned long )0;
            sqlstm.sqadto[13] = (unsigned short )0;
            sqlstm.sqtdso[13] = (unsigned short )0;
            sqlstm.sqhstv[14] = (unsigned char  *)&(GP_res->prjexcode);
            sqlstm.sqhstl[14] = (unsigned long )4;
            sqlstm.sqhsts[14] = (         int  )0;
            sqlstm.sqindv[14] = (         short *)0;
            sqlstm.sqinds[14] = (         int  )0;
            sqlstm.sqharm[14] = (unsigned long )0;
            sqlstm.sqadto[14] = (unsigned short )0;
            sqlstm.sqtdso[14] = (unsigned short )0;
            sqlstm.sqhstv[15] = (unsigned char  *)&(GP_res->prjexfrdate);
            sqlstm.sqhstl[15] = (unsigned long )11;
            sqlstm.sqhsts[15] = (         int  )0;
            sqlstm.sqindv[15] = (         short *)0;
            sqlstm.sqinds[15] = (         int  )0;
            sqlstm.sqharm[15] = (unsigned long )0;
            sqlstm.sqadto[15] = (unsigned short )0;
            sqlstm.sqtdso[15] = (unsigned short )0;
            sqlstm.sqhstv[16] = (unsigned char  *)&(GP_res->prjextodate);
            sqlstm.sqhstl[16] = (unsigned long )11;
            sqlstm.sqhsts[16] = (         int  )0;
            sqlstm.sqindv[16] = (         short *)0;
            sqlstm.sqinds[16] = (         int  )0;
            sqlstm.sqharm[16] = (unsigned long )0;
            sqlstm.sqadto[16] = (unsigned short )0;
            sqlstm.sqtdso[16] = (unsigned short )0;
            sqlstm.sqhstv[17] = (unsigned char  *)jobEmpno;
            sqlstm.sqhstl[17] = (unsigned long )5;
            sqlstm.sqhsts[17] = (         int  )0;
            sqlstm.sqindv[17] = (         short *)0;
            sqlstm.sqinds[17] = (         int  )0;
            sqlstm.sqharm[17] = (unsigned long )0;
            sqlstm.sqadto[17] = (unsigned short )0;
            sqlstm.sqtdso[17] = (unsigned short )0;
            sqlstm.sqphsv = sqlstm.sqhstv;
            sqlstm.sqphsl = sqlstm.sqhstl;
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
                STRINIT(&logText);
                sprintf(logText, "업적평가 테이블 입력 실패!! 기준일[%s],사번[%s],성명[%s]", Erabasdate.arr, GP_anno->empno.arr, GP_anno->korname.arr);
                return 0;
            }
        }
        // 기존에 있던 사원이면 업적평가 대상화일에  update.
        if (strcmp(GP_res->empno.arr, "") != 0)
        {
            /* EXEC SQL
                UPDATE PEHREMAS                                             
                   SET JOBGUN = :GP_res->jobgun, ORGNUM = :GP_res->orgnum, DEPTCODE = :GP_res->deptcode,       
                       PSTATE = :GP_res->pstate, PAYCL = :GP_res->paycl, PAYRA = :GP_res->payra,
                       EMPDATE = :GP_anno->anfrdate, TRDATE = :GP_res->trdate, RECONYN = :GP_res->reconyn,       
                       E1EXISTYN = :GP_res->e1existyn, E2EXISTYN = :GP_res->e2existyn, PRJEXCODE = :GP_res->prjexcode,
                       PRJEXFRDATE = :GP_res->prjexfrdate,PRJEXTODATE = :GP_res->prjextodate,
                       WRITETIME = TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'), 
                       WRITEEMP  = :jobEmpno 
                 WHERE RABASDATE = :Erabasdate 
                   AND EMPNO = :GP_anno->empno; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "update PEHREMAS  set JOBGUN=:b0,ORGNUM=:b1,DEPTC\
ODE=:b2,PSTATE=:b3,PAYCL=:b4,PAYRA=:b5,EMPDATE=:b6,TRDATE=:b7,RECONYN=:b8,E1E\
XISTYN=:b9,E2EXISTYN=:b10,PRJEXCODE=:b11,PRJEXFRDATE=:b12,PRJEXTODATE=:b13,WR\
ITETIME=TO_CHAR(SYSDATE,'YYYYMMDDHH24MISSD'),WRITEEMP=:b14 where (RABASDATE=:\
b15 and EMPNO=:b16)";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )3116;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)&(GP_res->jobgun);
            sqlstm.sqhstl[0] = (unsigned long )5;
            sqlstm.sqhsts[0] = (         int  )0;
            sqlstm.sqindv[0] = (         short *)0;
            sqlstm.sqinds[0] = (         int  )0;
            sqlstm.sqharm[0] = (unsigned long )0;
            sqlstm.sqadto[0] = (unsigned short )0;
            sqlstm.sqtdso[0] = (unsigned short )0;
            sqlstm.sqhstv[1] = (unsigned char  *)&(GP_res->orgnum);
            sqlstm.sqhstl[1] = (unsigned long )6;
            sqlstm.sqhsts[1] = (         int  )0;
            sqlstm.sqindv[1] = (         short *)0;
            sqlstm.sqinds[1] = (         int  )0;
            sqlstm.sqharm[1] = (unsigned long )0;
            sqlstm.sqadto[1] = (unsigned short )0;
            sqlstm.sqtdso[1] = (unsigned short )0;
            sqlstm.sqhstv[2] = (unsigned char  *)&(GP_res->deptcode);
            sqlstm.sqhstl[2] = (unsigned long )8;
            sqlstm.sqhsts[2] = (         int  )0;
            sqlstm.sqindv[2] = (         short *)0;
            sqlstm.sqinds[2] = (         int  )0;
            sqlstm.sqharm[2] = (unsigned long )0;
            sqlstm.sqadto[2] = (unsigned short )0;
            sqlstm.sqtdso[2] = (unsigned short )0;
            sqlstm.sqhstv[3] = (unsigned char  *)&(GP_res->pstate);
            sqlstm.sqhstl[3] = (unsigned long )5;
            sqlstm.sqhsts[3] = (         int  )0;
            sqlstm.sqindv[3] = (         short *)0;
            sqlstm.sqinds[3] = (         int  )0;
            sqlstm.sqharm[3] = (unsigned long )0;
            sqlstm.sqadto[3] = (unsigned short )0;
            sqlstm.sqtdso[3] = (unsigned short )0;
            sqlstm.sqhstv[4] = (unsigned char  *)&(GP_res->paycl);
            sqlstm.sqhstl[4] = (unsigned long )6;
            sqlstm.sqhsts[4] = (         int  )0;
            sqlstm.sqindv[4] = (         short *)0;
            sqlstm.sqinds[4] = (         int  )0;
            sqlstm.sqharm[4] = (unsigned long )0;
            sqlstm.sqadto[4] = (unsigned short )0;
            sqlstm.sqtdso[4] = (unsigned short )0;
            sqlstm.sqhstv[5] = (unsigned char  *)&(GP_res->payra);
            sqlstm.sqhstl[5] = (unsigned long )6;
            sqlstm.sqhsts[5] = (         int  )0;
            sqlstm.sqindv[5] = (         short *)0;
            sqlstm.sqinds[5] = (         int  )0;
            sqlstm.sqharm[5] = (unsigned long )0;
            sqlstm.sqadto[5] = (unsigned short )0;
            sqlstm.sqtdso[5] = (unsigned short )0;
            sqlstm.sqhstv[6] = (unsigned char  *)&(GP_anno->anfrdate);
            sqlstm.sqhstl[6] = (unsigned long )11;
            sqlstm.sqhsts[6] = (         int  )0;
            sqlstm.sqindv[6] = (         short *)0;
            sqlstm.sqinds[6] = (         int  )0;
            sqlstm.sqharm[6] = (unsigned long )0;
            sqlstm.sqadto[6] = (unsigned short )0;
            sqlstm.sqtdso[6] = (unsigned short )0;
            sqlstm.sqhstv[7] = (unsigned char  *)&(GP_res->trdate);
            sqlstm.sqhstl[7] = (unsigned long )11;
            sqlstm.sqhsts[7] = (         int  )0;
            sqlstm.sqindv[7] = (         short *)0;
            sqlstm.sqinds[7] = (         int  )0;
            sqlstm.sqharm[7] = (unsigned long )0;
            sqlstm.sqadto[7] = (unsigned short )0;
            sqlstm.sqtdso[7] = (unsigned short )0;
            sqlstm.sqhstv[8] = (unsigned char  *)&(GP_res->reconyn);
            sqlstm.sqhstl[8] = (unsigned long )4;
            sqlstm.sqhsts[8] = (         int  )0;
            sqlstm.sqindv[8] = (         short *)0;
            sqlstm.sqinds[8] = (         int  )0;
            sqlstm.sqharm[8] = (unsigned long )0;
            sqlstm.sqadto[8] = (unsigned short )0;
            sqlstm.sqtdso[8] = (unsigned short )0;
            sqlstm.sqhstv[9] = (unsigned char  *)&(GP_res->e1existyn);
            sqlstm.sqhstl[9] = (unsigned long )4;
            sqlstm.sqhsts[9] = (         int  )0;
            sqlstm.sqindv[9] = (         short *)0;
            sqlstm.sqinds[9] = (         int  )0;
            sqlstm.sqharm[9] = (unsigned long )0;
            sqlstm.sqadto[9] = (unsigned short )0;
            sqlstm.sqtdso[9] = (unsigned short )0;
            sqlstm.sqhstv[10] = (unsigned char  *)&(GP_res->e2existyn);
            sqlstm.sqhstl[10] = (unsigned long )4;
            sqlstm.sqhsts[10] = (         int  )0;
            sqlstm.sqindv[10] = (         short *)0;
            sqlstm.sqinds[10] = (         int  )0;
            sqlstm.sqharm[10] = (unsigned long )0;
            sqlstm.sqadto[10] = (unsigned short )0;
            sqlstm.sqtdso[10] = (unsigned short )0;
            sqlstm.sqhstv[11] = (unsigned char  *)&(GP_res->prjexcode);
            sqlstm.sqhstl[11] = (unsigned long )4;
            sqlstm.sqhsts[11] = (         int  )0;
            sqlstm.sqindv[11] = (         short *)0;
            sqlstm.sqinds[11] = (         int  )0;
            sqlstm.sqharm[11] = (unsigned long )0;
            sqlstm.sqadto[11] = (unsigned short )0;
            sqlstm.sqtdso[11] = (unsigned short )0;
            sqlstm.sqhstv[12] = (unsigned char  *)&(GP_res->prjexfrdate);
            sqlstm.sqhstl[12] = (unsigned long )11;
            sqlstm.sqhsts[12] = (         int  )0;
            sqlstm.sqindv[12] = (         short *)0;
            sqlstm.sqinds[12] = (         int  )0;
            sqlstm.sqharm[12] = (unsigned long )0;
            sqlstm.sqadto[12] = (unsigned short )0;
            sqlstm.sqtdso[12] = (unsigned short )0;
            sqlstm.sqhstv[13] = (unsigned char  *)&(GP_res->prjextodate);
            sqlstm.sqhstl[13] = (unsigned long )11;
            sqlstm.sqhsts[13] = (         int  )0;
            sqlstm.sqindv[13] = (         short *)0;
            sqlstm.sqinds[13] = (         int  )0;
            sqlstm.sqharm[13] = (unsigned long )0;
            sqlstm.sqadto[13] = (unsigned short )0;
            sqlstm.sqtdso[13] = (unsigned short )0;
            sqlstm.sqhstv[14] = (unsigned char  *)jobEmpno;
            sqlstm.sqhstl[14] = (unsigned long )5;
            sqlstm.sqhsts[14] = (         int  )0;
            sqlstm.sqindv[14] = (         short *)0;
            sqlstm.sqinds[14] = (         int  )0;
            sqlstm.sqharm[14] = (unsigned long )0;
            sqlstm.sqadto[14] = (unsigned short )0;
            sqlstm.sqtdso[14] = (unsigned short )0;
            sqlstm.sqhstv[15] = (unsigned char  *)&Erabasdate;
            sqlstm.sqhstl[15] = (unsigned long )11;
            sqlstm.sqhsts[15] = (         int  )0;
            sqlstm.sqindv[15] = (         short *)0;
            sqlstm.sqinds[15] = (         int  )0;
            sqlstm.sqharm[15] = (unsigned long )0;
            sqlstm.sqadto[15] = (unsigned short )0;
            sqlstm.sqtdso[15] = (unsigned short )0;
            sqlstm.sqhstv[16] = (unsigned char  *)&(GP_anno->empno);
            sqlstm.sqhstl[16] = (unsigned long )7;
            sqlstm.sqhsts[16] = (         int  )0;
            sqlstm.sqindv[16] = (         short *)0;
            sqlstm.sqinds[16] = (         int  )0;
            sqlstm.sqharm[16] = (unsigned long )0;
            sqlstm.sqadto[16] = (unsigned short )0;
            sqlstm.sqtdso[16] = (unsigned short )0;
            sqlstm.sqphsv = sqlstm.sqhstv;
            sqlstm.sqphsl = sqlstm.sqhstl;
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
                STRINIT(&logText);
                sprintf(logText, "기존사원 업적평가 테이블 수정 실패!! 기준일[%s],사번[%s],성명[%s]", Erabasdate.arr, GP_anno->empno.arr, GP_anno->korname.arr);
                return 0;
            }
        }
    }

    return 1;
}

/* 사번 변경 발령건 처리 */
int Copy_Empno()
{
    /* EXEC SQL BEGIN DECLARE SECTION; */ 

        /* varchar codename[20+1]; */ 
struct { unsigned short len; unsigned char arr[21]; } codename;

        /* varchar codefname[30+1]; */ 
struct { unsigned short len; unsigned char arr[31]; } codefname;

    /* EXEC SQL END DECLARE SECTION; */ 

    char strSql[1024];
    int  iReadcount = 0;

    /* 사번 관련 내용 복사 대상 테이블 조회(CURSOR) */
    STRINIT(&strSql);
    strcpy(strSql, "SELECT UPPER(CODENAME), CODEFNAME FROM PYCCODE WHERE CODEID = 'Z100' AND USEYN = 'Y' ORDER BY CODENO");

    if (DEBUG)  printf("SQL_TAB => [%s],[%d]\n", strSql, strlen(strSql));

    /* EXEC SQL PREPARE SS FROM :strSql; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3199;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strSql;
    sqlstm.sqhstl[0] = (unsigned long )1024;
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


    /* EXEC SQL DECLARE cur_tab CURSOR FOR SS; */ 

    /* EXEC SQL OPEN cur_tab; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3218;
    sqlstm.selerr = (unsigned short)1;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqcmod = (unsigned int )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



    if(SQLCODE != SQL_OK)
    {
        /* EXEC SQL CLOSE cur_tab; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3233;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


        STRINIT(&logText);
        sprintf(logText, "Cursor(cur_tab) Open Fail : %s", SQLERRM);
        return 0;
    }
    
if (DEBUG)  printf("START WHILE\n");

    STRINIT(&logText);
    while(TRUE)
    {
        /* EXEC SQL FETCH cur_tab INTO :codename, :codefname; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3248;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqfoff = (         int )0;
        sqlstm.sqfmod = (unsigned int )2;
        sqlstm.sqhstv[0] = (unsigned char  *)&codename;
        sqlstm.sqhstl[0] = (unsigned long )23;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&codefname;
        sqlstm.sqhstl[1] = (unsigned long )33;
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



if (DEBUG) printf("Debug1 code[%d]\n", SQLCODE);
if (DEBUG) printf("tab1[%s],name[%s],newEmp[%s],OldEmp[%s]\n", codename.arr, codefname.arr, GP_anno->empno.arr, GP_anno->oldempno.arr);

        if (SQLCODE == SQL_NO_DATA)
        {
            if (iReadcount == 0) sprintf(logText, "Data not found!!");
            break;
        }
        else if (SQLCODE != SQL_OK)
        {
            sprintf(logText, "Cursor Fetch Error : %s", SQLERRM);
            break;
        }
        iReadcount ++;    //조회 숫자 +1

        /* 임시테이블이 존재한다면 DROP */
        /* EXEC SQL DROP TABLE T_PIE3011G; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "drop TABLE T_PIE3011G";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3271;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



        STRINIT(&strSql);
        sprintf(strSql, "CREATE TABLE T_PIE3011G AS SELECT * FROM %s WHERE EMPNO = '%s'", codename.arr, GP_anno->oldempno.arr);
        /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3286;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strSql;
        sqlstm.sqhstl[0] = (unsigned long )1024;
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

         // 임시테이블 생성 및 구사번 자료 복사
        if (SQLCODE != SQL_OK)
        {
            sprintf(logText, "Create temp table fail!! : %s", SQLERRM);
            break;
        }

        STRINIT(&strSql);
        /* 복사대상 테이블이 별도 UPDATE문이 필요할 경우 여기에 추가 */
        if (strcmp(codename.arr, "PIMFAMI") == 0)   // 가족사항 테이블은 EMPNO외에 FAMID 컬럼이 UNIQUE KEY이므로 별도 update문 필요
        {
            sprintf(strSql, "UPDATE T_PIE3011G "
                            "   SET EMPNO = '%s', WRITETIME = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD'), "
                            "       WRITEEMP = '%s', FAMID = '%s'||substr(FAMID, 5, 5)", GP_anno->empno.arr, jobEmpno, GP_anno->empno.arr);
        }
        else
        {
            sprintf(strSql, "UPDATE T_PIE3011G "
                            "   SET EMPNO = '%s', WRITETIME = TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISSD'), WRITEEMP = '%s'", GP_anno->empno.arr, jobEmpno);
        }                            

if (DEBUG) printf("Debug2 sql[%s]\n", strSql);   
        /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3305;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strSql;
        sqlstm.sqhstl[0] = (unsigned long )1024;
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

         // 구사번 자료 신사번으로 UPDATE
        if (SQLCODE != SQL_OK)
        {
            if (SQLCODE != SQL_NO_DATA) sprintf(logText, "Update temp table fail!! : %s", SQLERRM);
            break;
        }

        STRINIT(&strSql);
        sprintf(strSql, "INSERT INTO %s SELECT * FROM T_PIE3011G", codename.arr);
        /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3324;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strSql;
        sqlstm.sqhstl[0] = (unsigned long )1024;
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

         // 복사대상 테이블에 신사번의 자료 입력
        if (SQLCODE != SQL_OK)
        {
            sprintf(logText, "Insert data fail!! : %s", SQLERRM);
            break;
        }

        /* EXEC SQL DROP TABLE T_PIE3011G; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "drop TABLE T_PIE3011G";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3343;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

             // Drop Temp Table
        if (SQLCODE != SQL_OK)
        {
            sprintf(logText, "Drop temp table fail!! : %s", SQLERRM);
            break;
        }
    } /* End While */

if (DEBUG) printf("Debug3 End While!! logText=[%s]\n", logText);

    if (strcmp(logText, "") != 0) return 0;

    return 1;
}

/* 사번변경 발령에 대해 복수사번 등록                 */
/* 복수사번이 최초(2개) 발생 시 신규 마스터 사번 생성 */
/* 복수사번이 다수(2개 이상)일 시 추가 등록           */
int Ins_Mempno()
{   
    char strSql[2048];
    char strMempno[5+1];
    int  iSeqno = 0;
    
    STRINIT(&strMempno);
    /* EXEC SQL
        SELECT MEMPNO, MAX(SEQNO)
          INTO :strMempno, :iSeqno
          FROM PYMEMPNO
         WHERE EMPNO = :GP_anno->oldempno
         GROUP BY MEMPNO; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select MEMPNO ,max(SEQNO) into :b0,:b1  from PYMEMPNO wh\
ere EMPNO=:b2 group by MEMPNO";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3358;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strMempno;
    sqlstm.sqhstl[0] = (unsigned long )6;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&iSeqno;
    sqlstm.sqhstl[1] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&(GP_anno->oldempno);
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


if (DEBUG) printf("INS_MEMPNO 0 mempno[%s]code[%d]\n", strMempno, SQLCODE);

    if ((SQLCODE != SQL_OK) && (SQLCODE != SQL_NO_DATA))
    {
        STRINIT(&logText);
        sprintf(logText, "복수사번 조회 실패!! : %s", SQLERRM);
        return 0;
    }
    if (strcmp(strMempno, "") == 0) // 신규 마스터사번으로 등록하기
    {
        /* EXEC SQL 
            SELECT 'X'||LTRIM(TO_CHAR(TO_NUMBER(SUBSTR(MAX(MEMPNO), 2, 4)+1), '0009')) AS NUM 
              INTO :strMempno
              FROM PYMEMPNO; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "select ('X'||LTRIM(TO_CHAR(TO_NUMBER((SUBSTR(max(MEM\
PNO),2,4)+1)),'0009'))) NUM into :b0  from PYMEMPNO ";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3385;
        sqlstm.selerr = (unsigned short)0;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strMempno;
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


        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "신규 마스터사번 발췌 실패!! : %s", SQLERRM);
            return 0;
        }
        STRINIT(&strSql);
        sprintf(strSql, "INSERT INTO PYMEMPNO (MEMPNO, EMPNO, SEQNO, STARTDATE, WRITEMAN, WRITETIME) "
                        "SELECT '%s', EMPNO, 1, ORGEMPDATE, '%s', TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')"
                        "  FROM PIMPMAS "
                        " WHERE EMPNO = '%s'", strMempno, jobEmpno, GP_anno->oldempno.arr);

if (DEBUG) printf("INS_MEMPNO1 sql[%s]code[%d]\n", strSql, SQLCODE);

        /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3404;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strSql;
        sqlstm.sqhstl[0] = (unsigned long )2048;
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

         // 구사번 등록
        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "구사번 등록 실패!! : %s", SQLERRM);
            return 0;
        }
        STRINIT(&strSql);
        sprintf(strSql, "INSERT INTO PYMEMPNO (MEMPNO, EMPNO, SEQNO, STARTDATE, WRITEMAN, WRITETIME) "
                        "VALUES ('%s', '%s', 2, '%s', '%s', TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'))", 
                        strMempno, GP_anno->empno.arr, GP_mas->orgempdate.arr, jobEmpno);
                        
if (DEBUG) printf("INS_MEMPNO2 sql[%s]code[%d]\n", strSql, SQLCODE);
    
        /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3423;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strSql;
        sqlstm.sqhstl[0] = (unsigned long )2048;
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

         // 신규사번 등록
        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "신규사번 등록 실패!! : %s", SQLERRM);
            return 0;
        }
    }
    else                            // 기존 마스터사번으로 신규사번 등록
    {
        /* EXEC SQL
            INSERT INTO PYMEMPNO (MEMPNO, EMPNO, SEQNO, STARTDATE, WRITEMAN, WRITETIME)
            VALUES(:strMempno, :GP_anno->empno, :iSeqno+1, :GP_mas->orgempdate, :jobEmpno, TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')); */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.stmt = "insert into PYMEMPNO (MEMPNO,EMPNO,SEQNO,STARTDATE,W\
RITEMAN,WRITETIME) values (:b0,:b1,(:b2+1),:b3,:b4,TO_CHAR(SYSDATE,'YYYYMMDDH\
H24MISS'))";
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3442;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqhstv[0] = (unsigned char  *)strMempno;
        sqlstm.sqhstl[0] = (unsigned long )6;
        sqlstm.sqhsts[0] = (         int  )0;
        sqlstm.sqindv[0] = (         short *)0;
        sqlstm.sqinds[0] = (         int  )0;
        sqlstm.sqharm[0] = (unsigned long )0;
        sqlstm.sqadto[0] = (unsigned short )0;
        sqlstm.sqtdso[0] = (unsigned short )0;
        sqlstm.sqhstv[1] = (unsigned char  *)&(GP_anno->empno);
        sqlstm.sqhstl[1] = (unsigned long )7;
        sqlstm.sqhsts[1] = (         int  )0;
        sqlstm.sqindv[1] = (         short *)0;
        sqlstm.sqinds[1] = (         int  )0;
        sqlstm.sqharm[1] = (unsigned long )0;
        sqlstm.sqadto[1] = (unsigned short )0;
        sqlstm.sqtdso[1] = (unsigned short )0;
        sqlstm.sqhstv[2] = (unsigned char  *)&iSeqno;
        sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
        sqlstm.sqhsts[2] = (         int  )0;
        sqlstm.sqindv[2] = (         short *)0;
        sqlstm.sqinds[2] = (         int  )0;
        sqlstm.sqharm[2] = (unsigned long )0;
        sqlstm.sqadto[2] = (unsigned short )0;
        sqlstm.sqtdso[2] = (unsigned short )0;
        sqlstm.sqhstv[3] = (unsigned char  *)&(GP_mas->orgempdate);
        sqlstm.sqhstl[3] = (unsigned long )11;
        sqlstm.sqhsts[3] = (         int  )0;
        sqlstm.sqindv[3] = (         short *)0;
        sqlstm.sqinds[3] = (         int  )0;
        sqlstm.sqharm[3] = (unsigned long )0;
        sqlstm.sqadto[3] = (unsigned short )0;
        sqlstm.sqtdso[3] = (unsigned short )0;
        sqlstm.sqhstv[4] = (unsigned char  *)jobEmpno;
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



if (DEBUG) printf("INS_MEMPNO3 code[%d]\n", SQLCODE);

        if (SQLCODE != SQL_OK)
        {
            STRINIT(&logText);
            sprintf(logText, "신규사번 추가 실패!! : %s", SQLERRM);
            return 0;
        }
    }
    return 1;
}

//근속기간 빼기 루틴
char *CalExduMinus(char *sYY, char *sMM, char *sDD)
{
    char strYY1[2+1];    //Date1의 Year수
    char strMM1[2+1];    //Date1의 Month수
    char strDD1[2+1];    //Date1의 Day수
    char strRet[6+1];    //Return변수
    int  iYY1;           //Date1의 Year수 
    int  iMM1;           //Date1의 Month수
    int  iDD1;           //Date1의 Day수  
    int  iYY2;           //Date2의 Year수 
    int  iMM2;           //Date2의 Month수
    int  iDD2;           //Date2의 Day수
    int  iYear;          //계산용 임시 변수
    int  iMonth;         //계산용 임시 변수
    int  iDay;           //계산용 임시 변수
    
    STRINIT(&strRet);
    STRINIT(&strYY1);
    STRINIT(&strMM1);
    STRINIT(&strDD1);
    sprintf(strYY1, "%d", GP_mas->lexduyy);
    sprintf(strMM1, "%d", GP_mas->lexdumm);
    sprintf(strDD1, "%d", GP_mas->lexdudd);
    //Date1을 숫자로 변환
    iYY1 = atoi(strYY1);
    iMM1 = atoi(strMM1);
    iDD1 = atoi(strDD1);
    //Date2를 숫자로 변환
    iYY2 = atoi(sYY);
    iMM2 = atoi(sMM);
    iDD2 = atoi(sDD);
    
    //일을 계산한다
    iDay = iDD1 - iDD2;
    if (iDay < 0)
    {
        if (iMM1 > 0)
        {
            iMM1 = iMM1 - 1;
            iDD1 = iDay + 30;
        }
        else
        {
            if (iYY1 > 0)
            {
                iYY1 = iYY1 - 1;
                iMM1 = 12;
                iMM1 = iMM1 - 1;
                iDD1 = iDay + 30;
            }
            else
                return "000000";
        }
    }
    else
        iMM1 = iDay;
        
    //월을 계산한다
    iMonth = iMM1 - iMM2;
    if (iMonth < 0)
    {
        if (iYY1 > 0)
        {
            iYY1 = iYY1 - 1;
            iMM1 = iMonth + 12;
        }
        else
            return "000000";
    }
    else
        iMM1 = iMonth;

    //년을 계산한다
    iYear = iYY1 - iYY2;
    if (iYear < 0)
        return "000000";
    else
        iYY1 = iYear;

    sprintf(strRet, "%02d%02d%02d", iYY1, iMM1, iDD1);
    
    return strRet;
}

/* 문자열에서 구분자로 분리하여 해당 순서의 문자열 Return */
/* 사용 예 : PasString("abc,def", ',', 2)
      결과 : "def"                                        */
char *PasString(char *str, char cSep, int iPos)
{
    int  i;
    int  j = 0;
    int  iSepCnt = 0;
    char strBuff[50];
    char strPas[50];

    STRINIT(&strBuff);
    STRINIT(&strPas);
    strcpy(strBuff, str);  //검색대상 원본 copy

    for (i = 0; i <= strlen(str); i++)
    {
        if (strBuff[i] == cSep)
        {
            iSepCnt++;
            if (iSepCnt == iPos)
                break;
            else
            {
                STRINIT(&strPas);
                j = 0;
            }
        }
        else
            strPas[j++] = strBuff[i];
    }
    if (iSepCnt+1 < iPos)
        strcpy(strPas, "");

    return strPas;
}

/* 발령내용을 MYHR공지사항 테이블에 등록 및 메일 발송*/
void Ins_Notice()
{
    int  iCount = 0;
    char mEmpno[5+1];
    char strSql[100000];
    char strSql1[4096];
    char strAncodename[100+1];
    char strAncode[3+1];
    char strnotiyn[1+1];  /*2019.01. MyHR공지여부 Add*/
    char strmailyn[1+1];  /*2019.01. 메일발송여부 Add*/
    
    STRINIT(&strnotiyn);
    STRINIT(&strmailyn);
    /* EXEC SQL 
    SELECT COUNT(*) INTO :iCount FROM PIHANNO WHERE ANNONO = :oldAnnono AND ANUPDYN = 'Y'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select count(*)  into :b0  from PIHANNO where (ANNONO=:b\
1 and ANUPDYN='Y')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3477;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)&iCount;
    sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)&oldAnnono;
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


    
    /*2019.01. Add */
    /* EXEC SQL 
    SELECT NOTIYN, MAILYN INTO :strnotiyn, :strmailyn 
      FROM Pihanba 
     WHERE ANNONO = :oldAnnono AND Anupdateyn = 'Y'; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select NOTIYN ,MAILYN into :b0,:b1  from Pihanba where (\
ANNONO=:b2 and Anupdateyn='Y')";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3500;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strnotiyn;
    sqlstm.sqhstl[0] = (unsigned long )2;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)strmailyn;
    sqlstm.sqhstl[1] = (unsigned long )2;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&oldAnnono;
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


    
    /* 발령구분명 */
    /* EXEC SQL SELECT MAX(DISTINCT A.ANCODE), MAX(DISTINCT A.ANCODE) INTO :strAncodename, :strAncode 
               FROM PIHANNO A
              WHERE A.ANNONO = :oldAnnono AND A.ANUPDYN = 'Y' AND ROWNUM = 1; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select max(distinct A.ANCODE) ,max(distinct A.ANCODE) in\
to :b0,:b1  from PIHANNO A where ((A.ANNONO=:b2 and A.ANUPDYN='Y') and ROWNUM\
=1)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3527;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strAncodename;
    sqlstm.sqhstl[0] = (unsigned long )101;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)strAncode;
    sqlstm.sqhstl[1] = (unsigned long )4;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&oldAnnono;
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



    /* EXEC SQL SELECT CODENAME INTO :strAncodename        
               FROM PYCCODE           
              WHERE CODEID = 'I300'   
                AND CODENO = TRIM(:strAncodename); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "select CODENAME into :b0  from PYCCODE where (CODEID='I3\
00' and CODENO=trim(:b0))";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3554;
    sqlstm.selerr = (unsigned short)0;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strAncodename;
    sqlstm.sqhstl[0] = (unsigned long )101;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)strAncodename;
    sqlstm.sqhstl[1] = (unsigned long )101;
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

 
    
    if (iCount == 0) return;
    	
    printf("공지 - Annono[%s] Ancode[%s]\n", oldAnnono.arr,strAncode);
    	
    if ((strcmp(strAncode,"211") == 0) || (strcmp(strAncode,"411") == 0) || (strcmp(strAncode,"412") == 0) || (strcmp(strAncode,"414") == 0))    
    {
        STRINIT(&strSql);
        sprintf(strSql, "INSERT INTO EHR_PHNOTICE(NOTINO,NOTITYPE,TITLE,MAILYN,USEYN,REGMAN,REGDATE,REGMANDEPT,WRITEMAN,WRITETIME,WRITEMANDEPT, CONTENTS) \n"
                " WITH PIHANNO_W AS (          SELECT  rownum as rowno, '    <tr>'||chr(13)        \n"
                "                  ||'    <td>'||A.EMPNO||'</td>'||chr(13)   \n"
                "                  ||'    <td>'||A.KORNAME||'</td>'||chr(13) \n"
                "                  ||'    <td>'||(SELECT Z.DEPTNAME FROM PYCDEPT Z             \n"
                "                    WHERE Z.ORGNUM = A.BORGNUM  And Z.DEPTCODE = Decode(A.Ancode||A.Andetcode,'41421',A.AdDeptcode,A.BDEPTCODE)) ||'</td>'||chr(13) \n"  /*2018.12.26 발령전부서명(사내파견복귀시는 파견부서로) */
                "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z             \n"
                "                    WHERE Z.CODEID = 'I113' AND Z.CODENO = Decode(A.Ancode||A.Andetcode,'41421',A.AdPayra,A.BPayra))   ||'</td>'||chr(13) \n"    /*2018.12.26 발령전직책명(사내파견복귀시는 파견부서로) */
                "                  ||'    <td>'||(SELECT Z.DEPTNAME FROM PYCDEPT Z             \n"
                "                    WHERE Z.ORGNUM = A.ORGNUM  And Z.DEPTCODE = Decode(A.Ancode||A.Andetcode,'41421',A.Deptcode,Nvl(A.AdDeptcode,A.Deptcode))) ||'</td>'||chr(13) \n"  /*2018.12.26 발령부서명(사내파견복귀시는 발령부서로) */
                "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z             \n"
                "                    WHERE Z.CODEID = 'I113' AND Z.CODENO = Decode(A.Ancode||A.Andetcode,'41421',A.Payra,Nvl(A.AdPayra,A.Payra)))            ||'</td>'||chr(13) \n"  /*2018.12.26 발령후 직책명(사내파견복귀시는 발령부서로) */
                "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z WHERE Z.CODEID = 'I300' AND Z.CODENO = A.ANCODE) ||'</td>'||chr(13)\n"
                "                  ||'    <td>'||CASE NVL(TRIM(A.ANTODATE),'BLANK') WHEN 'BLANK' THEN SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)  \n"
                "                                ELSE SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)||'~'||  \n"
                "                                     SUBSTR(A.ANTODATE,1,4)||'.'||SUBSTR(A.ANTODATE,5,2)||'.'||SUBSTR(A.ANTODATE,7,2) END  \n"
                "                  ||'      </td>'||chr(13)      \n"
                "                  ||'    </tr>'||chr(13) contxt \n"
                "              FROM PIHANNO A                    \n"
                "             WHERE A.ANNONO  = '%s'             \n"
                "               AND A.ANUPDYN = 'Y'         )    \n"
                " SELECT (SELECT MAX(NOTINO) +1 FROM EHR_PHNOTICE),'PA', \n"
                "        '■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호('||trim('%s')||')', \n"
                "        'N','Y','%s',TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                     \n"   
                "        'HR팀','%s',TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),'HR팀',                               \n" 
                "  (SELECT replace(WM_CONCAT(contxt1 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt2 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt3 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt4 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt5 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt6 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt7 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt8 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt9 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt10),',','')|| \n"
                "          replace(WM_CONCAT(contxt11),',','')|| \n"
                "          replace(WM_CONCAT(contxt12),',','')|| \n"
                "          replace(WM_CONCAT(contxt13),',','')|| \n"
                "          replace(WM_CONCAT(contxt14),',','')|| \n"
                "          replace(WM_CONCAT(contxt15),',','')|| \n"
                "          replace(WM_CONCAT(contxt16),',','')|| \n"
                "          replace(WM_CONCAT(contxt17),',','')|| \n"
                "          replace(WM_CONCAT(contxt18),',','')|| \n"
                "          replace(WM_CONCAT(contxt19),',','')|| \n"
                "          replace(WM_CONCAT(contxt20),',','')|| \n"
                "          replace(WM_CONCAT(contxt21),',','')|| \n"
                "          replace(WM_CONCAT(contxt22),',','')|| \n"
                "          replace(WM_CONCAT(contxt23),',','')|| \n"
                "          replace(WM_CONCAT(contxt24),',','')|| \n"
                "          replace(WM_CONCAT(contxt25),',','')|| \n"
                "          replace(WM_CONCAT(contxt26),',','')|| \n"
                "          replace(WM_CONCAT(contxt27),',','')|| \n"
                "          replace(WM_CONCAT(contxt28),',','')|| \n"
                "          replace(WM_CONCAT(contxt29),',','')|| \n"
                "          replace(WM_CONCAT(contxt30),',','')|| \n"
                "          replace(WM_CONCAT(contxt31),',','')|| \n"
                "          replace(WM_CONCAT(contxt32),',','')|| \n"
                "          replace(WM_CONCAT(contxt33),',','')|| \n"
                "          replace(WM_CONCAT(contxt34),',','')|| \n"
                "          replace(WM_CONCAT(contxt35),',','')|| \n"
                "          replace(WM_CONCAT(contxt36),',','')|| \n"
                "          replace(WM_CONCAT(contxt37),',','')|| \n"
                "          replace(WM_CONCAT(contxt38),',','')|| \n"
                "          replace(WM_CONCAT(contxt39),',','')|| \n"
                "          replace(WM_CONCAT(contxt40),',','')|| \n"
                "          replace(WM_CONCAT(contxt41),',','')|| \n"
                "          replace(WM_CONCAT(contxt42),',','')|| \n"
                "          replace(WM_CONCAT(contxt43),',','')|| \n"
                "          replace(WM_CONCAT(contxt44),',','')|| \n"
                "          replace(WM_CONCAT(contxt45),',','')|| \n"
                "          replace(WM_CONCAT(contxt46),',','')|| \n"
                "          replace(WM_CONCAT(contxt47),',','')|| \n"
                "          replace(WM_CONCAT(contxt48),',','')|| \n"
                "          replace(WM_CONCAT(contxt49),',','')|| \n"
                "          replace(WM_CONCAT(contxt50),',','')  contents \n"
                "     FROM (                                                                                                          \n" 
                "           SELECT '<p><strong>■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호</strong></p>' contxt1, \n" 
                "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                "             FROM DUAL                                                                                            \n" 
                "            UNION ALL                                                                                             \n" 
                "           SELECT  '<table border=\"1\" cellpadding=\"5\" cellspacing=\"0\">'||chr(13)                            \n" 
                "                 ||'  <tbody>'||chr(13)                                                                           \n" 
                "                 ||'    <tr>'||chr(13)                                                                            \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>사번</p></td>'||chr(13)    \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>성명</p></td>'||chr(13)    \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령전부서</p></td>'||chr(13)\n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령전직책</p></td>'||chr(13)\n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령후부서</p></td>'||chr(13)\n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령후직책</p></td>'||chr(13)\n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령구분</p></td>'||chr(13)  \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령일자</td>'||chr(13)      \n"
                "                 ||'    </tr>'||chr(13) contxt1, \n"
                "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                "             FROM DUAL                         \n"
                "            UNION ALL                               \n"
                "            SELECT contxt contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1 and 50           \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, contxt contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 51 and 100         \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, contxt contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 101 and 150        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, contxt contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 151 and 200        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, contxt contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 201 and 250        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, contxt contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 251 and 300        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, contxt contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 301 and 350        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, contxt contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 351 and 400        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, contxt contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 401 and 450        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, contxt contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 451 and 500        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   contxt contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 501 and 550        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, contxt contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 551 and 600        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, contxt contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 601 and 650        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, contxt contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 651 and 700        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, contxt contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 701 and 750        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, contxt contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 751 and 800        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, contxt contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 801 and 850        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, contxt contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 851 and 900        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, contxt contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 901 and 950        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, contxt contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 951 and 1000       \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   contxt contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1001 and 1050      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, contxt contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1051 and 1100      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, contxt contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1101 and 1150      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, contxt contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1151 and 1200      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, contxt contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1201 and 1250      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, contxt contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1251 and 1300      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, contxt contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1301 and 1350      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, contxt contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1351 and 1400      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, contxt contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1401 and 1450      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, contxt contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1451 and 1500      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   contxt contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1501 and 1550      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, contxt contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1551 and 1600      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, contxt contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1601 and 1650      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, contxt contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1651 and 1700      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, contxt contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1701 and 1750      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, contxt contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1751 and 1800      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, contxt contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1801 and 1850      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, contxt contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1851 and 1900      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, contxt contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1901 and 1950      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, contxt contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1951 and 2000      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   contxt contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2001 and 2050      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, contxt contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2051 and 2100      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, contxt contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2101 and 2150      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, contxt contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2151 and 2200      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, contxt contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2201 and 2250      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, contxt contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2251 and 2300      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, contxt contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2301 and 2350      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, contxt contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2351 and 2400      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, contxt contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2401 and 2450      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, contxt contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2451 and 2500      \n"
                "             UNION ALL                          \n"
                "            SELECT  '  </tbody>'||chr(13)       \n"
                "                 ||'</table>'  contxt1,         \n"
                "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM DUAL                          \n"
                "             )                                  \n"
                "  )                                             \n"
                " FROM DUAL", oldAnnono.arr, oldAnnono.arr, oldAnnono.arr, strAncodename, jobEmpno, jobEmpno, oldAnnono.arr, oldAnnono.arr );
        
        /*
        if ((strcmp(oldAnnono.arr, "20180366") != 0) && (strcmp(oldAnnono.arr, "20180367") != 0) && (strcmp(oldAnnono.arr, "20180368") != 0) &&
            (strcmp(oldAnnono.arr, "20180369") != 0) && (strcmp(oldAnnono.arr, "20180370") != 0) && (strcmp(oldAnnono.arr, "20180371") != 0) && (strcmp(oldAnnono.arr, "20180374") != 0) &&
            (strcmp(oldAnnono.arr, "20180412") != 0) && (strcmp(oldAnnono.arr, "20180413") != 0) && (strcmp(oldAnnono.arr, "20180414") != 0) && (strcmp(oldAnnono.arr, "20180415") != 0) && //2018.12.07.
            (strcmp(oldAnnono.arr, "20180416") != 0) && (strcmp(oldAnnono.arr, "20180417") != 0) && (strcmp(oldAnnono.arr, "20180418") != 0) && (strcmp(oldAnnono.arr, "20180419") != 0) && //2018.12.07.
            (strcmp(oldAnnono.arr, "20180420") != 0) && (strcmp(oldAnnono.arr, "20180421") != 0) &&                                                                                         //2018.12.07.
            (strcmp(oldAnnono.arr, "20180429") != 0) && (strcmp(oldAnnono.arr, "20180430") != 0) && (strcmp(oldAnnono.arr, "20180431") != 0) && (strcmp(oldAnnono.arr, "20180434") != 0) && (strcmp(oldAnnono.arr, "20180435") != 0) && //2018.12.14
            (strcmp(oldAnnono.arr, "20180448") != 0) && (strcmp(oldAnnono.arr, "20180449") != 0) && //2018.12.19
            (strcmp(oldAnnono.arr, "20180354") != 0) && // 2018.12.24 Lee Sangmoon
            (strcmp(oldAnnono.arr, "20180456") != 0) && (strcmp(oldAnnono.arr, "20180457") != 0) && //2018.12.28
            (strcmp(oldAnnono.arr, "20180468") != 0) && (strcmp(oldAnnono.arr, "20180469") != 0) && (strcmp(oldAnnono.arr, "20180470") != 0)  //2018.12.31
           ) */
        if (strcmp(strnotiyn,"Y") == 0)  //2019.01. 공지여부 필드기준으로 체크해 공지토록 개선. dsa2000
        {	                
            /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )3577;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)strSql;
            sqlstm.sqhstl[0] = (unsigned long )100000;
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

      //if (DEBUG) printf("Notice sql[%s],code[%d]len[%d]\n", strSql, SQLCODE, strlen(strSql));
        
            STRINIT(&logText);  
            if (SQLCODE != SQL_OK)
            {
                sprintf(logText, "MYHR 공지사항 테이블 입력 실패 1 !! 발령번호[%s]", oldAnnono.arr);
                logWrite(logText);
            }
            else            
            {
            	  sprintf(logText, "MYHR 공지사항 테이블 입력 성공1 !! 발령번호[%s], strnotiyn[%s]", oldAnnono.arr, strnotiyn);
                logWrite(logText);
                /* EXEC SQL COMMIT WORK; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )3596;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            }
        }        
    }
    else
    {
        STRINIT(&strSql);
        sprintf(strSql, "INSERT INTO EHR_PHNOTICE(NOTINO,NOTITYPE,TITLE,MAILYN,USEYN,REGMAN,REGDATE,REGMANDEPT,WRITEMAN,WRITETIME,WRITEMANDEPT, CONTENTS) \n"
                " WITH PIHANNO_W AS (          SELECT  rownum as rowno, '    <tr>'||chr(13)        \n"
                "                  ||'    <td>'||A.EMPNO||'</td>'||chr(13)   \n"
                "                  ||'    <td>'||A.KORNAME||'</td>'||chr(13) \n"
                "                  ||'    <td>'||(SELECT Z.DEPTNAME FROM PYCDEPT Z             \n"
                "                    WHERE Z.ORGNUM = A.ORGNUM  And Z.DEPTCODE = Nvl(A.AdDeptcode,A.Deptcode)) ||'</td>'||chr(13) \n"  /*2018.11. 겸직/겸무 발령시 해당부서명 찍히도록 수정*/
                "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z             \n"
                "                    WHERE Z.CODEID = 'I113' AND Z.CODENO = Nvl(A.AdPayra,A.Payra))            ||'</td>'||chr(13) \n"  /*2018.11. 발령후 직책명 */
                "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z            \n"
                "                    WHERE Z.CODEID = 'I300' AND Z.CODENO = A.ANCODE )                         ||'</td>'||chr(13) \n"
                "                  ||'    <td>'||CASE NVL(TRIM(A.ANTODATE),'BLANK') WHEN 'BLANK' THEN SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)  \n"
                "                                ELSE SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)||'~'||  \n"
                "                                     SUBSTR(A.ANTODATE,1,4)||'.'||SUBSTR(A.ANTODATE,5,2)||'.'||SUBSTR(A.ANTODATE,7,2) END  \n"
                "                  ||'      </td>'||chr(13)      \n"
                "                  ||'    </tr>'||chr(13) contxt \n"
                "              FROM PIHANNO A                    \n"
                "             WHERE A.ANNONO  = '%s'             \n"
                "               AND A.ANUPDYN = 'Y' )            \n"
                " SELECT (SELECT MAX(NOTINO) +1 FROM EHR_PHNOTICE),'PA', \n"
                "        '■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호('||trim('%s')||')', \n"
                "        'N','Y','%s',TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                     \n"   
                "        'HR팀','%s',TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),'HR팀',                               \n" 
                "  (SELECT replace(WM_CONCAT(contxt1 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt2 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt3 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt4 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt5 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt6 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt7 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt8 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt9 ),',','')|| \n"
                "          replace(WM_CONCAT(contxt10),',','')|| \n"
                "          replace(WM_CONCAT(contxt11),',','')|| \n"
                "          replace(WM_CONCAT(contxt12),',','')|| \n"
                "          replace(WM_CONCAT(contxt13),',','')|| \n"
                "          replace(WM_CONCAT(contxt14),',','')|| \n"
                "          replace(WM_CONCAT(contxt15),',','')|| \n"
                "          replace(WM_CONCAT(contxt16),',','')|| \n"
                "          replace(WM_CONCAT(contxt17),',','')|| \n"
                "          replace(WM_CONCAT(contxt18),',','')|| \n"
                "          replace(WM_CONCAT(contxt19),',','')|| \n"
                "          replace(WM_CONCAT(contxt20),',','')|| \n"
                "          replace(WM_CONCAT(contxt21),',','')|| \n"
                "          replace(WM_CONCAT(contxt22),',','')|| \n"
                "          replace(WM_CONCAT(contxt23),',','')|| \n"
                "          replace(WM_CONCAT(contxt24),',','')|| \n"
                "          replace(WM_CONCAT(contxt25),',','')|| \n"
                "          replace(WM_CONCAT(contxt26),',','')|| \n"
                "          replace(WM_CONCAT(contxt27),',','')|| \n"
                "          replace(WM_CONCAT(contxt28),',','')|| \n"
                "          replace(WM_CONCAT(contxt29),',','')|| \n"
                "          replace(WM_CONCAT(contxt30),',','')|| \n"
                "          replace(WM_CONCAT(contxt31),',','')|| \n"
                "          replace(WM_CONCAT(contxt32),',','')|| \n"
                "          replace(WM_CONCAT(contxt33),',','')|| \n"
                "          replace(WM_CONCAT(contxt34),',','')|| \n"
                "          replace(WM_CONCAT(contxt35),',','')|| \n"
                "          replace(WM_CONCAT(contxt36),',','')|| \n"
                "          replace(WM_CONCAT(contxt37),',','')|| \n"
                "          replace(WM_CONCAT(contxt38),',','')|| \n"
                "          replace(WM_CONCAT(contxt39),',','')|| \n"
                "          replace(WM_CONCAT(contxt40),',','')|| \n"
                "          replace(WM_CONCAT(contxt41),',','')|| \n"
                "          replace(WM_CONCAT(contxt42),',','')|| \n"
                "          replace(WM_CONCAT(contxt43),',','')|| \n"
                "          replace(WM_CONCAT(contxt44),',','')|| \n"
                "          replace(WM_CONCAT(contxt45),',','')|| \n"
                "          replace(WM_CONCAT(contxt46),',','')|| \n"
                "          replace(WM_CONCAT(contxt47),',','')|| \n"
                "          replace(WM_CONCAT(contxt48),',','')|| \n"
                "          replace(WM_CONCAT(contxt49),',','')|| \n"
                "          replace(WM_CONCAT(contxt50),',','')  contents \n"
                "     FROM (                                                                                                          \n" 
                "           SELECT '<p><strong>■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호</strong></p>' contxt1, \n" 
                "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                "             FROM DUAL                                                                                            \n" 
                "            UNION ALL                                                                                             \n" 
                "           SELECT  '<table border=\"1\" cellpadding=\"5\" cellspacing=\"0\">'||chr(13)                            \n" 
                "                 ||'  <tbody>'||chr(13)                                                                           \n" 
                "                 ||'    <tr>'||chr(13)                                                                            \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>사번</p></td>'||chr(13)    \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>성명</p></td>'||chr(13)    \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>부서</p></td>'||chr(13)    \n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령직책</p></td>'||chr(13)\n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령구분</p></td>'||chr(13)\n"
                "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령일자</td>'||chr(13)    \n"
                "                 ||'    </tr>'||chr(13) contxt1, \n"
                "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                "             FROM DUAL                         \n"
                "            UNION ALL                               \n"
                "            SELECT contxt contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1 and 50           \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, contxt contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 51 and 100         \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, contxt contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 101 and 150        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, contxt contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 151 and 200        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, contxt contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 201 and 250        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, contxt contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 251 and 300        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, contxt contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 301 and 350        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, contxt contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 351 and 400        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, contxt contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 401 and 450        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, contxt contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 451 and 500        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   contxt contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 501 and 550        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, contxt contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 551 and 600        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, contxt contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 601 and 650        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, contxt contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 651 and 700        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, contxt contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 701 and 750        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, contxt contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 751 and 800        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, contxt contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 801 and 850        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, contxt contxt18, '' contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 851 and 900        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, contxt contxt19, '' contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 901 and 950        \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, contxt contxt20, \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 951 and 1000       \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   contxt contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1001 and 1050      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, contxt contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1051 and 1100      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, contxt contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1101 and 1150      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, contxt contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1151 and 1200      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, contxt contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1201 and 1250      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, contxt contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1251 and 1300      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, contxt contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1301 and 1350      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, contxt contxt28, '' contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1351 and 1400      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, contxt contxt29, '' contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1401 and 1450      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, contxt contxt30, \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1451 and 1500      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   contxt contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1501 and 1550      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, contxt contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1551 and 1600      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, contxt contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1601 and 1650      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, contxt contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1651 and 1700      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, contxt contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1701 and 1750      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, contxt contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1751 and 1800      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, contxt contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1801 and 1850      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, contxt contxt38, '' contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1851 and 1900      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, contxt contxt39, '' contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1901 and 1950      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, contxt contxt40, \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 1951 and 2000      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   contxt contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2001 and 2050      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, contxt contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2051 and 2100      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, contxt contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2101 and 2150      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, contxt contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2151 and 2200      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, contxt contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2201 and 2250      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, contxt contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2251 and 2300      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, contxt contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2301 and 2350      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, contxt contxt48, '' contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2351 and 2400      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, contxt contxt49, '' contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2401 and 2450      \n"
                "            UNION ALL                               \n"
                "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, contxt contxt50  \n"
                "             FROM  PIHANNO_W                        \n"       
                "            WHERE  rowno between 2451 and 2500      \n"
                "             UNION ALL                          \n"
                "            SELECT  '  </tbody>'||chr(13)       \n"
                "                 ||'</table>'  contxt1,         \n"
                "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                "             FROM DUAL                          \n"
                "             )                                  \n"
                "  )                                             \n"
                " FROM DUAL", oldAnnono.arr, oldAnnono.arr, oldAnnono.arr, strAncodename, jobEmpno, jobEmpno, oldAnnono.arr, oldAnnono.arr );

        /*
        if ((strcmp(oldAnnono.arr, "20180366") != 0) && (strcmp(oldAnnono.arr, "20180367") != 0) && (strcmp(oldAnnono.arr, "20180368") != 0) &&
            (strcmp(oldAnnono.arr, "20180369") != 0) && (strcmp(oldAnnono.arr, "20180370") != 0) && (strcmp(oldAnnono.arr, "20180371") != 0) && (strcmp(oldAnnono.arr, "20180374") != 0) &&
            (strcmp(oldAnnono.arr, "20180412") != 0) && (strcmp(oldAnnono.arr, "20180413") != 0) && (strcmp(oldAnnono.arr, "20180414") != 0) && (strcmp(oldAnnono.arr, "20180415") != 0) && //2018.12.07.
            (strcmp(oldAnnono.arr, "20180416") != 0) && (strcmp(oldAnnono.arr, "20180417") != 0) && (strcmp(oldAnnono.arr, "20180418") != 0) && (strcmp(oldAnnono.arr, "20180419") != 0) && //2018.12.07.
            (strcmp(oldAnnono.arr, "20180420") != 0) && (strcmp(oldAnnono.arr, "20180421") != 0) &&                                                                                         //2018.12.07.
            (strcmp(oldAnnono.arr, "20180429") != 0) && (strcmp(oldAnnono.arr, "20180430") != 0) && (strcmp(oldAnnono.arr, "20180431") != 0) && (strcmp(oldAnnono.arr, "20180434") != 0) && (strcmp(oldAnnono.arr, "20180435") != 0) && //2018.12.14
            (strcmp(oldAnnono.arr, "20180448") != 0) && (strcmp(oldAnnono.arr, "20180449") != 0) && //2018.12.19
            (strcmp(oldAnnono.arr, "20180354") != 0) && // 2018.12.24 Lee Sangmoon
            (strcmp(oldAnnono.arr, "20180456") != 0) && (strcmp(oldAnnono.arr, "20180457") != 0) && //2018.12.28
            (strcmp(oldAnnono.arr, "20180468") != 0) && (strcmp(oldAnnono.arr, "20180469") != 0) && (strcmp(oldAnnono.arr, "20180470") != 0)  //2018.12.31
           )*/
        if (strcmp(strnotiyn,"Y") == 0) //2019.01. 공지여부 필드기준으로 체크해 공지토록 개선. dsa2000
        {	  
            /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.stmt = "";
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )3611;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlstm.sqhstv[0] = (unsigned char  *)strSql;
            sqlstm.sqhstl[0] = (unsigned long )100000;
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

     //if (DEBUG) printf("Notice sql[%s],code[%d]len[%d]\n", strSql, SQLCODE, strlen(strSql));
        
            STRINIT(&logText);  
            if (SQLCODE != SQL_OK)
            {
                sprintf(logText, "MYHR 공지사항 테이블 입력 실패2 !! 발령번호[%s]", oldAnnono.arr);
                logWrite(logText);
            }
            else
            {
                sprintf(logText, "MYHR 공지사항 테이블 입력 성공2 !! 발령번호[%s], strnotiyn[%s]", oldAnnono.arr, strnotiyn);
                logWrite(logText);
                /* EXEC SQL COMMIT WORK; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )3630;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            }
        }        
    }	

    STRINIT(&strSql1);  //printf("strmailyn:%s\n",strmailyn);
    
    if (strcmp(strmailyn,"Z") == 0)  //2019.01. 메일발송여부 필드 기준으로 체크해 발송토록 개선. dsa2000
          sprintf(strSql1, "SELECT EMPNO FROM EHR_PHPINOTIMAIL WHERE USEYN = 'Y' AND Substr(EMPNO,1,1)='Z'");
    else  sprintf(strSql1, "SELECT EMPNO FROM EHR_PHPINOTIMAIL WHERE USEYN = 'Y'");

    /* EXEC SQL PREPARE SSS FROM :strSql1; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3645;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)strSql1;
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


    /* EXEC SQL DECLARE cur_mail CURSOR FOR SSS; */ 

    /* EXEC SQL OPEN cur_mail; */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3664;
    sqlstm.selerr = (unsigned short)1;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqcmod = (unsigned int )0;
    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


    
    //printf("Ins EHR_PZHMAIL sql[%s],code[%d]len[%d]\n", strSql1, SQLCODE, strlen(strSql1));

    while(TRUE)
    {
        STRINIT(&mEmpno);
        /* EXEC SQL FETCH cur_mail INTO :mEmpno; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3679;
        sqlstm.selerr = (unsigned short)1;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlstm.sqfoff = (         int )0;
        sqlstm.sqfmod = (unsigned int )2;
        sqlstm.sqhstv[0] = (unsigned char  *)mEmpno;
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



        if (SQLCODE == SQL_NO_DATA)
        {
            /* EXEC SQL CLOSE cur_mail; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )3698;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            /* EXEC SQL COMMIT WORK; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )3713;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            break;
        }
        else if (SQLCODE != SQL_OK)
        {
            /* EXEC SQL CLOSE cur_mail; */ 

{
            struct sqlexd sqlstm;
            sqlstm.sqlvsn = 12;
            sqlstm.arrsiz = 97;
            sqlstm.sqladtp = &sqladt;
            sqlstm.sqltdsp = &sqltds;
            sqlstm.iters = (unsigned int  )1;
            sqlstm.offset = (unsigned int  )3728;
            sqlstm.cud = sqlcud0;
            sqlstm.sqlest = (unsigned char  *)&sqlca;
            sqlstm.sqlety = (unsigned short)4352;
            sqlstm.occurs = (unsigned int  )0;
            sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


            STRINIT(&logText);
            sprintf(logText, "Cursor Fetch Error[cur_mail] : %s", SQLERRM);
            logWrite(logText);
            return;
        }
        printf("메일 - Annono[%s] Ancode[%s]\n", oldAnnono.arr,strAncode);
        
        if ((strcmp(strAncode,"211") == 0) || (strcmp(strAncode,"411") == 0) || (strcmp(strAncode,"412") == 0) || (strcmp(strAncode,"414") == 0))    
        { 
            STRINIT(&strSql);
            sprintf(strSql, "INSERT INTO EHR_PZHMAIL (SENDTIME,SENDPROG,SEND_PER,RCVR_PER,SUBJECT,BODY1,RECEIVEYN,EAI_FLAG)  \n"
                    " WITH PIHANNO_W AS (          SELECT  rownum as rowno, '    <tr>'||chr(13)        \n"
                    "                  ||'    <td>'||A.EMPNO||'</td>'||chr(13)   \n"
                    "                  ||'    <td>'||A.KORNAME||'</td>'||chr(13) \n"
                    "                  ||'    <td>'||(SELECT Z.DEPTNAME FROM PYCDEPT Z             \n"
                    "                    WHERE Z.ORGNUM = A.BORGNUM  And Z.DEPTCODE = Decode(A.Ancode||A.Andetcode,'41421',A.AdDeptcode,A.BDEPTCODE)) ||'</td>'||chr(13) \n"  /*2018.12.26 발령전부서명(사내파견복귀시는 파견부서로) */
                    "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z             \n"
                    "                    WHERE Z.CODEID = 'I113' AND Z.CODENO = Decode(A.Ancode||A.Andetcode,'41421',A.AdPayra,A.BPayra))   ||'</td>'||chr(13) \n"    /*2018.12.26 발령전직책명(사내파견복귀시는 파견부서로) */
                    "                  ||'    <td>'||(SELECT Z.DEPTNAME FROM PYCDEPT Z             \n"
                    "                    WHERE Z.ORGNUM = A.ORGNUM  And Z.DEPTCODE = Decode(A.Ancode||A.Andetcode,'41421',A.Deptcode,Nvl(A.AdDeptcode,A.Deptcode))) ||'</td>'||chr(13) \n"  /*2018.12.26 발령부서명(사내파견복귀시는 발령부서로) */
                    "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z             \n"
                    "                    WHERE Z.CODEID = 'I113' AND Z.CODENO = Decode(A.Ancode||A.Andetcode,'41421',A.Payra,Nvl(A.AdPayra,A.Payra)))            ||'</td>'||chr(13) \n"  /*2018.12.26 발령후 직책명(사내사내파견복귀시는 발령부서로) */
                    "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z WHERE Z.CODEID = 'I300' AND Z.CODENO = A.ANCODE) ||'</td>'||chr(13)\n"
                    "                  ||'    <td>'||CASE NVL(TRIM(A.ANTODATE),'BLANK') WHEN 'BLANK' THEN SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)  \n"
                    "                                ELSE SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)||'~'||  \n"
                    "                                     SUBSTR(A.ANTODATE,1,4)||'.'||SUBSTR(A.ANTODATE,5,2)||'.'||SUBSTR(A.ANTODATE,7,2) END  \n"
                    "                  ||'      </td>'||chr(13)      \n"
                    "                  ||'    </tr>'||chr(13) contxt \n"
                    "              FROM PIHANNO A          \n"
                    "             WHERE A.ANNONO  = '%s'   \n"
                    "               AND A.ANUPDYN = 'Y'   )\n"
                    " SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), 'pic1065g', '%s', trim('%s'),  \n"
                    "        '■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호('||trim('%s')||')', \n"
                    "  (SELECT replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt1 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"   
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt2 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt3 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt4 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt5 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt6 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt7 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt8 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt9 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt10),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt11),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt12),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt13),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt14),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt15),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt16),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt17),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt18),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt19),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt20),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt21),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt22),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt23),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt24),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt25),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt26),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt27),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt28),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt29),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt30),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt31),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt32),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt33),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt34),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt35),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt36),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt37),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt38),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt39),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt40),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt41),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt42),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt43),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt44),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt45),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt46),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt47),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt48),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt49),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt50),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')  contents \n" 
                    "     FROM (                                                                                                          \n" 
                    "           SELECT '<p><strong>■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호</strong></p>' contxt1,           \n" 
                    "                  '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,  \n" 
                    "                  '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                  '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                  '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                  '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                    "             FROM DUAL                                                                                                \n" 
                    "            UNION ALL                                                                                                 \n" 
                    "           SELECT   '<table border=\"1\" cellpadding=\"5\" cellspacing=\"0\">'||chr(13)                               \n" 
                    "                  ||'  <tbody>'||chr(13)                                                                              \n" 
                    "                  ||'    <tr>'||chr(13)                                                                               \n"
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>사번</p></td>'||chr(13)       \n"
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>성명</p></td>'||chr(13)       \n"
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령전부서</p></td>'||chr(13) \n"
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령전직책</p></td>'||chr(13) \n"                        
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령후부서</p></td>'||chr(13) \n"
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령후직책</p></td>'||chr(13) \n"
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령구분</p></td>  '||chr(13) \n"
                    "                  ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령일자</td>      '||chr(13) \n"
                    "                  ||'    </tr>'||chr(13) contxt1, \n"
                    "                  '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,  \n" 
                    "                  '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                  '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                  '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                  '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                    "             FROM DUAL                         \n"
                    "            UNION ALL                          \n"
                    "            SELECT contxt contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1 and 50           \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, contxt contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 51 and 100         \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, contxt contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 101 and 150        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, contxt contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 151 and 200        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, contxt contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 201 and 250        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, contxt contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 251 and 300        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, contxt contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 301 and 350        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, contxt contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 351 and 400        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, contxt contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 401 and 450        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, contxt contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 451 and 500        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   contxt contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 501 and 550        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, contxt contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 551 and 600        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, contxt contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 601 and 650        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, contxt contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 651 and 700        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, contxt contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 701 and 750        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, contxt contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 751 and 800        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, contxt contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 801 and 850        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, contxt contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 851 and 900        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, contxt contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 901 and 950        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, contxt contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 951 and 1000       \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   contxt contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1001 and 1050      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, contxt contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1051 and 1100      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, contxt contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1101 and 1150      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, contxt contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1151 and 1200      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, contxt contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1201 and 1250      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, contxt contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1251 and 1300      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, contxt contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1301 and 1350      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, contxt contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1351 and 1400      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, contxt contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1401 and 1450      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, contxt contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1451 and 1500      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   contxt contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1501 and 1550      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, contxt contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1551 and 1600      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, contxt contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1601 and 1650      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, contxt contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1651 and 1700      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, contxt contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1701 and 1750      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, contxt contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1751 and 1800      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, contxt contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1801 and 1850      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, contxt contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1851 and 1900      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, contxt contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1901 and 1950      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, contxt contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1951 and 2000      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   contxt contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2001 and 2050      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, contxt contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2051 and 2100      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, contxt contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2101 and 2150      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, contxt contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2151 and 2200      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, contxt contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2201 and 2250      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, contxt contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2251 and 2300      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, contxt contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2301 and 2350      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, contxt contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2351 and 2400      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, contxt contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2401 and 2450      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, contxt contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2451 and 2500      \n"
                    "             UNION ALL                          \n"
                    "            SELECT  '  </tbody>'||chr(13)       \n"
                    "                 ||'</table>'  contxt1,         \n"
                    "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM DUAL                          \n"
                    "             )                                  \n"
                    "  ), 'N', 'N'                                             \n"
                    " FROM DUAL", oldAnnono.arr, jobEmpno, mEmpno, oldAnnono.arr, oldAnnono.arr, strAncodename, oldAnnono.arr, oldAnnono.arr );

            /*if ( (strcmp(oldAnnono.arr, "20180429") != 0) && (strcmp(oldAnnono.arr, "20180430") != 0) && (strcmp(oldAnnono.arr, "20180431") != 0) && (strcmp(oldAnnono.arr, "20180434") != 0) && (strcmp(oldAnnono.arr, "20180435") != 0) && //2018.12.14
                 (strcmp(oldAnnono.arr, "20180448") != 0) && (strcmp(oldAnnono.arr, "20180449") != 0) && //2018.12.19
                 (strcmp(oldAnnono.arr, "20180354") != 0) && // 2018.12.24 Lee Sangmoon                     
                 (strcmp(oldAnnono.arr, "20180456") != 0) && (strcmp(oldAnnono.arr, "20180457") != 0) && //2018.12.28
                 (strcmp(oldAnnono.arr, "20180076") != 0) && //2018.12.31 정문선
                 (strcmp(oldAnnono.arr, "20180468") != 0) && (strcmp(oldAnnono.arr, "20180469") != 0) && (strcmp(oldAnnono.arr, "20180470") != 0) && //2018.12.31
                 (strcmp(oldAnnono.arr, "20190001") != 0)    //2019.01.03 정문선
                )*/
            if ( (strcmp(strmailyn,"Y") == 0) || (strcmp(strmailyn,"Z") == 0) ) //2019.01. 메일발송여부 필드 기준으로 체크해 발송토록 개선. dsa2000
            {
                /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )3743;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)strSql;
                sqlstm.sqhstl[0] = (unsigned long )100000;
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
                    /* EXEC SQL CLOSE cur_mail; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 97;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )3762;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    sprintf(logText, "발령 메일발송1 실패!! 발령번호[%s]", oldAnnono.arr);
                    logWrite(logText);
                }
            }
        }
        else
        {
            STRINIT(&strSql);
            sprintf(strSql, "INSERT INTO EHR_PZHMAIL (SENDTIME,SENDPROG,SEND_PER,RCVR_PER,SUBJECT,BODY1,RECEIVEYN,EAI_FLAG)  \n"
                    "  WITH PIHANNO_W AS (      SELECT  rownum as rowno,  '    <tr>'||chr(13)        \n"
                    "                  ||'    <td>'||A.EMPNO  ||'</td>'||chr(13)   \n"
                    "                  ||'    <td>'||A.KORNAME||'</td>'||chr(13) \n"
                    "                  ||'    <td>'||(SELECT Z.DEPTNAME FROM PYCDEPT Z             \n"
                    "                    WHERE Z.ORGNUM = A.ORGNUM  And Z.DEPTCODE = Nvl(A.AdDeptcode,A.Deptcode))  ||'</td>'||chr(13) \n"  /*2018.11. 발령 후 겸직/겸무/파견 발령시 해당부서명 찍히도록 수정*/
                    "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z             \n"
                    "                    WHERE Z.CODEID = 'I113' AND Z.CODENO = Nvl(A.AdPayra,A.Payra))             ||'</td>'||chr(13) \n"  /*2018.11. 발령후 직책명 */
                    "                  ||'    <td>'||(SELECT Z.CODENAME FROM PYCCODE Z                                     \n"
                    "                    WHERE Z.CODEID = 'I300' AND Z.CODENO = A.ANCODE)                           ||'</td>'||chr(13) \n"
                    "                  ||'    <td>'||CASE NVL(TRIM(A.ANTODATE),'BLANK') WHEN 'BLANK' THEN SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)  \n"
                    "                                ELSE SUBSTR(A.ANFRDATE,1,4)||'.'||SUBSTR(A.ANFRDATE,5,2)||'.'||SUBSTR(A.ANFRDATE,7,2)||'~'||  \n"
                    "                                     SUBSTR(A.ANTODATE,1,4)||'.'||SUBSTR(A.ANTODATE,5,2)||'.'||SUBSTR(A.ANTODATE,7,2) END  \n"
                    "                  ||'      </td>'||chr(13)      \n"
                    "                  ||'    </tr>'||chr(13) contxt \n"
                    "              FROM PIHANNO A          \n"
                    "             WHERE A.ANNONO  = '%s'   \n"
                    "               AND A.ANUPDYN = 'Y'   )\n"
                    " SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), 'pic1065g', '%s', trim('%s'),  \n"
                    "        '■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호('||trim('%s')||')', \n"
                    "  (SELECT replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt1 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"   
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt2 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt3 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt4 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt5 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt6 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt7 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt8 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt9 ),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt10),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt11),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt12),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt13),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt14),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt15),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt16),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt17),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt18),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt19),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt20),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt21),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt22),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt23),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt24),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt25),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt26),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt27),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt28),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt29),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt30),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt31),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt32),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt33),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt34),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt35),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt36),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt37),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt38),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt39),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt40),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt41),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt42),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt43),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt44),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt45),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt46),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt47),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt48),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt49),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')|| \n"
                    "          replace(replace(replace(replace(replace(replace(WM_CONCAT(contxt50),',',''),'\r\n',''),'\n\r',''),'\r',''),'\n',''),'\t','')  contents \n" 
                    "     FROM (                                                                                                          \n" 
                    "           SELECT '<p><strong>■ 인사발령 제'||substr('%s', 1, 4)||'-'||substr('%s', 5, 4)||'호</strong></p>' contxt1,           \n" 
                    "                  '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,  \n" 
                    "                  '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                  '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                  '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                  '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                    "             FROM DUAL                                                                                              \n" 
                    "            UNION ALL                                                                                               \n" 
                    "           SELECT   '<table border=\"1\" cellpadding=\"5\" cellspacing=\"0\">'||chr(13)                             \n" 
                    "                  ||'  <tbody>'||chr(13)                                                                            \n" 
                    "                  ||'    <tr>'||chr(13)                                                                             \n"
                    "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>사번</p></td>'||chr(13)     \n"
                    "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>성명</p></td>'||chr(13)     \n"
                    "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>부서</p></td>'||chr(13)     \n"
                    "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령직책</p></td>'||chr(13) \n"
                    "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령구분</p></td>'||chr(13) \n"
                    "                 ||'      <td style=\"text-align: center; vertical-align: middle;\"><p>발령일자</td>'||chr(13)     \n"
                    "                 ||'    </tr>'||chr(13) contxt1, \n"
                    "                  '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,  \n" 
                    "                  '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                  '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                  '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                  '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"            
                    "             FROM DUAL                         \n"
                    "            UNION ALL                          \n"
                    "            SELECT contxt contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1 and 50           \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, contxt contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 51 and 100         \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, contxt contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 101 and 150        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, contxt contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 151 and 200        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, contxt contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 201 and 250        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, contxt contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 251 and 300        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, contxt contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 301 and 350        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, contxt contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 351 and 400        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, contxt contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 401 and 450        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, contxt contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 451 and 500        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   contxt contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 501 and 550        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, contxt contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 551 and 600        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, contxt contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 601 and 650        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, contxt contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 651 and 700        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, contxt contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 701 and 750        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, contxt contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 751 and 800        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, contxt contxt17, '' contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 801 and 850        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, contxt contxt18, '' contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 851 and 900        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, contxt contxt19, '' contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 901 and 950        \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, contxt contxt20, \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 951 and 1000       \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   contxt contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1001 and 1050      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, contxt contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1051 and 1100      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, contxt contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1101 and 1150      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, contxt contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1151 and 1200      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, contxt contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1201 and 1250      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, contxt contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1251 and 1300      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, contxt contxt27, '' contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1301 and 1350      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, contxt contxt28, '' contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1351 and 1400      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, contxt contxt29, '' contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1401 and 1450      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, contxt contxt30, \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1451 and 1500      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   contxt contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1501 and 1550      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, contxt contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1551 and 1600      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, contxt contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1601 and 1650      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, contxt contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1651 and 1700      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, contxt contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1701 and 1750      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, contxt contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1751 and 1800      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, contxt contxt37, '' contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1801 and 1850      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, contxt contxt38, '' contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1851 and 1900      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, contxt contxt39, '' contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1901 and 1950      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, contxt contxt40, \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50      \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 1951 and 2000      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   contxt contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2001 and 2050      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, contxt contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2051 and 2100      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, contxt contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2101 and 2150      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, contxt contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2151 and 2200      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, contxt contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2201 and 2250      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, contxt contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2251 and 2300      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, contxt contxt47, '' contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2301 and 2350      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, contxt contxt48, '' contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2351 and 2400      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, contxt contxt49, '' contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2401 and 2450      \n"
                    "            UNION ALL                               \n"
                    "            SELECT '' contxt1, '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,              \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,     \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,     \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,     \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, contxt contxt50  \n"
                    "             FROM  PIHANNO_W                        \n"       
                    "            WHERE  rowno between 2451 and 2500      \n"
                    "             UNION ALL                          \n"
                    "            SELECT  '  </tbody>'||chr(13)       \n"
                    "                 ||'</table>'  contxt1,         \n"
                    "                   '' contxt2, '' contxt3, '' contxt4, '' contxt5, '' contxt6, '' contxt7, '' contxt8, '' contxt9, '' contxt10,       \n" 
                    "                   '' contxt11, '' contxt12, '' contxt13, '' contxt14, '' contxt15, '' contxt16, '' contxt17, '' contxt18, '' contxt19, '' contxt20,  \n" 
                    "                   '' contxt21, '' contxt22, '' contxt23, '' contxt24, '' contxt25, '' contxt26, '' contxt27, '' contxt28, '' contxt29, '' contxt30,  \n"
                    "                   '' contxt31, '' contxt32, '' contxt33, '' contxt34, '' contxt35, '' contxt36, '' contxt37, '' contxt38, '' contxt39, '' contxt40,  \n"
                    "                   '' contxt41, '' contxt42, '' contxt43, '' contxt44, '' contxt45, '' contxt46, '' contxt47, '' contxt48, '' contxt49, '' contxt50   \n"
                    "             FROM DUAL                          \n"
                    "             )                                  \n"
                    "  ), 'N', 'N'                                             \n"
                    " FROM DUAL", oldAnnono.arr, jobEmpno, mEmpno, oldAnnono.arr, oldAnnono.arr, strAncodename, oldAnnono.arr, oldAnnono.arr );

            /*if ( (strcmp(oldAnnono.arr, "20180429") != 0) && (strcmp(oldAnnono.arr, "20180430") != 0) && (strcmp(oldAnnono.arr, "20180431") != 0) && (strcmp(oldAnnono.arr, "20180434") != 0) && (strcmp(oldAnnono.arr, "20180435") != 0) && //2018.12.14
                 (strcmp(oldAnnono.arr, "20180448") != 0) && (strcmp(oldAnnono.arr, "20180449") != 0) && //2018.12.19
                 (strcmp(oldAnnono.arr, "20180354") != 0) && // 2018.12.24 Lee Sangmoon
                 (strcmp(oldAnnono.arr, "20180456") != 0) && (strcmp(oldAnnono.arr, "20180457") != 0) && //2018.12.28
                 (strcmp(oldAnnono.arr, "20180076") != 0) && //2018.12.31 정문선
                 (strcmp(oldAnnono.arr, "20180468") != 0) && (strcmp(oldAnnono.arr, "20180469") != 0) && (strcmp(oldAnnono.arr, "20180470") != 0) && //2018.12.31
                 (strcmp(oldAnnono.arr, "20190001") != 0)    //2019.01.03 정문선
                )*/
            if ( (strcmp(strmailyn,"Y") == 0) || (strcmp(strmailyn,"Z") == 0) ) //2019.01. 메일발송여부 필드 기준으로 체크해 발송토록 개선. dsa2000
            {
                /* EXEC SQL EXECUTE IMMEDIATE :strSql; */ 

{
                struct sqlexd sqlstm;
                sqlstm.sqlvsn = 12;
                sqlstm.arrsiz = 97;
                sqlstm.sqladtp = &sqladt;
                sqlstm.sqltdsp = &sqltds;
                sqlstm.stmt = "";
                sqlstm.iters = (unsigned int  )1;
                sqlstm.offset = (unsigned int  )3777;
                sqlstm.cud = sqlcud0;
                sqlstm.sqlest = (unsigned char  *)&sqlca;
                sqlstm.sqlety = (unsigned short)4352;
                sqlstm.occurs = (unsigned int  )0;
                sqlstm.sqhstv[0] = (unsigned char  *)strSql;
                sqlstm.sqhstl[0] = (unsigned long )100000;
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
                    /* EXEC SQL CLOSE cur_mail; */ 

{
                    struct sqlexd sqlstm;
                    sqlstm.sqlvsn = 12;
                    sqlstm.arrsiz = 97;
                    sqlstm.sqladtp = &sqladt;
                    sqlstm.sqltdsp = &sqltds;
                    sqlstm.iters = (unsigned int  )1;
                    sqlstm.offset = (unsigned int  )3796;
                    sqlstm.cud = sqlcud0;
                    sqlstm.sqlest = (unsigned char  *)&sqlca;
                    sqlstm.sqlety = (unsigned short)4352;
                    sqlstm.occurs = (unsigned int  )0;
                    sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


                    sprintf(logText, "발령 메일발송2 실패!! 발령번호[%s]", oldAnnono.arr);
                    logWrite(logText);
                }
            }                
        }
            
    } //while(TRUE) end
} //void Ins_Notice() end


/* TABLE에 프로그램 실행 로그를 저장 */
void logWrite(char *strMessage)
{
if (DEBUG) printf("cnt[%d],emp[%s],Log=[%s]code=[%d],time[%s],prog[%s],len[%d]\n", logCount, jobEmpno, strMessage, SQLCODE, jobTime, jobProgram, strlen(strMessage));
    
    if (strcmp((char *)jobProgram, "") == 0) strcpy(jobProgram, "pic1065g");
        
    /* EXEC SQL INSERT INTO PYBATLOG (RUNDATE, PROGID, SEQNO, WRITEMAN, RESULT)
             VALUES (:jobTime, :jobProgram, :logCount, :jobEmpno, :strMessage); */ 

{
    struct sqlexd sqlstm;
    sqlstm.sqlvsn = 12;
    sqlstm.arrsiz = 97;
    sqlstm.sqladtp = &sqladt;
    sqlstm.sqltdsp = &sqltds;
    sqlstm.stmt = "insert into PYBATLOG (RUNDATE,PROGID,SEQNO,WRITEMAN,RESU\
LT) values (:b0,:b1,:b2,:b3,:b4)";
    sqlstm.iters = (unsigned int  )1;
    sqlstm.offset = (unsigned int  )3811;
    sqlstm.cud = sqlcud0;
    sqlstm.sqlest = (unsigned char  *)&sqlca;
    sqlstm.sqlety = (unsigned short)4352;
    sqlstm.occurs = (unsigned int  )0;
    sqlstm.sqhstv[0] = (unsigned char  *)jobTime;
    sqlstm.sqhstl[0] = (unsigned long )16;
    sqlstm.sqhsts[0] = (         int  )0;
    sqlstm.sqindv[0] = (         short *)0;
    sqlstm.sqinds[0] = (         int  )0;
    sqlstm.sqharm[0] = (unsigned long )0;
    sqlstm.sqadto[0] = (unsigned short )0;
    sqlstm.sqtdso[0] = (unsigned short )0;
    sqlstm.sqhstv[1] = (unsigned char  *)jobProgram;
    sqlstm.sqhstl[1] = (unsigned long )16;
    sqlstm.sqhsts[1] = (         int  )0;
    sqlstm.sqindv[1] = (         short *)0;
    sqlstm.sqinds[1] = (         int  )0;
    sqlstm.sqharm[1] = (unsigned long )0;
    sqlstm.sqadto[1] = (unsigned short )0;
    sqlstm.sqtdso[1] = (unsigned short )0;
    sqlstm.sqhstv[2] = (unsigned char  *)&logCount;
    sqlstm.sqhstl[2] = (unsigned long )sizeof(int);
    sqlstm.sqhsts[2] = (         int  )0;
    sqlstm.sqindv[2] = (         short *)0;
    sqlstm.sqinds[2] = (         int  )0;
    sqlstm.sqharm[2] = (unsigned long )0;
    sqlstm.sqadto[2] = (unsigned short )0;
    sqlstm.sqtdso[2] = (unsigned short )0;
    sqlstm.sqhstv[3] = (unsigned char  *)jobEmpno;
    sqlstm.sqhstl[3] = (unsigned long )5;
    sqlstm.sqhsts[3] = (         int  )0;
    sqlstm.sqindv[3] = (         short *)0;
    sqlstm.sqinds[3] = (         int  )0;
    sqlstm.sqharm[3] = (unsigned long )0;
    sqlstm.sqadto[3] = (unsigned short )0;
    sqlstm.sqtdso[3] = (unsigned short )0;
    sqlstm.sqhstv[4] = (unsigned char  *)strMessage;
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


    if (SQLCODE != SQL_OK) 
        printf("Log Write Fail!! [%d][%s]\n", SQLCODE, SQLERRM);
    else
        /* EXEC SQL COMMIT WORK; */ 

{
        struct sqlexd sqlstm;
        sqlstm.sqlvsn = 12;
        sqlstm.arrsiz = 97;
        sqlstm.sqladtp = &sqladt;
        sqlstm.sqltdsp = &sqltds;
        sqlstm.iters = (unsigned int  )1;
        sqlstm.offset = (unsigned int  )3846;
        sqlstm.cud = sqlcud0;
        sqlstm.sqlest = (unsigned char  *)&sqlca;
        sqlstm.sqlety = (unsigned short)4352;
        sqlstm.occurs = (unsigned int  )0;
        sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}



    logCount ++;
}

/* 안내성 실행 로그를 배열에 저장 */
void logSave(char *strMessage)
{   //if (DEBUG) printf("logSave cnt[%d],Log=[%s]\n", logSavecount, strMessage);
    // 각 발령건(사원)에 10건의 안내로그 생성 가능
    strcpy((char *)logSaveText[logSavecount++], strMessage);
}
