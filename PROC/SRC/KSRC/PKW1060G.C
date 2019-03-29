
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
    "pkw1060g.pc"
};


static unsigned int sqlctx = 155411;


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
   unsigned char  *sqhstv[13];
   unsigned long  sqhstl[13];
            int   sqhsts[13];
            short *sqindv[13];
            int   sqinds[13];
   unsigned long  sqharm[13];
   unsigned long  *sqharc[13];
   unsigned short  sqadto[13];
   unsigned short  sqtdso[13];
} sqlstm = {12,13};

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

 static char *sq0006 = 
"select bacode  from pkmbank where (mbacode=:b0 and bacode<>:b0) order by ba\
code            ";

 static char *sq0007 = 
"select empno ,paybank ,paybank paybank1 ,payacnt ,payacnt payacnt1 ,realpay\
 ,0 mcamt ,0 mc_real  from (select max(empno) empno ,paybank ,payacnt ,sum(NV\
L(realpay,0)) realpay  from pkmilpay where (paybank=:b0 and PAYDATE=:b1) grou\
p by paybank,payacnt) a  union all select empno ,paybank ,nvl(trim(paybank1),\
paybank) paybank1 ,payacnt ,nvl(trim(payacnt1),payacnt) payacnt1 ,nvl(realpay\
,0) realpay ,(((((nvl(taxpay1,0)+nvl(taxpay2,0))+nvl(taxpay3,0))+nvl(taxpay4,\
0))+nvl(taxpay5,0))+nvl(notaxpay4,0)) mcamt ,(nvl(realpay,0)-(((((nvl(taxpay1\
,0)+nvl(taxpay2,0))+nvl(taxpay3,0))+nvl(taxpay4,0))+nvl(taxpay5,0))+nvl(notax\
pay4,0))) mc_real  from pkzhphis where (((payyn='Y' and nvl(realpay,0)>0) and\
 paydate=:b1) and (Nvl(paybank,'ZZ')=:b0 or Nvl(paybank1,'ZZ')=:b0)) order by\
 empno            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,82,0,4,141,0,0,4,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
36,0,0,2,46,0,4,202,0,0,1,0,0,1,0,2,3,0,0,
55,0,0,3,184,0,3,218,0,0,13,13,0,1,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,3,0,0,1,3,0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,4,0,0,
122,0,0,4,0,0,29,232,0,0,0,0,0,1,0,
137,0,0,5,161,0,4,263,0,0,10,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
192,0,0,6,91,0,9,349,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
215,0,0,6,0,0,13,362,0,0,1,0,0,1,0,2,97,0,0,
234,0,0,6,0,0,15,367,0,0,0,0,0,1,0,
249,0,0,6,0,0,15,374,0,0,0,0,0,1,0,
264,0,0,7,786,0,9,444,0,0,5,5,0,1,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,
299,0,0,7,0,0,13,458,0,0,8,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,
0,2,3,0,0,2,3,0,0,2,3,0,0,
346,0,0,7,0,0,15,469,0,0,0,0,0,1,0,
361,0,0,7,0,0,15,476,0,0,0,0,0,1,0,
376,0,0,8,50,0,3,739,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,0,
1,97,0,0,1,97,0,0,
417,0,0,9,0,0,29,749,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKW1060G(일용직급여이체 파일생성)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여 이체
 Programmer     : 이랑교
 Version        : 1.00
 Date           : 1999.06.01

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1999.06.01         이랑교          최초개발본      설계명세서
  30.00       2000.01.27                dacom 상용mail 사용으로 인한 변경
  30.01       2004.02.24         강륜종          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드.  
  31.00       2004.05.04.        강륜종(das2000) def.h 파일 사용안하고 clidef.h 파일의 정보만 사용하기로 함.
                                                 MIS2 장비로 이전하면서 생성파일 경로 수정  
  33.00       2004.12.29      강륜종(dsa2000)    Rexec 대체서비스를 위한 수정작업.                                                      
============================================================================= */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
/*#include  "/hper/insa/edi/new/svccli/def.h"   dacom 상용mail 사용으로 인한 변경*/
#include "./../EDIsrc/include/clidef.h"  /* 2004.05.04. DSA2000*/

/* Dsa2000  추가.. 2004.02.24.*/
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"
#include "hinsa_macro.h"

#define  FAIL        -2
/* Dsa2000  추가..End.......*/

/*#define  DATA_DIR  "edi/bdata"*/
#define  MAXPERSON 5000

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

     char    paydate[8+1];
     char    bacode[4];      /*2017.10.12 jissi 2->3자리 코드로 변경*/
     char    bankcode[4];    /*2017.10.12 jissi 2->3자리 코드로 변경*/
     char    paybank[4];     /*2017.10.12 jissi 2->3자리 코드로 변경*/
     char    paybank1[4];    /*2017.10.12 jissi 2->3자리 코드로 변경*/
     char    empno[5];
     char    im_empno[2];
     char    jobkind[3];
     char    cocode[11];
     char    reqdate[9];
     char    deddate[9];
     char    transcode[5];
     char    vancode[7];
     char    raninfo[12];
     char    sysinfo1[5];
     char    payacnt[20];
     char    payacnt1[20];
     char    copasswd[9];
     char    filename[80];
     int     seq;
     int     realpay;     /* 실지급액*/
     int     mcamt ;      /* 식교비  */
     int     mc_real;     /* 식교비 제외한 실지급액 */
     int     RecordCnt = 0;
     double  PaySum = 0;
     double  im_PaySum = 0;
     double  dg_PaySum = 0;
     int     cRecordCnt = 0;
     double  cPaySum = 0;
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;

