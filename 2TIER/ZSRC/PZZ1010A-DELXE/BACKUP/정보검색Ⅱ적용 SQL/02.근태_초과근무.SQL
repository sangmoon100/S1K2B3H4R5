--01.정규직:출장시 초과근무 신청사원 자료추출
--인수로 `년월` 를 입력한다. (예 : 200301)
SELECT  /*+ ordered a */
       A.EMPNO        "사번",
       A.KORNAME      "성명",
       COUNT(A.EMPNO) "신청횟수" 
  FROM PKHOTHIS A, PKHDUTY B
 WHERE A.EMPNO  = B.EMPNO
   AND B.DUYYMM = :근태년월
   AND A.OVTMDATE LIKE :근태년월||'%'   
   AND ((B.DD1  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '01') 
    OR  (B.DD2  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '02')
    OR  (B.DD3  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '03')
    OR  (B.DD4  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '04')
    OR  (B.DD5  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '05')
    OR  (B.DD6  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '06')
    OR  (B.DD7  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '07')
    OR  (B.DD8  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '08')
    OR  (B.DD9  IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '09')
    OR  (B.DD10 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '10')
    OR  (B.DD11 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '11')
    OR  (B.DD12 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '12')
    OR  (B.DD13 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '13')
    OR  (B.DD14 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '14')
    OR  (B.DD15 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '15')
    OR  (B.DD16 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '16')
    OR  (B.DD17 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '17')
    OR  (B.DD18 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '18')
    OR  (B.DD19 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '19')
    OR  (B.DD20 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '20')
    OR  (B.DD21 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '21')
    OR  (B.DD22 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '22')																				
    OR  (B.DD23 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '23')
    OR  (B.DD24 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '24')
    OR  (B.DD25 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '25')
    OR  (B.DD26 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '26')
    OR  (B.DD27 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '27')
    OR  (B.DD28 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '28')
    OR  (B.DD29 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '29')
    OR  (B.DD30 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '30')
    OR  (B.DD31 IN ('12','13') AND A.OVTMDATE = B.DUYYMM || '31') ) 
 GROUP BY A.EMPNO, A.KORNAME

--02.일반직:출장시 초과근무 신청사원 자료추출
--근태등록후에 작업
--인수로 `년월` 를 입력한다. (예 : 200105). 
SELECT /*+ ORDERED A */
       A.EMPNO        "사원번호", 
       A.KORNAME      "사원성명", 
	   COUNT(A.EMPNO) "신청횟수"
  FROM PKHIGOT A, PKHIGDUTY B
 WHERE A.EMPNO = B.EMPNO
   AND A.OVTMDATE = B.DUFRDATE  	  
   AND A.OVTMDATE LIKE :근태년월||'%'
   AND B.DUFRDATE LIKE :근태년월||'%'
   AND B.DUCODE   IN ('12','13')
 GROUP BY A.EMPNO, A.KORNAME

--03.근태미입자 리스트 추출
SELECT D.EMPNO 사원번호, D.KORNAME 사원성명, 
      (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I114' AND CODENO=M.PSTATE) 인사상태
  FROM PKHDUTY D, PIMPMAS M
 WHERE D.DUYYMM = :근태년월
   AND D.EMPNO  = M.EMPNO 
   AND (D.DD1   = '99'   OR  D.DD2   = '99'   OR  D.DD3   = '99'         
    OR  D.DD4   = '99'   OR  D.DD5   = '99'   OR  D.DD6   = '99' 
    OR  D.DD7   = '99'   OR  D.DD8   = '99'   OR  D.DD9   = '99'         
    OR  D.DD10  = '99'   OR  D.DD11  = '99'   OR  D.DD12  = '99'
    OR  D.DD13  = '99'   OR  D.DD14  = '99'   OR  D.DD15  = '99'         
    OR  D.DD16  = '99'   OR  D.DD17  = '99'   OR  D.DD18  = '99' 
    OR  D.DD19  = '99'   OR  D.DD20  = '99'   OR  D.DD21  = '99'         
    OR  D.DD22  = '99'   OR  D.DD23  = '99'   OR  D.DD24  = '99' 
    OR  D.DD25  = '99'   OR  D.DD26  = '99'   OR  D.DD27  = '99'         
    OR  D.DD28  = '99'   OR  D.DD29  = '99'   OR  D.DD30  = '99'   OR  D.DD31  = '99')


--04.최근 3개월간 근태중 산휴(55) 사용자 추출
SELECT /*+ I1_PIMPMAS*/
       DUYYMM 근태년월, D.EMPNO 사원번호, D.KORNAME 사원성명,
      (SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I114' AND CODENO=M.PSTATE) 인사상태	   
  FROM PKHDUTY D, PIMPMAS M
 WHERE D.DUYYMM BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-2),'YYYYMM') AND TO_CHAR(SYSDATE,'YYYYMM')
   AND D.EMPNO  = M.EMPNO 
   AND (D.DD1   = '55'   OR  D.DD2   = '55'   OR  D.DD3   = '55'         
    OR  D.DD4   = '55'   OR  D.DD5   = '55'   OR  D.DD6   = '55' 
    OR  D.DD7   = '55'   OR  D.DD8   = '55'   OR  D.DD9   = '55'         
    OR  D.DD10  = '55'   OR  D.DD11  = '55'   OR  D.DD12  = '55'
    OR  D.DD13  = '55'   OR  D.DD14  = '55'   OR  D.DD15  = '55'         
    OR  D.DD16  = '55'   OR  D.DD17  = '55'   OR  D.DD18  = '55' 
    OR  D.DD19  = '55'   OR  D.DD20  = '55'   OR  D.DD21  = '55'         
    OR  D.DD22  = '55'   OR  D.DD23  = '55'   OR  D.DD24  = '55' 
    OR  D.DD25  = '55'   OR  D.DD26  = '55'   OR  D.DD27  = '55'         
    OR  D.DD28  = '55'   OR  D.DD29  = '55'   OR  D.DD30  = '55'   OR  D.DD31  = '55')
 ORDER BY 1,2 

