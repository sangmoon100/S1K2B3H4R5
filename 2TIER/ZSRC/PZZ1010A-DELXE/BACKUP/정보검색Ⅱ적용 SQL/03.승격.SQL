--01.연도별 평가점수 테이블
SELECT A.RABASYEAR   평가기준년                                                               ,
       A.EMPNO       사번                                                                     ,
       A.KORNAME     성명                                                                     ,
       (SELECT CODENAME FROM PYCCODE WHERE A.PAYCL  = CODENO AND CODEID = 'I112') BAND명      ,
       (SELECT CODENAME FROM PYCCODE WHERE A.PAYRA  = CODENO AND CODEID = 'I113') 직책명      ,
       (SELECT CODENAME FROM PYCCODE WHERE A.JOBGUN = CODENO AND CODEID = 'I116') 직군명      ,
       A.ORGNUM      조직차수                                                                 ,
       (SELECT DEPTNAME FROM PYCDEPT WHERE A.ORGNUM = ORGNUM AND A.DEPTCODE = DEPTCODE) 부서명,
       A.RESULTSCR2  업적점수                                                                 ,
       A.ABILITYSCR2 역량점수                                                                 ,
       A.FINALSCR    최종점수                                                                 ,
       A.FINALGRADE  최종등급                                                                 ,
       A.UPPOINT     승격포인트                                                               ,
       A.UPSCORE     승격점수                                                                 ,
       A.EXDUDAYS    근속제외일수                                                             ,
       A.EXDUDESC    근속제외내용                                                             ,
       A.RANK        서열                                                                     ,
       A.RANKINYN    서열포함여부                                                             ,
       A.RANKTOT     서열총인원
  FROM PEHEVHIS A, (SELECT '20072006' PASSWORD FROM DUAL) B
 WHERE A.RABASYEAR = :평가년도
   AND B.PASSWORD = :PASSWORD
 ORDER BY A.PAYRA, A.EMPNO

