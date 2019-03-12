--001.최종연봉 데이터 읽어오기
--최종연봉 데이터 읽어오기..(연봉업데이트 완료 후)
  SELECT C.EMPNO    사원번호,  C.KORNAME    성명,
         C.DEPTCODE 부서코드,  
         DECODE(D.DEPTNA3,'',D.DEPTNAME,D.DEPTNAME||'-'||D.DEPTNA3)   부서명,  
         C.PAYCL    BAND,  
        (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I112' AND CODENO=C.PAYCL) BAND명,
         C.PAYRA    직책,
        (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I113' AND CODENO=C.PAYRA) 직책명,
         C.PSTATE   인사상태,   
        (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I114' AND CODENO=C.PSTATE) 인사상태명,		                 
         C.ORGEMPDATE SKB입사일,
		 C.ORGEMPDATE 최초입사일,  
         B.YEARPAYNUM 급여연봉차수,  
         B.TOTPAY     총연봉,       
         CEIL(B.TOTPAY/18) "월정연봉1-총연봉/18",           
         C.FIXPAY          "월정연봉2-월정연봉",
         BASEPAY      기본연봉, 
         ABLITYPAY    업적연봉
    FROM PKHYPHIS B, PKMPMAS C, PYCDEPT D
   WHERE B.EMPNO      = C.EMPNO
     AND B.YEARPAYNUM = (SELECT YEARPAYNUM FROM PKCPBAS)
     AND C.PSTATE     < '80'	 
     AND C.ORGNUM     = D.ORGNUM
     AND C.DEPTCODE   = D.DEPTCODE
   Order By C.Empno	 

--002.급여작업전 인원체크하기.
--003.연차수당
--004.개인별 급여통계(급여이력에서)_1명씩
--005.개인별 급여내역(급여이력에서)_1명씩
--006.급여통계(급여이력)_전체
--007.급여통계(당월내역)_전체
--008.월급여이력내역_개인별(보고용)
--009.급여계좌 변동자 추출
--011.BAND별 지급항목 자료 추출(급여이력추출)
--012.BAND별 급여통계(급여이력추출)
--013.BAND별 급여통계(당월내역추출)
--014.BAND별/월별 특별근무수당 구하기
--015.BAND별 월급여이력내역(보고용)
--021.정규직 건강보험 당월공제금
--022.정규직 건강보험 마스터 내역
--023.정규직 국민연금 공제이력
--031.저축납입내역 추출(년도별)
--032.저축가입자 내역조회
--033.저축가입 내역조회(임원)
--041.연말정산 등록내역
--042.연말정산마스터 추출
--043.연말정산이력 추출
