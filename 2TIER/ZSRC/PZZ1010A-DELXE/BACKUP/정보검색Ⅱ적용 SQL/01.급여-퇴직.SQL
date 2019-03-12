--100.인사마스터
select a.empno 사번,   a.korname 성명,    
      (select codename from pyccode where codeid = 'I114' and codeno=a.pstate) 인사상태명,		   
       a.deptcode 부서코드,  d.deptname 부서명,  d.deptna3 직무,
       a.paycl    band,  
      (select codename from pyccode where codeid = 'I112' and codeno=a.paycl) band명,
       a.payra    직책,
      (select codename from pyccode where codeid = 'I113' and codeno=a.payra) 직책명,  
       a.korage 연령,      a.usaage "연령(만)",  sex 성별,
       a.empdate 최초입사일, a.orgempdate  skb입사일, a.cpaycldate 승격일,
      a.comduyy 근속기간년,
      a.comdumm 근속기간월,
      a.payclyy 재급기간년,
      a.payclmm 재급기간월,	   
      (select codename from pyccode where codeid = 'I101' and codeno=a.empcode   ) 입사구분,
      (select codename from pyccode where codeid = 'I221' and codeno=a.empschgr  ) 학위,
      (select codename from pyccode where codeid = 'I221' and codeno=a.lschgr    ) 최종학력,
      (select codename from pyccode where codeid = 'I223' and codeno=a.lschcode  ) 학교명,
      (select codename from pyccode where codeid = 'I225' and codeno=a.lmajorcode) 전공명
  from pimpmas a, pycdept d
 where a.orgnum  =  d.orgnum 
   and a.deptcode=  d.deptcode
   and a.pstate  < '80'
 order by a.deptcode, a.payra, a.paycl,  a.payclyy, a.empno
	  
	  
--101.연봉조회 
SELECT B.YEARPAYNUM 연봉차수,
       A.EMPNO 사번,    A.KORNAME 성명,
      (select codename from pyccode where codeid = 'I114' and codeno=a.pstate) 인사상태명,	
       B.TOTPAY    총연봉,
       B.BASEPAY   기본연봉,
       B.ABLITYPAY 업적연봉
  FROM PIMPMAS A,  PKHYPHIS B
 WHERE A.EMPNO      =  B.EMPNO
   AND B.YEARPAYNUM = :연봉차수
   AND A.PSTATE <'80'

		
--102.최종 평균임금_통상임금 
select MRTODATE 정산기산일_기준, a.empno    "사번",      a.korname   "성명",
       a.avggross "평균임금",  a.commonamt "통상임금",
      (select fixpay from pkmpmas where empno = a.empno) "월정연봉_급여마스터",
      (select codename from pyccode where codeid = 'I112' and codeno=a.paycl) band명,
      (select codename from pyccode where codeid = 'I113' and codeno=a.payra) 직책명,  	  
      (select codename from pyccode where codeid = 'I114' and codeno=a.pstate) 인사상태명	  
  from pkmmrest a
 order by empno
  
--103.전근무지 있는 퇴사자 세금 자료추출
-- 전근무지 있는 퇴사자들의 종전에 납세한 세금자료를 추출한다.
SELECT A.EMPNO       사원번호,  A.Korname 성명, 
       B.CARPLACE    종전근무지, 
       A.BRETFRDAY   종전입사일자, 
       A.BRETTODAY   종전퇴사일자, 
       A.BRETMM      종전근속월수, 
       A.BRETINTAX   종전소득세, 
       A.BRETJUTAX   종전주민세, 
       A.BRETNONGTAX 종전농특세, 
       A.BRETINTAX + A.BRETJUTAX + A.BRETNONGTAX  종전세금합계  
  FROM PKHRTHIS A, PIMCARR B
 WHERE A.EMPNO = B.EMPNO  
   AND A.BRETFRDAY IS NOT NULL 
   AND A.BRETTODAY IS NOT NULL 
   AND A.BRETMM    <> 0
   AND B.CARFRDATE = (SELECT MAX(C.CARFRDATE)  FROM PIMCARR C 
                       WHERE C.EMPNO = A.EMPNO AND C.EMPNO = B.EMPNO 
                       GROUP BY C.EMPNO)
						  
						  
