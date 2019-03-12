--00.재직자정보
select empno 사번,  korname 성명,  
      (select codename  from pyccode where codeid='I113'   and codeno  =a.payra   ) 소속직책,
      (select codename  from pyccode where codeid='I113'   and codeno  =a.jobpayra) 근무지직책,	  
      (select codename  from pyccode where codeid='I114'   and codeno  =a.pstate  ) 인사상태,
      (select codename  from pyccode where codeid='I115'   and codeno  =a.jobgun  ) 직군,
       paydunm 직책명,  Empdate 입사일, orgempdate "SKB입사일", e_mail 이메일,	
	   orgnum 조직차수, deptcode 부서코드,
      (select deptfname from hper.v_hintdept where deptcode=a.deptcode) 부문본부명,
      (select deptname  from hper.v_hintdept where deptcode=a.deptcode) 실명,	  
      (select deptname  from pycdept where orgnum=a.orgnum and deptcode=a.deptcode) 소속부서명,
      (select deptname  from pycdept where orgnum=a.orgnum and deptcode=a.jobdept ) 근무지부서명,	  	  
      (select codename  from pyccode where codeid='I160'   and codeno  =a.jobplace) 근무지	  
  from pimpmas a 
 where pstate <'80'
 order by empno 	

--01.교육_전사명단
SELECT M.empno  사번,  M.korname  성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,  
       M.DEPTCODE 부서코드, Y.DEPTNAME  부서명,   Y.DEPTNA3   직무그룹,   
       M.jobplace 근무지,   nvl((select codename from pyccode where codeid='I160' and codeno=M.jobplace),'') 근무지명,
       M.jobgun   직군,     nvl((select codename from pyccode where codeid='I115' and codeno=M.jobgun),'')  직군명,
       Decode(SEX,'M','남','F','여')  성별
  FROM PYCDEPT Y,   PIMPMAS M
 WHERE M.ORGNUM  = Y.ORGNUM
   AND M.DEPTCODE= Y.DEPTCODE
   AND M.PSTATE <= '70'
ORDER BY  M.EMPNO Asc

--02.신규 입사자 명단(90일미만) 
SELECT M.empno  사번,  M.korname  성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,  
       M.DEPTCODE  부서코드,   Y.DEPTNAME  부서명,      Y.DEPTNA3   직무그룹,   
       M.jobplace 근무지,    nvl((select codename from pyccode where codeid='I160' and codeno=M.jobplace),'') 근무지명,    
       (select CODENAME from pyccode where CODEID = 'I101' and CODENO = M.EMPCODE )  입사구분,
       M.ORGEMPDATE 입사일,
       A.ANTODATE   발령일To,
       Y.Fincode    재무관리용부서코드
  FROM PYCDEPT Y, PIMPMAS M, PIHANNO A
 WHERE M.ORGNUM  = Y.ORGNUM
   AND M.DEPTCODE= Y.DEPTCODE
   AND M.EMPNO   = A.EMPNO
   AND M.PSTATE  < '80'
   AND M.OrgEmpdate > To_Char(Sysdate-90,'YYYYMMDD')
ORDER BY M.ORGEMPDATE Desc

--03.장기파견자 명단
SELECT M.empno  사번,  M.korname  성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,   
       Y.DEPTNAME   부서명,    
       (select CODENAME from pyccode where CODEID = 'I160' and CODENO = M.JOBPLACE) 근무지,    
       (select CODENAME from pyccode where CODEID = 'I115' and CODENO = M.JOBGUN )  직군,      
       Decode(SEX,'M','남','F','여')  성별,    
       M.ORGEMPDATE  입사일,    
       (select CODENAME from pyccode where CODEID = 'I101' and CODENO = M.EMPCODE)  입사구분,  
       (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )  발령세부구분,
       A.ANFRDATE    발령일From,
       A.ANTODATE    발령일To
  FROM PIMPMAS M, PIHANNO A, PYCDEPT Y
 WHERE M.EMPNO  =  A.EMPNO
   AND M.PSTATE BETWEEN '20'  AND '24'
   AND A.ANCODE BETWEEN '411' AND '412'
   AND M.DEPTCODE=  Y.DEPTCODE
   AND M.ORGNUM  =  Y.ORGNUM
 ORDER BY A.ANTODATE Desc,  A.ANFRDATE Desc

