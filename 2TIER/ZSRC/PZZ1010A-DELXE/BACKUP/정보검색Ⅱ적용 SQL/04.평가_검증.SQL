--301. 1차평가자가 미존재 자료조회
select a.rabasdate 평가기준일,
       a.empno     사번,
       a.korname   성명, 
       NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.paycl  BAND코드, NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'') BAND,
       a.payra  직책코드, NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'') 직책,
       a.pstate 상태코드, NVL((SELECT codename FROM pyccode WHERE codeid='I114' AND codeno = a.pstate),'') 인사상태,
       a.orgnum 차수, a.deptcode 부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       a.empdate   입사일,
       a.paycldate 승격일,
       a.e1empno   제1차평가자,
       a.e1korname 제1차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e1paycl),'') 제1차평가자직책,
       a.e1deptcode 제1차평가자부서,
       a.e2empno    제2차평가자,
       a.e2korname  제2차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e2paycl),'') 제2차평가자직책,
       a.e2deptcode 제2차평가자부서, restiyn
  from pehremas a
 where a.rabasdate = :평가기준일
   and a.restiyn   = 'Y'
   and e1empno is null
 order by a.deptcode, a.empno 


--302. 자기평가완료 현황 자료조회
select a.rabasdate 평가기준일,
       a.empno     사번,
       a.korname   성명, 
       NVL((SELECT codename from pyccode WHERE codeid='I115' and codeno = a.jobgun),'') 직군,
       a.paycl  Band코드, NVL((SELECT codename from pyccode WHERE codeid='I112' and codeno = a.paycl),'') Band,
       a.payra  직책코드, NVL((SELECT codename from pyccode WHERE codeid='I113' and codeno = a.payra),'') 직책,
       a.pstate 상태코드, NVL((SELECT codename from pyccode WHERE codeid='I114' and codeno = a.pstate),'') 인사상태,
       a.orgnum 차수, a.deptcode 부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       a.empdate   입사일,
       a.paycldate 승격일,
       decode(b.empno, null, decode(a.rvalconyn,'Y','완료','미완료'),  
                             decode(a.rvalconyn,'Y',decode(b.rvalconyn,'Y','완료','미완료'),'미완료')) 자기평가완료여부
  from pehremas a, petremas b
 where a.rabasdate = :평가기준일
   and a.restiyn = 'Y'
   and a.rabasdate = b.rabasdate(+)
   and a.empno = b.empno(+)
   and a.paycl BETWEEN '10' and '44'
   and substr(a.empno,1,1) in ('0','1','2')
 order by a.deptcode, a.empno 


