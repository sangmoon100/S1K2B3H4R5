--01.실지사팀장(부서순) 
SELECT M.EMPNO 사원번호, M.KORNAME    성명,  
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,
       M.DEPTCODE   부서코드,  DEPTNAME  부서명       
  FROM PIMPMAS M, PYCDEPT A
 WHERE M.ORGNUM   = A.ORGNUM
   AND M.DEPTCODE = A.DEPTCODE
   AND M.PSTATE   < '80'
   AND M.PAYRA BETWEEN 'A71' AND 'C11'      
 ORDER BY M.DEPTCODE, M.PAYRA

--02.보훈대상자
SELECT EMPNO 사원번호, KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태	   
  FROM PIMPMAS M
 WHERE PSTATE <'80'
   AND BOHUNYN ='Y'
 Order By payra, Empno   
   
--03.TFT파견인력현황(근무부서순) 
SELECT EMPNO 사원번호, KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,  
       A.DEPTNAME  "소속부서명", B.DEPTNAME  "근무부서명"
  FROM PIMPMAS M, PYCDEPT A, PYCDEPT B
 WHERE PSTATE     = '21'
   AND M.DEPTCODE = A.DEPTCODE
   AND M.ORGNUM   = A.ORGNUM
   AND M.JOBDEPT  = B.DEPTCODE
   AND M.ORGNUM   = B.ORGNUM
 Order By JOBDEPT, payra, Empno     
	
--04.휴직자
SELECT EMPNO 사원번호, KORNAME 성명, M.TELNO 전화번호, RETCONT 휴대폰, A.DEPTNAME  부서명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,
       (select CODENAME from pyccode where CODEID = 'I115' and CODENO = M.JOBGUN )  직군,
       (select CODENAME from pyccode where CODEID = 'I310' and CODENO = M.LRKIND )  발령세부구분, 
       M.LRFRDATE   휴직기간FROM, 
       M.LRTODATE   휴직기간TO   
  FROM PIMPMAS M, PYCDEPT A
 WHERE M.PSTATE BETWEEN '70' AND '79'
   AND M.DEPTCODE=  A.DEPTCODE
   AND M.ORGNUM  =  A.ORGNUM
   
--05.비정규직(부서순) 
SELECT EMPNO 사원번호, KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,     
       Decode(SEX,'M','남','F','여')  성별,        
       A.DEPTNAME  부서명,      
       M.DEPTCODE   부서코드,    
       M.ORGEMPDATE 입사일       
  FROM PIMPMAS M, PYCDEPT A
 WHERE M.DEPTCODE =  A.DEPTCODE
   AND M.ORGNUM   =  A.ORGNUM
   AND M.PSTATE   < '80'
   AND M.PAYCL    >='D91'
 ORDER BY M.DEPTCODE, M.PAYCL
 
--06.정규직 발령내역
SELECT A.EMPNO 사번, A.KORNAME 성명,                 
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA )  직책명,          
       A.ANCODE    발령구분코드, (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )    발령구분명,  
       A.ANDETCODE 발령세부구분, (select CODENAME from pyccode where CODEID = 'I310' and CODENO = A.ANDETCODE ) 발령세부구분명,
       A.ANNONO    발령번호,        
       A.ANSEQNO   발령일련번호,    
       A.ANFRDATE  발령일FROM,      
       A.ANTODATE  발령일TO,        
       C.DEPTNAME  부서명,
       B.DEPTNAME  발령전부서명,
       (select CODENAME from pyccode where CODEID = 'I141' and CODENO = A.RETSAYU1 ) 퇴직사유      
  FROM PIHANNO A, PYCDEPT B, PYCDEPT C
 WHERE A.ANFRDATE  >= :발령시작일 
   AND A.BDEPTCODE =  B.DEPTCODE
   AND A.BORGNUM   =  B.ORGNUM
   AND A.DEPTCODE  =  C.DEPTCODE
   AND A.ORGNUM    =  C.ORGNUM
   AND A.PAYCL     <  'D91'      
 ORDER BY A.PAYRA, A.ANCODE, A.ANDETCODE
 
 select CODENAME from pyccode where CODEID = 'I901'
 