--05.연간근태집계내역_정규직
SELECT nvl(B.empno,' ')     "사번",
       nvl(B.korname,' ')   "이름", 
       NVL(B.ORGNUM,' ')    "조직차수",
       NVL(B.DEPTCODE, ' ') "부서코드",
       NVL(C.DEPTNAME,' ')  "부서명",
       SUBSTR(A.DUYYMM,1,4) "근무년도",
       sum(nvl(to_char(A.normal    ),'0')) "정상근무",  
       sum(nvl(to_char(A.exchange  ),'0')) "교대    ",
       sum(nvl(to_char(A.exchholi  ),'0')) "비번    ",
       sum(nvl(to_char(A.late      ),'0')) "지각    ",  
       sum(nvl(to_char(A.earleave  ),'0')) "조퇴    ",  
       sum(nvl(to_char(A.repoff    ),'0')) "대휴    ",  
       sum(nvl(to_char(A.speoff    ),'0')) "교휴    ",  
       sum(nvl(to_char(A.satoff    ),'0')) "토휴    ",  
       sum(nvl(to_char(A.domtour   ),'0')) "국출    ",  
       sum(nvl(to_char(A.seatour   ),'0')) "해출    ",  
       sum(nvl(to_char(A.corpdisp  ),'0')) "사파    ",  
       sum(nvl(to_char(A.domdisp   ),'0')) "국파    ",  
       sum(nvl(to_char(A.seadisp   ),'0')) "해파    ",  
       sum(nvl(to_char(A.edu       ),'0')) "교육    ",  
       sum(nvl(to_char(A.lodge     ),'0')) "합숙    ",  
       sum(nvl(to_char(A.special   ),'0')) "특휴    ",  
       sum(nvl(to_char(A.longwork  ),'0')) "장휴    ",  
       sum(nvl(to_char(A.pubvac    ),'0')) "공가    ",  
       sum(nvl(to_char(A.pubsick   ),'0')) "공병    ",  
       sum(nvl(to_char(A.bear      ),'0')) "산휴    ",  
       sum(nvl(to_char(A.celeb     ),'0')) "경조    ",  
       sum(nvl(to_char(A.birth     ),'0')) "생일    ",  
       sum(nvl(to_char(A.health    ),'0')) "보건    ",  
       sum(nvl(to_char(A.half      ),'0')) "반차    ",  
       sum(nvl(to_char(A.month     ),'0')) "월차    ",  
       sum(nvl(to_char(A.year      ),'0')) "년차    ",
       sum(nvl(to_char(A.YEARHALF  ),'0')) "반연차  ",  
       sum(nvl(to_char(A.sick      ),'0')) "병가    ",  
       sum(nvl(to_char(A.absence   ),'0')) "결근    ",  
       sum(nvl(to_char(A.pubrest   ),'0')) "공상    ",  
       sum(nvl(to_char(A.sickrest  ),'0')) "병상    ",  
       sum(nvl(to_char(A.babyrest  ),'0')) "육아    ",  
       sum(nvl(to_char(A.milrest   ),'0')) "병역    ",  
       sum(nvl(to_char(A.stayrest  ),'0')) "기소    ",  
       sum(nvl(to_char(A.studyrest ),'0')) "유학    ",  
       sum(nvl(to_char(A.genrest   ),'0')) "일반    ",  
       sum(nvl(to_char(A.etcrest   ),'0')) "기타    ",  
       sum(nvl(to_char(A.prize     ),'0')) "상휴    ",  
       sum(nvl(to_char(A.workstop  ),'0')) "정직    ",  
       sum(nvl(to_char(A.temporary ),'0')) "임시    ",  
       sum(nvl(to_char(A.holiday   ),'0')) "휴일    ",  
       sum(nvl(to_char(A.noinput   ),'0')) "미입력  ",  
       sum(nvl(to_char(A.ymdedcnt  ),'0')) "연월차공제일수",
       sum(nvl(to_char(A.mcardedcnt),'0')) "식교비공제일수",  
       sum(nvl(to_char(A.nopaycnt  ),'0')) "무급휴직일수"
 FROM (SELECT * FROM PKHDUTY   
        WHERE DUYYMM LIKE :근태년도||'%') A,
      (SELECT * FROM PIMPMAS
        WHERE PSTATE < '80'
          AND EMPNO NOT LIKE 'Y%') B, 
       PYCDEPT C
 WHERE A.EMPNO    = B.EMPNO
   AND C.ORGNUM   = B.ORGNUM
   AND C.DEPTCODE = B.DEPTCODE                        
 group by B.empno, B.korname, B.ORGNUM, B.DEPTCODE, C.DEPTNAME, SUBSTR(A.DUYYMM,1,4)

