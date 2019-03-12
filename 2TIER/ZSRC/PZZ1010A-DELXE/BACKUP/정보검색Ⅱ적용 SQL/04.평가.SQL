--201. 정규직 평가대상자 자료조회
select a.rabasdate 평가기준일,  a.empno 사번,  a.korname 성명, a.orgnum 차수, a.deptcode 부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I114' AND codeno = a.pstate),'') 인사상태,
       a.jobkind   직종코드, NVL((SELECT DUTYKINDNAME FROM pishrdukind WHERE dutykind = a.jobkind),'') 직종,       
       a.paycl     BAND코드, NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl ),'') BAND,
       a.jobgun    직군코드, NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.payra     직책코드, NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra ),'') 직책,       
       a.empdate   입사일,
       a.paycldate 승격일,
       decode(a.restiyn,'Y','Y','평가제외') 업적평가대상여부 ,
       a.reconyn     목표수립대상여부 ,
       a.prjexcode   목표수립대상제외코드,
       a.prjexmark   목표수립대상제외사유,
       a.prjexfrdate 목표수립대상제외기간,
       a.prjextodate 목표시립대상제외기간,
       a.valexcode   업적평가대상제외코드,
       a.valexmark   업적평가대상제외사유,  
       a.e1empno     제1차평가자,
       a.e1korname   제1차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e1paycl),'') 제1차평가자직책,
       a.e1deptcode 제1차평가자부서,
       a.E1PRJCONYN 제1차목표수립확인여부,
       a.E1VALVIEW  제1차평가완료여부,
       a.e2empno    제2차평가자,
       a.e2korname  제2차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e2paycl),'') 제2차평가자직책,
       a.e2deptcode 제2차평가자부서,
       a.E2PRJCONYN 제2차목표수립확인여부,
       a.E2VALVIEW  제2차평가완료여부,       
       a.e3empno    제2차평가자,
       a.e3korname  제2차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e3paycl),'') 제2차평가자직책,
       a.e3deptcode 제2차평가자부서,
       a.E3PRJCONYN 제2차목표수립확인여부,
       a.E3VALVIEW  제2차평가완료여부,       
       a.SHIFTYN    전환배치충족여부
  from pehremas a
 where a.rabasdate = :평가기준일 
 order by a.deptcode, a.empno 


--202. 특정직 평가대상자 자료조회
select a.rabasdate 평가기준일,
       a.empno     사번,
       a.korname   성명,
       a.paycl     BAND코드, NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl ),'') BAND,
       a.orgnum    차수, a.deptcode 부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       a.empdate    입사일,
       decode(a.EXYN,'Y','Y','평가제외') 평가대상여부 ,
       a.e1empno    제1차평가자,
       a.e1korname  제1차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e1paycl),'') 제1차평가자직책,
       a.e1deptcode 제1차평가자부서,
       a.E1CONYN    제1차평가여부,
       a.e2empno    제2차평가자,
       a.e2korname  제2차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e2paycl),'') 제2차평가자직책,
       a.e2deptcode 제2차평가자부서,
       a.E2CONYN    제2차평가완료여부
  from PEMSPMAS a
 where a.rabasdate = :평가기준일
 order by a.deptcode, a.empno  


--203. 역량평가 대상자 자료조회
select a.rabasdate 평가기준일,
       a.empno     사번,
       a.korname   성명,
       a.paycl     BAND코드, NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl ),'') BAND,
       a.jobgun    직군코드, NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.payra     직책코드, NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra ),'') 직책,
       a.orgnum    차수,
       a.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명,
       a.syn       자기평가대상여부,
       a.exmarks   자기평가대상제외사유,
       a.hyn       상향평가대상여부,
       a.exmarkh   상향평가대상제외사유,
       a.layn      하향1차평가대상여부,
       a.exmarkla  하향1차평가제외사유,
       a.lbyn      하향2차평가대상여부,
       a.exmarklb  하향2차평가제외사유,
       a.cyn       동료평가대상여부,
       a.exmarkc   동료평가제외사유
  from pehamas a
 where rabasdate =  :평가기준일
 order by a.jobgun

--204. 자기평가 대상자 자료조회
select a.rabasdate 평가기준일,
       a.empno     사번,
       a.korname   성명,
       a.paycl     BAND코드, NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl ),'') BAND,
       a.jobgun    직군코드, NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.payra     직책코드, NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra ),'') 직책,       
       a.orgnum    차수,
       a.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명
  from pesms a
 where a.rabasdate = :평가기준일       
 order by a.jobgun, paycl

--205. 동료평가 대상자 자료조회
select a.rabasdate 평가기준일,
       a.empno     피평가자사번,
       b.korname   피평가자성명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = b.paycl),'') 피평가자BAND,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = b.payra),'') 피평가자직책,
       a.eempno    평가자사번,
       a.korname   평가자성명,
       a.paycl     평가자BAND코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'') 평가자BAND,
       a.payra     평가자직책코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'') 평가자직책,
       NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.orgnum    차수,
       a.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명
  from pesmcs a, pehremas b
 where a.empno = b.empno
   and a.rabasdate = :평가기준일
   and a.rabasdate = b.rabasdate


--206. 하향1차 평가자 자료조회
select a.rabasdate 평가기준일,
       a.empno     피평가자사번,
       b.korname   피평가자성명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = b.paycl),'') 피평가자BAND,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = b.payra),'') 피평가자직책,
       a.eempno    평가자사번,
       a.korname   평가자성명,
       a.paycl     평가자BAND코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'') 평가자BAND,
       a.payra     평가자직책코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'') 평가자직책,
       NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.orgnum    차수,
       a.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명
  from pesmla a, pehremas b
 where a.rabasdate = :평가기준일
   and a.rabasdate = b.rabasdate
   and a.empno = b.empno

--207. 하향2차 평가자 조회
select a.rabasdate 평가기준일,
       a.empno     피평가자사번,
       b.korname   피평가자성명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = b.paycl),'') 피평가자BAND,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = b.payra),'') 피평가자직책,
       a.eempno    평가자사번,
       a.korname   평가자성명,
       a.paycl     평가자BAND코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'') 평가자BAND,
       a.payra     평가자직책코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'') 평가자직책,
       NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.orgnum    차수,
       a.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명
  from pesmlb a, pehremas b
 where a.rabasdate = :평가기준일
   and a.rabasdate = b.rabasdate
   and a.empno = b.empno