--02.승격 서열 명부
select c.rank    서열,       
       c.cnt     총인원,                                                                                                                        
       round(c.rank*100/c.cnt,4)||' %' 백분율,                                                             
       a.empno   사번,                                                                                                                          
       a.korname 사원명,                                                                                                                        
       nvl((select codefname from pyccode where codeid='I115' and codeno = c.jobgun),'') 직군명,                                 
       a.jobgun  직군,                                                                                                                         
       nvl((select codefname from pyccode where codeid='I112' and codeno = a.paycl),'') BAND,                                    
       a.paycl   BAND코드,                                                                                                                          
       107 - substr(b.juminid,1,2) 나이,                                                                                                  
      (select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode) 부서명,
       d.deptna3 직무그룹,                                                                                                                        
       nvl((select codename from pyccode where codeid='I113' and codeno = a.payra),'')  직책,                                    
       nvl((select codename from pyccode where codeid='I221' and codeno = b.lschgr),'') 최종학력,                                  
       b.lschnm 최종학교명,                                                                                                                         
       nvl((select codename from pyccode where codeid='I225' and codeno = b.lmajorcode),'') 최종전공명,                              
       substr(b.lschgrym,1,4) 최종졸업년도,                                                                                                  
       decode(b.lschgr,'69',nvl((select codename from pyccode where codeid='I223' and codeno = b.unicode),''),'') 학교명,   
       decode(b.lschgr,'69',nvl((select codename from pyccode where codeid='I225' and codeno = b.unimajor),''),'') 전공명, 
       decode(b.lschgr,'69',substr(b.unigrym,1,4),'') 졸업년도,                                                                       
       substr(b.empdate,1,4) || '/' || substr(b.empdate,5,2) || '/' || substr(b.empdate,7,2) 입사일자,                                
       nvl((select codename from pyccode where codeid='I101' and codeno = b.empcode),'') 입사구분,                                    
       substr(a.paycldate,1,4) || '/' || substr(a.paycldate,5,2) || '/' || substr(a.paycldate,7,2) BANDDATE,                        
       '(' || substr(b.cpaycldate,1,4) || '/' || substr(b.cpaycldate,5,2) || '/' || substr(b.cpaycldate,7,2)  || ')' 舊BANDDATE, 
       a.payclyy || '년' || a.payclmm || '월' BAND체류기간,
       (SELECT finalgrade FROM pehevhis  WHERE empno = a.empno AND rabasyear = '2006') "2006년도 등급",
       (SELECT finalgrade FROM pehevhis  WHERE empno = a.empno AND rabasyear = '2005' and substr(a.paycldate,1,4) <= rabasyear ) "2005년도 등급",
       (SELECT finalgrade FROM pehevhis  WHERE empno = a.empno AND rabasyear = '2004' and substr(a.paycldate,1,4) <= rabasyear ) "2004년도 등급",
       (SELECT finalgrade FROM pehevhis  WHERE empno = a.empno AND rabasyear = '2003' and substr(a.paycldate,1,4) <= rabasyear ) "2003년도 등급",
       (SELECT finalgrade FROM pehevhis  WHERE empno = a.empno AND rabasyear = '2002' and substr(a.paycldate,1,4) <= rabasyear ) "2002년도 등급",                                              
       decode(substr(a.paycl,1,1),'4',0, nvl(a.totscr,0))   인사고과,                                                                                                                        
       decode(substr(a.paycl,1,1),'4',0, nvl(a.payclscr,0)) BAND체류점수,                                                                                                                        
       decode(substr(a.paycl,1,1),'4',0, nvl(a.totscr,0) + nvl(a.payclscr,0)) 승격점수계,                                                                                    
       decode(substr(a.paycl,1,1),'4',0, nvl(a.qpayclscr,0)) BAND체류기간점수,                                                                                                                      
       a.uppoint 승격포인트,                                                                                                                        
       decode(substr(a.paycl,1,1),'4',0, nvl(a.prizescr,0) + nvl(a.suggscr,0)) 포상제안,                                                                                     
       decode(substr(a.paycl,1,1),'4',0, nvl(a.uppoint_2year,0)) 최근2년승격포인트
  from pimupmas a, pimpmas b, pycdept d,                                                                                                  
      (select a.empno, a.jobgun, a.paycl, b.cnt,
              rank() over (partition by a.jobgun, a.paycl                                                                                
                           order by a.tot desc, a.gijun1 desc, a.gijun2 desc, a.gijun3 desc,a.gijun4 desc) rank                          
         from (select a.empno,                                                                                                             
                      nvl(a.totscr,0) + nvl(a.payclscr,0)  tot,                                                                             
                      nvl(a.qpayclscr,0)                   gijun1,                                                                                           
                      nvl(a.uppoint,0)                     gijun2,                                                                                             
                      nvl(a.prizescr,0) + nvl(a.suggscr,0) gijun3,                                                                         
                      nvl(uppoint_2year,0)                 gijun4,                                                                                         
                      b.evjobgun                           jobgun,                                                                                                   
                      a.paycl                              paycl                                                                                                        
                 from pimupmas a, pimragroup b                                                                                              
                where a.rabasdate = :승격기준일                                                                                              
                  and b.rabasdate = :승격기준일                                                                                              
                  and b.ragroup   = '01'                                                                                                    
                  and a.paycl     = b.rapaycl                                                                                                   
                  and a.jobgun    = b.rajobgun                                                                                                 
                  and a.upyn      = :승격대상여부YN) a,                                                                                                    
              (select count(*)   cnt,                                                                                                        
                      b.evjobgun jobgun,                                                                                                   
                      a.paycl    paycl                                                                                                        
                 from pimupmas a, pimragroup b                                                                                               
                where a.rabasdate = :승격기준일                                                                                              
                  and b.rabasdate = :승격기준일                                                                                              
                  and b.ragroup   = '01'                                                                                                    
                  and a.paycl     = b.rapaycl                                                                                                   
                  and a.jobgun    = b.rajobgun                                                                                                 
                  and a.upyn      = :승격대상여부YN                                                                                                        
                group by b.evjobgun, a.paycl) b                                                                                             
       where a.paycl  = b.paycl                                                                                                           
         and a.jobgun = b.jobgun) c,
       (SELECT '20072006' PASSWORD FROM DUAL) h		                          
 where a.rabasdate= :승격기준일                                                                                                          
   and a.empno    = b.empno                                                                                                                 
   and a.empno    = c.empno                                                                                                                 
   and a.orgnum   = d.orgnum                                                                                                               
   and a.deptcode = d.deptcode                                                                                                           
--   and c.jobgun LIKE :직군                                                                           
--   and a.paycl between :직급시작 and :직급종료 
   and h.PASSWORD = :PASSWORD                                                                                            
 order by c.paycl, c.jobgun , c.rank                                                                                                    
                                                                                                   

--03.승격MST
SELECT A.RABASDATE 승격기준일,
       A.EMPNO     사번      ,
       A.KORNAME   성명      ,
       A.ORGNUM    조직차수  ,
       (SELECT DEPTNAME FROM PYCDEPT WHERE A.ORGNUM = ORGNUM AND A.DEPTCODE = DEPTCODE) 부서명,
       (SELECT CODENAME FROM PYCCODE WHERE A.PAYCL  = CODENO AND CODEID     = 'I112')   BAND명,
       (SELECT CODENAME FROM PYCCODE WHERE A.PAYRA  = CODENO AND CODEID     = 'I113')   직책명,
       (SELECT CODENAME FROM PYCCODE WHERE A.JOBGUN = CODENO AND CODEID     = 'I116')   직무명,
       (SELECT DUTYKINDNAME FROM PISHRDUKIND WHERE A.JOBKIND = DUTYKIND)                직종명,
       A.PAYCLDATE     재급년차기준일    ,
       A.PAYCLYY       재급기간_년       ,
       A.PAYCLMM       재급기간_월       ,
       A.PAYCLDD       재급기간_일       ,
       A.UPPOINT       승격포인트        ,
       A.EDUPOINT      교육포인트        ,
       A.UPPOINTYN     승격포인트충족요건,
       A.EDUPOINTYN    교육포인트충족요건,
       A.SHIFTYN       전환배치요건충족여부,
       A.UPYN          승격대상여부        ,
       A.TOTSCR        승격점수            ,
       A.PAYCLSCR      재급기간점수        ,
       A.QPAYCLSCR     재급점수            ,
       A.PRIZESCR      포상점수            ,
       A.SUGGSCR       제안점수            ,
       A.UPPOINT_2YEAR 최근2년승격포인트   ,
       A.RUPYN         실제승격여부
  FROM PIMUPMAS A, (SELECT '20072006' PASSWORD FROM DUAL) B
 WHERE A.RABASDATE = :승격기준일
   AND B.PASSWORD  = :PASSWORD
 ORDER BY A.PAYRA, A.EMPNO


