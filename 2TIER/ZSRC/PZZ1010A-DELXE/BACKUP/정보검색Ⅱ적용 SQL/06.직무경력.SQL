--01.직무경력추출
SELECT C.EMPNO 사번, C.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = C.PSTATE) 인사상태,
       C.PAYRA      직책코드,  (select CODENAME from pyccode where CODEID = 'I113' and CODENO = C.PAYRA ) 직책명,
       (select DEPTNAME||' '||DEPTNA3 from pycdept where ORGNUM = C.ORGNUM and DEPTCODE = C.DEPTCODE ) 부서명,
       C.DEPTCODE   부서코드,
       A.FRDUTYDATE 직무경력FROM,
       A.TODUTYDATE 직무경력TO,
       A.DUTYYY     경력년수,
       A.DUTYMM     경력월수,
       C.EMPDATE    최초입사일,
       C.ORGEMPDATE 입사일,
       A.DUTYKIND   직종코드,  (select DUTYKINDNAME from PISHRDUKIND where DUTYKIND = A.DUTYKIND) 직종명,       
       A.DUTY       직무코드,  (select DUTYNAME from PISHRDUTY where DUTY = A.DUTY) 직무명,
       DUTYTERMRATE 직무비중,
       (select CODENAME from pyccode where CODEID = 'I221' and CODENO = C.LSCHDEG) 학력,
       C.LSCHNM  최종학교명,
       (select CODENAME from pyccode where CODEID = 'I225' and CODENO = C.LMAJORCODE) 최종전공명,
       (select CODENAME from pyccode where CODEID = 'I223' and CODENO = C.UNICODE)  대학명,
       (select CODENAME from pyccode where CODEID = 'I225' and CODENO = C.UNIMAJOR) 대학전공명
  FROM PISHRMAS A, PIMPMAS C
 WHERE A.EMPNO  = C.EMPNO(+)
   AND C.PSTATE<= '80'   
 ORDER BY C.EMPNO, C.PAYRA, A.FRDUTYDATE, A.DUTYNO   

--02.특정직무내용소지자
SELECT C.EMPNO 사번, C.KORNAME 성명, 
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = C.PSTATE) 인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = C.PAYRA ) 직책명,
       I.DEPTNAME   부서명, 
       A.FRDUTYDATE 근무시작일 , 
       A.TODUTYDATE 근무종료일, 
       A.DUTYYY     근속종사년수, 
       A.DUTYMM     근속종사월수, 
       C.EMPDATE    최초입사일, 
       C.ORGEMPDATE 입사일, 
       A.DUTYKIND   직종, (select DUTYKINDNAME from PISHRDUKIND where A.DUTYKIND= DUTYKIND) 직종명, 
       A.DUTY       직무, (select DUTYNAME     from PISHRDUTY   where A.DUTY    = DUTY    ) 직무명, 
       E.SUBDUTYTEXT 상세직무내역, 
       (select CODENAME from pyccode where CODEID = 'I221' and CODENO = C.LSCHDEG) 학력,
       C.LSCHNM  최종학교명,
       (select CODENAME from pyccode where CODEID = 'I225' and CODENO = C.LMAJORCODE) 최종전공명,
       (select CODENAME from pyccode where CODEID = 'I223' and CODENO = C.UNICODE)  대학명,
       (select CODENAME from pyccode where CODEID = 'I225' and CODENO = C.UNIMAJOR) 대학전공명       
  FROM PISHRMAS A, PIMPMAS C, PISHRSUB E, PYCDEPT I     
 WHERE A.EMPNO   = C.EMPNO
   AND A.EMPNO   = E.EMPNO
   AND C.PSTATE  < '80' 
   AND C.DEPTCODE= I.DEPTCODE
   AND C.ORGNUM  = I.ORGNUM    --and a.empno='0006'
   AND E.SUBDUTYTEXT LIKE '%'||:상세직무||'%'
 ORDER BY C.EMPNO, A.FRDUTYDATE
 
 
select * from PISHRDUTY

--03.장기근무자 발령체크
SELECT A.EMPNO 사번,  A.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = B.PSTATE) 인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = B.PAYRA ) 직책명,  
       D.DEPTNAME 현부서명,
       DECODE(A.COMGUBUN,'1','데이콤','2','DST','3','하나로') 회사구분,
       A.ANFRDATE 발령일From,
       (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE ) 발령구분,
       (select CODENAME from pyccode where CODEID = 'I310' and CODENO = A.ANDETCODE ) 발령세부구분,
       I.DEPTNAME 발령전부서,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.BPAYRA ) 발령전직책,
       L.DEPTNAME 발령후부서,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = A.PAYRA  ) 발령후직책
  FROM PIHANNO A, PIMPMAS B, PYCDEPT D, PYCDEPT I, PYCDEPT L
 WHERE A.EMPNO     = B.EMPNO
   AND B.PSTATE   <= '25'
   AND B.PAYRA    <= decode( sign(substr(ANFRDATE,1,4)-2008),1,'D61','79')
--   AND A.ANFRDATE >= '20021101'
   AND B.DEPTCODE  =  D.DEPTCODE
   AND B.ORGNUM    =  D.ORGNUM
   AND A.BDEPTCODE =  I.DEPTCODE
   AND A.BORGNUM   =  I.ORGNUM
   AND A.DEPTCODE  =  L.DEPTCODE
   AND A.ORGNUM    =  L.ORGNUM 
 ORDER BY A.ANCODE, A.ANFRDATE, A.EMPNO, B.DEPTCODE, B.PAYRA, B.PAYCL

--04.IT 자격보유_전근무처현황
SELECT C.EMPNO 사번, C.KORNAME 성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = C.PSTATE)  인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = C.PAYRA )  직책명,
       (select CODENAME from pyccode where CODEID = 'I231' and CODENO = A.LICKIND) "자격/면허명",
       (select CODENAME from pyccode where CODEID = 'I232' and CODENO = A.LICGR  ) "자격/면허등급",
       A.LICGETDATE 취득일,
       B.CARFRDATE  경력일From,
       B.CARTODATE  경력일To,
       B.CARPLACE   근무부서
  FROM PIMLICE A, PIMCARR B, PIMPMAS C
 WHERE A.EMPNO  = B.EMPNO(+)
   AND B.EMPNO  = C.EMPNO
   AND C.PSTATE < '70'
   AND A.LICKIND BETWEEN 'A00' AND 'AZ0'
 Order by C.Empno, A.LICGETDATE   
   
   select * from pyccode where CODEID = 'I231'