char  FullName[80];
char  cmdline[256];
char  AcntBuf[MAXPERSON][20];
int   BufCnt = 0;
int   id;
char   dir[80];

/* HEADER  01/27/2000 6:02오후 */
char  companyCode[2+1];
char  dataCode[3+1];
char  receiverId[8+1];

/*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
char  log_rundate[16]     = ""; 
char  log_progid[16]      = "";
char  log_writeman[5]     = "";
char  log_buff[100]       = "";
int   seqno               = 0; 

void WriteLog(char *message);
void main(argc,argv)
int argc;
char *argv[];
{        
     char FL_file[255];
     
     if  (argc != 7) {  /* /hper/insa/HINSA/proc/bin/Kbin/pkw1060g 05 1512051110.lst 20151204 D025 pkw1060g 20160203000000 */
          printf("[Usage] : pkw1060g 1.은행코드 2.파일명 3.지급일자     \n");
          printf("[Usage] :        4.작업자 5.프로그램ID  6.시작시간  \n");
          exit(1);
     }
           
     /*로그 디렉토리 생성 및 로그작업 */
     STRINIT(FL_file);
     strcpy(FL_file,"pkw1060g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
         
     /* Dsa2000  2004.02.24.  **********************************/  
     /*DB_connect(id,0); */  
     hinsa_log_print(0,"일용직급여이체 파일생성 프로그램 시작...[pkw1060g]");
     hinsa_db_connect();  /*DB Connect 실시..*/
     /* Dsa2000  수정 End......................................*/
     
     /*=== dsa2000 2004.12. Rexec대체 서비스를 위한 =============*/
     strcpy(log_writeman, argv[4]);
     strcpy(log_progid,   argv[5]);
     strcpy(log_rundate,  argv[6]);  
       
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
     /*========================================================*/
     
     memset(AcntBuf,'\0',sizeof(AcntBuf));
     strcpy(bacode,argv[1]);
     strcpy(paydate,argv[3]);
     memset(receiverId,'\0',sizeof(receiverId));
     memset(companyCode,'\0',sizeof(companyCode));
     memset(dataCode,'\0',sizeof(dataCode));
     
       
     /* EXEC SQL
     SELECT   RVCODE ,COGUCODE,INGUCODE
     INTO  :receiverId,:companyCode,:dataCode
     FROM   PKCLIENT
     WHERE  BACODE =:bacode; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select RVCODE ,COGUCODE ,INGUCODE into :b0,:b1,:b2  fro\
m PKCLIENT where BACODE=:b3";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)receiverId;
     sqlstm.sqhstl[0] = (unsigned long )9;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)companyCode;
     sqlstm.sqhstl[1] = (unsigned long )3;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)dataCode;
     sqlstm.sqhstl[2] = (unsigned long )4;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bacode;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          printf("[ERRCODE : %d] log 생성 Error  , bacode :%s\n",sqlca.sqlcode, bacode);
          unlink(FullName);
          sprintf(log_buff, "[ERRCODE : %d] log 생성 Error , bacode :%s\n",sqlca.sqlcode, bacode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          exit(1);
     }    
     
     /*receiverId = 'ZEBTKNH';   이체테스트시에 사용하는 외환은행 아이디 dsa2000 */
     /*strcpy(receiverId,"ZEBTKNH");*/
/*===========================================================================================*/  
     CheckFile(argv[2]);
     
     MakeFile();
     
     fclose(fp);
     
     MakeLog();
     
     printf("임원들 실지급총액 : %013.0f\n ",im_PaySum);
     printf("단기직 실지급총액 : %013.0f\n ",dg_PaySum);
     printf("총합계 실지급총액 : %013.0f\n ",PaySum);
     
     sprintf(log_buff, "임원들 실지급총액 : %013.0f\n ",im_PaySum);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); 
     
     sprintf(log_buff, "단기직 실지급총액 : %013.0f\n ",dg_PaySum);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff);
     
     sprintf(log_buff, "총합계 실지급총액 : %013.0f\n ",PaySum);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff);
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] =====");
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          error_quit("ERROR ====== [작업 실패] =====\n");
     }
     else
     {
          sprintf(log_buff, "OK ====== [단기계약직 급여계산 작업성공] =====\n");
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK ====== [단기계약직 급여계산 작업성공] =====\n");    
     }
  
}