--04.승격조회
select a.empno "사번", a.korname "성명", 
       a.paycl  BAND      , (SELECT CODENAME FROM PYCCODE WHERE a.PAYCL  = CODENO AND CODEID = 'I112') BAND명,
       a.payra  "직책코드", (SELECT CODENAME FROM PYCCODE WHERE a.PAYRA  = CODENO AND CODEID = 'I113') 직책명,
       a.jobgun "직군코드", (SELECT CODENAME FROM PYCCODE WHERE A.JOBGUN = CODENO AND CODEID = 'I115') 직군명,
       d.deptname   "부서명",       
       a.paycldate  "BANDDATE", 
       a.cpaycldate "승격일", 
       2005-substr(a.cpaycldate,1,4) "재급년차", 
       a.orgempdate "입사일", 
       a.cardate    "경력일",
       MIN(decode(e.rabasyear,'1999',e.finalgrade))    "1999등급",
       SUM(decode(e.rabasyear,'1999',e.uppoint))       "1999point",
       SUM(decode(e.rabasyear,'1999',e.upscore))       "1999평점",  
       SUM(decode(e.rabasyear,'1999',365 - e.EXDUDAYS))"1999근속기간",
       MIN(decode(e.rabasyear,'2000',e.finalgrade))    "2000등급",
       SUM(decode(e.rabasyear,'2000',e.uppoint))       "2000point",
       SUM(decode(e.rabasyear,'2000',e.upscore))       "2000평점",  
       SUM(decode(e.rabasyear,'2000',365 - e.EXDUDAYS))"2000근속기간",
       MIN(decode(e.rabasyear,'2001',e.finalgrade))    "2001등급",
       SUM(decode(e.rabasyear,'2001',e.uppoint))       "2001point",
       SUM(decode(e.rabasyear,'2001',e.upscore))       "2001평점",  
       SUM(decode(e.rabasyear,'2001',365 - e.EXDUDAYS))"2001근속기간", 
       MIN(decode(e.rabasyear,'2002',e.finalgrade))    "2002등급",
       SUM(decode(e.rabasyear,'2002',e.uppoint))       "2002point",
       SUM(decode(e.rabasyear,'2002',e.upscore))       "2002평점",  
       SUM(decode(e.rabasyear,'2002',365 - e.EXDUDAYS))"2002근속기간",
       MIN(decode(e.rabasyear,'2003',e.finalgrade))    "2003등급",
       SUM(decode(e.rabasyear,'2003',e.uppoint))       "2003point",
       SUM(decode(e.rabasyear,'2003',e.upscore))       "2003평점",  
       SUM(decode(e.rabasyear,'2003',365 - e.EXDUDAYS))"2003근속기간",
       f.UPPOINT   "총 point", 
       f.PAYCLYY ||'년'|| f.PAYCLMM ||'월'|| f.PAYCLDD||'일' "총 재급기간", 
       f.TOTSCR    "종합평점", 
       f.PAYCLSCR  "재급점수", 
       f.QPAYCLSCR "재급기간점수", 
       f.UPPOINT   "승격 Point", 
       to_char(f.PRIZESCR,decode(f.PRIZESCR,'0','0','0.0'))||'/'||to_char(f.SUGGSCR) "포상/제안점수", 
       f.UPPOINT_2YEAR "최근2년 Pt", 
       f.REEXAMCNT "재시험여부"    
  from pimpmas a, pycdept d, pehevhis e, pimupmas f
 where a.empno in (select empno from pimupmas where (paycl > '10' and paycl <'45') )
   and a.deptcode  = d.deptcode
   and a.orgnum    = d.orgnum
   and a.empno     = e.empno(+)
   and a.empno     = f.empno(+)
   and e.RABASYEAR >= substr(a.paycldate,1,4)       
 group by a.empno, a.korname, a.jobgun, a.paycl, d.deptname, a.payra, a.paycldate, a.cpaycldate, a.orgempdate, a.cardate,   
          f.UPPOINT, f.PAYCLYY, f.PAYCLMM, f.PAYCLDD, f.TOTSCR, f.PAYCLSCR, f.QPAYCLSCR, 
          f.UPPOINT, f.PRIZESCR,f.SUGGSCR, f.UPPOINT_2YEAR, f.REEXAMCNT    