--104.주택자금대출금
select a.empno  사번,  a.korname 성명,
      (select codename from pyccode where codeid = 'K710' and codeno=a.hskind) 주택자금구분,  
       a.hskind 주택자금코드, a.hsdate 대출일,
       a.hsamt  대출금액,     a.remsum 대출건당잔액,
      (select codename from pyccode where codeid = 'I114' and codeno=b.pstate) 인사상태명
  from pkmhsmas a, pimpmas b
 where a.empno  =  b.empno
 order by decode(sign(b.pstate-81),-1,'10',b.pstate), a.empno, a.hsdate
	  
	  
--105.사주대출금 조회
select a.divseqnum 청약차수,
       a.empno   사번,   a.korname 성명,
      (select codename from pyccode where codeid = 'I114' and codeno=b.pstate) 인사상태명,
       a.stclass 주식구분,
	   decode(stclass,'1','우리사주', '2','주주실권', '3','주주우선', '4','주주우선(예탁)', '5','주주우선(비예탁)',stclass) 주식구분명,
       a.stlorg  대부기관코드,
	  (select codename from pyccode where codeid = 'K910' and codeno=a.stlorg) 대부기관명,
       a.stldate 대부일자,
       a.stlamt  대부금액,
       a.stiramt 상환잔액
  from pslmas a, pimpmas b
 where a.empno  =  b.empno
 order by decode(sign(b.pstate-81),-1,'10',b.pstate), a.empno, a.divseqnum

--106.퇴직금조회 
--최종중간정산기산일을 입력한다. yyyymmdd 
SELECT A.EMPNO 사번, A.KORNAME 성명,
      (select codename from pyccode where codeid = 'I112' and codeno=b.paycl ) band명,
      (select codename from pyccode where codeid = 'I114' and codeno=b.pstate) 인사상태,
       A.MRTODATE 중간정산기산일TO,
       A.DUTYYY   근속년수,
       A.DUTYMM   근속월수,
       A.EXYY     제외년수,
       A.EXMM     제외월수,
       A.RETYY    계산적용근속년수,
       A.RETMM    계산적용개월수,
       A.AVGGROSS 평균임금,
       A.RETRATE  퇴직지급율,
       A.RETAMT   퇴직소득수입금액,
       A.HSAMT    주택자금대출공제금,
       A.SAJUAMT  사주대출공제금,
       A.ANUAMT   국민연금전환금,
       A.DEDSUM   공제총액,
       A.REALAMT  실지급액
  FROM PKHMRESH A, PIMPMAS B
 WHERE A.EMPNO    =  B.EMPNO
   AND A.MRTODATE = :중간정산기산일TO
 ORDER BY A.RETYY, A.RETMM, A.EMPNO
 
	  
