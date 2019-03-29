
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
    "pkc4050g.pc"
};


static unsigned int sqlctx = 150643;


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

 static char *sq0008 = 
"select bacode  from pkmbank where (mbacode=:b0 and bacode<>:b0) order by ba\
code            ";

 static char *sq0009 = 
"select empno ,paybank ,payacnt ,realpay  from pkhindtra where ((empno not l\
ike 'Y%' and reqdate=:b0) and moveyn='N') order by empno            ";

typedef struct { unsigned short len; unsigned char arr[1]; } VARCHAR;
typedef struct { unsigned short len; unsigned char arr[1]; } varchar;

/* CUD (Compilation Unit Data) Array */
static short sqlcud0[] =
{12,4274,840,0,0,
5,0,0,1,82,0,4,133,0,0,4,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
36,0,0,2,93,0,5,170,0,0,1,1,0,1,0,1,97,0,0,
55,0,0,3,63,0,4,178,0,0,1,0,0,1,0,2,97,0,0,
74,0,0,4,46,0,4,205,0,0,1,0,0,1,0,2,3,0,0,
93,0,0,5,184,0,3,221,0,0,13,13,0,1,0,1,3,0,0,1,97,0,0,1,97,0,0,1,97,0,0,1,97,0,
0,1,3,0,0,1,3,0,0,1,4,0,0,1,4,0,0,1,3,0,0,1,4,0,0,1,3,0,0,1,4,0,0,
160,0,0,6,0,0,29,235,0,0,0,0,0,1,0,
175,0,0,7,161,0,4,266,0,0,10,1,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,
0,0,2,97,0,0,2,97,0,0,2,97,0,0,2,97,0,0,1,97,0,0,
230,0,0,8,91,0,9,335,0,0,2,2,0,1,0,1,97,0,0,1,97,0,0,
253,0,0,8,0,0,13,348,0,0,1,0,0,1,0,2,97,0,0,
272,0,0,8,0,0,15,353,0,0,0,0,0,1,0,
287,0,0,8,0,0,15,360,0,0,0,0,0,1,0,
302,0,0,9,143,0,9,385,0,0,1,1,0,1,0,1,97,0,0,
321,0,0,9,0,0,13,399,0,0,4,0,0,1,0,2,97,0,0,2,97,0,0,2,97,0,0,2,3,0,0,
352,0,0,9,0,0,15,406,0,0,0,0,0,1,0,
367,0,0,9,0,0,15,413,0,0,0,0,0,1,0,
382,0,0,10,50,0,3,658,0,0,5,5,0,2,6,76,79,71,95,68,66,1,97,0,0,1,97,0,0,1,3,0,
0,1,97,0,0,1,97,0,0,
423,0,0,11,0,0,29,668,0,0,0,0,0,2,6,76,79,71,95,68,66,
};


/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKC4040G(급여이체 파일생성)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여 이체
 Programmer     : 이인환
 Version        : 1.00
 Date           : 1997.07.14

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.07.14         이인환          최초개발본      설계명세서
   30.00      1999.12.30   이랑교          dacom 상용mail 사용으로 인한 변경
   30.01      2004.02.24         강륜종          Oracle8i 업그레이드에 의한 관련 라이브러리 업그레이드. 
   31.00      2004.05.04.        강륜종(das2000) def.h 파일 사용안하고 clidef.h 파일의 정보만 사용하기로 함.
                                                 MIS2 장비로 이전하면서 생성파일 경로 수정
   32.00      2004.11.        강륜종(dsa2000)  Rexec대체 서비스를 위한 수정작업.   
============================================================================= */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include "hinsa_macro.h"
#include "hinsa_string.h"
#include "hinsa_date.h"
#include "hinsa_log.h"
#include "hinsa_oracle.h"
#include "hinsa_common.h"
/*#include "def.h"   dsa2000 2004.05.04.*/
#include "./../EDIsrc/include/clidef.h"   /* MIS2  */

#define  MAXPERSON 5000
#define FAILURE   -1

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

char    bacode[4];    /*2017.10.12 jissi 2->3자리 코드로 변경*/
char    bankcode[4];  /*2017.10.12 jissi 2->3자리 코드로 변경*/ 
char    paybank[4];   /*2017.10.12 jissi 2->3자리 코드로 변경*/
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
char    copasswd[9];
char    filename[80];
int     seq;
int     realpay;     /* 실지급액*/
int     RecordCnt = 0;
double  PaySum = 0;
double  im_PaySum = 0;
double  jg_PaySum = 0;
int     cRecordCnt = 0;
double  cPaySum = 0;
/* EXEC SQL END   DECLARE SECTION; */ 