--06.근무지별 월간 개인근태내역 
SELECT NVL(B.jobplace, ' ') "근무지코드",
      (select codename from pyccode where codeid='I160' and codeno=b.jobplace) "근무지",
       A.DUYYMM             "근무년월",
       nvl(B.empno,' ')     "사번",
       nvl(B.korname,' ')   "이름",
       NVL(a.ORGNUM,' ')    "조직차수",
       NVL(a.DEPTCODE, ' ') "부서코드",
      (select DEPTNAME from pycdept where orgnum=a.orgnum and deptcode=a.deptcode) "부서명",
       sum(nvl(to_char(A.normal    ),'0')) "정상근무",
       sum(nvl(to_char(A.exchange  ),'0')) "교대    ",
       sum(nvl(to_char(A.exchholi  ),'0')) "비번    ",
       sum(nvl(to_char(A.late      ),'0')) "지각    ",
       sum(nvl(to_char(A.earleave  ),'0')) "조퇴    ",
       sum(nvl(to_char(A.repoff    ),'0')) "대휴    ",
       sum(nvl(to_char(A.speoff    ),'0')) "교휴    ",
       sum(nvl(to_char(A.satoff    ),'0')) "토휴    ",
       sum(nvl(to_char(A.domtour   ),'0')) "국출    ",
       sum(nvl(to_char(A.seatour   ),'0')) "해출    ",
       sum(nvl(to_char(A.corpdisp  ),'0')) "사파    ",
       sum(nvl(to_char(A.domdisp   ),'0')) "국파    ",
       sum(nvl(to_char(A.seadisp   ),'0')) "해파    ",
       sum(nvl(to_char(A.edu       ),'0')) "교육    ",
       sum(nvl(to_char(A.lodge     ),'0')) "합숙    ",
       sum(nvl(to_char(A.special   ),'0')) "특휴    ",
       sum(nvl(to_char(A.longwork  ),'0')) "장휴    ",
       sum(nvl(to_char(A.pubvac    ),'0')) "공가    ",
       sum(nvl(to_char(A.pubsick   ),'0')) "공병    ",
       sum(nvl(to_char(A.bear      ),'0')) "산휴    ",
       sum(nvl(to_char(A.celeb     ),'0')) "경조    ",
       sum(nvl(to_char(A.birth     ),'0')) "생일    ",
       sum(nvl(to_char(A.health    ),'0')) "보건    ",
       sum(nvl(to_char(A.half      ),'0')) "반차    ",
       sum(nvl(to_char(A.month     ),'0')) "월차    ",
       sum(nvl(to_char(A.year      ),'0')) "년차    ",
       sum(nvl(to_char(A.YEARHALF  ),'0')) "반연차  ",
       sum(nvl(to_char(A.sick      ),'0')) "병가    ",
       sum(nvl(to_char(A.absence   ),'0')) "결근    ",
       sum(nvl(to_char(A.pubrest   ),'0')) "공상    ",
       sum(nvl(to_char(A.sickrest  ),'0')) "병상    ",
       sum(nvl(to_char(A.babyrest  ),'0')) "육아    ",
       sum(nvl(to_char(A.milrest   ),'0')) "병역    ",
       sum(nvl(to_char(A.stayrest  ),'0')) "기소    ",
       sum(nvl(to_char(A.studyrest ),'0')) "유학    ",
       sum(nvl(to_char(A.genrest   ),'0')) "일반    ",
       sum(nvl(to_char(A.etcrest   ),'0')) "기타    ",
       sum(nvl(to_char(A.prize     ),'0')) "상휴    ",
       sum(nvl(to_char(A.workstop  ),'0')) "정직    ",
       sum(nvl(to_char(A.temporary ),'0')) "임시    ",
       sum(nvl(to_char(A.holiday   ),'0')) "휴일    ",
       sum(nvl(to_char(A.noinput   ),'0')) "미입력  ",
       sum(nvl(to_char(A.ymdedcnt  ),'0')) "년월차공제일수",
       sum(nvl(to_char(A.mcardedcnt),'0')) "식교비공제일수",
       sum(nvl(to_char(A.nopaycnt  ),'0')) "무급휴직일수"
  FROM (SELECT * FROM PKHDUTY
         WHERE DUYYMM between :근무년월from and :근무년월to) A,
       (SELECT * FROM PIMPMAS
         WHERE PSTATE < '80'
           AND EMPNO NOT LIKE 'Y%') B
 WHERE A.EMPNO = B.EMPNO
 group by b.JOBPLACE, A.DUYYMM, a.ORGNUM, a.DEPTCODE, B.empno, B.korname