--07.발령내역_채용
SELECT M.EMPNO 사원번호, M.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,          
       A.ANCODE    발령구분코드, (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )    발령구분명,  
       A.ANDETCODE 발령세부구분, (select CODENAME from pyccode where CODEID = 'I310' and CODENO = A.ANDETCODE ) 발령세부구분명,      
       A.ANFRDATE  발령일FROM     
  FROM PIMPMAS M,  PIHANNO A
 WHERE M.EMPNO  =  A.EMPNO
   AND A.ANCODE IN ('111','131')
   AND A.ANFRDATE  >= :발령시작일 
 ORDER BY A.ANFRDATE
	  
	  
--08.발령내역_퇴사
SELECT M.EMPNO 사원번호, M.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,          
       A.ANCODE    발령구분코드, (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )    발령구분명,  
       A.ANDETCODE 발령세부구분, (select CODENAME from pyccode where CODEID = 'I310' and CODENO = A.ANDETCODE ) 발령세부구분명,      
       A.ANFRDATE  발령일FROM     
  FROM PIMPMAS M,  PIHANNO A
 WHERE M.EMPNO  =  A.EMPNO
   AND A.ANCODE BETWEEN '819' AND '839'
   AND A.ANFRDATE  >= :발령시작일 
 ORDER BY A.ANFRDATE
 
--09.발령변동내역 
--입력하는 발령시작일이후 전체 발령내역 
SELECT M.EMPNO 사원번호, M.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,          
       M.DEPTCODE  부서코드,    B.DEPTNAME  현부서명,         
       M.PSTATEYN  현원포함여부,   
       A.ANFRDATE  발령일FROM,     
       A.ANTODATE  발령일TO,       
       A.ANCODE    발령구분코드, (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )    발령구분명,  
       A.ANDETCODE 발령세부구분, (select CODENAME from pyccode where CODEID = 'I310' and CODENO = A.ANDETCODE ) 발령세부구분명,      
       C.BORGNUM   발령전차수,         
       C.DEPTNAME  발령전부서명,   
       A.ORGNUM    발령후차수,         
       D.DEPTNAME  발령후부서명           
  FROM PIMPMAS M, PIHANNO A, PYCDEPT B, PYCDEPT C, PYCDEPT D
 WHERE M.EMPNO  =  A.EMPNO
   AND A.ANFRDATE >= :발령시작일
   AND M.DEPTCODE  =  B.DEPTCODE
   AND M.ORGNUM    =  B.ORGNUM
   AND A.BDEPTCODE =  C.DEPTCODE
   AND A.ORGNUM    =  C.ORGNUM   
   AND A.DEPTCODE  =  D.DEPTCODE
   AND A.ORGNUM    =  D.ORGNUM
 ORDER BY A.ANFRDATE, A.Empno
 
--11.입사학력 조회
SELECT M.EMPNO 사원번호, M.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA)    직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)   인사상태,            
       (select CODENAME from pyccode where CODEID = 'I221' and CODENO = M.EMPSCHGR) 학력         
  FROM PIMPMAS M
 WHERE M.PSTATE < '80'
 Order By Empno 

--12.퇴사자 조회
--입력하는 퇴사일 이후 전체 퇴사자 
SELECT A.EMPNO 사원번호, A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = A.PSTATE)  인사상태,     
       B.DEPTNAME   부서명,
       A.ORGEMPDATE 입사일,
       A.RETDATE    퇴사일,
       (select CODENAME from pyccode where CODEID = 'I310' and CODENO = A.RETGUBUN) 퇴사구분
  FROM PIMPMAS A, PYCDEPT B
 WHERE A.PSTATE >= '80'
   AND A.DEPTCODE= B.DEPTCODE
   AND A.ORGNUM  = B.ORGNUM
   AND A.RETDATE > :퇴사일
 ORDER BY A.RETDATE, Empno