FILE *fp = stdout;

char   FullName[80];
char   cmdline[256];
char   AcntBuf[MAXPERSON][20];
int    BufCnt = 0;
int    id;
char   dir[80];

/* HEADER  99-12-30 5:52오후 */
char   companyCode[2+1];
char   dataCode[3+1];
char   receiverId[8+1];

/*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/
char   log_rundate[16]     = ""; 
char   log_progid[16]      = "";
char   log_writeman[5]     = "";
char   log_buff[100]       = "";
int    seqno = 0; 

void WriteLog(char *message);
void main(argc,argv)
int  argc;
char *argv[];
{             
     char FL_file[255];
     char curdatetime[15];
     
     if  (argc != 6) {  /* /hper8/HINSA/proc/bin/Kbin/pkc4050g 05 0409051163.lst D006 pkc4050g 2004110500000 */
          printf("[Usage] : pkc4050g 1.은행코드(05) 2.파일명 3.작업자 4.프로그램ID 5.시작시간 \n");
          exit(1);
     }         
     
     STRINIT(FL_file);
     strcpy(FL_file,"pkc4050g");
     
     hinsa_get_filename(1, FL_file);
     if  (hinsa_log_open(FL_file) == FAILURE)
     {
          hinsa_exit(0,"로그파일 생성에러로 인한 프로그램 종료...");
          return;
     }
     
     /* Dsa2000  2004.02.24.  **********************************/
         hinsa_log_print(0,"급여이체 파일생성 프로그램 시작...");        
         hinsa_db_connect();  /*DB Connect 실시..*/
     /*dsa2000  수정..End......................................*/
     
     /*=== dsa2000 2004.11. Rexec대체 서비스를 위한 =============*/

     strcpy(log_writeman, argv[3]);
     strcpy(log_progid,   argv[4]);
     strcpy(log_rundate,  argv[5]);  
      
     /* EXEC SQL DECLARE log_db DATABASE; */ 
    
     hinsa_log_db_connect();
  /*========================================================*/
  
/* ============================================================================================= *
   30.00      1999.12.30   이랑교          dacom 상용mail 사용으로 인한 변경
===================================================================================================== */
     memset(companyCode,'\0',sizeof(companyCode));
     memset(dataCode,'\0',sizeof(dataCode));
     memset(receiverId,'\0',sizeof(receiverId));
     
     strcpy(bacode,argv[1]);
     CheckFile(argv[2]);
        
     /* EXEC SQL
     SELECT   COGUCODE, INGUCODE, RVCODE
     INTO  :companyCode, :dataCode, :receiverId
     FROM   PKCLIENT
     WHERE  BACODE =:bacode; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select COGUCODE ,INGUCODE ,RVCODE into :b0,:b1,:b2  fro\
m PKCLIENT where BACODE=:b3";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )5;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)companyCode;
     sqlstm.sqhstl[0] = (unsigned long )3;
     sqlstm.sqhsts[0] = (         int  )0;
     sqlstm.sqindv[0] = (         short *)0;
     sqlstm.sqinds[0] = (         int  )0;
     sqlstm.sqharm[0] = (unsigned long )0;
     sqlstm.sqadto[0] = (unsigned short )0;
     sqlstm.sqtdso[0] = (unsigned short )0;
     sqlstm.sqhstv[1] = (unsigned char  *)dataCode;
     sqlstm.sqhstl[1] = (unsigned long )4;
     sqlstm.sqhsts[1] = (         int  )0;
     sqlstm.sqindv[1] = (         short *)0;
     sqlstm.sqinds[1] = (         int  )0;
     sqlstm.sqharm[1] = (unsigned long )0;
     sqlstm.sqadto[1] = (unsigned short )0;
     sqlstm.sqtdso[1] = (unsigned short )0;
     sqlstm.sqhstv[2] = (unsigned char  *)receiverId;
     sqlstm.sqhstl[2] = (unsigned long )9;
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


     
     /*receiverId = 'ZEBTKNH';     이체테스트시에 사용하는 외환은행 아이디  */
     /*strcpy(receiverId,"ZEBTKNH");*/
     printf("[BACODE : %s]\n",bacode);
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          printf("[ERRCODE : %d] log 생성 Error\n",sqlca.sqlcode);
          sprintf(log_buff, "[ERRCODE : %d] log 생성 Error\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);                                    /*dsa2000 Rexec 대체*/
          unlink(FullName);
          exit(1);
     }
        
     MakeFile();
     
     fclose(fp);
     
     MakeLog();
     
     sprintf(log_buff, "임원들 실지급총액 : %013.0f\n ",im_PaySum);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff); 
     
     sprintf(log_buff, "정규직 실지급총액 : %013.0f\n ",jg_PaySum);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff);
     
     sprintf(log_buff, "총합계 실지급총액 : %013.0f\n ",PaySum);
     WriteLog(log_buff);
     Write_batlog(seqno++, log_buff);

     /*생성완료 후 대상자료 생성여부 Setting */
     /* EXEC SQL  
     UPDATE pkhindtra
        SET moveyn = 'Y'
     where  empno not like 'Y%'             
       and  reqdate  = :reqdate
       and  moveyn   = 'N'; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "update pkhindtra  set moveyn='Y' where ((empno not like\
 'Y%' and reqdate=:b0) and moveyn='N')";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )36;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)reqdate;
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


     
     /*** 종료시간 Print dsa2000 Add ***************************/
     /* EXEC SQL  
     SELECT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')
       INTO :curdatetime
       FROM DUAL; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') into :b0  fr\
om DUAL ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )55;
     sqlstm.selerr = (unsigned short)0;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqhstv[0] = (unsigned char  *)curdatetime;
     sqlstm.sqhstl[0] = (unsigned long )15;
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
     
     /* Dsa2000  2004.02.25.  hinsa_exit()에서 DB Commit & DB접속종료함.*/
     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403)
     {
          sprintf(log_buff, "ERROR ====== [작업 실패] ====="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);                    /*dsa2000 Rexec 대체*/
          error_quit("ERROR [작업 실패]\n");
     }
     else
     {
          sprintf(log_buff, "OK ====== [급여이체파일 생성 완료] ====="); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);                  /*dsa2000 Rexec 대체*/
          hinsa_exit(0,"OK [급여이체파일 생성 완료].\n");   
     }
}