--208. 비보임 상향평가자 자료조회
select a.rabasdate 평가기준일,
       a.empno     피평가자사번,
       b.korname   피평가자성명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = b.paycl),'') 피평가자BAND,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = b.payra),'') 피평가자직책,
       a.eempno    평가자사번,
       a.korname   평가자성명,
       a.paycl     평가자BAND코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'') 평가자BAND,
       a.payra     평가자직책코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'') 평가자직책,
       NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'') 직군,
       a.orgnum    차수,
       a.deptcode  부서코드,
       NVL((select deptname from pycdept where a.orgnum = orgnum and a.deptcode = deptcode),'') 부서명
  from pesmhs a, pehremas b
 where a.rabasdate = :평가기준일
   and a.rabasdate = b.rabasdate
   and a.empno     = b.empno

--209. 자기평가완료 현황조회
select a.empno     사번,                                                                        
       a.korname   성명,                                                                        
       a.paycl band, NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'') BAND명,
       a.payra 직책, NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'') 직책명,
       A.ORGNUM    조직차수,
	   NVL((SELECT deptname FROM pycdept WHERE orgnum=A.ORGNUM AND deptcode = a.deptcode),'') 소속,               
       decode(b.empno, null, decode(a.rvalconyn,'Y','완료','미완료'),                     
       decode(a.rvalconyn,'Y',decode(b.rvalconyn,'Y','완료','미완료'),'미완료')) 자기평가완료여부 
  from pehremas a, petremas b                                                                                        
 where a.rabasdate = :lrabasdate                                                                                    
   and a.restiyn = 'Y'                                                                                              
   and a.rabasdate = b.rabasdate(+)                                                                                   
   and a.empno = b.empno(+)                                                                                         
   AND substr(a.empno,1,1) in ('0','1','2')  

--210. 팀장평가 현황 자료조회
select a.rabasdate 평가기준일,
       a.empno     사번,
       a.korname   성명,
       a.deptcode  부서코드,
       nvl((select deptname from pycdept where orgnum=a.orgnum and deptcode=a.deptcode),'') 부서명,
       a.jobgun    직군코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I115' AND codeno = a.jobgun),'')  직군,
       a.paycl     BAND코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'')   BAND,
       a.payra     직책코드,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'')   직책,
       NVL((SELECT codename FROM pyccode WHERE codeid='I114' AND codeno = a.pstate),'')  인사상태,
       a.empdate   입사일,
       a.paycldate 승격일,
       a.RVALCONYN 자기평가완료,
       a.e1empno    제1차평가자,
       a.e1korname  제1차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e1paycl),'') 제1차평가자BAND,
       a.e1deptcode 제1차평가자부서,
       a.E1VALCONYN 제1차평가완료,       
       a.e2empno    제2차평가자,
       a.e2korname  제2차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e2paycl),'') 제2차평가자BAND,
       a.e2deptcode 제2차평가자부서,
       a.E2VALCONYN 제2차평가완료,	       
       a.e3empno    제3차평가자,
       a.e3korname  제3차평가자명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.e3paycl),'') 제3차평가자BAND,
       a.e3deptcode 제3차평가자부서,
       a.E3VALCONYN 제3차평가완료       
  from petremas a
 where a.rabasdate = :평가기준일
 order by 5,a.empno 

--211. 팀장 상향평가 자료조회
select a.rabasdate 평가기준일,
       a.empno     평가자사번,
       a.korname   평가자성명,
       NVL((SELECT codename FROM pyccode WHERE codeid='I112' AND codeno = a.paycl),'') 평가자band,
       NVL((SELECT codename FROM pyccode WHERE codeid='I113' AND codeno = a.payra),'') 평가자직책,
       a.deptcode  평가자부서코드,
       nvl((select deptname from pycdept where orgnum=a.orgnum and deptcode=a.deptcode),'') 평가자부서명,
       a.pempno    피평가자사번,
       a.pkorname  피평가자성명,
       a.pdeptcode 피평가자부서코드,
       nvl((select deptname from pycdept where orgnum=a.orgnum and deptcode=a.deptcode),'') 피평가자부서명,
       a.RVALCONYN 상향평가완료여부
  from pesremas a
 where a.rabasdate = :평가기준일 

--220. 팀장 상사(하향)평가 점수 조회
SELECT T1.EMPNO 사번,
       T1.KORNAME 성명,
      (select jobgun   from pehremas where rabasdate =:평가기준일 and empno =T1.empno) 직군코드,
      (Select CODENAME From PYCCODE  Where CODEID    = 'I115' 
          AND CODENO = (select jobgun from pehremas where rabasdate =:평가기준일 and empno =T1.empno) ) 직군명,
      (select jobkind  from pehremas where rabasdate =:평가기준일 and empno =T1.empno) 직종코드,
      (select dutykindname  from pishrdukind where dutykind = (select jobkind from pehremas where rabasdate =:평가기준일 and empno =T1.empno)) 직종명,--jobfield = hh.jobgun and  
       T1.DEPTCODE 부서코드,                       
       (Select NVL(DEPTNAME||' '||DEPTNA3,'') From Pycdept Where orgnum = T1.orgnum And Deptcode = T1.Deptcode) 부서명,
       T1.PAYRA 직책코드,  (Select CODENAME From PYCCODE Where CODEID = 'I113' AND CODENO = T1.PAYRA ) 직책,
       T1.PAYCL BAND코드,  (Select CODENAME From PYCCODE Where CODEID = 'I112' AND CODENO = T1.PAYCL ) BAND,
       DECODE(T1.RVALCONYN, 'Y','완료','미완료') 자기평가여부,
       DECODE(T1.E1VALCONYN,'Y','완료','미완료') "1차평가여부",
       DECODE(T1.E2EMPNO,null,null,decode(T1.E2VALCONYN,'Y','완료','미완료')) "2차평가여부",
       T1.E1EMPNO "1차평가자사번",
       T1.E1KORNAME "1차평가자성명",
       T1.E2EMPNO "2차평가자사번",
       T1.E2KORNAME "2차평가자성명",
       DECODE(TH.Cscore,0,'',TH.Cscore) 상향평가점수,
       decode(nvl(TW.WSCORE,0),0,'',TW.WSCORE) 업적1차점수,
       DECODE(Ts.E1CSCORE,0,'',Ts.E1CSCORE) 공통역량1차점수,
       DECODE(Ts.E1LSCORE,0,'',Ts.E1LSCORE) 리더십역량1차점수,
       DECODE(T1.E1SCORE,0,'',T1.E1SCORE) 역량1차점수,
       DECODE(Ts.E2CSCORE,0,'',Ts.E2CSCORE) 공통역량2차점수,
       DECODE(Ts.E2LSCORE,0,'',Ts.E2LSCORE) 리더십역량2차점수,
       DECODE(T1.E2SCORE,0,'',T1.E2SCORE) 역량2차점수
  FROM PETREMAS T1,             
      (SELECT A.EMPNO,round(B.ESCORE,2) WSCORE
         FROM PEHREMAS A,       
             (SELECT EMPNO,SUM(ESCORE) ESCORE FROM PEHREAIM_DET 
               WHERE RABASDATE =:평가기준일 GROUP BY EMPNO) B   
        WHERE A.RABASDATE = :평가기준일                       
          AND A.RESTIYN   = 'Y'                               
          AND A.EMPNO = B.EMPNO ) TW,
      (select c.empno,c.E1cscore,c.E2cscore,l.E1lscore,l.E2lscore from       
             (select empno,round(avg(E1score),4) E1cscore,0 E1lscore,round(avg(E2score),4) E2cscore,0 E2lscore                              
                from petds    
               where rabasdate = :평가기준일
                 and ekind = '공통역량'                               
               group by empno) c,
             (select empno,0 E1cscore,round(avg(E1score),4) E1lscore,0 E2cscore,round(avg(E2score),4) E2lscore                             
                from petds    
               where rabasdate = :평가기준일
                 and ekind = '리더십역량'                               
               group by empno) l 
       where c.empno = l.empno
       )   TS,     
     (select pempno,pdeptcode,round(avg(elscore),2) Cscore                
             ,round(avg(evscore),2) Vscore                                
        from pesremas                                                     
       where rabasdate = :평가기준일                               
         and RVALCONYN = 'Y'                                            
       group by pempno,pdeptcode) TH                                     
 WHERE T1.RABASDATE = :평가기준일                                   
   AND T1.EMPNO    = TW.EMPNO(+)                                        
   AND T1.EMPNO    = TH.PEMPNO(+)                                            
   AND T1.DEPTCODE = TH.PDEPTCODE(+)  
   and t1.empno    = ts.empno(+)