--13.특정인 발령내역
SELECT A.EMPNO 사원번호, A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA)   직책명,          
       A.ANCODE    발령구분코드, (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )    발령구분명,  
       A.ANDETCODE 발령세부구분, (select CODENAME from pyccode where CODEID = 'I310' and CODENO = A.ANDETCODE ) 발령세부구분명,      
       A.ANFRDATE  발령일FROM,     
       B.DEPTNAME  부서코드명,        
       A.MARK1      비고1,             
       A.MARK2      비고2,             
       A.MARK3      비고3              
  FROM PIHANNO A, PYCDEPT B
 WHERE A.EMPNO   = :사번
   AND A.DEPTCODE= B.DEPTCODE
   AND A.ORGNUM  = B.ORGNUM
 ORDER BY A.ANFRDATE

--14. 근무지별_직군_성별 통계 
SELECT A.EMPNO 사원번호, A.KORNAME 성명, A.ORGEMPDATE SKB입사일,  A.EMPDATE 최초입사일,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA)    직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = A.PSTATE)   인사상태, 
       (select CODENAME from pyccode where CODEID = 'I160' and CODENO = A.JOBPLACE) 근무지,      
       (select CODENAME from pyccode where CODEID = 'I115' and CODENO = A.JOBGUN)   직군,
       Decode(SEX,'M','남','F','여')  성별        
  FROM PIMPMAS A
 WHERE A.PSTATE < '80'
 ORDER BY A.JOBPLACE, A.JOBGUN Asc

--15.특정팀 인적사항
SELECT A.EMPNO 사원번호, A.KORNAME 성명, A.KORAGE 연령,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = A.PSTATE)  인사상태,          
       D.DEPTNAME   부서명,
       A.PAYCLDATE  재급기준일,
       A.CARDATE    경력일,
       A.EMPDATE    최초입사일,
       A.ORGEMPDATE SKB입사일,
       A.LSCHNM     최종학교명,
       (select CODENAME from pyccode where CODEID = 'I225' and CODENO = A.LMAJORCODE) 전공명,
       A.LSCHGRYM   최종졸업년월,
       A.BCARYY     입사전총경력년,
       A.BCARMM     입사전총경력월
  FROM PIMPMAS A, PYCDEPT D
 WHERE A.PSTATE < '80'
   AND A.DEPTCODE=  D.DEPTCODE
   AND A.ORGNUM  =  D.ORGNUM
   AND D.DEPTNAME LIKE '%'||:검색할팀명||'%'
 ORDER BY A.PAYra
      

--16.특정학교_검색
SELECT A.EMPNO 사원번호, A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = B.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = B.PSTATE)  인사상태,  
       A.SCHNM 학교명,
       (select CODENAME from pyccode where CODEID = 'I225' and CODENO = A.MAJORCODE) 전공,
       A.SCHTOYM 수학기간To,
       E.DEPTNAME 부서명,
       (select CODENAME from pyccode where CODEID = 'I160' and CODENO = B.JOBPLACE)  근무지,
       B.REGADDR 주소,
       (select CODENAME from pyccode where CODEID = 'I001' and CODENO = B.BORNAREA) 출생지
  FROM PIMSCHO A, PIMPMAS B, PYCDEPT E
 WHERE A.EMPNO  =  B.EMPNO
   AND A.SCHNM LIKE :학교명||'%'
   AND B.PSTATE  < '80'
   AND B.DEPTCODE=  E.DEPTCODE
   AND B.ORGNUM  =  E.ORGNUM
 ORDER BY B.PAYRA, A.KORNAME