MakeLog()
{

     /* EXEC SQL
     SELECT max(seqno)+1 INTO :seq
       FROM  pkmbalog; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (max(seqno)+1) into :b0  from pkmbalog ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )36;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&seq;
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 && sqlca.sqlcode != -1405)
     {
          printf("[ERRCODE : %d] 일련번호 생성 Error\n",sqlca.sqlcode);
          unlink(FullName);
          sprintf(log_buff, "[ERRCODE : %d] 일련번호 생성 Error\n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     if  (sqlca.sqlcode == -1405)
          seq = 1;
     
     /* EXEC SQL 
     INSERT INTO pkmbalog (seqno,mbacode,paydate,workdate,fname,mmovecnt,mmoveamt,
                           cmovecnt,cmoveamt,movecnt,moveamt)
     VALUES (:seq,:bacode,:deddate,:reqdate,:filename,:RecordCnt-2-:cRecordCnt,:PaySum-:cPaySum,
       :cRecordCnt,:cPaySum,:RecordCnt-2,:PaySum); */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into pkmbalog (seqno,mbacode,paydate,workdate,fn\
ame,mmovecnt,mmoveamt,cmovecnt,cmoveamt,movecnt,moveamt) values (:b0,:b1,:b2,\
:b3,:b4,((:b5-2)-:b6),(:b7-:b8),:b6,:b8,(:b5-2),:b7)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)&seq;
     sqlstm.sqhstl[0] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bacode;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)deddate;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)reqdate;
     sqlstm.sqhstl[3] = (unsigned long )9;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)filename;
     sqlstm.sqhstl[4] = (unsigned long )80;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)&RecordCnt;
     sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)&cRecordCnt;
     sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)&PaySum;
     sqlstm.sqhstl[7] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)&cPaySum;
     sqlstm.sqhstl[8] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)&cRecordCnt;
     sqlstm.sqhstl[9] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[9] = (         int  )0;
     sqlstm.sqindv[9] = (         short *)0;
     sqlstm.sqinds[9] = (         int  )0;
     sqlstm.sqharm[9] = (unsigned long )0;
     sqlstm.sqadto[9] = (unsigned short )0;
     sqlstm.sqtdso[9] = (unsigned short )0;
     sqlstm.sqhstv[10] = (unsigned char  *)&cPaySum;
     sqlstm.sqhstl[10] = (unsigned long )sizeof(double);
     sqlstm.sqhsts[10] = (         int  )0;
     sqlstm.sqindv[10] = (         short *)0;
     sqlstm.sqinds[10] = (         int  )0;
     sqlstm.sqharm[10] = (unsigned long )0;
     sqlstm.sqadto[10] = (unsigned short )0;
     sqlstm.sqtdso[10] = (unsigned short )0;
     sqlstm.sqhstv[11] = (unsigned char  *)&RecordCnt;
     sqlstm.sqhstl[11] = (unsigned long )sizeof(int);
     sqlstm.sqhsts[11] = (         int  )0;
     sqlstm.sqindv[11] = (         short *)0;
     sqlstm.sqinds[11] = (         int  )0;
     sqlstm.sqharm[11] = (unsigned long )0;
     sqlstm.sqadto[11] = (unsigned short )0;
     sqlstm.sqtdso[11] = (unsigned short )0;
     sqlstm.sqhstv[12] = (unsigned char  *)&PaySum;
     sqlstm.sqhstl[12] = (unsigned long )sizeof(double);
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


     
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          printf("[ERRCODE : %d] log 생성 Error2\n",sqlca.sqlcode);
          unlink(FullName);
          sprintf(log_buff, "[ERRCODE : %d] log 생성 Error2\n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          exit(1);
     }
     /* EXEC SQL commit; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )122;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


}

MakeFile()
{
     MakeTrans();
     MakeHeader();
     MakeBody();
     MakeTail();
}

/* =============================================================================================
01/27/2000 5:43오후
DACOM에서 사용하는 HEADER 
   ============================================================================================= */
MakeTrans()
{
     char  buffer[81];
     /*<<HEADER>>BK01495 HS300NN001BK00007 */  
     memset(buffer,'\0',sizeof(buffer));
     /*  sprintf(buffer,"<<HEADER>>%-8s%2s%3sNN001%-8s\r\n",LOGIN_ID,companyCode,dataCode,receiverId);  dsa2000  2004.05.04*/
     sprintf(buffer,"<<HEADER>>%-8s%2s%3sNN001%-8s\r\n",MAGICLINKID,companyCode,dataCode,receiverId);  
     fprintf(fp,"%s",buffer);  
     printf("=======================\n",buffer);
     printf("buffer : [%s] \n",buffer);  
}

