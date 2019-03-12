--01.채용 집계 상세 현황 (채용기준년월 입력) 
(select A.apjobkind GUBUN,decode(A.apjobkind,'10','경영기획','11','경영지원', '12','Finance' ,'20','마케팅',
                                             '30','NW계획'  ,'31','NW운용'  , '32','영업지원','33','IT',
                                             '40','연구개발','70','보안CERT', '71','EDW'     ,'72','ERP',
                                             '80','사업'    ,'81','컨텐츠'  , A.apjobkind) jobkindNM,
        count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",
        count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사", 
        count(decode(substr(univid,1,1),'3',NULL,'4',NULL,1))      "국내대",
        count(decode(substr(univid,1,1),'3',1,'4',1,NULL))         "해외대",   
        count(decode(substr(regno,8,1),'1',1,'5',1,'7',1,NULL))    "남자",
        count(decode(substr(regno,8,1),'2',1,'6',1,'8',1,NULL))    "여자",
        count(decode(aparea,'1',1,NULL)) "서울",
        count(decode(aparea,'2',1,NULL)) "부산",
        count(decode(aparea,'3',1,NULL)) "충청",
        count(decode(aparea,'4',1,NULL)) "경북",
        count(decode(aparea,'5',1,NULL)) "호남",
        count(rid) "지원현황"
   from prectmas A 
  where substr(rabasdate,1,6)  = :채용기준년월
  group by A.apjobkind                       )
  UNION ALL                                   
(select DEPT||'X' GUBUN,'소계' jobkindNM,    
        count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",
        count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사", 
        count(decode(substr(univid,1,1),'3',NULL,'4',NULL,1))      "국내대",
        count(decode(substr(univid,1,1),'3',1,'4',1,NULL))         "해외대",   
        count(decode(substr(regno,8,1),'1',1,'5',1,'7',1,NULL))    "남자",
        count(decode(substr(regno,8,1),'2',1,'6',1,'8',1,NULL))    "여자",
        count(decode(aparea,'1',1,NULL)) "서울",
        count(decode(aparea,'2',1,NULL)) "부산",
        count(decode(aparea,'3',1,NULL)) "충청",
        count(decode(aparea,'4',1,NULL)) "경북",
        count(decode(aparea,'5',1,NULL)) "호남",
        count(rid) "지원현황"
   from prectmas A                           
  where substr(rabasdate,1,6)  =:채용기준년월
    and A.DEPT NOT IN ('2','4')              
  group by A.DEPT)                           
  UNION ALL        
(select decode(A.gubun,'1','5','9')||'Z' GUBUN,'합계' jobkindNM,
        count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",
        count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사", 
        count(decode(substr(univid,1,1),'3',NULL,'4',NULL,1))      "국내대",
        count(decode(substr(univid,1,1),'3',1,'4',1,NULL))         "해외대",   
        count(decode(substr(regno,8,1),'1',1,'5',1,'7',1,NULL))    "남자",
        count(decode(substr(regno,8,1),'2',1,'6',1,'8',1,NULL))    "여자",
        count(decode(aparea,'1',1,NULL)) "서울",
        count(decode(aparea,'2',1,NULL)) "부산",
        count(decode(aparea,'3',1,NULL)) "충청",
        count(decode(aparea,'4',1,NULL)) "경북",
        count(decode(aparea,'5',1,NULL)) "호남",
        count(rid) "지원현황"
   from prectmas A where substr(rabasdate,1,6)  =:채용기준년월                                           
  group by A.gubun)                                                                        
  UNION ALL                                                                               
(select 'ZZ' GUBUN,'총계' jobkindNM,         
        count(decode(grd1id,NULL,decode(univid,NULL,NULL,1),NULL)) "학사",
        count(decode(grd1id,NULL,NULL,decode(univid,NULL,NULL,1))) "박사", 
        count(decode(substr(univid,1,1),'3',NULL,'4',NULL,1))      "국내대",
        count(decode(substr(univid,1,1),'3',1,'4',1,NULL))         "해외대",   
        count(decode(substr(regno,8,1),'1',1,'5',1,'7',1,NULL))    "남자",
        count(decode(substr(regno,8,1),'2',1,'6',1,'8',1,NULL))    "여자",
        count(decode(aparea,'1',1,NULL)) "서울",
        count(decode(aparea,'2',1,NULL)) "부산",
        count(decode(aparea,'3',1,NULL)) "충청",
        count(decode(aparea,'4',1,NULL)) "경북",
        count(decode(aparea,'5',1,NULL)) "호남",
        count(rid) "지원현황"
   from prectmas A where substr(rabasdate,1,6)  =:채용기준년월 )                                          
  order by gubun  