--17.특정회사 근무자
SELECT A.EMPNO 사원번호, A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = B.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = B.PSTATE)  인사상태, 
       E.DEPTNAME  부서명,
       B.EMPDATE   입사일,
       A.CARFRDATE 경력일From,
       A.CARTODATE 경력일To,
       A.CARPLACE  근무처,
       A.CARJOBNM  담당직무
  FROM PIMCARR A, PIMPMAS B, PYCDEPT E
 WHERE B.EMPNO  =  A.EMPNO
   AND A.CARPLACE LIKE :근무처||'%'
   AND B.PSTATE  < '80'
   AND B.DEPTCODE=  E.DEPTCODE
   AND B.ORGNUM  =  E.ORGNUM
 ORDER BY A.Empno
     
--18.포상자 명단
select * from pyccoid where CODEID = 'I243'

SELECT A.EMPNO 사원번호, A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA)   직책명,
       A.DEPTCODE 부서코드,  B.DEPTNAME 부서명, B.DEPTNA3 직무그룹,
       A.REKINDNM 포상명,
       (select CODENAME from pyccode where CODEID = 'I240' and CODENO = A.RECLASS) 포상구분,
       A.RENO    포상번호,
       A.REDATE  포상일자,
       A.RECAUSE 포상사유,
       (select CODENAME from pyccode where CODEID = 'I245' and CODENO = A.REORG ) 포상권자
  FROM PIMREWA A, PYCDEPT B
 WHERE A.ORGNUM   =  B.ORGNUM
   AND A.DEPTCODE =  B.DEPTCODE
   AND A.REDATE  >= '19990101'
 ORDER BY A.REORG, A.REDATE, A.RECLASS, A.REKINDNM	


--19.자격증보유자
 SELECT A.EMPNO 사원번호, A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = B.PAYRA)   직책명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = B.PSTATE)  인사상태, 
       A.LICKIND 자격증, (select CODENAME from pyccode where CODEID = 'I231' and CODENO = A.LICKIND) 자격증명,
       A.LICGETDATE 취득일,
       (select CODENAME from pyccode where CODEID = 'I232' and CODENO = A.LICGR) 자격증등급       
  FROM PIMLICE A,  PIMPMAS B
 WHERE A.EMPNO  =  B.EMPNO
   AND B.PSTATE < '80'
   AND A.LICKIND BETWEEN 'A00' AND 'WZ0'
 ORDER BY A.LICKIND, A.LICGR, B.EMPNO  
 
--20.한자성명(직책순) 
SELECT A.EMPNO 사원번호, A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA)   직책명,
       D.DEPTNAME 부서명,  A.CHNNAME 한자
  FROM PIMPMAS A,  PYCDEPT D
 WHERE A.PSTATE  < '80'
   AND A.DEPTCODE=  D.DEPTCODE
   AND A.ORGNUM  =  D.ORGNUM
 ORDER BY A.PAYRA, A.Deptcode, Empno


--21.전사원 인적사항(근속기간포함) 
SELECT A.empno 사번, A.korname  성명,
       B.deptcode 부서코드,   B.deptname 부서명,     B.deptna3  과명,
       A.payra    직책,      nvl((select codename from pyccode where codeid='I113' and codeno=A.payra),'') 직책명,
      (select codename  from pyccode where codeid='I113'   and codeno  =a.jobpayra) 근무지직책,	           
       A.jobgun   직군,      nvl((select codename from pyccode where codeid='I115' and codeno=A.jobgun),'')  직군명,
       nvl((select codename  from pyccode where codeid='I114' and codeno=A.pstate),'')  인사상태,
       A.empdate  최초입사일,A.orgempdate SKB입사일,   A.cpaycldate 승격일 ,   
       nvl((select codename  from pyccode where codeid='I101' and codeno=A.empcode),'')  입사구분, 
       A.usaage   연령,      A.juminid    주민번호,    A.marrigeyn  결혼여부,      e_mail 이메일,	
       A.jobplace 근무지,    nvl((select codename from pyccode where codeid='I160' and codeno=A.jobplace),'') 근무지명,        
       A.empschgr 입사학력,  nvl((select codename from pyccode where codeid='I221' and codeno=A.empschgr),'') 입사학력명,
       A.lschgr   최종학력,  nvl((select codename from pyccode where codeid='I221' and codeno=A.lschgr  ),'') 최종학력명,
       A.unicode  대학,      nvl((select codename from pyccode where codeid='I223' and codeno=A.unicode ),'') 대학명, 
       A.unimajor 전공,      nvl((select codename from pyccode where codeid='I225' and codeno=A.unimajor),'') 전공명, 
       A.toeicscore 토익,    A.lschnm     최종학교, 
       A.lmajorcode 최종전공,nvl((select codename from pyccode where codeid='I225' and codeno=A.lmajorcode),'') 최종전공명,
       comduyy 근속기간년수,  comdumm 근속기간월수,
       payclyy 재급기간년수,  payclmm 재급기간월수	   
  FROM pimpmas A, pycdept B
 WHERE A.deptcode = B.deptcode 
   AND A.orgnum   = B.orgnum
   AND A.pstate   < '80'   
 ORDER BY  A.deptcode,  A.payra,   A.cpaycldate