--107.평균임금 조회
select a.empno 사번, 
       a.korname 이름, 
      (select deptname from pycdept where orgnum = a.orgnum and deptcode = a.deptcode) 부서명,
       a.empdate 입사월,	    
	  (select nvl(decode(substr(empno,1,1),'J','P','Q',ceil((fixpay+sopay)*12/12),ceil((fixpay+sopay)*18/12)),0) 
	     from pkhphis 
	    where paydate = to_char(add_months(to_date(:조회월,'yyyymm'),0),'yyyymm') 
		  and empno = a.empno) "조회월 급여", 
	  (select nvl(decode(substr(empno,1,1),'J','P','Q',ceil((fixpay+sopay)*12/12),ceil((fixpay+sopay)*18/12)),0) 
	     from pkhphis 
	    where paydate = to_char(add_months(to_date(:조회월,'yyyymm'),-1),'yyyymm') 
		  and empno = a.empno) "조회월 전월 급여", 
	  (select decode(substr(empno,1,1),'J','P','Q',ceil((fixpay+sopay)*12/12),ceil((fixpay+sopay)*18/12)) 
	     from pkhphis 
	    where paydate = to_char(add_months(to_date(:조회월,'yyyymm'),-2),'yyyymm') 
		  and empno = a.empno) "조회월 전전월 급여", 
	  (select nvl((fixpay+sopay),0) 
	     from pkhphis 
	    where paydate = :조회월 
		  and empno = a.empno) "조회월 월정연봉", 
       b.liceamt  "3개월 자격수당 합",
	   b.famiamt  "3개월 가족수당 합",
	   b.ovtmamt  "3개월 초과근무 합",
	   b.sptmamt  "3개월 특별근무 합",
	   b.sopaysum "3개월 소급급여 합",
	   b.mcaramt  "3개월 식교비 합",
	   b.odamt    "3개월 자가운전 합",
	   b.itamt    "3개월 정보통신 합",
	   b.mbonamt  "3개월 월차수당 합",
	   b.tot_amt  "3개월 제수당 합",
	   decode(substr(:조회월,5,2),'12',d.ybonamt,c.ybonamt) "연차수당",	   
	   a.avggross "평균임금" 
  from PKHMRESH a, 
       (select empno, 
	           sum(decode(h.roleamt,0,0, p.avgroleamt)) roleamt, 
			   sum(h.liceamt) liceamt, 
			   sum(h.childamt+h.partamt+h.mateamt) famiamt, 
			   sum(h.ovtmamt) ovtmamt, 
			   sum(h.sptmamt) sptmamt, 
			   sum(h.mbonamt) mbonamt, 
			   sum(h.mcaramt) mcaramt, 
			   sum(decode(h.odamt,0,0,p.avgodamt)) odamt, 
			   sum(h.sobon) sobon,
			   sum(h.sopaysum) sopaysum, 
			   sum(nvl(h.itamt,0)) itamt, 
	           sum(decode(h.roleamt,0,0, p.avgroleamt) 
                   +h.liceamt  +h.childamt  +h.partamt 
                   +h.mateamt  +h.ovtmamt   +h.sptmamt 
                   +h.mbonamt  +h.mcaramt   +decode(h.odamt,0,0,p.avgodamt) 
                   +h.sobon    +nvl(h.itamt,0)) tot_amt 
		  from pkhphis h, pkcpbas p 
		 where h.paydate >= to_char(add_months(to_date(:조회월,'yyyymm'),-2),'yyyymm') 
           and h.paydate <= :조회월
		 group by empno ) b,
	   (select empno, sum(ybonamt) ybonamt from pkhphis
		 where (paydate >=  to_char(add_months(to_date(:조회월,'yyyymm'),-11),'yyyymm')
	       and  paydate <=  :조회월) 
	     group by empno ) c,
	   (select empno, sum(ybonamt) ybonamt from pkhphis
		 where (paydate >=  to_char(add_months(to_date(:조회월,'yyyymm'),-12),'yyyymm')
		   and  paydate <=  :조회월) 
		 group by empno ) d
 where a.mrtodate like :조회월||'%' 
   and a.empno = b.empno
   and a.empno = c.empno
   and a.empno = d.empno 
 order by a.empno
 
--109.퇴직충당금 월별 자료 구하기
--인수로 조회를 원하는 기준년월을  입력한다
SELECT A.EMPNO    사번,            A.KORNAME  성명, 
       B.JUMINID  주민번호,        F.DEPTNAME 부서, 
      (select codename from pyccode where codeid = 'I114' and codeno=b.pstate) 인사상태,
       TO_CHAR(TO_DATE(A.CALCDATE,'YYYYMMDD') ,'YYYY.MM.DD') 기준일 ,
       TO_CHAR(TO_DATE(ORGEMPDATE,'YYYYMMDD') ,'YYYY.MM.DD') 입사일,
       TO_CHAR(TO_DATE(MRTODATE,  'YYYYMMDD') ,'YYYY.MM.DD') 중간정산일,  
       decode(substr(to_char(A.RETRATE),1,1),'.','0'||to_char(A.RETRATE), to_char(A.RETRATE)) "지급율",
       A.RETRATE  지급율2,         A.PAY3SUM  급여총액, 
       A.BON12SUM 상여총액,        A.AVGGROSS 평균임금, 
       A.BMONTOT  전월누계,        A.CMONTOT  당월누계, 
       A.RETAMT   당월충당금 
  FROM PYCDEPT F, PKHRZHIS A ,PIMPMAS B,     
       (SELECT   EMPNO,  MAX(MRTODATE) MRTODATE  FROM PKHMRHIS      
         WHERE   MRTODATE <= :기준년월||'99' GROUP BY EMPNO) E 
 WHERE  A.CALCDATE LIKE :기준년월||'%'
   AND  A.PSTATE < '80' 
   AND  A.EMPNO   = B.EMPNO       
   AND  A.EMPNO   = E.EMPNO(+)    
   AND  A.ORGNUM  = F.ORGNUM    
   AND  A.DIVCODE = F.DEPTCODE
	  