MakeHeader()
{
     char  buffer[81];
     
     /* EXEC SQL 
     SELECT  jobkind,cocode,reqdate,deddate,transcode,vancode,raninfo,sysinfo,
             copasswd
       INTO  :jobkind, :cocode, :reqdate, :deddate, :transcode, :vancode, :raninfo,
             :sysinfo1, copasswd
       FROM  pkclient
      WHERE  bacode = :bacode; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select jobkind ,cocode ,reqdate ,deddate ,transcode ,va\
ncode ,raninfo ,sysinfo ,copasswd into :b0,:b1,:b2,:b3,:b4,:b5,:b6,:b7,:b8  f\
rom pkclient where bacode=:b9";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )137;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)jobkind;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)cocode;
     sqlstm.sqhstl[1] = (unsigned long )11;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)reqdate;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)deddate;
     sqlstm.sqhstl[3] = (unsigned long )9;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)transcode;
     sqlstm.sqhstl[4] = (unsigned long )5;
     sqlstm.sqhsts[4] = (         int  )0;
     sqlstm.sqindv[4] = (         short *)0;
     sqlstm.sqinds[4] = (         int  )0;
     sqlstm.sqharm[4] = (unsigned long )0;
     sqlstm.sqadto[4] = (unsigned short )0;
     sqlstm.sqtdso[4] = (unsigned short )0;
     sqlstm.sqhstv[5] = (unsigned char  *)vancode;
     sqlstm.sqhstl[5] = (unsigned long )7;
     sqlstm.sqhsts[5] = (         int  )0;
     sqlstm.sqindv[5] = (         short *)0;
     sqlstm.sqinds[5] = (         int  )0;
     sqlstm.sqharm[5] = (unsigned long )0;
     sqlstm.sqadto[5] = (unsigned short )0;
     sqlstm.sqtdso[5] = (unsigned short )0;
     sqlstm.sqhstv[6] = (unsigned char  *)raninfo;
     sqlstm.sqhstl[6] = (unsigned long )12;
     sqlstm.sqhsts[6] = (         int  )0;
     sqlstm.sqindv[6] = (         short *)0;
     sqlstm.sqinds[6] = (         int  )0;
     sqlstm.sqharm[6] = (unsigned long )0;
     sqlstm.sqadto[6] = (unsigned short )0;
     sqlstm.sqtdso[6] = (unsigned short )0;
     sqlstm.sqhstv[7] = (unsigned char  *)sysinfo1;
     sqlstm.sqhstl[7] = (unsigned long )5;
     sqlstm.sqhsts[7] = (         int  )0;
     sqlstm.sqindv[7] = (         short *)0;
     sqlstm.sqinds[7] = (         int  )0;
     sqlstm.sqharm[7] = (unsigned long )0;
     sqlstm.sqadto[7] = (unsigned short )0;
     sqlstm.sqtdso[7] = (unsigned short )0;
     sqlstm.sqhstv[8] = (unsigned char  *)copasswd;
     sqlstm.sqhstl[8] = (unsigned long )9;
     sqlstm.sqhsts[8] = (         int  )0;
     sqlstm.sqindv[8] = (         short *)0;
     sqlstm.sqinds[8] = (         int  )0;
     sqlstm.sqharm[8] = (unsigned long )0;
     sqlstm.sqadto[8] = (unsigned short )0;
     sqlstm.sqtdso[8] = (unsigned short )0;
     sqlstm.sqhstv[9] = (unsigned char  *)bacode;
     sqlstm.sqhstl[9] = (unsigned long )4;
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


          
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != -1405)
     {
          printf("[ERRCODE : %d] 표제부 생성 Error\n",sqlca.sqlcode);
          fclose(fp);
          unlink(FullName);
          sprintf(log_buff, "[ERRCODE : %d] 표제부 생성 Error\n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     memset(buffer,'\0',sizeof(buffer));
     sprintf(buffer,   "%1s" ,"S");                          /* 표제부      */
     sprintf(buffer+ 1,"%2s", jobkind);                      /* 화일구분    */ 
     /*  sprintf(buffer+ 1,"%2s", "C2");  */                 /* 화일구분    */ 
     sprintf(buffer+ 3,"%10s",cocode);                       /* 발신기관    */
     /*2017.10.17 jissi 2->3자리 코드로 변경하지 않고 기존 외환은행코드(05)로 보내라고 함(하나은행 이준희차장 331-3462)
     sprintf(buffer+13,"%2s", bacode);                          수신은행05  */      
     if  (strcmp(bacode,"081") == 0)
     {
          sprintf(buffer+13,"%2s", "05");                         /* 수신은행    */ 
          
          /* 2003.05.07.  강륜종 Dsa2000  : 급여이체 파일전송을 다른 날짜로 전송을 원할때.. 
           이체화면의 의뢰일자만 바꾸고 작업하면 파일생성시 전송/이체 일자가 바뀌도록.... */
          /*  sprintf(buffer+15,"%6s", paydate+2);                   전송일자    */
          /*  sprintf(buffer+21,"%6s", paydate+2);                   이체일자    */    
          sprintf(buffer+15,"%6s", reqdate+2);                    /* 전송일자    */
          sprintf(buffer+21,"%6s", deddate+2);                    /* 이체일자    */
                                                                                 
          sprintf(buffer+27,"%15s" ," ");                         /* 이체모계좌  */
          sprintf(buffer+42,"%8s" ,copasswd);                     /* 업체암호    */
          sprintf(buffer+50,"%1s" ,"1");                          /* 지급차수    */
          sprintf(buffer+51,"%1s" ,"2");                          /* 처리결과통보*/
          sprintf(buffer+52,"%1s" ,"1");                          /* 재처리구분  */
          sprintf(buffer+53,"%4s" ,transcode);                    /* 거래지점    */
          sprintf(buffer+57,"%6s" ,vancode);                      /* VAN 사업자  */
          sprintf(buffer+63,"%11s",raninfo);                      /* 업체임의사용*/
          sprintf(buffer+74,"%4s" , sysinfo1);                    /* 시스템이용  */
     }
     else
     {
          sprintf(buffer+13,"%3s", bacode);                       /* 수신은행    */ 
          
          /* 2003.05.07.  강륜종 Dsa2000  : 급여이체 파일전송을 다른 날짜로 전송을 원할때.. 
           이체화면의 의뢰일자만 바꾸고 작업하면 파일생성시 전송/이체 일자가 바뀌도록.... */
          /*  sprintf(buffer+16,"%6s", paydate+2);                   전송일자    */
          /*  sprintf(buffer+22,"%6s", paydate+2);                   이체일자    */    
          sprintf(buffer+16,"%6s", reqdate+2);                    /* 전송일자    */
          sprintf(buffer+22,"%6s", deddate+2);                    /* 이체일자    */
                                                                                 
          sprintf(buffer+28,"%15s" ," ");                         /* 이체모계좌  */
          sprintf(buffer+43,"%8s" ,copasswd);                     /* 업체암호    */
          sprintf(buffer+51,"%1s" ,"1");                          /* 지급차수    */
          sprintf(buffer+52,"%1s" ,"2");                          /* 처리결과통보*/
          sprintf(buffer+53,"%1s" ,"1");                          /* 재처리구분  */
          sprintf(buffer+54,"%4s" ,transcode);                    /* 거래지점    */
          sprintf(buffer+58,"%6s" ,vancode);                      /* VAN 사업자  */
          sprintf(buffer+64,"%11s",raninfo);                      /* 업체임의사용*/
          sprintf(buffer+75,"%4s" , sysinfo1);                    /* 시스템이용  */
     }
     fprintf(fp,"%s\r\n",buffer);
     RecordCnt++;
    
}