--22.부서/직군별 인원현황
SELECT B.ORGNUM 조직차수, SUBSTR(B.DEPTCODE,1,1)||'0000' 부서코드, B.deptname 부서명, 
       COUNT(DECODE(C.JOBGUN,'11',1,NULL)) "경영관리", 
       COUNT(DECODE(C.JOBGUN,'22',1,NULL)) "마케팅/영업", 
       COUNT(DECODE(C.JOBGUN,'33',1,NULL)) "연구", 
       COUNT(DECODE(C.JOBGUN,'44',1,NULL)) "기술"
  FROM pycdept B, PIMPMAS C 
 WHERE B.DEPTCODE = SUBSTR(C.DEPTCODE,1,1)||'0000' 
   AND B.DEPTLEVEL < 'A0'
   AND B.ORGNUM   = C.ORGNUM
  AND C.PState   < '80'     
 GROUP BY B.ORGNUM, SUBSTR(B.DEPTCODE,1,1),B.deptname 
 UNION ALL 
SELECT B.ORGNUM 조직차수, SUBSTR(B.DEPTCODE,1,2)||'000' 부서코드, ' '||B.deptname 부서명, 
       COUNT(DECODE(C.JOBGUN,'11',1,NULL)) "경영관리", 
       COUNT(DECODE(C.JOBGUN,'22',1,NULL)) "마케팅/영업", 
       COUNT(DECODE(C.JOBGUN,'33',1,NULL)) "연구", 
       COUNT(DECODE(C.JOBGUN,'44',1,NULL)) "기술"
  FROM pycdept B, PIMPMAS C 
 WHERE B.DEPTCODE = SUBSTR(C.DEPTCODE,1,2)||'000' 
   AND B.DEPTLEVEL IN ('B0') 
   AND B.ORGNUM   = C.ORGNUM
  AND C.PState   < '80'   
 GROUP BY B.ORGNUM, SUBSTR(B.DEPTCODE,1,2),B.deptname 
 UNION ALL 
SELECT B.ORGNUM 조직차수, SUBSTR(B.DEPTCODE,1,3)||'00' 부서코드, '    '||B.deptname 부서명, 
       COUNT(DECODE(C.JOBGUN,'11',1,NULL)) "경영관리", 
       COUNT(DECODE(C.JOBGUN,'22',1,NULL)) "마케팅/영업", 
       COUNT(DECODE(C.JOBGUN,'33',1,NULL)) "연구", 
       COUNT(DECODE(C.JOBGUN,'44',1,NULL)) "기술"
FROM  pycdept B, PIMPMAS C 
WHERE B.DEPTCODE = SUBSTR(C.DEPTCODE,1,3)||'00' 
  AND B.DEPTLEVEL IN ('C0','E0')  
  AND B.ORGNUM   = C.ORGNUM
  AND C.PState   < '80' 
GROUP BY B.ORGNUM, SUBSTR(B.DEPTCODE,1,3),B.deptname 
ORDER BY 1 

select * from pimpmas where pstate <'80' and JOBGUN not in ('11','22','33','44')