--02.신규채용 기본정보
SELECT  DECODE(A.GUBUN,'1','신입','2','경력') 구분                                                                      ,
        TO_CHAR(RID) 접수번호                                                                                           ,
        FULLNAME 성명                                                                                                   ,
        REGNO 주민번호                                                                                                  ,
        PASSWD 비밀번호                                                                                                 ,
        (select codename from pyccode where codeid = 'C052' and codeno = a.dept) 응시분야                               ,
        DECODE(A.APAREA,'1','전국','2','서울/수도권','3','충청','4','호남','5','부산·경북') 응시지역명                  ,
        TEL 전화번호                                                                                                    ,
        ZIPCODE 우편번호                                                                                                ,
        ADDRESS 주소                                                                                                    ,
        MOBILE 핸드폰                                                                                                   ,
        EMAIL 이메일                                                                                                    ,
        HIGHNAME 고교명                                                                                                 ,
        DECODE(HIGHGRAD,'1','졸업','2','중퇴','3','수료','4','졸예') 고교졸업구분명                                     ,
        HIGHINYM 고교입학년월                                                                                           ,
        HIGHOUTYM 고교졸업년월                                                                                          ,
        UNIVID 대학코드                                                                                                 ,
        UNIVNAME 대학명                                                                                                 ,
        NVL((SELECT MAJORNAME FROM PRECTMAJOR WHERE CODEID = 'I225' AND MAJORCODE = A.UNIVMAJORID),'') 대학전공명       ,
        UNIVMAJORNAME 대학전공_기타전공명                                                                               ,
        NVL((SELECT MAJORNAME FROM PRECTMAJOR WHERE CODEID = 'I225' AND MAJORCODE = A.UNIVMINORID),'') 대학부전공명     ,
        UNIVMINORNAME 대학부전공_기타전공명                                                                             ,
        UNIVSCORE 대학학점                                                                                              ,
        UNIVSCORET 대학총점                                                                                             ,
        DECODE(UNIVWHERE,'1','본교','2','분교','') 대학본분교                                                           ,
        DECODE(UNIVDAY,'1','주간','2','야간','') 대학주야간                                                             ,
        DECODE(UNIVGRAD,'1','졸업','2','중퇴','3','수료','4','졸예') 대학졸업구분명                                     ,
        UNIVINYM 대학입학년월                                                                                           ,
        UNIVOUTYM 대학졸업년월                                                                                          ,
        ADMITYN 편입여부                                                                                                ,
        BADUNIVID 편입전대학코드                                                                                        ,
        BADUNIVNAME 편입전대학명                                                                                        ,
        NVL((SELECT MAJORNAME FROM PRECTMAJOR WHERE CODEID = 'I225' AND MAJORCODE = A.BADUNIVMAJOR),'') 편입전대학전공명,
        BADUNIVMAJORNAME 편입전대학전공_기타전공명                                                                      ,
        BADUNIVSCORE 편입전대학학점                                                                                     ,
        BADUNIVSCORET 편입전대학총점                                                                                    ,
        DECODE(BADUNIVWHERE,'1','본교','2','분교','') 편입전대학본분교                                                  ,
        DECODE(BADUNIVDAY,'1','주간','2','야간','') 편입전대학주야간                                                    ,
        DECODE(BADUNIVGRD,'1','졸업','2','중퇴','3','수료','4','졸예','') 편입전대학졸업                                ,
        BADUNIVINYM 편입전대학입학년월                                                                                  ,
        BADUNIVOUTYM 편입전대학졸업년월                                                                                 ,
        GRD1ID 대학원코드                                                                                               ,
        GRD1NAME 대학원명                                                                                               ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I225' AND CODENO = A.GRD1MAJORID),'') 대학원전공명            ,
        GRD1MAJORNAME 대학원전공_기타전공명                                                                             ,
        GRD1SCORE 대학원학점                                                                                            ,
        GRD1SCORET 대학원총점                                                                                           ,
        DECODE(GRD1WHERE,'1','본교','2','분교','') 대학원본분교                                                         ,
        DECODE(GRD1DAY,'1','주간','2','야간','') 대학원주야간                                                           ,
        DECODE(GRD1GRAD,'1','졸업','2','중퇴','3','수료','4','졸예') 대학원졸업구분명                                   ,
        GRD1INYM 대학원입학년월                                                                                         ,
        GRD1OUTYM 대학원졸업년월                                                                                        ,
        GRD1PAPER 대학원논문제목                                                                                        ,
        LICENCE1 자격증코드1                                                                                            ,
        LICENCE1NAME 자격증명1                                                                                          ,
        LICENCE2 자격증코드2                                                                                            ,
        LICENCE2NAME 자격증명2                                                                                          ,
        DECODE(BOHUN,'1','Y','2','N','') 보훈여부                                                                       ,
        OBSYN 장애여부                                                                                                  ,
        ENGSCORE 토익점수                                                                                               ,
        ENGYMD 토익취득일                                                                                               ,
        ETCLANG 기타외국어                                                                                              ,
        ETCLANG_POINT 기타외국어취득점수                                                                                ,
        ETCLANGYM 기타외국어취득년월                                                                                    ,
        DECODE(ARMYKIND,'1','군필','2','면제','3','미필','') 병역구분                                                   ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I034' AND CODENO = A.ARMYGRADE  ),'') 계급명                  ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I037' AND CODENO = A.ARMYEXCEPT ),'') 면제사유                ,
        ARMYINYMD 입대년월일                                                                                            ,
        ARMYOUTYMD 제대년월일                                                                                           ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I211' AND CODENO = A.F1TYPE     ),'') 가족관계명1             ,
        F1NAME 가족성명1                                                                                                ,
        F1AGE 가족연령1                                                                                                 ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I221' AND CODENO = A.F1GRADE    ),'') 가족학력명1             ,
        F1WORK 가족근무처1                                                                                              ,
        DECODE(F1WITH,'1','동거','2','비동거','') 가족동거여부1                                                         ,
        F1TEL 가족연락처1                                                                                               ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I211' AND CODENO = A.F2TYPE     ),'') 가족관계명2             ,
        F2NAME 가족성명2                                                                                                ,
        F2AGE 가족연령2                                                                                                 ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I221' AND CODENO = A.F2GRADE    ),'') 가족학력명2             ,
        F2WORK 가족근무처2                                                                                              ,
        DECODE(F2WITH,'2','동거','2','비동거','') 가족동거여부2                                                         ,
        F2TEL 가족연락처2                                                                                               ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I211' AND CODENO = A.F3TYPE     ),'') 가족관계명3             ,
        F3NAME 가족성명3                                                                                                ,
        F3AGE 가족연령3                                                                                                 ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I221' AND CODENO = A.F3GRADE    ),'') 가족학력명3             ,
        F3WORK 가족근무처3                                                                                              ,
        DECODE(F3WITH,'3','동거','3','비동거','') 가족동거여부3                                                         ,
        F3TEL 가족연락처3                                                                                               ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I211' AND CODENO = A.F4TYPE     ),'') 가족관계명4             ,
        F4NAME 가족성명4                                                                                                ,
        F4AGE 가족연령4                                                                                                 ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I221' AND CODENO = A.F4GRADE    ),'') 가족학력명4             ,
        F4WORK 가족근무처4                                                                                              ,
        DECODE(F4WITH,'4','동거','4','비동거','') 가족동거여부4                                                         ,
        F4TEL 가족연락처4                                                                                               ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I211' AND CODENO = A.F5TYPE     ),'') 가족관계명5             ,
        F5NAME 가족성명5                                                                                                ,
        F5AGE 가족연령5                                                                                                 ,
        NVL((SELECT CODENAME FROM PYCCODE WHERE CODEID = 'I221' AND CODENO = A.F5GRADE    ),'') 가족학력명5             ,
        F5WORK 가족근무처5                                                                                              ,
        DECODE(F5WITH,'5','동거','5','비동거','') 가족동거여부5                                                         ,
        F5TEL 가족연락처5                                                                                               ,
        STRENGTH 강점                                                                                                   ,
        SELFINFO 자기소개                                                                                               ,
        BODYHEIGHT 신장                                                                                                 ,
        BODYWEIGHT 체중                                                                                                 ,
        BLOODTYPE 혈액형                                                                                                ,
        INTEREST 취미                                                                                                   ,
        FILEPHOTO 사진파일명                                                                                            ,
        FILETOEIC 토익파일명                                                                                            ,
        FILESCORE1 대학성적증명파일명                                                                                   ,
        FILESCORE2 대학원성적증명파일명                                                                                 ,
        FILEBOHUN 보훈증명서파일명                                                                                      ,
        FILEETC 기타화일명                                                                                              ,
        FILEGRAD1 대학졸업증명화일명                                                                                    ,
        FILEGRAD2 대학원졸업증명화일명                                                                                  ,
        CAR1WHERE 경력근무처1                                                                                           ,
        CAR1DATEFROM 경력FROM일자1                                                                                      ,
        CAR1DATETO 경력TO일자1                                                                                          ,
        CAR1WORK 경력담당업무1                                                                                          ,
        CAR1PAYRA 경력최종직위1                                                                                         ,
        CAR2WHERE 경력근무처2                                                                                           ,
        CAR2DATEFROM 경력FROM일자2                                                                                      ,
        CAR2DATETO 경력TO일자2                                                                                          ,
        CAR2WORK 경력담당업무2                                                                                          ,
        CAR2PAYRA 경력최종직위2                                                                                         ,
        CAR3WHERE 경력근무처3                                                                                           ,
        CAR3DATEFROM 경력FROM일자3                                                                                      ,
        CAR3DATETO 경력TO일자3                                                                                          ,
        CAR3WORK 경력담당업무3                                                                                          ,
        CAR3PAYRA 경력최종직위3                                                                                         ,
        CAR4WHERE 경력근무처4                                                                                           ,
        CAR4DATEFROM 경력FROM일자4                                                                                      ,
        CAR4DATETO 경력TO일자4                                                                                          ,
        CAR4WORK 경력담당업무4                                                                                          ,
        CAR4PAYRA 경력최종직위4                                                                                         ,
        YMDHMS 접수일시                                                                                                 ,
        RABASDATE 채용기준일                                                                                            ,
        HOPEPAY 희망연봉                                                                                                ,
        HOPEINYM 희망입사시기년월                                                                                       ,
        DECODE(HOPE_PER,'1','초순','2','중순','3','말','') 희망입사시기                                                 ,
        DECODE(SUBMIT,'1','Y','2','N','3') 제출여부                                                                     ,
        SUCCESS1 합격여부
  FROM PRECTMAS A
 WHERE substr(RABASDATE,1,6) =:채용기준년월 
 ORDER BY A.gubun, a.dept   