MakeBody()
{

     /* 모계좌에 해당하는 자료 생성 */
     strcpy(bankcode,bacode);
     SetBody();
     
     /* 자계좌에 해당하는 자료 생성 */
     /* EXEC SQL DECLARE c2 CURSOR FOR 
     SELECT  bacode
       FROM  pkmbank
      WHERE  mbacode = :bacode and bacode <> :bacode
      ORDER  BY bacode; */ 

     
     /* EXEC SQL OPEN c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0006;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )192;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bacode;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)bacode;
     sqlstm.sqhstl[1] = (unsigned long )4;
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
          printf("[ERRCODE : %d] 타행은행 read 에러\n",sqlca.sqlcode);
          fclose(fp);
          unlink(FullName);
          sprintf(log_buff, "[ERRCODE : %d] 타행은행 read 에러\n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     while(1)
     {
          /* EXEC SQL FETCH c2 
          INTO :bankcode; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 13;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )215;
          sqlstm.selerr = (unsigned short)1;
          sqlstm.cud = sqlcud0;
          sqlstm.sqlest = (unsigned char  *)&sqlca;
          sqlstm.sqlety = (unsigned short)4352;
          sqlstm.occurs = (unsigned int  )0;
          sqlstm.sqfoff = (         int )0;
          sqlstm.sqfmod = (unsigned int )2;
          sqlstm.sqhstv[0] = (unsigned char  *)bankcode;
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


          
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 13;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )234;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          
          if  (sqlca.sqlcode != 0)
          {
          
               /* EXEC SQL CLOSE c2; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 13;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )249;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               printf("[ERRCODE : %d] 타행 에러\n",sqlca.sqlcode);
               fclose(fp);
               unlink(FullName);
               sprintf(log_buff, "[ERRCODE : %d] 타행 에러\n",sqlca.sqlcode);
               Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
               exit(1);
          }
          SetBody();
     }
}

SetBody()
{
     /* char buffer[81]; 이체계좌별로  */
     /* 2016.02.03 jissi 단기계약직에 임원 자료 같이 말아져서 나갈 수 있도록 변경 */
     /* EXEC SQL DECLARE c1 CURSOR FOR
     SELECT empno, paybank, paybank paybank1,
            payacnt, payacnt payacnt1, realpay, 0 mcamt, 0 mc_real
       FROM
           (SELECT  MAX(empno) empno, paybank,
                   payacnt,SUM(NVL(realpay,0)) realpay
             FROM  pkmilpay
            WHERE  paybank = :bankcode
              AND  PAYDATE = :paydate
              /o2016.03.07 jissi HR팀이지연 요청 20160304일자 3889사번 급여자료 한건만 다시 생성 전송
              AND  PAYDATE = '20160304'
              AND  EMPNO   = '3889'o/
            GROUP  BY paybank,payacnt) a
     union all  
     SELECT  empno, paybank, nvl(trim(paybank1),paybank) paybank1, 
             payacnt, nvl(trim(payacnt1),payacnt) payacnt1, nvl(realpay,0) realpay,
             /o 2015.02.12 jissi 손필영 매니저 요청 계좌분리(기타과세1) 
             0 mcamt,                    
             nvl(realpay,0) mc_real
             o/
             /o 2015.11.19 jissi HR팀 김보배 요청 분리계좌에 급여항목추가(기타과세1~6) SR-1511-0796  
             nvl(taxpay1,0) mcamt,                    
             nvl(realpay,0) - nvl(taxpay1,0) mc_real
             o/
             /o 2016.02.23 jissi HR팀 김보배 요청 분리계좌에 급여항목 삭제(기타과세6) 및 추가(기타비과세4) SR-1602-0879
             nvl(taxpay1,0)+nvl(taxpay2,0)+nvl(taxpay3,0)+nvl(taxpay4,0)+nvl(taxpay5,0)+nvl(taxpay6,0) mcamt,                    
             nvl(realpay,0)-(nvl(taxpay1,0)+nvl(taxpay2,0)+nvl(taxpay3,0)+nvl(taxpay4,0)+nvl(taxpay5,0)+nvl(taxpay6,0)) mc_real
             o/
             nvl(taxpay1,0)+nvl(taxpay2,0)+nvl(taxpay3,0)+nvl(taxpay4,0)+nvl(taxpay5,0)+nvl(notaxpay4,0) mcamt,                    
             nvl(realpay,0)-(nvl(taxpay1,0)+nvl(taxpay2,0)+nvl(taxpay3,0)+nvl(taxpay4,0)+nvl(taxpay5,0)+nvl(notaxpay4,0)) mc_real
       FROM  pkzhphis
      where  payyn    = 'Y' and nvl(realpay, 0) > 0
	      and  paydate  = :paydate
        and (Nvl(paybank,'ZZ')  = :bankcode or Nvl(paybank1,'ZZ')  = :bankcode)	   
      ORDER BY empno; */ 

        
     /* 강륜종 Dsa2000  : 급여이체 파일전송을 다른 날짜로 전송을 원할때..
      :paydate  ==> '20030506' 으로 수정    
     EXEC SQL DECLARE c1 CURSOR FOR
     SELECT  MAX(empno),paybank,
             payacnt,SUM(NVL(realpay,0))
       FROM  pkmilpay
      WHERE  paybank = :bankcode
        AND  PAYDATE = :paydate
      GROUP  BY paybank,payacnt;
     */
     /*
     EXEC SQL DECLARE c1 CURSOR FOR
     SELECT  empno, paybank,
                   payacnt,realpay
     FROM  pkmilpay
     WHERE  paybank  = :bankcode
     ORDER BY empno;
     */
     /* EXEC SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0007;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )264;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)bankcode;
     sqlstm.sqhstl[0] = (unsigned long )4;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)paydate;
     sqlstm.sqhstl[1] = (unsigned long )9;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)paydate;
     sqlstm.sqhstl[2] = (unsigned long )9;
     sqlstm.sqhsts[2] = (         int  )0;
     sqlstm.sqindv[2] = (         short *)0;
     sqlstm.sqinds[2] = (         int  )0;
     sqlstm.sqharm[2] = (unsigned long )0;
     sqlstm.sqadto[2] = (unsigned short )0;
     sqlstm.sqtdso[2] = (unsigned short )0;
     sqlstm.sqhstv[3] = (unsigned char  *)bankcode;
     sqlstm.sqhstl[3] = (unsigned long )4;
     sqlstm.sqhsts[3] = (         int  )0;
     sqlstm.sqindv[3] = (         short *)0;
     sqlstm.sqinds[3] = (         int  )0;
     sqlstm.sqharm[3] = (unsigned long )0;
     sqlstm.sqadto[3] = (unsigned short )0;
     sqlstm.sqtdso[3] = (unsigned short )0;
     sqlstm.sqhstv[4] = (unsigned char  *)bankcode;
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


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
          printf("[ERRCODE : %d] 이체금액 setting 에러\n",sqlca.sqlcode);
          fclose(fp);
          unlink(FullName);
          sprintf(log_buff, "[ERRCODE : %d] 이체금액 setting 에러\n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          exit(1);
     }
   
     while(1)
     {
          InitVal();
          /* EXEC SQL FETCH c1
          INTO :empno, :paybank, :paybank1,
                       :payacnt, :payacnt1,:realpay, :mcamt, :mc_real; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 13;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )299;
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
          sqlstm.sqhstv[1] = (unsigned char  *)paybank;
          sqlstm.sqhstl[1] = (unsigned long )4;
          sqlstm.sqhsts[1] = (         int  )0;
          sqlstm.sqindv[1] = (         short *)0;
          sqlstm.sqinds[1] = (         int  )0;
          sqlstm.sqharm[1] = (unsigned long )0;
          sqlstm.sqadto[1] = (unsigned short )0;
          sqlstm.sqtdso[1] = (unsigned short )0;
          sqlstm.sqhstv[2] = (unsigned char  *)paybank1;
          sqlstm.sqhstl[2] = (unsigned long )4;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)payacnt;
          sqlstm.sqhstl[3] = (unsigned long )20;
          sqlstm.sqhsts[3] = (         int  )0;
          sqlstm.sqindv[3] = (         short *)0;
          sqlstm.sqinds[3] = (         int  )0;
          sqlstm.sqharm[3] = (unsigned long )0;
          sqlstm.sqadto[3] = (unsigned short )0;
          sqlstm.sqtdso[3] = (unsigned short )0;
          sqlstm.sqhstv[4] = (unsigned char  *)payacnt1;
          sqlstm.sqhstl[4] = (unsigned long )20;
          sqlstm.sqhsts[4] = (         int  )0;
          sqlstm.sqindv[4] = (         short *)0;
          sqlstm.sqinds[4] = (         int  )0;
          sqlstm.sqharm[4] = (unsigned long )0;
          sqlstm.sqadto[4] = (unsigned short )0;
          sqlstm.sqtdso[4] = (unsigned short )0;
          sqlstm.sqhstv[5] = (unsigned char  *)&realpay;
          sqlstm.sqhstl[5] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[5] = (         int  )0;
          sqlstm.sqindv[5] = (         short *)0;
          sqlstm.sqinds[5] = (         int  )0;
          sqlstm.sqharm[5] = (unsigned long )0;
          sqlstm.sqadto[5] = (unsigned short )0;
          sqlstm.sqtdso[5] = (unsigned short )0;
          sqlstm.sqhstv[6] = (unsigned char  *)&mcamt;
          sqlstm.sqhstl[6] = (unsigned long )sizeof(int);
          sqlstm.sqhsts[6] = (         int  )0;
          sqlstm.sqindv[6] = (         short *)0;
          sqlstm.sqinds[6] = (         int  )0;
          sqlstm.sqharm[6] = (unsigned long )0;
          sqlstm.sqadto[6] = (unsigned short )0;
          sqlstm.sqtdso[6] = (unsigned short )0;
          sqlstm.sqhstv[7] = (unsigned char  *)&mc_real;
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


          /* 2016.02.03 jissi 단기계약직에 임원 자료 같이 말아져서 나갈 수 있도록 변경 
          INTO :empno, :paybank,
               :payacnt, realpay;*/
          /* **********
          printf("leerk empno%s sqlcode =>%d 읽기 에러\n",empno,sqlca.sqlcode);
          * ********** */
          if  (sqlca.sqlcode == 1403)
          {
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 13;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )346;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               return;
          }
          
          if  (sqlca.sqlcode != 0)
          {
          
               /* EXEC SQL CLOSE c1; */ 

{
               struct sqlexd sqlstm;
               sqlstm.sqlvsn = 12;
               sqlstm.arrsiz = 13;
               sqlstm.sqladtp = &sqladt;
               sqlstm.sqltdsp = &sqltds;
               sqlstm.iters = (unsigned int  )1;
               sqlstm.offset = (unsigned int  )361;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               printf("[ERRCODE : %d] 이체금액 읽기 에러\n",sqlca.sqlcode);
               fclose(fp);
               unlink(FullName);
               sprintf(log_buff, "[ERRCODE : %d] 이체금액 읽기 에러\n",sqlca.sqlcode);
               Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
               exit(1);
          }
          /* 은행이 같을때 */ 
          if (strcmp(bankcode, paybank)  == 0 && 
              strcmp(bankcode, paybank1) == 0 )
          {
               if  (strcmp(payacnt, payacnt1) != 0)
               {
                    realpay = mc_real;   /* 식교비제외급여 */
                    SetVal();
                 
                    if  (mcamt != 0)
                    { 
                          strcpy(payacnt,payacnt1);
                          realpay = mcamt;    /* 식교비  */
                          SetVal();
                    } 
               }
               else
                    SetVal();
          }
          else if (strcmp(bankcode, paybank) ==0) 
          {
               realpay = mc_real;
               SetVal();
          }
          else if (strcmp(bankcode, paybank1) == 0 &&
                  (mcamt !=0 ))  /*leerk 98 01 07*/
          {
               strcpy(payacnt,payacnt1);
               realpay = mcamt;
               SetVal();
          }
     }
}