--221. 팀원 상사(하향)평가 점수 조회
Select NVL(HH.Empno, ' ')         사번    ,
       NVL(HH.KORNAME,' ')         성명    ,
       NVL(HH.deptcode,' ')        부서코드,
      (Select NVL(DEPTNAME||' '||DEPTNA3,'') From Pycdept Where orgnum = HH.orgnum And Deptcode = HH.Deptcode) 부서명,
       HH.PAYRA  직책코드, (Select CODENAME From PYCCODE   Where CODEID = 'I113' AND CODENO = HH.PAYRA )      직책명,
       HH.PAYCL  BAND코드, (Select CODENAME From PYCCODE   Where CODEID = 'I112' AND CODENO = HH.PAYCL )      BAND명,
       hh.jobgun 직군코드, (Select CODENAME From PYCCODE   Where CODEID = 'I115' AND CODENO = HH.jobgun )     직군명,
       hh.jobkind 직종코드,
      (select dutykindname  from pishrdukind where  dutykind = hh.jobkind) 직종명,--jobfield = hh.jobgun and
       HH.E1Empno                   "1차평가자사번"  ,
       HH.E1korname                 "1차평가자성명"  ,
       HH.E2Empno                   "2차평가자사번"  ,
       HH.E2korname                 "2차평가자성명"  ,
       NVL(com.ASELF,' ')           자기평가여부     ,
       NVL(com.ADOWN1,' ')          "1차평가여부"    ,
       NVL(com.ADOWN2,' ')          "2차평가여부"    ,
       DECODE(HH.RVALOBJYN,NULL,'진행전','X','미합의','Y','신청','N','미신청') 이의제기여부,
       round(HH.ESCORE,4)           "1차업적점수",
       round(com.HSCORE,4)          "상향평가리더십점수",
       round(com.comSCR1,4)         "1차공통역량점수"    ,
       round(com.ldrSCR1,4)         "1차리더십역량점수",
       round(com.dutSCR1,4)         "1차직무역량점수",
       round(com.ABILSCR1,4)        "1차역량점수",
       round(com.comSCR2,4)         "2차공통역량점수"    ,
       round(com.ldrSCR2,4)         "2차리더십역량점수",
       round(com.dutSCR2,4)         "2차직무역량점수",
       round(com.ABILSCR2,4)        "2차역량점수"
 From
   (select ss.empno,Aself,HSCORE,e1empno,comscr1,ldrscr1,dutscr1,ABILSCR1,adown1,e2empno,comscr2,ldrscr2,dutscr2,ABILSCR2,adown2 from
         (Select --'자기' GUBUN,
                 A.Empno,
                 Decode(B.EVCNO,'1',DECODE(B.SYN,'Y',DECODE(A.ABCONYN,'Y',DECODE(A.BECONYN,'Y',DECODE(A.DUCONYN,'Y','완료','미완료')),'미완료'),'비대상'),
                                    DECODE(B.SYN,'Y',DECODE(A.ABCONYN,'Y',DECODE(A.DUCONYN,'Y','완료','미완료'),'미완료'),'비대상')           )      ASELF 
            From PESMS A,PEHAMAS B                                           
           Where A.RabasDate = :평가기준일                             
             AND A.RabasDate = B.RabasDate                                    
             AND A.Empno     = B.Empno                                        
             AND B.EVCNO    in ('1','2')                                  
          ) SS,
         (Select Empno,NVL(ROUND(AVG(SCORE),2),0) HSCORE  From PESDC                                     
           Where RabasDate = :평가기준일 AND EKIND = '리더십역량' AND length(EEmpno) = 16        
           Group By Empno                                                                       ) YY,
         (Select --'1차' GUBUN,
                 A.Empno,A.EEmpno E1empno, 
                 round(Decode(B.EVCNO,'1',C.comscr1,D.comscr1),4) comscr1,
                 round(Decode(B.EVCNO,'1',C.ldrscr1,D.ldrscr1),4) ldrscr1,
                 round(Decode(B.EVCNO,'1',C.dutscr1,D.dutscr1),4) dutscr1, 
                 round(Decode(B.EVCNO,'1',C.ABILSCR1,D.ABILSCR1),4) ABILSCR1,
                 Decode(B.EVCNO,'1',DECODE(B.LAYN,'Y',DECODE(A.ABCONYN,'Y',DECODE(A.BECONYN,'Y',DECODE(A.DUCONYN,'Y','완료','미완료')),'미완료'),' ') ,
                                    DECODE(B.LAYN,'Y',DECODE(A.ABCONYN,'Y',DECODE(A.DUCONYN,'Y','완료','미완료'),'미완료'),'비대상')           )   ADOWN1
            From PESMLA A,PEHAMAS B,    
                (Select Empno,EEmpno,   
                        AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr1, 
                        AVG(DECODE(EKIND,'리더십역량',SCORE)) ldrscr1,
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr1,
                       (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                        AVG(DECODE(EKIND,'리더십역량',SCORE))*0.3+          
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.2) ABILSCR1  
                   From PESDL                                                 
                  Where RabasDate = :평가기준일                        
                  Group By Empno,EEmpno  ) C, 
                (Select Empno,EEmpno,   
                        AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr1,
                        null                                  ldrscr1, 
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr1,
                        (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.5) ABILSCR1
                   From PESDL                                                 
                  Where RabasDate = :평가기준일                        
                  Group By Empno,EEmpno  ) D                                 
           Where A.RabasDate = :평가기준일                             
             AND A.RabasDate = B.RabasDate   AND A.Empno = B.Empno            
             AND A.Empno     = C.Empno(+)    AND A.Empno = D.Empno(+)         
             AND A.EEmpno    = C.EEmpno(+)   AND A.EEmpno= D.EEmpno(+)        
             AND B.EVCNO    in ('1','2')                                  
          ) BB,                          
         (Select --'2차' GUBUN,
                 A.Empno,A.EEmpno E2empno, 
                 round(Decode(B.EVCNO,'1',C.comscr2,D.comscr2),4) comscr2,
                 round(Decode(B.EVCNO,'1',C.ldrscr2,D.ldrscr2),4) ldrscr2,
                 round(Decode(B.EVCNO,'1',C.dutscr2,D.dutscr2),4) dutscr2, 
                 round(Decode(B.EVCNO,'1',C.ABILSCR2,D.ABILSCR2),4) ABILSCR2, 
                 Decode(B.EVCNO,'1',DECODE(B.LBYN,'Y',DECODE(A.ABCONYN,'Y',DECODE(A.BECONYN,'Y',DECODE(A.DUCONYN,'Y','완료','미완료'),'미완료'),'미완료'),' '),
                                    DECODE(B.LBYN,'Y',DECODE(A.ABCONYN,'Y',DECODE(A.DUCONYN,'Y','완료','미완료'),'미완료'),' ')               )   ADOWN2
            From PESMLB A,PEHAMAS B,    
                (Select Empno,EEmpno,   
                        AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr2,
                        AVG(DECODE(EKIND,'리더십역량',SCORE)) ldrscr2,
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr2,
                       (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                        AVG(DECODE(EKIND,'리더십역량',SCORE))*0.3+          
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.2) ABILSCR2 
                   From PESDL                                                 
                 Where RabasDate = :평가기준일                         
                 Group By Empno,EEmpno  ) C,
                (Select Empno,EEmpno,   
                        AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr2,
                        null                                  ldrscr2, 
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr2,
                       (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                        AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.5) ABILSCR2
                   From PESDL                                                 
                 Where RabasDate = :평가기준일                         
                 Group By Empno,EEmpno  ) D                                  
           Where A.RabasDate = :평가기준일                             
             AND A.RabasDate = B.RabasDate  AND A.Empno = B.Empno             
             AND A.Empno     = C.Empno(+)   AND A.Empno = D.Empno(+)          
             AND A.EEmpno    = C.EEmpno(+)  AND A.EEmpno= D.EEmpno(+)         
             AND B.EVCNO    in ('1','2')                                  
          ) CC
        where ss.empno = bb.empno(+)
          and ss.empno = YY.empno(+)
          and ss.empno = cc.empno(+)) com,                          
    (Select --DECODE(:평가자사번,A.E1Empno,'1차',E2Empno,'2차',E3Empno,'2차') GUBUN, A.PGROUP,
            A.Empno,E2VALOBJYN,A.KORNAME,A.PAYCL,A.PAYRA,A.ORGNUM,A.Deptcode,a.jobgun,a.jobkind,
            A.E1Empno,A.E1korname,A.E2Empno,A.E2korname,A.E3Empno,A.E3korname,RVALOBJYN,        
            DECODE(A.RESTIONLYYN,'Y','비대상',DECODE(A.RVALCONYN ,'Y','완료','미완료')) SELF,
            DECODE(A.RESTIONLYYN,'Y','비대상',DECODE(A.E1VALCONYN,'Y','완료','미완료')) DOWN1, 
--            DECODE(A.EBREmpno,NULL,' ',DECODE(EBRVALCONYN ,'Y','완료','미완료')) DOWNEBR,
            DECODE(A.RESTIONLYYN,'Y','비대상',              
                   DECODE(A.E2Empno,NULL,' ',             
                          DECODE(E2VALCONYN,'Y','완료','N',
                                 DECODE(E2VALOBJYN,'Y','반려중','미완료'),'미완료'))) DOWN2,
           (Select sum(escore)                                                                       
              From (Select t1.Empno,nvl(round(t1.seldata * t2.mainweight * 0.01,2),0) escore        
                      From (Select c.Empno,a.taskcode,substr(a.Deptcode,1,4) Deptcode,
                                   nvl(round(sum((a.detailrscore*a.detailweight)/100),2),0) seldata  
                              From pehaimhis_com a,pehreaim_bas b,pehremas c                       
                             Where a.RabasDate = :평가기준일 and a.RabasDate = b.RabasDate    
                               and a.RabasDate = c.RabasDate        and a.taskcode  = b.taskcode     
                               and nvl(a.eobjyn,'N') <> 'Y'     and nvl(a.econyn,'N') = 'Y'  
                               and substr(a.Deptcode,1,4) = substr(c.Deptcode,1,4)                   
                               and SUBSTR(a.Deptcode,1,4) = SUBSTR(b.Deptcode,1,4)                   
                             Group By c.Empno,a.taskcode,substr(a.Deptcode,1,4)         ) t1,
                           (Select distinct a.Empno,substr(a.Deptcode,1,4) Deptcode, 
                                   a.taskcode,a.mainweight                                          
                              From pehreaim_comdet a,pehremas b                                     
                             Where a.RabasDate = :평가기준일 and a.RabasDate = b.RabasDate    
                          and a.Empno     = b.Empno                                  ) t2       
                       Where t1.Deptcode = t2.Deptcode                                                 
                         and t1.taskcode = t2.taskcode   and t1.Empno = t2.Empno                       
                       union all                                                                       
                      Select Empno,SUM(ECONTRSCR) ESCORE From PEHREAIM_SCR                            
                     Where RabasDate =:평가기준일   Group By Empno                            
                       union all                                                                       
                      Select Empno,SUM(ESCORE)    ESCORE From PEHREAIM_DET                            
                     Where RabasDate =:평가기준일   Group By Empno )                          
            Where Empno = A.Empno                                                                    
               Group By Empno ) ESCORE                                                                
       From PEHREMAS A                                                                               
      Where  A.RabasDate = :평가기준일 AND A.RESTIYN = 'Y'
     ) HH          