--03.점수계산 (제외)
SELECT TO_CHAR(RID) 접수번호, FULLNAME 성명, 대학, 토익, 보훈, FANALSCORE 학점, MAJORSCORE 전공, TOEIC 토익점수, 
       LICENCESCORE 자격증, ' ' 자기소개,(FANALSCORE+MAJORSCORE+TOEIC+LICENCESCORE) 합계, SPECIALSCORE 특별가점, 
      (FANALSCORE+MAJORSCORE+LICENCESCORE+TOEIC+SPECIALSCORE) 특별포함합계
  FROM (
        SELECT A.RID, A.FULLNAME, DECODE(B.UNIVID,'2990',B.UNIVNAME,'4990',B.UNIVNAME,'') 대학,
               DECODE(B.ENGSCORE,'','미입',B.ENGSCORE) 토익, DECODE(B.BOHUN,'1','보훈대상','2','미대상') 보훈,
               AA-((DECODE(A.UNIVWHERE,'2',AA*0.1,0))+(DECODE(A.UNIVDAY,'2',AA*0.1,0))+(DECODE(A.ADMITYN,'Y',AA*0.1,0))) FANALSCORE,
              (NVL(C.UNIVSCORE_2006,0)+NVL(D.GRD1SCORE_2006,0)) MAJORSCORE, 
               TO_NUMBER(GREATEST(NVL(E.LICSCORE_2006,'0'),NVL(F.LICSCORE_2006,'0'))) LICENCESCORE,
               DECODE(NVL(DECODE(B.BOHUN,'1','10','0'),0)+NVL(DECODE(B.OBSYN,'Y','5','0'),0),15,12,NVL(DECODE(B.BOHUN,'1','10','0'),0)+NVL(DECODE(B.OBSYN,'Y','5','0'),0)) SPECIALSCORE,
               case when b.engscore >= '900'  then 10
                    when b.engscore >= '800' and b.engscore <= '895' then 8
                    when b.engscore >= '700' and b.engscore <= '795' then 6
               else 0 end TOEIC   
         FROM (
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',30,'나',30,'다',27.5,'라',25) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NULL
                  AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) >= '86'
                UNION ALL
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',27.5,'나',27.5,'다',25,'라',0) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NULL
                  AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) BETWEEN '82' AND '85.99'
                UNION ALL
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',25,'나',25,'다',0,'라',0) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NULL
                  AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) BETWEEN '77' AND '81.99'
                UNION ALL
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',0,'나',0,'다',0,'라',0) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NULL
                  AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) < '76.99'
                UNION ALL
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',30,'나',30,'다',27.5,'라',25) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NOT NULL
                  AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 >= '86'
                UNION ALL
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',27.5,'나',27.5,'다',25,'라',0) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NOT NULL
                  AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 BETWEEN '82' AND '85.99'
                UNION ALL
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',25,'나',25,'다',0,'라',0) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NOT NULL
                  AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 BETWEEN '77' AND '81.99'
                UNION ALL
               SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                      DECODE(B.GROUPID,'가',0,'나',0,'다',0,'라',0) AA
                 FROM PRECTMAS A,PRECTUNI B
                WHERE RABASDATE ='20061201'
                  AND A.UNIVID = B.UNIVCODE
                  AND GUBUN='1'
                  AND GRD1ID IS NOT NULL
                  AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 < '76.99'
               ) A, 
            PRECTMAS B, PRECTMAJOR C, PRECTMAJOR D, PRECTLICE E, PRECTLICE F
      WHERE A.RID=B.RID(+)
        AND B.UNIVMAJORID=C.MAJORCODE(+)
        AND B.GRD1MAJORID=D.MAJORCODE(+)
        AND B.LICENCE1=E.MAJORCODE(+)
        AND B.LICENCE2=F.MAJORCODE(+)
        AND (B.UNIVID IN ('2990','4990') OR B.BOHUN = '1' OR B.ENGSCORE IS NULL OR A.AA-((DECODE(A.UNIVWHERE,'2',AA*0.1,0))+(DECODE(A.UNIVDAY,'2',AA*0.1,0))+(DECODE(A.ADMITYN,'Y',AA*0.1,0))) >= 25)
        AND (B.UNIVID IN ('2990','4990') OR B.BOHUN = '1' OR B.ENGSCORE IS NULL OR B.ENGSCORE >= '750' OR DECODE(B.DEPT,'05', B.ENGSCORE) >= '700')
      )