InitVal()
{
     memset(payacnt ,'\0',sizeof(payacnt));
     memset(paybank ,'\0',sizeof(paybank));
     realpay = 0;
}

SetVal()
{
     char buffer[81]; 
     /*2017.10.12 jissi 2->3자리 코드로 변경
     sprintf(buffer,   "%s", "D");
     sprintf(buffer+1, "%-2s", bankcode);
     StripBar();
     sprintf(buffer+3, "%-15s",payacnt);
     strcpy(AcntBuf[BufCnt],payacnt);
     sprintf(buffer+18,"%s","31");
     sprintf(buffer+20,"%011d",realpay);
     PaySum += realpay;
     sprintf(im_empno,"%.1s",empno);  
     if  (strcmp(im_empno ,"M" )==0)  im_PaySum += realpay;
     else                             dg_PaySum += realpay; 
     sprintf(buffer+31,"%-2s", deddate+6);
     sprintf(buffer+33,"%s", " ");
     sprintf(buffer+34,"%4s", " ");
     sprintf(buffer+38,"%10s"," ");
     sprintf(buffer+48,"%24s"," ");
     sprintf(buffer+72,"%4s"," ");
     sprintf(buffer+76,"%2s"," ");
     buffer[78] = '\0';
     */

     sprintf(buffer,   "%s",  "D");                          /*식별코드'D'  1자리*/  
     sprintf(buffer+1, "%-3s", bankcode);                    /*신은행코드   3자리*/  
     StripBar();                                                                     
     sprintf(buffer+4, "%-15s",payacnt);                     /*계좌번호    15자리*/  
     strcpy(AcntBuf[BufCnt],payacnt);                                                
     sprintf(buffer+19,"%s", "31");                          /*자금구분'31' 2자리*/  
     sprintf(buffer+21,"%011d",realpay);                     /*이체금액    11자리*/  
     PaySum += realpay;
     sprintf(im_empno,"%.1s",empno);  
     if  (strcmp(im_empno ,"M" )==0)  im_PaySum += realpay;
     else                             dg_PaySum += realpay; 
     sprintf(buffer+32,"%s", " ");                           /*처리상태     1자리*/
     sprintf(buffer+33,"%4s", " ");                          /*불능코드     4자리*/
     sprintf(buffer+37,"%11s"," ");                          /*미처리금액  11자리*/
     sprintf(buffer+48,"%15s"," ");                          /*사용자정의1 15자리*/
     sprintf(buffer+63,"%15s"," ");                          /*사용자정의2 15자리*/
     sprintf(buffer+78,"%2s"," ");                           /*HEX0D0A      2자리*/
     buffer[80] = '\0';
     
     fprintf(fp,"%s\r\n",buffer);
     RecordCnt++;
     BufCnt++;
     
     /* 자계좌에 해당건수 ,금액구하기 */
     if  (strcmp(bacode,bankcode) != 0)
     {
          cRecordCnt++;
          cPaySum += realpay;
     }
}  