Where HH.Empno  = com.Empno(+)    
  AND hh.empno not in (select empno from petremas where rabasdate = :평가기준일)
--  and (hh.E1Empno=:평가자사번 OR hh.E2Empno=:평가자사번 OR hh.E3Empno=:평가자사번) 

--222. 팀장 상사(하향)평가 의견 조회
select a.empno 사번, a.Korname 성명,
       b.jobgun  직군, (Select CODENAME From PYCCODE   Where CODEID = 'I115' AND CODENO = b.jobgun) 직군명,
       b.jobkind 직종, (select dutykindname from pishrdukind where dutykind = b.jobkind) 직종명,
       a.payra   직책, (select codename from pyccode where codeid = 'I113' and codeno = a.payra) 직책명,
       a.paycl   BAND, (select codename from pyccode where codeid = 'I112' and codeno = a.paycl) BAND명,
       a.deptcode 부서코드, (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) 부서명,
       a.e1empno "1차평가자사번", a.e1Korname "1차평가자성명",
       a.e1payra "1차평가자직책", (select codename from pyccode where codeid = 'I113' and codeno = a.e1payra) "1차평가자직책명",
       a.e1paycl "1차평가자BAND", (select codename from pyccode where codeid = 'I112' and codeno = a.e1paycl) "1차평가자BAND명",
       a.e1deptcode "1차부서코드", (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e1deptcode) "1차부서명", 
       a.e2empno "2차평가자사번", a.e2Korname "2차평가자성명",
       a.e2payra "2차평가자직책", (select codename from pyccode where codeid = 'I113' and codeno = a.e2payra) "2차평가자직책명",
       a.e2paycl "2차평가자BAND", (select codename from pyccode where codeid = 'I112' and codeno = a.e2paycl) "2차평가자BAND명",
       a.e2deptcode "2차부서코드", (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e2deptcode) "2차부서명", 
       a.E1OPINION2 역량평가의견, 
       a.E1OPINION3 업적평가의견, 
       a.E1VALVIEW "1차종합의견",
       a.E2VALVIEW "2차종합의견",
       E1BANDTEXT 향후개발능력, decode(E1MOVEDEPT,1,'부문내',2,'타부문',3,'기타') 이동, E1MOVETEXT 이동의견, 
       decode(E1STUDY,1,'장기연수-국내',2,'장기연수-해외',3,'외부연구과정',4,'기타') 교육훈련, E1STUDYTEXT 교육훈련의견
  from petremas a, pehremas b
 where a.rabasdate =:평가기준일
   and b.rabasdate =:평가기준일 
   and a.empno     = b.empno