--07.교대 근무 추출
SELECT A.DUYYMM   근태월, 
       A.EMPNO    사번, 
       A.KORNAME  성명,
       A.DEPTCODE 부서코드, (SELECT DEPTNAME FROM PYCDEPT WHERE DEPTCODE =A.DEPTCODE AND ORGNUM=A.ORGNUM) 부서명,
       M.JOBDEPT  근무무서, (SELECT DEPTNAME FROM PYCDEPT WHERE DEPTCODE =M.JOBDEPT  AND ORGNUM=M.ORGNUM) 근무부서,
       M.JOBPLACE 근무지,   (SELECT CODENAME FROM PYCCODE WHERE CODENO   =M.JOBPLACE AND CODEID='I160')   근무지명,
       A.CNT                                                       교대근무일수,
       TRUNC(NVL(A.CNT,0)/7)                                       교대미사용,
      (SELECT GREATEST(DECODE(SIGN(A.CNT - KIJUN11),-1,0,KIJUN12),DECODE(SIGN(A.CNT - KIJUN21),-1,0,KIJUN22))
         FROM PKCEXBAS WHERE DUYYMM = A.DUYYMM)                    교휴일수,
       A.CNT2                                                      유급휴일근무,
       TOTPAY                                                      총연봉,
       CEIL(TRUNC((TOTPAY/18/226),1))                              통상임금,
       ROUND(A.CNT  * CEIL(TRUNC((TOTPAY/18/226),1)) *14.5)        교대근무수당,
       ROUND(TRUNC(NVL(A.CNT,0)/7)  * CEIL(TRUNC((TOTPAY/18/226),1)) *8) 교휴보상수당,
       ROUND(A.CNT2 * CEIL(TRUNC((TOTPAY/18/226),1)) *22)                   유급휴일수당,
      (A.CNT + A.CNT2)*3500                                                                야근식대
  FROM PKHYPHIS H, PIMPMAS M,
       (SELECT DUYYMM, EMPNO, KORNAME, ORGNUM, DEPTCODE,
               SUM(DECODE(KEY1,'06',1,0)) CNT,
               SUM(DECODE(KEY1,'06',(SELECT 1 FROM PKCHOLI
                                      WHERE HOLIDATE = DU.DUYYMM || LPAD(DU.CNT,2,'0')
                                        AND HOLIKIND ='1'),0)) CNT2
          FROM (SELECT D.DUYYMM, D.EMPNO, D.KORNAME, D.ORGNUM, D.DEPTCODE,
                       C.CNT,
                       DECODE(C.CNT, 1,D.DD1,  2,D.DD2,  3,D.DD3,  4,D.DD4,  5,D.DD5,
                                     6,D.DD6,  7,D.DD7,  8,D.DD8,  9,D.DD9, 10,D.DD10,
                                    11,D.DD11,12,D.DD12,13,D.DD13,14,D.DD14,15,D.DD15,
                                    16,D.DD16,17,D.DD17,18,D.DD18,19,D.DD19,20,D.DD20,
                                    21,D.DD21,22,D.DD22,23,D.DD23,24,D.DD24,25,D.DD25,
                                    26,D.DD26,27,D.DD27,28,D.DD28,29,D.DD29,30,D.DD30, 31,D.DD31) KEY1
                  FROM PKHDUTY D, (SELECT ROWNUM CNT FROM PKHDUTY WHERE ROWNUM < 32) C
                 WHERE D.DUYYMM = :근태월) DU
         GROUP BY DUYYMM,EMPNO,KORNAME,ORGNUM,DEPTCODE
        HAVING SUM(DECODE(KEY1,'06',1,0)) > 0) A
  WHERE H.EMPNO = A.EMPNO
    AND A.EMPNO = M.EMPNO
    AND H.YEARPAYNUM = (SELECT YEARPAYNUM FROM PKCPBAS)