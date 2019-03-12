--401. 개별_공동 사원목표 자료조회
select * from
      (select a.rabasdate 평가기준일,  a.empno 사번,  b.korname 성명, b.deptcode 부서코드,
              NVL((select deptname from pycdept where b.orgnum = orgnum and b.deptcode = deptcode),'') 부서명,
              '개별목표'  목표구분,
              a.seqno     No,
              propeltask  중점추진업무,
              mainweight  비중,
              DECODE(d.cnt,1,detailtask1,  2,detailtask2,  3,detailtask3,  4,detailtask4,  5,detailtask5  ) 세부추진활동,
              DECODE(d.cnt,1,detailweight1,2,detailweight2,3,detailweight3,4,detailweight4,5,detailweight5) 세부추진비중,
              DECODE(d.cnt,1,validx1,      2,validx2,      3,validx3,      4,validx4,      5,validx5      ) 평가지표,
              DECODE(d.cnt,1,bresultclass1,2,bresultclass2,3,bresultclass3,4,bresultclass4,5,bresultclass5) 평가기준목표,
              DECODE(d.cnt,1,valfunction1, 2,valfunction2, 3,valfunction3, 4,valfunction4, 5,valfunction5 ) 평가산식,
              DECODE(d.cnt,1,SRESULTCLASS1,2,SRESULTCLASS2,3,SRESULTCLASS3,4,SRESULTCLASS4,5,SRESULTCLASS5) 달성목표S,
              DECODE(d.cnt,1,ARESULTCLASS1,2,ARESULTCLASS2,3,ARESULTCLASS3,4,ARESULTCLASS4,5,ARESULTCLASS5) 달성목표A,
              DECODE(d.cnt,1,BRESULTCLASS1,2,BRESULTCLASS2,3,BRESULTCLASS3,4,BRESULTCLASS4,5,BRESULTCLASS5) 달성목표B,
              DECODE(d.cnt,1,CRESULTCLASS1,2,CRESULTCLASS2,3,CRESULTCLASS3,4,CRESULTCLASS4,5,CRESULTCLASS5) 달성목표C,
              DECODE(d.cnt,1,DRESULTCLASS1,2,DRESULTCLASS2,3,DRESULTCLASS3,4,DRESULTCLASS4,5,DRESULTCLASS5) 달성목표D
         from pehreaim_det a, pehremas b,
             (SELECT ROWNUM cnt FROM pimpmas WHERE ROWNUM < 6 ) d
        where a.rabasdate = :평가기준일
          and a.empno = b.empno
          and a.rabasdate = b.rabasdate
          and DECODE(d.cnt,1,detailtask1,2,detailtask2,3,detailtask3,4,detailtask4,5,detailtask5) is not null
        UNION ALL
       select a.rabasdate  평가기준일, a.empno 사번, c.korname 성명,  c.deptcode 부서코드,
              NVL((select deptname from pycdept where c.orgnum = orgnum and c.deptcode = deptcode),'') 부서명,
              '공동목표'     목표구분,
              a.taskcode     No,
              b.taskname     중점추진업무,
              a.mainweight   비중,
              a.detailtask   세부추진활동,
              a.detailweight 세부추진비중,
              a.validx       평가지표,
              a.bresultclass 평가기준목표,
              a.valfunction  평가산식,
              SRESULTCLASS   달성목표S,
              ARESULTCLASS   달성목표A,
              BRESULTCLASS   달성목표B,
              CRESULTCLASS   달성목표C,
              DRESULTCLASS   달성목표D
         from pehreaim_comdet a, pehreaim_bas b, pehremas c
        where a.rabasdate = :평가기준일
          and a.rabasdate = b.rabasdate
          and substr(a.deptcode,1,4) = substr(b.deptcode,1,4)
          and a.taskcode = b.taskcode
          and a.rabasdate = c.rabasdate
          and a.empno = c.empno
          ) a
 order by 사번, 목표구분, No