--110.퇴직월급여 합계내역
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'01',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'01',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'01',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'01',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'01',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'01',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'01',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'01',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'01',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'01',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'01',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'01',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'01',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'01',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'01',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'01',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'01',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'01',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'01',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'01',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'01',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'01',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'01',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'01',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'01',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'01',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'01',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'01',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'01',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'01',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'01',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'01',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'01',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'01',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'01',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'01',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'01',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'01'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'02',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'02',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'02',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'02',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'02',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'02',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'02',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'02',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'02',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'02',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'02',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'02',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'02',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'02',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'02',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'02',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'02',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'02',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'02',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'02',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'02',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'02',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'02',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'02',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'02',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'02',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'02',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'02',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'02',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'02',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'02',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'02',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'02',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'02',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'02',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'02',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'02',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'02'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'03',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'03',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'03',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'03',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'03',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'03',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'03',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'03',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'03',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'03',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'03',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'03',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'03',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'03',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'03',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'03',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'03',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'03',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'03',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'03',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'03',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'03',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'03',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'03',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'03',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'03',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'03',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'03',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'03',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'03',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'03',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'03',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'03',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'03',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'03',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'03',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'03',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'03'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'04',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'04',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'04',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'04',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'04',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'04',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'04',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'04',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'04',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'04',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'04',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'04',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'04',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'04',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'04',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'04',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'04',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'04',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'04',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'04',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'04',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'04',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'04',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'04',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'04',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'04',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'04',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'04',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'04',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'04',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'04',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'04',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'04',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'04',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'04',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'04',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'04',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'04'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'05',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'05',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'05',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'05',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'05',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'05',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'05',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'05',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'05',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'05',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'05',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'05',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'05',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'05',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'05',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'05',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'05',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'05',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'05',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'05',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'05',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'05',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'05',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'05',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'05',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'05',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'05',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'05',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'05',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'05',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'05',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'05',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'05',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'05',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'05',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'05',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'05',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'05'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'06',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'06',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'06',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'06',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'06',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'06',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'06',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'06',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'06',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'06',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'06',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'06',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'06',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'06',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'06',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'06',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'06',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'06',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'06',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'06',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'06',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'06',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'06',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'06',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'06',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'06',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'06',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'06',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'06',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'06',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'06',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'06',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'06',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'06',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'06',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'06',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'06',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'06'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'07',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'07',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'07',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'07',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'07',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'07',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'07',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'07',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'07',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'07',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'07',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'07',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'07',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'07',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'07',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'07',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'07',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'07',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'07',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'07',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'07',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'07',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'07',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'07',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'07',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'07',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'07',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'07',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'07',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'07',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'07',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'07',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'07',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'07',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'07',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'07',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'07',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'07'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'08',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'08',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'08',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'08',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'08',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'08',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'08',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'08',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'08',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'08',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'08',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'08',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'08',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'08',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'08',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'08',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'08',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'08',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'08',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'08',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'08',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'08',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'08',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'08',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'08',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'08',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'08',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'08',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'08',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'08',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'08',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'08',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'08',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'08',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'08',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'08',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'08',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'08'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'09',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'09',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'09',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'09',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'09',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'09',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'09',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'09',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'09',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'09',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'09',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'09',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'09',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'09',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'09',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'09',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'09',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'09',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'09',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'09',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'09',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'09',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'09',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'09',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'09',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'09',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'09',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'09',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'09',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'09',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'09',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'09',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'09',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'09',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'09',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'09',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'09',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'09'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'10',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'10',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'10',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'10',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'10',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'10',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'10',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'10',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'10',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'10',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'10',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'10',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'10',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'10',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'10',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'10',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'10',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'10',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'10',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'10',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'10',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'10',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'10',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'10',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'10',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'10',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'10',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'10',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'10',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'10',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'10',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'10',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'10',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'10',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'10',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'10',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'10',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'10'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'11',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'11',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'11',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'11',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'11',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'11',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'11',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'11',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'11',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'11',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'11',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'11',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'11',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'11',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'11',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'11',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'11',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'11',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'11',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'11',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'11',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'11',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'11',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'11',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'11',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'11',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'11',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'11',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'11',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'11',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'11',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'11',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'11',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'11',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'11',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'11',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'11',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'11'
 group by SUBSTR(RETDATE,5,2)