MakeLog()
{
     /* EXEC SQL
     SELECT  max(seqno)+1 INTO :seq
       FROM  pkmbalog; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 4;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "select (max(seqno)+1) into :b0  from pkmbalog ";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )74;
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
          sprintf(log_buff, "[ERRCODE : %d] 일련번호 생성 Error\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          unlink(FullName);
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
     sqlstm.offset = (unsigned int  )93;
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
          printf("[ERRCODE : %d] log 생성 Error\n",sqlca.sqlcode);
          sprintf(log_buff, "[ERRCODE : %d] log 생성 Error\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          unlink(FullName);
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
     sqlstm.offset = (unsigned int  )160;
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

/* ============================================================================================= */
MakeTrans()
{

     char  buffer[81];    /*<<HEADER>>BK01495             HR999NN001BK00007 */  
     memset(buffer,'\0',sizeof(buffer));                       /*HR          999      BK00007   */
     /*sprintf(buffer,"<<HEADER>>%-8s%2s%3sNN001%-8s\r\n",LOGIN_ID,companyCode,dataCode,receiverId);  dsa2000  2004.05.04*/
     sprintf(buffer,"<<HEADER>>%-8s%2s%3sNN001%-8s\r\n",MAGICLINKID,companyCode,dataCode,receiverId);
     fprintf(fp,"%s",buffer);  
     printf("======================================\n",buffer);
     printf("%s\n",buffer);
     sprintf(log_buff, "%s\n",buffer); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);

}

