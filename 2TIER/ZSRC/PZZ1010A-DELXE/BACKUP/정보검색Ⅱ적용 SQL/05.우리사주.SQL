--01.우리사주 상환내역 추출(하나로) 
SELECT /*+ ORDERED A */
       A.CORPNAME  회사명,
       A.EMPNO     사번, 
       A.KORNAME   성명, 
	   A.DIVSEQNUM 차수, 
	   A.STCLASS   대부구분, 
	   A.STLORG    대부기관,
       DECODE(A.STLORG, 'ZZ', '회사',(select codename from pyccode where codeid='K910' and codeno=A.STLORG) ) 기관명 ,
       A.STLDATE   대부일, 
	   A.STLAMT    대부금액,
       B.EXDATE    상환월, 
	   B.EXMDATE   상환일, 
	   NVL(B.EXCPAMT, 0) 상환금액, 
	   A.STIRAMT   잔여금액
  FROM PSLMAS A, PSEMHIS B
 WHERE A.CORPNAME = '하나로'  
   AND A.CORPNAME = B.CORPNAME(+)     -- 회사구분
   AND A.DIVSEQNUM= B.DIVSEQNUM(+)    -- 대부차수
   AND A.EMPNO    = B.EMPNO(+)        -- 사원번호
   AND A.STCLASS  = B.STCLASS(+)      -- 대부구분
   AND A.STLORG   = B.STLORG(+)       -- 대부기관
   AND NVL(B.EXMDATE(+), ' ') <= :상환일자
   AND NVL(B.EXCPAMT(+), 0) > 0
 Order by A.Empno, A.DIVSEQNUM, A.STCLASS, A.STLORG
   
select * from pyccode where codeid='K910'   
   
--02.개인별 차수별 보유현황 자료 추출
--인수로 "인출인자" 입력한다.
SELECT A.EMPNO     사번, 
       C.KORNAME   성명, 
	   A.DIVSEQNUM 차수, 
	   A.DPSTCNT   예탁주식,
       B.SUBDATE   인출일, 
	   NVL(B.WDSTCNT,0) 인출주식, 
	   A.REMCNT    보유주식
  FROM PSDPHIS A, PIMPMAS C,
      (SELECT EMPNO, DIVSEQNUM, SUBDATE, SUM(WDSTCNT) WDSTCNT
         FROM PSDOHIS
        WHERE SUBDATE <= :인출일자
        GROUP BY EMPNO, DIVSEQNUM, SUBDATE) B 
 WHERE A.SDIVSEQNUM  = B.DIVSEQNUM(+)	
   AND A.EMPNO       = B.EMPNO(+)
   AND A.EMPNO       = C.EMPNO(+)
 Order by A.Empno