StripBar()
{
     char  TmpStr[81];
     int i = 0;
     int j = 0;
     
     memset(TmpStr,'\0',sizeof(TmpStr));  
     strcpy(TmpStr,payacnt);
     while(TmpStr[j])
     {
          if  (TmpStr[j] != '-')
          {
               payacnt[i] = TmpStr[j];
               i++;
          }
          j++;
     }
     payacnt[i] = '\0';
}

MakeTail()
{
     char buffer[81];
     
     memset(buffer,'\0',sizeof(buffer));
     sprintf(buffer,    "%s", "E");                          /* 식별코드    */
     RecordCnt++;
     sprintf(buffer+1,  "%07d",RecordCnt);                   /* Record 수   */  
     sprintf(buffer+8,  "%07d",RecordCnt-2);                 /* 의뢰건수    */
     sprintf(buffer+15, "%013.0f",PaySum);                   /* 의뢰금액    */  
     sprintf(buffer+28, "%07d", 0);                          /* 정상처리건수*/
     sprintf(buffer+35, "%013.0f",0.0);                      /* 정상처리금액*/
     sprintf(buffer+48, "%07d",0);                           /* 미처리금액  */
     sprintf(buffer+55, "%013.0f",0.0);                      /* 미처리금액  */
     /*if  (strcmp(bacode,"05") == 0) 2017.10.12 jissi 2->3자리 코드로 변경 */
     if  ((strcmp(bacode,"05") == 0) || (strcmp(bacode,"005") == 0) || (strcmp(bacode,"081") == 0))
     {
          sprintf(buffer+68, "%04d",MakeBokjiho());          /* 복기호부호  */
          sprintf(buffer+72, "%4s"," ");    
     
     }
     else if (strcmp(bacode,"24") == 0)
     {
          sprintf(buffer+68, "%04d",MakeBokjiho());          /* 복기호부호  */
          sprintf(buffer+72, "%4s"," ");    
     
     }
     else
          sprintf(buffer+68, "%08d",MakeBokjiho());         /* 복기호부호  */
     sprintf(buffer+76, "%2s"," ");                         /* 업체임의정보*/
     buffer[78] = '\0';
     fprintf(fp,"%s\r\n",buffer);
}