MakeHeader()
{
     char  buffer[81];
     
     /* EXEC SQL 
     SELECT  jobkind,  cocode,  reqdate,  deddate, transcode,  vancode,  raninfo,  sysinfo,   copasswd
       INTO  :jobkind, :cocode, :reqdate, :deddate, :transcode, :vancode, :raninfo, :sysinfo1, :copasswd
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
     sqlstm.offset = (unsigned int  )175;
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
          sprintf(log_buff, "[ERRCODE : %d] 표제부 생성 Error\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          fclose(fp);
          unlink(FullName);
          exit(1);
     }
     
     memset(buffer,'\0',sizeof(buffer));          
     sprintf(buffer,   "%1s" ,"S");                          /* 표제부      */              
     sprintf(buffer+ 1,"%2s", jobkind);                      /* 화일구분"C2"*/     
     sprintf(buffer+ 3,"%10s",cocode);                       /* 발신기관6510100666*/
     /*2017.10.17 jissi 2->3자리 코드로 변경하지 않고 기존 외환은행코드(05)로 보내라고 함(하나은행 이준희차장 331-3462)
     sprintf(buffer+13,"%2s", bacode);                         수신은행05   */      
     if (strcmp(bacode,"081") == 0)
     {
          sprintf(buffer+13,"%2s", "05");                         /* 수신은행    */
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
          sprintf(buffer+74,"%4s" ,sysinfo1);                     /* 시스템이용  */
     }
     else
     {
          sprintf(buffer+13,"%3s", bacode);                       /* 수신은행    */
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
          sprintf(buffer+75,"%4s" ,sysinfo1);                     /* 시스템이용  */
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
     SELECT   bacode
     FROM  pkmbank
     WHERE  mbacode = :bacode and bacode <> :bacode
     ORDER BY bacode; */ 

     
     /* EXEC SQL OPEN c2; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0008;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )230;
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
          sprintf(log_buff, "[ERRCODE : %d] 타행은행 read 에러\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          fclose(fp);
          unlink(FullName);
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
          sqlstm.offset = (unsigned int  )253;
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
               sqlstm.offset = (unsigned int  )272;
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
               sqlstm.offset = (unsigned int  )287;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               printf("[ERRCODE : %d] 타행 에러\n",sqlca.sqlcode);
               sprintf(log_buff, "[ERRCODE : %d] 타행 에러\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
               Write_batlog(seqno++, log_buff);
               fclose(fp);
               unlink(FullName);
               exit(1);
          }
          SetBody();
     }
}

/* 식교비 분할지급 1997.12.09 leerk */
SetBody()
{
     /* char buffer[81];  이체계좌별로 */
     
     /* EXEC SQL DECLARE c1 CURSOR FOR 
     SELECT empno, paybank, payacnt, realpay
     FROM   pkhindtra
     where  empno not like 'Y%'              /oY사번 제외 Add  dsa2000  2008.01.o/
       and  reqdate  = :reqdate
       and  moveyn    = 'N'
      ORDER BY empno; */ 

     
     /* EXEC SQL OPEN c1; */ 

{
     struct sqlexd sqlstm;
     sqlstm.sqlvsn = 12;
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = sq0009;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )302;
     sqlstm.selerr = (unsigned short)1;
     sqlstm.cud = sqlcud0;
     sqlstm.sqlest = (unsigned char  *)&sqlca;
     sqlstm.sqlety = (unsigned short)4352;
     sqlstm.occurs = (unsigned int  )0;
     sqlstm.sqcmod = (unsigned int )0;
     sqlstm.sqhstv[0] = (unsigned char  *)reqdate;
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


     if  (sqlca.sqlcode != 0 && sqlca.sqlcode != 1403 )
     {
          printf("[ERRCODE : %d] 이체금액 setting 에러\n",sqlca.sqlcode);
          sprintf(log_buff,"[ERRCODE : %d] 이체금액 setting 에러\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          fclose(fp);
          unlink(FullName);
          exit(1);
     }
     
     while(1)
     {
          InitVal();
          /* EXEC SQL FETCH c1 
          INTO :empno, :paybank, :payacnt, :realpay ; */ 

{
          struct sqlexd sqlstm;
          sqlstm.sqlvsn = 12;
          sqlstm.arrsiz = 13;
          sqlstm.sqladtp = &sqladt;
          sqlstm.sqltdsp = &sqltds;
          sqlstm.iters = (unsigned int  )1;
          sqlstm.offset = (unsigned int  )321;
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
          sqlstm.sqhstv[2] = (unsigned char  *)payacnt;
          sqlstm.sqhstl[2] = (unsigned long )20;
          sqlstm.sqhsts[2] = (         int  )0;
          sqlstm.sqindv[2] = (         short *)0;
          sqlstm.sqinds[2] = (         int  )0;
          sqlstm.sqharm[2] = (unsigned long )0;
          sqlstm.sqadto[2] = (unsigned short )0;
          sqlstm.sqtdso[2] = (unsigned short )0;
          sqlstm.sqhstv[3] = (unsigned char  *)&realpay;
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
               sqlstm.offset = (unsigned int  )352;
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
               sqlstm.offset = (unsigned int  )367;
               sqlstm.cud = sqlcud0;
               sqlstm.sqlest = (unsigned char  *)&sqlca;
               sqlstm.sqlety = (unsigned short)4352;
               sqlstm.occurs = (unsigned int  )0;
               sqlcxt((void **)0, &sqlctx, &sqlstm, &sqlfpn);
}


               printf("[ERRCODE : %d] 이체금액 읽기 에러\n",sqlca.sqlcode);
               sprintf(log_buff,"[ERRCODE : %d] 이체금액 읽기 에러\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
                     Write_batlog(seqno++, log_buff);
               fclose(fp);
               unlink(FullName);
               exit(1);
          }
           
          /* 은행이 같을때 */ 
          if (strcmp(bankcode, paybank)  == 0)
          {
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
     else                             jg_PaySum += realpay; 
     sprintf(buffer+31,"%-2s", deddate+6);
     sprintf(buffer+33,"%s", " ");
     sprintf(buffer+34,"%4s", " ");
     sprintf(buffer+38,"%10s"," ");
     sprintf(buffer+48,"%24s"," ");
     sprintf(buffer+72,"%4s"," ");
     sprintf(buffer+76,"%2s"," ");
     buffer[78] = '\0';
     */

     sprintf(buffer,   "%s", "D");                           /*식별코드'D'  1자리*/
     sprintf(buffer+1, "%-3s", bankcode);                    /*신은행코드   3자리*/
     StripBar();
     sprintf(buffer+4, "%-15s",payacnt);                     /*계좌번호    15자리*/
     strcpy(AcntBuf[BufCnt],payacnt);
     sprintf(buffer+19,"%s","31");                           /*자금구분'31' 2자리*/
     sprintf(buffer+21,"%011d",realpay);                     /*이체금액    11자리*/ 
     PaySum += realpay;
     sprintf(im_empno,"%.1s",empno);  
     if  (strcmp(im_empno ,"M" )==0)  im_PaySum += realpay;
     else                             jg_PaySum += realpay;      
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
     /*if  (strcmp(bacode,"05") == 0) 2017.10.12 jissi 2->3자리 코드로 변경*/
     if  ((strcmp(bacode,"05") == 0) || (strcmp(bacode,"005") == 0) || (strcmp(bacode,"081") == 0))
     {
          sprintf(buffer+68, "%04d",MakeBokjiho()); /* 복기호부호  */
          sprintf(buffer+72, "%4s"," ");   
     
     }
     else if (strcmp(bacode,"24") == 0)
     {
          sprintf(buffer+68, "%04d",MakeBokjiho()); /* 복기호부호  */
          sprintf(buffer+72, "%4s"," ");   
     
     }
     else
          sprintf(buffer+68, "%08d",MakeBokjiho()); /* 복기호부호  */
          
     sprintf(buffer+76, "%2s"," ");   /* 업체임의정보  */
     buffer[78] = '\0';
     fprintf(fp,"%s\r\n",buffer);
}

MakeBokjiho()
{
     int i;
     double a  = 0;
     double b  = 0;
     double c  = 0;
     double d  = 0;
     double A  = 0;
     double B  = 0;
     double C  = 0;
     double D  = 0;
     double D1 = 0;
     double X  = 0;
     double t  = 0;
     int    result = 0;
     char   tmp[80];
/*
  FILE *ffp;

ffp = fopen("LeeTst","w");
*/

     /*if  (strcmp(bacode,"05") == 0) 2017.10.12 jissi 2->3자리 코드로 변경*/
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
          A = a + b + c + d;
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
     
     /* dsa2000  2004.05.13 MIS2 장비로 이전하면서 생성파일 경로 수정*/  
     DATA_DIR = hinsa_home();
     strcat(DATA_DIR,"/data/EDIdata");
           
     memset(FullName,'\0',sizeof(FullName));
     sprintf(FullName,"%s/%s",DATA_DIR,fname);
     strcpy(filename,fname);
     
     printf("FullName :%s\n",FullName);  
     sprintf(log_buff,"FullName :%s\n",FullName); /*dsa2000 Rexec 대체*/
     Write_batlog(seqno++, log_buff);
      
     fp = fopen(FullName,"r");
     if  (fp  != NULL)
     {
          printf("[ERRCODE : %d] 파일이 이미 존재합니다. 다른이름을 지정하십시요\n",sqlca.sqlcode);
          sprintf(log_buff,"[ERRCODE : %d] 파일이 이미 존재합니다. 다른이름을 지정하십시요\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          fclose(fp);
          exit(1);
     }
     
     fp = fopen(FullName,"w");
     if  (fp == NULL)
     {
          printf("[ERRCODE : %d] 파일을 생성할수 없습니다\n",sqlca.sqlcode);
          sprintf(log_buff,"[ERRCODE : %d] 파일을 생성할수 없습니다\n",sqlca.sqlcode); /*dsa2000 Rexec 대체*/
          Write_batlog(seqno++, log_buff);
          fclose(fp);
          exit(1);
     }
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
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.stmt = "insert into PYBATLOG  values (:b0,:b1,:b2,:b3,:b4)";
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )382;
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
     sqlstm.arrsiz = 13;
     sqlstm.sqladtp = &sqladt;
     sqlstm.sqltdsp = &sqltds;
     sqlstm.iters = (unsigned int  )1;
     sqlstm.offset = (unsigned int  )423;
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