--223. 팀원 상사(하향)평가 의견 조회
select empno   사번, Korname 성명,
       payra   직책, (select codename from pyccode where codeid = 'I113' and codeno = a.payra) 직책명,
       paycl   BAND, (select codename from pyccode where codeid = 'I112' and codeno = a.paycl) BAND명,
       jobgun  직군, (Select CODENAME From PYCCODE Where CODEID = 'I115' AND CODENO = a.jobgun ) 직군명,
       jobkind 직종, (select dutykindname  from pishrdukind where  dutykind = a.jobkind) 직종명,      --jobfield = hh.jobgun and 
       deptcode 부서코드, (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) 부서명,
       e1empno    "1차평가자사번", e1Korname "1차평가자성명",
       e1payra    "1차평가자직책", (select codename from pyccode where codeid = 'I113' and codeno = a.e1payra) "1차평가자직책명",
       e1paycl    "1차평가자BAND", (select codename from pyccode where codeid = 'I112' and codeno = a.e1paycl) "1차평가자BAND명",
       e1deptcode "1차부서코드",   (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e1deptcode) "1차부서명", 
       e2empno    "2차평가자사번", e2Korname "2차평가자성명",
       e2payra    "2차평가자직책", (select codename from pyccode where codeid = 'I113' and codeno = a.e2payra) "2차평가자직책명",
       e2paycl    "2차평가자BAND", (select codename from pyccode where codeid = 'I112' and codeno = a.e2paycl) "2차평가자BAND명",
       e2deptcode "2차부서코드",   (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e2deptcode) "2차부서명", 
       OPINION2   "역량평가의견",  OPINION3  "업적평가의견", OPINION4 "육성평가의견", 
       E1VALVIEW  "1차종합의견",   E2VALVIEW "2차종합의견" 
  from pehremas a
 where rabasdate = :평가기준일
   and RESTIYN   = 'Y'
   and payra     > decode( sign(substr(rabasdate,1,4)-2008),1,'C11','2C')
   

--224. 팀장 자기평가 의견 조회
select a.empno 사번, a.Korname 성명, 
       a.payra   직책, (select codename from pyccode where codeid = 'I113' and codeno = a.payra) 직책명,
       a.paycl   BAND, (select codename from pyccode where codeid = 'I112' and codeno = a.paycl) BAND명,
       b.jobgun  직군, (Select CODENAME From PYCCODE Where CODEID = 'I115' AND CODENO = b.jobgun) 직군명,
       b.jobkind 직종, (select dutykindname from pishrdukind where dutykind = b.jobkind) 직종명,
       a.deptcode 부서코드, (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) 부서명,
       a.e1empno "1차평가자사번", a.e1Korname "1차평가자성명",
       a.e1payra "1차평가자직위", (select codename from pyccode where codeid = 'I113' and codeno = a.e1payra) "1차평가자직위명",
       a.e1paycl "1차평가자직급", (select codename from pyccode where codeid = 'I112' and codeno = a.e1paycl) "1차평가자직급명",
       a.e1deptcode "1차부서코드",(select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e1deptcode) "1차부서명", 
       a.e2empno "2차평가자사번", a.e2Korname "2차평가자성명",
       a.e2payra "2차평가자직위", (select codename from pyccode where codeid = 'I113' and codeno = a.e2payra) "2차평가자직위명",
       a.e2paycl "2차평가자직급", (select codename from pyccode where codeid = 'I112' and codeno = a.e2paycl) "2차평가자직급명",
       a.e2deptcode "2차부서코드",(select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e2deptcode) "2차부서명",  
       MERIT 장점, DEMERIT 보완점, 
       decode(WORKLOAD,1,'너무많다',2,'비교적많다',3,'보통',4,'다소적다',5,'매우적다') 담당업무량, 
       decode(JOBHARD,1,'너무어렵다',2,'비교적어렵다',3,'보통',4,'다소쉽다',5,'매우쉽다') 업무난이도, 
       decode(JOBSATISFY,1,'매우적합',2,'비교적적합',3,'보통',4,'다소불만',5,'매우불만') 업무적성만족도,
       decode(MOVEERA,'1','현재는 고려하고 있지 않음',2,'2~3년이내',3,'1년이내') 이동희망시기,
       MOVECAUSE 이동희망사유, 
      (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.MOVEDEPT) 희망부서, 
       PROPOSE 건의사항
  from petremas a, pehremas b
 where a.rabasdate =:평가기준일
   and b.rabasdate =:평가기준일 
   and a.empno     = b.empno