union
SELECT SUBSTR(RETDATE,5,2) "퇴직월",
       nvl(sum(decode(substr(retdate,5,2),'12',FIXPAY    )),0) "월정연봉",       
       nvl(sum(decode(substr(retdate,5,2),'12',QUATERPAY )),0) "분기연봉",       
       nvl(sum(decode(substr(retdate,5,2),'12',HOLIPAY   )),0) "명절연봉",       
       nvl(sum(decode(substr(retdate,5,2),'12',ROLEAMT   )),0) "직책수당",       
       nvl(sum(decode(substr(retdate,5,2),'12',FAMIAMT   )),0) "가족수당",       
       nvl(sum(decode(substr(retdate,5,2),'12',LICEAMT   )),0) "자격수당",       
       nvl(sum(decode(substr(retdate,5,2),'12',MCARAMT   )),0) "식대교통비_총액",
       nvl(sum(decode(substr(retdate,5,2),'12',MCARTAXAMT)),0) "식대교통비_세금",
       nvl(sum(decode(substr(retdate,5,2),'12',ODAMT     )),0) "자가운전_총액",  
       nvl(sum(decode(substr(retdate,5,2),'12',ODTAXAMT  )),0) "자가운전_과세",  
       nvl(sum(decode(substr(retdate,5,2),'12',OVTMAMT   )),0) "초과근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'12',SPTMAMT   )),0) "특별근무수당",   
       nvl(sum(decode(substr(retdate,5,2),'12',MBONAMT   )),0) "당월월차수당",   
       nvl(sum(decode(substr(retdate,5,2),'12',BOKJISPAMT)),0) "복지연금",       
       nvl(sum(decode(substr(retdate,5,2),'12',BASICAMT  )),0) "기본급",        
       nvl(sum(decode(substr(retdate,5,2),'12',ITAMT     )),0) "정보통신수당",   
       nvl(sum(decode(substr(retdate,5,2),'12',DUTYAMT   )),0) "직무수당",       
       nvl(sum(decode(substr(retdate,5,2),'12',PROMAMT   )),0) "업무추진비",     
       nvl(sum(decode(substr(retdate,5,2),'12',BONUSAMT  )),0) "정기상여",       
       nvl(sum(decode(substr(retdate,5,2),'12',INCENTAMT )),0) "능률제고",       
       nvl(sum(decode(substr(retdate,5,2),'12',TRAINAMT  )),0) "체력단련비",     
       nvl(sum(decode(substr(retdate,5,2),'12',HOMESUPAMT)),0) "선택적복리후생", 
       nvl(sum(decode(substr(retdate,5,2),'12',WINTERAMT )),0) "영업인센티브",   
       nvl(sum(decode(substr(retdate,5,2),'12',YENAMT    )),0) "연차수당",       
       nvl(sum(decode(substr(retdate,5,2),'12',SBONAMT   )),0) "특별상여금",     
       nvl(sum(decode(substr(retdate,5,2),'12',AIDAMT1   )),0) "기타수당1",      
       nvl(sum(decode(substr(retdate,5,2),'12',AIDAMT2   )),0) "기타수당2",      
       nvl(sum(decode(substr(retdate,5,2),'12',TAXPAY    )),0) "기타과세급여",   
       nvl(sum(decode(substr(retdate,5,2),'12',notaxpay  )),0) "기타비과세급여", 
       nvl(sum(decode(substr(retdate,5,2),'12',PAYSUM    )),0) "급여총액",       
       nvl(sum(decode(substr(retdate,5,2),'12',MEDAMT1   )),0) "국민건강보험료", 
       nvl(sum(decode(substr(retdate,5,2),'12',EMPLAMT   )),0) "고용보험료",     
       nvl(sum(decode(substr(retdate,5,2),'12',ANUSELFAMT)),0) "국민연금",       
       nvl(sum(decode(substr(retdate,5,2),'12',TICKETAMT )),0) "중식권공제",     
       nvl(sum(decode(substr(retdate,5,2),'12',ETCAMT    )),0) "기타공제",       
       nvl(sum(decode(substr(retdate,5,2),'12',DEDTOT    )),0) "공제총액",       
       nvl(sum(decode(substr(retdate,5,2),'12',REALPAY   )),0) "실지급액"         
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직YYYY||'12'
 group by SUBSTR(RETDATE,5,2)
 