--04.복직자 명단
SELECT M.empno  사번,  M.korname  성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,   
       Y.DEPTNAME   부서명,    
       (select CODENAME from pyccode where CODEID = 'I160' and CODENO = M.JOBPLACE ) 근무지,    
       (select CODENAME from pyccode where CODEID = 'I115' and CODENO = M.JOBGUN )   직군,      
       Decode(SEX,'M','남','F','여')  성별,    
       (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )  발령구분,
       A.ANFRDATE    발령일From,
       A.ANTODATE    발령일To
  FROM PYCDEPT Y,  PIMPMAS M,  PIHANNO A
 WHERE M.EMPNO  =  A.EMPNO
   AND M.PSTATE < '80'
   AND A.ANCODE ='514'
   AND M.DEPTCODE  =  Y.DEPTCODE
   AND M.ORGNUM  =  Y.ORGNUM
 ORDER BY A.ANTODATE Desc

--05.휴직자 명단
SELECT M.empno  사번,  M.korname  성명,
       (select CODENAME from pyccode where CODEID = 'I114' and CODENO = M.PSTATE)  인사상태,
       (select CODENAME from pyccode where CODEID = 'I113' and CODENO = M.PAYRA )  직책명,   
       Y.DEPTNAME   부서명,    
       (select CODENAME from pyccode where CODEID = 'I160' and CODENO = M.JOBPLACE ) 근무지,    
       (select CODENAME from pyccode where CODEID = 'I115' and CODENO = M.JOBGUN )   직군,      
       Decode(SEX,'M','남','F','여')  성별,    
       M.ORGEMPDATE  입사일,    
       (select CODENAME from pyccode where CODEID = 'I101' and CODENO = M.EMPCODE)  입사구분,  
       (select CODENAME from pyccode where CODEID = 'I300' and CODENO = A.ANCODE )  발령구분,
       A.ANFRDATE    발령일From,
       A.ANTODATE    발령일To
  FROM PIMPMAS M, PIHANNO A, PYCDEPT Y
 WHERE M.EMPNO  =  A.EMPNO
   AND M.PSTATE BETWEEN '70'  AND '7A'
   AND A.ANCODE BETWEEN '511' AND '512'
   AND M.DEPTCODE  =  Y.DEPTCODE
   AND M.ORGNUM  =  Y.ORGNUM
 ORDER BY A.ANTODATE Desc,  A.ANFRDATE Desc

--06.노조_현원
select m.empno  사번,  m.korname  성명,         y.deptname   부서명,
       (select codename from pyccode where codeid = 'I114' and codeno = m.pstate  ) 인사상태,
       (select codename from pyccode where codeid = 'I113' and codeno = m.payra   ) 직책명,      
       (select codename from pyccode where codeid = 'I160' and codeno = m.jobplace) 근무지,  
       (select codename from pyccode where codeid = 'I122' and codeno = b.nojibu  ) 관할지부, 
       b.nojibu    관할지부코드, 
       b.chasu     재임회차,   
	   b.nojobcode 근태참조코드,	   
	   b.nogubun   노조직책코드, 
       (select codename from pyccode where codeid = 'I120' and codeno = b.nogubun ) 노조직책명,  
       b.actfrdate 활동기간fr, b.acttodate 활동기간to,
       decode(substr(m.nogubun,1,1),'3','노조원','4','노조원','5','노조원','I','노조원','비노조원') 노조구분 
  from pimpmas m, pihnojo b, pycdept y
 where m.pstate < '80'
   and m.empno = b.empno
   and m.deptcode = y.deptcode   and m.orgnum = y.orgnum
   and b.chasu    = (select max(chasu) from pihnojo)
 order by  노조구분  