--225. 팀원 자기평가 의견 조회
select a.empno 사번, a.Korname 성명,
       a.payra   직책, (select codename from pyccode where codeid = 'I113' and codeno = a.payra) 직책명,
       a.paycl   BAND, (select codename from pyccode where codeid = 'I112' and codeno = a.paycl) BAND명,
       a.jobgun  직군, (Select CODENAME From PYCCODE Where CODEID = 'I115' AND CODENO = a.jobgun ) 직군명,
       a.jobkind 직종, (select dutykindname  from pishrdukind where  dutykind = a.jobkind) 직종명,      --jobfield = hh.jobgun and 
       a.deptcode 부서코드, (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) 부서명,
       e1empno    "1차평가자사번", e1Korname "1차평가자성명",
       e1payra    "1차평가자직위", (select codename from pyccode where codeid = 'I113' and codeno = a.e1payra) "1차평가자직위명",
       e1paycl    "1차평가자직급", (select codename from pyccode where codeid = 'I112' and codeno = a.e1paycl) "1차평가자직급명",
       e1deptcode "1차부서코드",   (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e1deptcode) "1차부서명", 
       e2empno    "2차평가자사번", e2Korname "2차평가자성명",
       e2payra    "2차평가자직위", (select codename from pyccode where codeid = 'I113' and codeno = a.e2payra) "2차평가자직위명",
       e2paycl    "2차평가자직급", (select codename from pyccode where codeid = 'I112' and codeno = a.e2paycl) "2차평가자직급명",
       e2deptcode "2차부서코드",   (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e2deptcode) "2차부서명",
       b.SELFVALUE1 기여도의견, b.SELFVALUE2 건의사항 
  from pehremas a, PEHSEMAS b
 where a.rabasdate = :평가기준일
   and a.rabasdate = b.rabasdate(+)
   and a.empno     = b.empno(+)    
   and a.RESTIYN   = 'Y'
   and a.payra     > decode( sign(substr(a.rabasdate,1,4)-2008),1,'C11','2C')

--226. 팀원 동료평가 의견 조회
select a.empno 사번, a.Korname 성명,
       a.payra   직책, (select codename from pyccode where codeid = 'I113' and codeno = a.payra) 직책명,
       a.paycl   BAND, (select codename from pyccode where codeid = 'I112' and codeno = a.paycl) BAND명,
       a.jobgun  직군, (Select CODENAME From PYCCODE Where CODEID = 'I115' AND CODENO = a.jobgun ) 직군명,
       a.jobkind 직종, (select dutykindname  from pishrdukind where  dutykind = a.jobkind) 직종명,      --jobfield = hh.jobgun and 
       a.deptcode 부서코드, (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) 부서명,
       e1empno    "1차평가자사번", e1Korname "1차평가자성명",
       e1payra    "1차평가자직위", (select codename from pyccode where codeid = 'I113' and codeno = a.e1payra) "1차평가자직위명",
       e1paycl    "1차평가자직급", (select codename from pyccode where codeid = 'I112' and codeno = a.e1paycl) "1차평가자직급명",
       e1deptcode "1차부서코드",   (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e1deptcode) "1차부서명", 
       e2empno    "2차평가자사번", e2Korname "2차평가자성명",
       e2payra    "2차평가자직위", (select codename from pyccode where codeid = 'I113' and codeno = a.e2payra) "2차평가자직위명",
       e2paycl    "2차평가자직급", (select codename from pyccode where codeid = 'I112' and codeno = a.e2paycl) "2차평가자직급명",
       e2deptcode "2차부서코드",   (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.e2deptcode) "2차부서명",
       b.merit 장점, b.demerit 보완점 
  from pehremas a, pesmcs b
 where a.rabasdate = :평가기준일
   and a.rabasdate = b.rabasdate(+)
   and a.empno     = b.empno(+)
   and b.abconyn(+)= 'Y'
   and a.RESTIYN   = 'Y'
   and a.payra     > decode( sign(substr(a.rabasdate,1,4)-2008),1,'C11','2C')
   