--111.퇴직월급여내역 추출
SELECT EMPNO 사번,  KORNAME 이름,
	   RETDATE 퇴사일,
      (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I112' AND CODENO = A.PAYCL) BAND명,
       FIXPAY 월정연봉, 
       QUATERPAY 분기연봉, 
	   HOLIPAY 명절연봉,
	   ROLEAMT 직책수당, 
	   FAMIAMT 가족수당, 
	   LICEAMT 자격수당,
	   MCARAMT 식대교통비_총액, 
	   MCARTAXAMT 식대교통비_세금,
	   ODAMT 자가운전_총액, 
	   ODTAXAMT 자가운전_과세, 
	   OVTMAMT 초과근무수당,
	   SPTMAMT 특별근무수당, 
	   MBONAMT 당월월차수당, 
	   BOKJISPAMT 복지연금,
	   BASICAMT 기본급, 
	   ITAMT 정보통신수당, 
	   DUTYAMT 직무수당,
	   PROMAMT 업무추진비,
	   BONUSAMT 정기상여,
	   INCENTAMT 능률제고,
	   TRAINAMT 체력단련비,
	   HOMESUPAMT 선택적복리후생,
	   WINTERAMT 영업인센티브,
	   YENAMT 연차수당,
	   SBONAMT 특별상여금,
	   AIDAMT1 기타수당1,
	   AIDAMT2 기타수당2,
	   TAXPAY 기타과세급여,
	   notaxpay 기타비과세급여,
	   PAYSUM 급여총액,
	   MEDAMT1 국민건강보험료,
	   EMPLAMT 고용보험료,
	   ANUSELFAMT 국민연금,
	   TICKETAMT 중식권공제,
	   ETCAMT 기타공제,
	   DEDTOT 공제총액,
	   REALPAY 실지급액     
  FROM PKHRTHIS A
 WHERE SUBSTR(RETDATE,1,6) = :퇴직년월     
 
--121.중간정산 신청인원_마스터
SELECT A.EMPNO 사번,
	   A.KORNAME 성명,
       A.MRTODATE 중간정산기산일TO,
      (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I112' AND CODENO = A.PAYCL) BAND명,
       A.PAYCL BAND코드,
      (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I113' AND CODENO = A.PAYRA) 직책명,
       A.PAYRA    직책코드,
       E.DEPTNAME 부서명,
       A.DEPTCODE 부서코드,
       A.EMPDATE  입사일,
       A.DUTYYY   근속년수,
       A.DUTYMM   근속월수,
       A.AVGGROSS 평균임금,
       A.RETYY 계산적용근속년수,
       A.RETMM 계산적욕근속월수,
       A.RETRATE 퇴직지급율,
       A.RETAMT 퇴직소득수입금액
  FROM PKMMRMAS A, PIMPMAS B, PYCDEPT E
 WHERE B.EMPNO    =  A.EMPNO
   AND A.MRTODATE = :중간정산기산일TO
   AND B.DEPTCODE =  E.DEPTCODE
   AND B.ORGNUM   =  E.ORGNUM
 ORDER BY A.PAYCL Asc
	  
	  
--122.중간정산 신청자 초과/특별근무수당 구하기
/* 인수로 조회를 원하는 급여지급년월 기간과 중간신청한 해당년월을  입력한다.
   인수형은 전부 문자형으로 지정한다.*/ 
/* 퇴직중간정산 신청자들의 초과근무수당,특별근무수당 구하기...*/

SELECT PAYDATE 급여지급월, EMPNO 사번, KORNAME 성명, 
      (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I112' AND CODENO = A.PAYCL) BAND명,
       B.DEPTNAME 부서명, 
	   OVTMAMT    초과근무수당, 
	   SPTMAMT    특별근무수당
  FROM PKHPHIS A, PYCDEPT B
 WHERE a.orgnum   = b.orgnum
   AND A.DEPTCODE = B.DEPTCODE
   AND PAYDATE BETWEEN  :FROM지급월 AND :TO지급월
   AND EMPNO IN (SELECT EMPNO FROM PKMMRAPP 
                  WHERE APPDATE LIKE :중간정산신청년월||'%')
					

COMMENT ON TABLE PKMHSMAS IS '주택자금마스터';

COMMENT ON COLUMN PKMHSMAS.PAYCL IS 'BAND(I112)';

select * from pyccoid where codeidname like '금융%'

select codename from pyccode where codeid = 'K910'