ORDER BY RID

--04.지원인원현황
SELECT A.DEPT 구분,
       DECODE(A.DEPT,'01','경영관리'   ,'02','마케팅'       ,'03','신사업'  ,'04','영업','05','기술',    
                     '06','NI사업/영업','07','법인/기업영업','08','법인기술','09','회계','10','컨텐츠사업',
                     '11','언론홍보'   ,'12','웹플래닝/마케팅' ) 지원부서,
       COUNT(DECODE(GRD1ID,NULL,DECODE(UNIVID,NULL,NULL,1),NULL)) "학사",
       COUNT(DECODE(GRD1ID,NULL,NULL,DECODE(UNIVID,NULL,NULL,1))) "박사",
       COUNT(DECODE(SUBSTR(UNIVID,1,1),'3',NULL,'4',NULL,1))      "국내대",
       COUNT(DECODE(SUBSTR(UNIVID,1,1),'3',1,'4',1,NULL))         "해외대",
       COUNT(DECODE(SUBSTR(REGNO,7,1),'1',1,'5',1,'7',1,NULL))    "남자",
       COUNT(DECODE(SUBSTR(REGNO,7,1),'2',1,'6',1,'8',1,NULL))    "여자",
       COUNT(DECODE(APAREA,'1',1,NULL)) "전국",
       COUNT(DECODE(APAREA,'2',1,NULL)) "서울/수도권",
       COUNT(DECODE(APAREA,'3',1,NULL)) "충청",
       COUNT(DECODE(APAREA,'4',1,NULL)) "호남",
       COUNT(DECODE(APAREA,'5',1,NULL)) "부산·경북",       
       COUNT(RID) "지원현황"
  FROM PRECTMAS A 
 WHERE RABASDATE = '20061201'
 GROUP BY A.DEPT