MakeBokjiho()
{
     int i;
     double a = 0;
     double b = 0;
     double c = 0;
     double d = 0;
     double A = 0;
     double B = 0;
     double C = 0;
     double D = 0;
     double D1 = 0;
     double X = 0;
     double t = 0;
     int    result = 0;
     char  tmp[80];
     /*
       FILE *ffp;
     
     ffp = fopen("LeeTst","w");
     */
   
     /*if  (strcmp(bacode,"05") == 0) 2017.10.12 jissi 2->3자리 코드로 변경 */
     if  ((strcmp(bacode,"05") == 0) || (strcmp(bacode,"005") == 0) || (strcmp(bacode,"081") == 0))
     {
          for (i=0; i<BufCnt; ++i)
          {  
               memset(tmp,'\0',sizeof(tmp));  
               sprintf(tmp,"%.3s",AcntBuf[i]);
               a += atof(tmp);
               
               memset(tmp,'\0',sizeof(tmp));  
               sprintf(tmp,"%.2s",&(AcntBuf[i][3]));
               t = atof(tmp);
               if ((t < 10) && (tmp[0] != '0'))
                 t = t*10;
               b += t;
               
               memset(tmp,'\0',sizeof(tmp));  
               sprintf(tmp,"%.5s",&(AcntBuf[i][5]));
               c += atof(tmp);
               
               memset(tmp,'\0',sizeof(tmp));  
               sprintf(tmp,"%.1s",&(AcntBuf[i][10]));
               d += atof(tmp);
   /*
   fprintf(ffp,"%5d : %15s %10.0f %10.0f\n",i+1,AcntBuf[i],t,a+b+c+d);
   */
          }
          A = a + b + c +d;
   /*
   fclose(ffp);
   */
   
               B = RecordCnt -2;
               C = PaySum;
               D = atof(deddate);
               D1= atoi(deddate+4);
               X = (A+B+C+D) / D1;
               result = ((int)X) % 10000;     
     }
     else if (strcmp(bacode,"24") == 0)
     {
          result = 1111;
     }
     return result;
}

CheckFile(fname)
char *fname;
{
     char *DATA_DIR;  
     DATA_DIR = hinsa_home();
     strcat(DATA_DIR,"/data/EDIdata");
     
     memset(FullName,'\0',sizeof(FullName));
     sprintf(FullName,"%s/%s",DATA_DIR,fname);
     
     strcpy(filename,fname);
     
     fp = fopen(FullName,"r");
     if  (fp  != NULL)
     {
          printf("[ERRCODE : %d] 파일이 이미 존재합니다. 다른이름을 지정하십시요\n",sqlca.sqlcode);
          fclose(fp);
          sprintf(log_buff, "[ERRCODE : %d] 파일이 이미 존재합니다. 다른이름을 지정하십시요\n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
          exit(1);
     }
     
     fp = fopen(FullName,"w");
     if  (fp == NULL)
     {
          printf("[ERRCODE : %d] 파일을 생성할수 없습니다\n",sqlca.sqlcode);
          fclose(fp);
          sprintf(log_buff, "[ERRCODE : %d] 파일이 이미 존재합니다. 다른이름을 지정하십시요\n",sqlca.sqlcode);
          Write_batlog(seqno++, log_buff);   /*dsa2000 Rexec 대체*/
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
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )376;
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
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )417;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}

  
}

void WriteLog(char *message)
{
     fprintf(fp, "%s", message);
}

/*
hinsacc pkw1060g
mv pkw1060g ~/HINSA/proc/bin/Kbin
/hper/insa/HINSA/proc/bin/Kbin/pkw1060g 05 1512051112.lst 20151204 D025 pkw1060g 20160203000000
*/