--303. 평가완료 현황 자료조회
select * from 
    (select a.rabasdate 평가기준일,
            a.empno     사번,
            a.korname   성명,
            a.paycl     BAND,
            a.payra     직책,                          
            a.deptcode  부서코드,
            NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
            a.e1empno   제1차평가자,     a.e1korname  제1차평가자명,    a.e1deptcode 제1차평가자부서,
            a.e2empno   제2차평가자,     a.e2korname  제2차평가자명,    a.e2deptcode 제2차평가자부서,
            a.e3empno   제3차평가자,     a.e3korname  제3차평가자명,    a.e3deptcode 제3차평가자부서,
            decode(a.restionlyyn, 'Y', decode(a.e1empno, null, '', decode(b.ADOWN, '완료', '완료', '미완료')), 
                                       decode(a.e1empno, null, '', decode(a.e1valconyn, 'Y', decode(b.ADOWN, '완료', '완료', '미완료'), '미완료'))) 평가상태1차, 
            decode(a.restionlyyn, 'Y', decode(a.e2empno, null, '', decode(c.ADOWN, '완료', '완료', '미완료')), 
                                       decode(a.e2empno, null, '', decode(a.e2valconyn, 'Y', decode(c.ADOWN, '완료', '완료', '미완료'), '미완료'))) 평가상태2차,
            '' 평가상태3차,                      
            decode(a.restionlyyn, 'Y', '비대상', decode(a.e1empno, null, '', decode(a.e1valconyn, 'Y', '완료', '미완료'))) 업적1차,      
            decode(a.restionlyyn, 'Y', '비대상', decode(a.e2empno, null, '', decode(a.e2valconyn, 'Y', '완료', '미완료'))) 업적2차,      
            b.ADOWN 역량1차,     
            c.ADOWN 역량2차,
            ''      역량3차   
       from pehremas a,
           (select empno, 
                   decode(abconyn, 'Y', decode(beconyn,'Y', decode(duconyn,'Y','완료','미완료')),'미완료') adown     
              from pesmla
             where rabasdate = :평가기준일) b,
           (select empno, 
                   decode(abconyn, 'Y', decode(beconyn,'Y', decode(duconyn,'Y','완료','미완료')),'미완료') adown     
              from pesmlb
             where rabasdate = :평가기준일) c
      where a.rabasdate = :평가기준일
        and a.restiyn = 'Y'
        and (  ( (substr(a.rabasdate,1,4) >  2008) and (a.payra in ('C11','C15','A71')) )
            or ( (substr(a.rabasdate,1,4) <= 2008) and (a.payra in ('2C','34','38','58','16')) )
            )
        --and a.paycl BETWEEN '10' AND '44'
        AND substr(a.empno,1,1) in ('0','1','2')
        and a.empno = b.empno (+)
        and a.empno = c.empno (+)
      UNION ALL
     select a.rabasdate 평가기준일,
            a.empno     사번,
            a.korname   성명,
            a.paycl     BAND,
            a.payra     직책,                          
            a.deptcode  부서코드,
            NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
            a.e1empno   제1차평가자,     a.e1korname 제1차평가자명,     a.e1deptcode 제1차평가자부서,
            a.e2empno   제2차평가자,     a.e2korname 제2차평가자명,     a.e2deptcode 제2차평가자부서,
            a.e3empno   제3차평가자,     a.e3korname 제3차평가자명,     a.e3deptcode 제3차평가자부서,
            decode(a.restionlyyn, 'Y', decode(a.e1empno, null, '', decode(b.e1valconyn, 'Y', '완료', '미완료')), 
                                       decode(a.e1empno, null, '', decode(a.e1valconyn, 'Y', decode(b.e1valconyn, 'Y', '완료', '미완료'), '미완료'))) 평가상태1차, 
            decode(a.restionlyyn, 'Y', decode(a.e2empno, null, '', decode(b.e2valconyn, 'Y', '완료', '미완료')), 
                                       decode(a.e2empno, null, '', decode(a.e2valconyn, 'Y', decode(b.e2valconyn, 'Y', '완료', '미완료'), '미완료'))) 평가상태2차, 
            decode(a.e3empno, null, '', decode(b.e3valconyn, 'Y', '완료', '미완료')) 평가상태3차,      
            decode(a.restionlyyn, 'Y', '비대상', decode(a.e1empno, null, '', decode(a.e1valconyn, 'Y', '완료', '미완료'))) 업적1차,      
            decode(a.restionlyyn, 'Y', '비대상', decode(a.e2empno, null, '', decode(a.e2valconyn, 'Y', '완료', '미완료'))) 업적2차,      
            decode(a.e1empno, null, '', decode(b.e1valconyn, 'Y', '완료', '미완료')) 역량1차,      
            decode(a.e2empno, null, '', decode(b.e2valconyn, 'Y', '완료', '미완료')) 역량2차,      
            decode(a.e3empno, null, '', decode(b.e3valconyn, 'Y', '완료', '미완료')) 역량3차      
       from pehremas a,
           (select empno, e1valconyn, e2valconyn, e3valconyn
              from petremas
             where rabasdate = :평가기준일) b
      where a.rabasdate = :평가기준일
        and a.restiyn   = 'Y'
        and (  ( (substr(a.rabasdate,1,4) >  2008) and (a.payra in ('C11','C15','A71')) )
            or ( (substr(a.rabasdate,1,4) <= 2008) and (a.payra in ('2C','34','38','58','16')) )
            )
        --AND a.paycl BETWEEN '10' AND '44'
        AND substr(a.empno,1,1) in ('0','1','2')
        and a.empno = b.empno (+)   
   ) a   