--05.점수계산 (전체)
SELECT  TO_CHAR(RID) 접수번호, FULLNAME 성명, 대학, 토익, 보훈, 
        FANALSCORE 학점, MAJORSCORE 전공, TOEIC 토익점수, 
        LICENCESCORE 자격증, ' ' 자기소개,
       (FANALSCORE+MAJORSCORE+TOEIC+LICENCESCORE) 합계, SPECIALSCORE 특별가점, 
       (FANALSCORE+MAJORSCORE+LICENCESCORE+TOEIC+SPECIALSCORE) 특별포함합계
  FROM (SELECT A.RID, A.FULLNAME, DECODE(B.UNIVID,'2990',B.UNIVNAME,'4990',B.UNIVNAME,'') 대학,
               DECODE(B.ENGSCORE,'','미입',B.ENGSCORE) 토익, DECODE(B.BOHUN,'1','보훈대상','2','미대상') 보훈,
               AA-((DECODE(A.UNIVWHERE,'2',AA*0.1,0))+(DECODE(A.UNIVDAY,'2',AA*0.1,0))+(DECODE(A.ADMITYN,'Y',AA*0.1,0))) FANALSCORE,
              (NVL(C.UNIVSCORE_2006,0)+NVL(D.GRD1SCORE_2006,0)) MAJORSCORE, 
               TO_NUMBER(GREATEST(NVL(E.LICSCORE_2006,'0'),NVL(F.LICSCORE_2006,'0'))) LICENCESCORE,
               DECODE(NVL(DECODE(B.BOHUN,'1','10','0'),0)+NVL(DECODE(B.OBSYN,'Y','5','0'),0),15,12,NVL(DECODE(B.BOHUN,'1','10','0'),0)+NVL(DECODE(B.OBSYN,'Y','5','0'),0)) SPECIALSCORE,
               case when b.engscore >= '900'  then 10
                    when b.engscore >= '800' and b.engscore <= '895' then 8
                    when b.engscore >= '700' and b.engscore <= '795' then 6
               else 0 end TOEIC    
         FROM (
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',30,'나',30,'다',27.5,'라',25) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NULL
                 AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) >= '86'
               UNION ALL
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',27.5,'나',27.5,'다',25,'라',0) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NULL
                 AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) BETWEEN '82' AND '85.99'
               UNION ALL
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',25,'나',25,'다',0,'라',0) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NULL
                 AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) BETWEEN '77' AND '81.99'
               UNION ALL
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',0,'나',0,'다',0,'라',0) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NULL
                 AND ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2) < '76.99'
               UNION ALL
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',30,'나',30,'다',27.5,'라',25) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NOT NULL
                 AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 >= '86'
               UNION ALL
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',27.5,'나',27.5,'다',25,'라',0) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NOT NULL
                 AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 BETWEEN '82' AND '85.99'
               UNION ALL
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',25,'나',25,'다',0,'라',0) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NOT NULL
                 AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 BETWEEN '77' AND '81.99'
               UNION ALL
              SELECT B.GROUPID, A.RID,A.FULLNAME,UNIVWHERE,UNIVDAY,ADMITYN,
                     DECODE(B.GROUPID,'가',0,'나',0,'다',0,'라',0) AA
                FROM PRECTMAS A,PRECTUNI B
               WHERE RABASDATE ='20061201'
                 AND A.UNIVID = B.UNIVCODE
                 AND GUBUN='1'
                 AND GRD1ID IS NOT NULL
                 AND (ROUND((TO_NUMBER(UNIVSCORE)*100)/UNIVSCORET,2)+ROUND((TO_NUMBER(GRD1SCORE)*100)/GRD1SCORET,2))/2 < '76.99'
              ) A, 
              PRECTMAS B, PRECTMAJOR C, PRECTMAJOR D, PRECTLICE E, PRECTLICE F
        WHERE A.RID=B.RID(+)
          AND B.UNIVMAJORID=C.MAJORCODE(+)
          AND B.GRD1MAJORID=D.MAJORCODE(+)
          AND B.LICENCE1=E.MAJORCODE(+)
          AND B.LICENCE2=F.MAJORCODE(+)
          AND (B.UNIVID IN ('2990','4990') OR B.BOHUN = '1' OR B.ENGSCORE IS NULL OR A.AA-((DECODE(A.UNIVWHERE,'2',AA*0.1,0))+(DECODE(A.UNIVDAY,'2',AA*0.1,0))+(DECODE(A.ADMITYN,'Y',AA*0.1,0))) >= 25)
          AND (B.UNIVID IN ('2990','4990') OR B.BOHUN = '1' OR B.ENGSCORE IS NULL OR B.ENGSCORE >= '750' OR DECODE(B.DEPT,'05', B.ENGSCORE) >= '700')
        )
 ORDER BY RID