--227. 팀원 자기n동료평가 점수 조회
Select NVL(HH.Empno,   ' ')         사번    ,                         
       NVL(HH.KORNAME, ' ')         성명    ,  
       decode((select UNIONYN from pehreaim_combas where rabasdate = :평가기준일 and empno = hh.empno),'Y','공동목표대상자','개별목표대상자') 공동평가여부,   
       HH.deptcode 부서코드, (Select NVL(DEPTNAME||' '||DEPTNA3,'') From Pycdept Where orgnum = HH.orgnum And Deptcode = HH.Deptcode) 부서명,    
       HH.PAYRA    직책코드, (Select CODENAME From PYCCODE   Where CODEID = 'I113' AND CODENO = HH.PAYRA )      직책명,      
       HH.PAYCL    BAND코드, (Select CODENAME From PYCCODE   Where CODEID = 'I112' AND CODENO = HH.PAYCL )      BAND명,
       hh.jobgun   직군코드, (Select CODENAME From PYCCODE   Where CODEID = 'I115' AND CODENO = HH.jobgun )      직군명,
       hh.jobkind  직종코드, (select dutykindname  from pishrdukind where  dutykind = hh.jobkind) 직종명,      --jobfield = hh.jobgun and
       HH.E1Empno              "1차평가자사번"  ,
       HH.E1korname            "1차평가자성명"  ,                          
       HH.E2Empno              "2차평가자사번"  ,
       HH.E2korname            "2차평가자성명"  ,
       NVL(com.ASELF, ' ')      자기평가여부     ,                         
       DECODE(HH.RVALOBJYN,NULL,'진행전','X','미합의','Y','신청','N','미신청') 이의제기여부,                         
       round(HH.RSCORE,4)      "자기업적점수",
       round(com.comSCR1,4)    "자기공통역량점수"    ,                                    
       round(com.ldrSCR1,4)    "자기리더십역량점수",
       round(com.dutSCR1,4)    "자기직무역량점수",  
       round(com.ABILSCR1,4)   "자기역량점수",
       round(com.comSCR2,4)    "동료공통역량점수"    ,                                    
       round(com.ldrSCR2,4)    "동료리더십역량점수",
       round(com.dutSCR2,4)    "동료직무역량점수",
       round(com.ABILSCR2,4)   "동료역량점수"                                                  
 From                                                                  
   (select ss.empno, Aself,  comscr1, ldrscr1, dutscr1, ABILSCR1,  comscr2, ldrscr2, dutscr2, ABILSCR2 from
      (Select --'자기' GUBUN, 
              A.Empno,                                 
              Decode(B.EVCNO,'1',DECODE(B.SYN,'Y',DECODE(A.ABCONYN, 'Y',DECODE(A.BECONYN,'Y',DECODE(A.DUCONYN,'Y','완료','미완료')),'미완료'),'비대상'), 
                                 DECODE(B.SYN,'Y',DECODE(A.ABCONYN, 'Y',DECODE(A.DUCONYN,'Y','완료','미완료'),'미완료'),'비대상')           )        ASELF 
         From PESMS A, PEHAMAS B                                           
        Where A.RabasDate = :평가기준일                             
          AND A.RabasDate = B.RabasDate                                    
          AND A.Empno     = B.Empno                                        
          AND B.EVCNO    in ('1','2')                                  
       ) SS,
      (Select --'1차' GUBUN, 
              b.Empno,                          
              round(Decode(B.EVCNO,'1',C.comscr1,  D.comscr1),4) comscr1, 
              round(Decode(B.EVCNO,'1',C.ldrscr1,  D.ldrscr1),4) ldrscr1,
              round(Decode(B.EVCNO,'1',C.dutscr1,  D.dutscr1),4) dutscr1,   
              round(Decode(B.EVCNO,'1',C.ABILSCR1, D.ABILSCR1),4) ABILSCR1     
         From PEHAMAS B,                                         
             (Select Empno,                                        
                     AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr1,         
                     AVG(DECODE(EKIND,'리더십역량',SCORE)) ldrscr1,          
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr1,
                    (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                     AVG(DECODE(EKIND,'리더십역량',SCORE))*0.3+          
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.2) ABILSCR1  
                From PESDs                                                 
               Where RabasDate = :평가기준일                        
               Group By Empno  ) C,                                
             (Select Empno,                                        
                     AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr1,
                     null                                  ldrscr1,         
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr1,
                     (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.5) ABILSCR1
                From PESDs                                                 
               Where RabasDate = :평가기준일                        
               Group By Empno  ) D                                 
        Where b.RabasDate = :평가기준일                             
          AND b.Empno     = C.Empno(+)    AND b.Empno = D.Empno(+)         
          AND B.EVCNO    in ('1','2')                                  
       ) BB,                                                               
      (Select --'2차' GUBUN, 
              B.Empno,                             
              round(Decode(B.EVCNO,'1',C.comscr2,  D.comscr2),4) comscr2, 
              round(Decode(B.EVCNO,'1',C.ldrscr2,  D.ldrscr2),4) ldrscr2,
              round(Decode(B.EVCNO,'1',C.dutscr2,  D.dutscr2),4) dutscr2,   
              round(Decode(B.EVCNO,'1',C.ABILSCR2, D.ABILSCR2),4) ABILSCR2   
         From PEHAMAS B,                                         
             (Select Empno,                                        
                     AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr2,          
                     AVG(DECODE(EKIND,'리더십역량',SCORE)) ldrscr2,          
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr2,
                    (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                     AVG(DECODE(EKIND,'리더십역량',SCORE))*0.3+          
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.2) ABILSCR2 
                From PESDc                                                 
              Where RabasDate = :평가기준일
                AND length(EEmpno) = 16                        
              Group By Empno  ) C,                                 
             (Select Empno,                                        
                     AVG(DECODE(EKIND,'공통역량'  ,SCORE)) comscr2,
                     null                                  ldrscr2,         
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE)) dutscr2,
                    (AVG(DECODE(EKIND,'공통역량'  ,SCORE))*0.5+          
                     AVG(DECODE(EKIND,'직무역량'  ,SCORE))*0.5) ABILSCR2
                From PESDc                                                 
              Where RabasDate = :평가기준일
                AND length(EEmpno) = 16                       
              Group By Empno ) D                                  
        Where B.RabasDate = :평가기준일                             
          AND B.Empno     = C.Empno(+)   AND B.Empno = D.Empno(+)          
          AND B.EVCNO    in ('1','2')                                  
       ) CC
     where ss.empno = bb.empno(+)
       and ss.empno = cc.empno(+)) com,                                                               
      (Select --DECODE(:평가자사번,A.E1Empno,'1차',E2Empno,'2차',E3Empno,'2차') GUBUN,               
              --A.PGROUP,
              A.Empno, E2VALOBJYN, A.KORNAME, A.PAYCL, A.PAYRA, A.ORGNUM, A.Deptcode, a.jobgun, a.jobkind,             
              A.E1Empno,A.E1korname, A.E2Empno, A.E2korname, A.E3Empno, A.E3korname, RVALOBJYN,                                             
              DECODE(A.RESTIONLYYN,'Y','비대상',DECODE(A.RVALCONYN ,'Y','완료','미완료')) SELF,    
              DECODE(A.RESTIONLYYN,'Y','비대상',DECODE(A.E1VALCONYN,'Y','완료','미완료')) DOWN1,   
--              DECODE(A.EBREmpno,NULL,' ',       DECODE(EBRVALCONYN ,'Y','완료','미완료')) DOWNEBR, 
              DECODE(A.RESTIONLYYN,'Y','비대상',                                                   
                     DECODE(A.E2Empno, NULL,' ',                                                  
                            DECODE(E2VALCONYN,'Y','완료','N',                                    
                                   DECODE(E2VALOBJYN,'Y','반려중','미완료'),'미완료'))) DOWN2, 
             (Select sum(escore)                                                                       
                From (Select t1.Empno, nvl(round(t1.seldata * t2.mainweight * 0.01,2),0) escore        
                        From (Select c.Empno, a.taskcode, substr(a.Deptcode,1,4) Deptcode,             
                                     nvl(round(sum((a.detailrscore*a.detailweight)/100),2),0) seldata  
                                From pehaimhis_com a, pehreaim_bas b, pehremas c                       
                               Where a.RabasDate = :평가기준일 and a.RabasDate = b.RabasDate    
                                 and a.RabasDate = c.RabasDate        and a.taskcode  = b.taskcode     
                                 and nvl(a.eobjyn,'N') <> 'Y'     and nvl(a.econyn,'N') = 'Y'  
                                 and substr(a.Deptcode,1,4) = substr(c.Deptcode,1,4)                   
                                 and SUBSTR(a.Deptcode,1,4) = SUBSTR(b.Deptcode,1,4)                   
                               Group By c.Empno, a.taskcode, substr(a.Deptcode,1,4)         ) t1,      
                             (Select distinct a.Empno, substr(a.Deptcode,1,4) Deptcode,                
                                     a.taskcode, a.mainweight                                          
                                From pehreaim_comdet a, pehremas b                                     
                               Where a.RabasDate = :평가기준일 and a.RabasDate = b.RabasDate    
                            and a.Empno     = b.Empno                                  ) t2       
                         Where t1.Deptcode = t2.Deptcode                                                 
                           and t1.taskcode = t2.taskcode   and t1.Empno = t2.Empno                       
                         union all                                                                       
                        Select Empno, SUM(ECONTRSCR) ESCORE From PEHREAIM_SCR                            
                       Where RabasDate =:평가기준일   Group By Empno                            
                         union all                                                                       
                        Select Empno, SUM(rSCORE)    ESCORE From PEHREAIM_DET                            
                       Where RabasDate =:평가기준일   Group By Empno )                          
              Where Empno = A.Empno                                                                    
                 Group By Empno ) RSCORE                                                                
         From PEHREMAS A                                                                               
        Where  A.RabasDate = :평가기준일 AND A.RESTIYN = 'Y'
       ) HH          