--402. 목표등록의 비중의 합이 100이 안되는 사원 현황 조회
select empno 사번, 
      (select korname from pimpmas where empno= a.empno) 성명,
       sum(hap) 비중합
  from (
        select empno, seqno taskcode, max(a.mainweight) hap
          from pehreaim_det a
         where rabasdate = :평가기준일
         group by empno, seqno
         union all
        select a.empno, a.taskcode, max(a.mainweight) hap
          from pehreaim_comdet a, pehreaim_bas b
         where a.rabasdate = :평가기준일
           and a.rabasdate = b.rabasdate
           and substr(a.deptcode,1,4) = substr(b.deptcode,1,4)
           and a.taskcode = b.taskcode
         group by a.empno, a.taskcode
        ) a
 group by empno
having sum(hap) <> 100

--403. 목표등록을 완료하지 못했거나 직상위자에게 승인을 받지 못한 사원 조회
select a.empno 사번, b.korname 성명, b.deptcode 현부서코드 ,
      (select deptname from pycdept where orgnum=b.orgnum and deptcode = b.deptcode) 현부서명,
      (select codename from pyccode where codeid = 'I113' and codeno = b.payra)  직책,
      (select codename from pyccode where codeid = 'I114' and codeno = b.pstate) 인사상태,
       decode(d.empno, null, 'N','Y') 목표등록,
       a.rprjconyn  결재상신,
       a.e1prjobjyn 반려여부, 
       a.e1prjconyn 승인여부
 from pehremas a, pimpmas b,
      (select empno from pehreaim_det    where rabasdate = :평가기준일
        union
       select empno from pehreaim_comdet where rabasdate = :평가기준일) d
where a.empno     = b.empno
  and a.empno     = d.empno(+)
  and a.reconyn   = 'Y'
  and a.rabasdate = :평가기준일
order by decode(d.empno, null, 'N','Y'),a.rprjconyn,a.e1prjobjyn, a.e1prjconyn, a.empno

--404. 사원목표등록 피평가자 완료 여부
select b.empno 사번,  b.korname 성명,
       (select deptname from pycdept where b.orgnum = orgnum and b.deptcode = deptcode) 부서명,
       (SELECT codename FROM pyccode WHERE codeid   = 'I113' AND codeno     = b.payra ) 직책,
       b.rprjconyn  목표등록완료여부,
       b.e1empno    평가자사번,
       b.e1korname  평가자명,
       b.e1prjconyn 평가자결재여부,
       b.e1prjobjyn 평가자반려여부
  from pehremas b
 where b.rabasdate = :평가기준일
   and b.reconyn = 'Y'
 order by b.rprjconyn desc, b.empno

--405. 공동목표 등록하지 않은 팀장 현황 조회
select a.empno 사번,  b.korname  이름,  
       b.deptcode 부서코드,
      (select deptname from pycdept where b.orgnum = orgnum and b.deptcode = deptcode) 부서명,
      (select codename from pyccode where codeid='I113' and codeno = a.payra) 직책,
       a.yn 목표설정여부  
  from pimpmas b,		
      (select distinct a.empno, a.paycl, a.payra, a.senioryn, a.deptcode,
              decode(b.deptcode,null,'N','Y') yn                                                                
         from pehreaim_combas a  , (select * from pehaimhis_com where rabasdate = :평가기준일) b    
        where a.rabasdate = :평가기준일
          and a.senioryn  = 'Y'
          and a.deptcode  = b.deptcode(+)
       ) a
 where b.empno = a.empno  	
 order by a.yn, a.empno, b.deptcode
 

--406. 사원목표등록 팀장 결재 여부
select b.empno   사번,
       b.korname 성명,
       NVL((select deptname from pycdept where b.orgnum = orgnum and b.deptcode = deptcode),'') 부서명,
     --NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = b.paycl),'') BAND,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = b.payra),'') 직책,
       b.rprjconyn  목표등록완료여부,
       b.e1empno    평가자사번,
       b.e1korname  평가자명,
       b.e1prjconyn 평가자결재여부,
       b.e1prjobjyn 평가자반려여부
  from pehremas b
 where b.rabasdate = :평가기준일
   and b.reconyn   = 'Y'
   and b.rprjconyn = 'Y'
 order by b.e1prjconyn desc, b.empno