order by a.평가상태1차, a.평가상태2차, a.평가상태3차, a.부서코드, a.BAND, a.사번   

 
--304. 팀장상향평가 완료현황 자료조회
SELECT a.rabasdate 평가기준일,
       a.empno     평가자,
       a.korname   성명,
       a.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       a.pempno    피평가자,
       a.pkorname  피평가자명,
       a.pdeptcode 피평가자부서,
       decode(a.rvalconyn, 'Y', '완료', '미완료') 평가상태 
  FROM PESREMAS a
 WHERE a.rabasdate = :평가기준일
 order by a.deptcode, a.empno


--305. 비보임상향평가 완료현황 자료조회
SELECT a.rabasdate 평가기준일,
       a.empno     피평가자,
       c.korname   피평가자성명,
       c.deptcode  피평가자부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       c.paycl     피평가자Band코드, 
       NVL((SELECT codename from pyccode WHERE codeid='I112' and codeno = c.paycl),'') 피평가자Band,
       c.payra     피평가자직책코드, 
       NVL((SELECT codename from pyccode WHERE codeid='I113' and codeno = c.payra),'') 피평가자직책,   
       a.eempno    평가자,
       a.korname   평가성명,
       a.paycl     평가자Band코드, 
       NVL((SELECT codename from pyccode WHERE codeid='I112' and codeno = a.paycl),'') 평가자Band,
       a.payra     평가자직책코드, 
       NVL((SELECT codename from pyccode WHERE codeid='I113' and codeno = a.payra),'') 평가자직책,       
       a.abconyn   공통평가상태, 
       a.beconyn   리더십평가상태        
  FROM pesmcs a, pehremas c
 WHERE a.rabasdate = :평가기준일
   and a.rabasdate = c.rabasdate
   and a.empno = c.empno
   and a.empno in (select b.empno from pehamas b where b.rabasdate = :평가기준일 and b.hyn = 'Y')
 order by a.deptcode, a.eempno


--306. 업적평가 이의신청 현황 조회
select a.empno       피평가자사번            ,
       b.korname     피평가자성명            ,
       a.PROPELTASK  중점추진업무            ,
       a.objyn       피평가자이의신청여부    ,
       a.objsayu     피평가자이의신청사유    ,
       b.rvalobjyn   피평가자이의신청완료여부,
       b.e1empno     "1차평가자사번"         ,
       b.e1korname   "1차평가자성명"         ,
       b.e1opinionyn "1차평가자소견확인여부" ,
       a.objopinion  "평가자평가사유"        ,
       b.e2empno     "2차평가자사번"         ,
       b.e2korname   "2차평가자성명"         
  from pehreaim_det a, pehremas b
 where a.rabasdate = :평가기준일 
   and a.rabasdate = b.rabasdate
   and a.empno     = b.empno
   and (a.objyn = 'Y' or a.objsayu is not null)
 order by a.empno, a.seqno






--팀별최종완료현황 자료조회(삭제) 
select a.rabasdate 평가기준일,
       a.empno     사번,
       a.korname   성명,
       b.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       decode(c.empno, null, decode(a.valconyn, 'Y', '완료', '미완료'),  
                             decode(a.valconyn, 'Y', decode(a.valconyn1, 'Y', '완료', '미완료'), '미완료')) 평가상태, 
       a.valconyn 하향평가,
       a.valconyn1 팀장하향평가,
       c.empno
  from pehreclose a, pimpmas b,
      (select e1empno empno       
         from pehremas 
        where rabasdate = :평가기준일
          and substr(e1empno,1,1) = 'M'
        group by e1empno
        union
       select e2empno empno       
         from pehremas 
        where rabasdate = :평가기준일
        group by e2empno
        union        
       select e3empno empno
         from pehremas 
        where rabasdate = :평가기준일
        group by e3empno) c 
 where a.rabasdate = :평가기준일
   and a.empno = b.empno 
   and a.empno = c.empno(+)
 order by a.empno 


select * from pehreclose  where rabasdate = :평가기준일