Where  HH.Empno  = com.Empno(+)    
  AND  hh.empno not in (select empno from petremas where rabasdate = :평가기준일)
--  and (hh.E1Empno=:평가자사번 OR hh.E2Empno=:평가자사번 OR hh.E3Empno=:평가자사번)

--228. 팀장 자기n상향평가 점수 조회
SELECT T1.EMPNO 사번,                                                           
       T1.KORNAME 성명, 
      (select jobgun   from pehremas where rabasdate =:평가기준일 and empno =T1.empno) 직군코드,
      (Select CODENAME From PYCCODE  Where CODEID = 'I115' AND CODENO = (select jobgun from pehremas where rabasdate =:평가기준일 and empno =T1.empno) ) 직군명,
      (select jobkind  from pehremas where rabasdate =:평가기준일 and empno =T1.empno) 직종코드, 
      (select dutykindname  from pishrdukind where  dutykind = (select jobkind from pehremas where rabasdate =:평가기준일 and empno =T1.empno) )직종명,      --jobfield = hh.jobgun and  
       T1.DEPTCODE 부서코드,                                                      
       (Select NVL(DEPTNAME||' '||DEPTNA3,'') From Pycdept Where orgnum = T1.orgnum And Deptcode = T1.Deptcode) 부서명, 
       T1.PAYRA 직책코드,   (Select CODENAME From PYCCODE Where CODEID = 'I113' AND CODENO = T1.PAYRA ) 직책,
       T1.PAYCL BAND코드,   (Select CODENAME From PYCCODE Where CODEID = 'I112' AND CODENO = T1.PAYCL ) BAND,
       DECODE(T1.RVALCONYN,  'Y', '완료', '미완료') 자기평가여부, 
       DECODE(T1.E1VALCONYN, 'Y', '완료', '미완료') "1차평가여부", 
       DECODE(T1.E2VALCONYN, 'Y', '완료', '미완료') "2차평가여부", 
       T1.E1EMPNO   "1차평가자사번", 
       T1.E1KORNAME "1차평가자성명", 
       T1.E2EMPNO   "2차평가자사번", 
       T1.E2KORNAME "2차평가자성명",
       decode(nvl(TW.WSCORE,0),0,'',TW.WSCORE) 자기업적점수,
       DECODE(Ts.cSCORE,0,'',Ts.cSCORE) 자기공통역량점수, 
       DECODE(Ts.lSCORE,0,'',Ts.lSCORE) 자기리더십역량점수, 
       DECODE(T1.RESCORE,0,'',T1.RESCORE) 자기역량점수, 
       DECODE(TH.Cscore,0,'',TH.Cscore) 상향공통역량점수, 
       DECODE(TH.lscore,0,'',TH.lscore) 상향리더십역량점수
  FROM PETREMAS T1,                                                 
     ( SELECT A.EMPNO, round(B.RSCORE,4) WSCORE                           
         FROM PEHREMAS A,                                                 
            (SELECT EMPNO,SUM(RSCORE) RSCORE FROM PEHREAIM_DET            
              WHERE RABASDATE =:평가기준일 GROUP BY EMPNO) B       
        WHERE  A.RABASDATE = :평가기준일                           
          AND  A.RESTIYN   = 'Y'                                        
          AND  A.EMPNO = B.EMPNO ) TW,
     ( select c.empno, c.cscore, l.lscore      
        from (select empno, round(avg(score),4) cscore,0 lscore                             
                from petds    
               where rabasdate = :평가기준일
                 and ekind = '공통역량'                               
               group by empno) c,
             (select empno, 0 cscore, round(avg(score),4) lscore                             
                from petds    
               where rabasdate = :평가기준일
                 and ekind = '리더십역량'                               
               group by empno) l 
       where c.empno = l.empno
       )   TS,       
     (select pempno, pdeptcode, round(avg(elscore),4) lscore                
             ,round(avg(ecscore),4) cscore                                
        from pesremas                                                     
       where rabasdate = :평가기준일                               
         and RVALCONYN = 'Y'                                            
       group by pempno, pdeptcode) TH                                     
 WHERE T1.RABASDATE = :평가기준일                                   
   AND T1.EMPNO    = TW.EMPNO(+)                                        
   AND T1.EMPNO    = TH.PEMPNO(+)                                            
   AND T1.DEPTCODE = TH.PDEPTCODE(+) 
   and t1.empno    = ts.empno(+)