--06.주요대학별 인원현황
SELECT SEOUL  서울대인원,
       KAIST  KAIST인원,
       POHANG 포항공대인원,
       YENSE  연세대인원,
       KOREA  고려대인원,
       FORE   해외대인원,                      
       TOTAL - (SEOUL+KAIST+POHANG+YENSE+KOREA+FORE) 기타대학인원,
       ROUND((SEOUL/TOTAL*100),2)||'%'  서울대백분율, 
       ROUND((KAIST/TOTAL*100),2)||'%'  KAIST백분율,   
       ROUND((POHANG/TOTAL*100),2)||'%' 포항공대백분율, 
       ROUND((YENSE/TOTAL*100),2)||'%'  연세대백분율, 
       ROUND((KOREA/TOTAL*100),2)||'%'  고려대백분율, 
       ROUND((FORE/TOTAL*100),2)||'%'   해외대백분율, 
       ROUND(((TOTAL - (SEOUL+KAIST+POHANG+YENSE+KOREA+FORE))/TOTAL*100),2)||'%' 기타대학백분율,       
       SYSDATE                                                         
   FROM                                                                
(                                                                      
    SELECT COUNT(DECODE(UNIVID,'0640',1,NULL)) SEOUL,                
           COUNT(DECODE(UNIVID,'1200',1,NULL)) KAIST,                
           COUNT(DECODE(UNIVID,'1180',1,NULL)) POHANG,               
           COUNT(DECODE(UNIVID,'0840',1,NULL)) YENSE,                
           COUNT(DECODE(UNIVID,'0140',1,NULL)) KOREA,                
           COUNT(DECODE(SUBSTR(UNIVID,1,1),'3',1,'4',1,NULL)) FORE,
           COUNT(*) TOTAL
      FROM PRECTMAS                                                    
     WHERE RABASDATE = :채용기준일  ) 

--07.경쟁률현황
SELECT 41 신입모집인원, 
       42 경력모집인원, 
       83 전체모집인원,
       COUNT(DECODE(GUBUN,'1',1)) 신입지원현황,
       COUNT(DECODE(GUBUN,'2',1)) 경력지원현황,      
       COUNT(DECODE(GUBUN,'1',1,'2',1)) 전체지원현황,       
       ROUND(COUNT(DECODE(GUBUN,'1',1))/41,2) 신입경쟁률,   
       ROUND(COUNT(DECODE(GUBUN,'2',1))/42,2) 경력경쟁률,         
       ROUND(COUNT(DECODE(GUBUN,'1',1,'2',1))/83,2) 전체경쟁률
  FROM PRECTMAS     
 WHERE RABASDATE = '20061201' 

select distinct apjobkind from prectmas where substr(rabasdate,1,6)  = :채용기준년월

SELECT GROUPNAME "그룹명", 
       TO_NUMBER(SUBSTR(GROUPNAME,1,2)||SUBSTR(QUERYNAME,1,2)) "일련번호", 
       QUERYNAME "쿼리명", 
       CONTENT   "설명" 
  FROM AQUSERQUERY 
 ORDER BY GROUPNAME, QUERYNAME