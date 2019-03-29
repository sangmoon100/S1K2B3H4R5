
CREATE OR REPLACE PROCEDURE PRO_SCH01_PIA1010A
(  pEMPNO IN VARCHAR2,
   pLIST OUT SYS_REFCURSOR  
)
IS
BEGIN

Open pLIST For
SELECT -- tab-1
       A.ORGNUM, A.EMPNO, A.KORNAME,
       A.COUNTRY,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK03'
           AND Z.CODENO = A.COUNTRY
       ) NCountry,           
       A.PSTATE,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I114'
           AND Z.CODENO = A.PSTATE
       ) Npstate,       
       A.PSTATEYN,
       A.PAYCL,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I112'
           AND Z.CODENO = A.PAYCL
       ) Npaycl,  
       (SELECT Z.GROUPCODE2
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I112'
           AND Z.CODENO = A.PSTATE
       ) Nemptypecd, 
       (SELECT Z.GROUPCODENAME2
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I112'
           AND Z.CODENO = A.PSTATE
       ) Nemptypenm, 
       A.ROLELEVEL,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK00'
           AND Z.CODENO = A.ROLELEVEL
       ) Nrolelevel,
       A.ROLELVDATE,A.BONCODE,A.FINCODE,A.PAYGR,       
       A.DEPTCODE,
       (SELECT Z.DEPTNA1 || ' ' || Z.DEPTNA2
          FROM pycdept Z                                           
         WHERE Z.deptcode = RPAD(A.DEPTCODE, 5,'0') 
           AND Z.orgnum = A.Orgnum       
       ) Ndeptcode,
       (SELECT Z.DEPTNA3
          FROM pycdept Z                                           
         WHERE Z.deptcode = RPAD(A.DEPTCODE, 5,'0') 
           AND Z.orgnum = A.orgnum       
       ) Njikgroup,   
       A.FIELDCODE,
       (SELECT Z.fieldcode
          FROM pycdept Z                                           
         WHERE Z.deptcode = RPAD(A.FIELDCODE, 5,'0') 
           AND Z.orgnum = A.orgnum       
       ) Nfieldcode,             
       A.JOBDEPT,
       (SELECT Z.DEPTNA1 || ' ' || Z.DEPTNA2
          FROM pycdept Z                                           
         WHERE Z.deptcode = RPAD(A.JOBDEPT, 5,'0') 
           AND Z.orgnum = A.orgnum       
       ) Njobdept,             
       A.PAYRA,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I113'
           AND Z.CODENO = A.PAYRA
       ) Npayra,  
       A.JOBPAYRA,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I113'
           AND Z.CODENO = A.JOBPAYRA
       ) Njobpayra,       
       A.PAYDUNM,A.REALTRDATE,A.OFFTRDATE,A.TRLIMFRDATE,A.TRLIMTODATE,A.PAYRAYN,A.JOBPAYRAYN,A.IMWONDATE,A.CPAYRADATE,            
       A.JOBPLACE,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I160'
           AND Z.CODENO = A.JOBPLACE
       ) Njobplace,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK03'
           AND Z.CODENO = A.NATION
       ) NplaceNation, -- 근무지국가-오류         
       A.EMPDATE, A.ORGEMPDATE, A.GROUPEMPDATE,A.GROUPCOMPANY,       
       A.CPAYCLDATE,A.PAYCLDATE,A.OLD_PAYCLDATE,       
       A.REPPAYCL,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I112'
           AND Z.CODENO = A.REPPAYCL
       ) Nreppaycl,       
       A.REPPAYFRDATE,A.REPPAYTODATE,A.APDPAYDUNM,A.APDPAYFRDATE,A.APDPAYTODATE,A.ACTPAYDUNM,A.ACTPAYFRDATE,
       A.ACTPAYTODATE,A.LRAGRDATE,
       A.REMARK,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I040'
           AND Z.CODENO = A.REMARK
       ) Nremark,        
       A.EMPCODE,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I101'
           AND Z.CODENO = A.EMPCODE
       ) Nempcode,           
       A.EMPTERM,
       A.EMPSCHGR,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I221'
           AND Z.CODENO = A.EMPSCHGR
       ) Nempschgr,       
       A.EMPPAYCL,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I112'
           AND Z.CODENO = A.EMPPAYCL
       ) Nemppaycl,
       A.EMPPAYGR,A.EMPJOBLINE,A.EMPJOBPLACE,A.GRPAYGRSUM,A.ARMYPAYGR,A.MASPAYGR,A.CARPAYGR,A.ETCPAYGR,
       A.ETCPAYCONT,A.BCARYY,A.BCARMM,A.CARDATE,
       -- tab-2
       A.JOBGUN,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I115'
           AND Z.CODENO = A.JOBGUN
       ) Njobgun,       
       A.JOBGUNDATE,A.JOBLINE,A.JOBLINEDATE,
       A.JOBKIND,
      (SELECT Z.dutykindname
          FROM pishrdukind Z                                   
         WHERE Z.dutykind = A.JOBKIND
       ) Njobkind,
       A.JOBKINDDATE,
       A.JOBDUTY,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I???'
           AND Z.CODENO = A.JOBDUTY
       ) NJOBDUTY,           
       A.JOBDUTYDATE,
       A.NOJEONYN,
       A.NOGUBUN,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I120'
           AND Z.CODENO = A.NOGUBUN
       ) Nnogubun,     
       case when A.NOGUBUN >= '30' and  A.NOGUBUN <= '5A' then 'Y' else 'N' end NojoYN,
       A.NOJNFRDATE,A.NOJNTODATE,
       A.LANCODE,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I300'
           AND Z.CODENO = A.LANCODE
       ) Nlancode,
       A.LANNONO,A.LANFRDATE,A.LANTODATE,A.EXDUTCNT,A.EXDUTYY,A.EXDUTMM,A.EXDUTDD,A.LEXFRDATE,A.LEXTODATE,
       A.LEXDUYY,A.LEXDUMM,A.LEXDUDD,A.PAYCLYY,A.PAYCLMM,A.PAYCLDD,   A.TOTPAYCLDD,
       A.COMDUYY,A.COMDUMM,A.COMDUDD,A.TOTCOMDUDD,A.CHNNAME,A.ENGNAME,A.ELDSONYN,A.MARRIGEYN,A.JUMINID,
       A.KORAGE,A.USAAGE,
       A.SEX,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I339'
           AND Z.CODENO = A.SEX
       ) Nsex,
       A.E_MAIL, A.SKEMAIL,A.HOLDNAME,
       A.HOLDREL,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I211'
           AND Z.CODENO = A.HOLDREL
       )       
       Nholdrel,
       A.HOUSETYPE,      
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I211'
           AND Z.CODENO = A.HOUSETYPE
       ) Nhousetype,
       A.HEALTH,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I502'
           AND Z.CODENO = A.HEALTH
       ) Nhealth,       
       A.BORNAREA,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I001'
           AND Z.CODENO = A.BORNAREA
       ) Nbornarea,        
       A.REGADDR,A.CURADDR,A.ZIPNO,
       A.CURNATION,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK03'
           AND Z.CODENO = A.CURNATION
       ) Ncurnation,
       A.CURREGION,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK04'
           AND Z.CODENO = A.CURREGION
           AND NVL(NATIONCD, ' ') like A.CURNATION||'%'                
       ) Ncurregion,        
       A.NATION, -- 국가
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK03'
           AND Z.CODENO = A.NATION
       ) Nnation, -- 국가명          
       A.REGION,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK04'
           AND Z.CODENO = A.REGION
           AND NVL(NATIONCD, ' ') like A.NATION||'%'           
       ) Nregion,       
       A.POSTNO,A.ADDRESS,A.TELNO,A.OFFITEL,       
       A.RELIGION, 
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I002'
           AND Z.CODENO = A.RELIGION
       ) Nreligion,
       A.HABIT,A.ABILITY,A.BLOOD,A.HEIGHT,A.WEIGHT,  
       -- tab 3
       A.ARMYKIND,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I031'
           AND Z.CODENO = A.ARMYKIND              
       ) Narmykind,        
       A.ARMYCL,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I034'
           AND Z.CODENO = A.ARMYCL              
       ) Narmycl,         
       A.ARMYFIELD,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I035'
           AND Z.CODENO = A.ARMYFIELD              
       ) Narmyfield,       
       A.ARMYFRDATE,A.ARMYTODATE,
       A.ARMYDIS,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I036'
           AND Z.CODENO = A.ARMYDIS              
       ) Narmydis,
       A.ARMYEX,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I037'
           AND Z.CODENO = A.ARMYEX              
       ) Narmyex,
       A.LSCHGR,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I221'
           AND Z.CODENO = A.LSCHGR              
       ) Nlschgr,
       A.LSCHDEG,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I221'
           AND Z.CODENO = A.LSCHDEG              
       ) Nlschdeg,              
       A.LSCHCODE,A.LSCHNM,A.LSCHFRYM,A.LSCHGRYM,
       A.LMAJORCODE,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I225'
           AND Z.CODENO = A.LMAJORCODE              
       ) Nlmajorcode, 
       A.UNICODE,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I223'
           AND Z.CODENO = A.UNICODE              
       ) Nunicode,       
       A.UNIMAJOR,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I225'
           AND Z.CODENO = A.UNIMAJOR              
       ) Nunimajor, 
       A.UNIFRYM,A.UNIGRYM,A.LSCHMAJNM,A.LSCHTOPIC,
       A.LICKIND,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I231'
           AND Z.CODENO = A.LICKIND              
       ) Nlickind,
       (SELECT Z.groupcode
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I231'
           AND Z.CODENO = A.LICKIND           
       ) Nliccd,
       (SELECT Z.groupcodename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I231'
           AND Z.CODENO = A.LICKIND           
       ) Nlicnm,       
       A.LICGR,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I232'
           AND Z.CODENO = A.LICGR           
       ) Nlicgr,   
       A.LICGETDATE,
       A.LICALKIND,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I231'
           AND Z.CODENO = A.LICALKIND           
       ) Nlicalkind,      
       A.LICALGR,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I232'
           AND Z.CODENO = A.LICALGR           
       ) Nlicalgr,                 
       A.LICALGETDATE, A.LICALFIELD, A.LICALDATE, A.LICBIGO,C.PUBLISH,A.TOEICSCORE,
       A.TOEICFULL,A.TOEICDATE,A.JPTSCORE,A.JPTFULL,A.JPTDATE,
       B.LANGTYPE, 
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK10'
           AND Z.CODENO = B.LANGTYPE           
       ) Nlangtype,       
       B.EXAMTYPE, 
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'SK11'
           AND Z.CODENO = B.EXAMTYPE           
       ) Nexamtype,           
       B.LANGNAME, B.EXAMDATE, B.EXAMPLACE,
       -- tab 4
       A.EDUGUBUN,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I601'
           AND Z.CODENO = A.EDUGUBUN
       ) Nedugubun, 
       A.EDUPLACE,A.EDUFRDATE,A.EDUTODATE,A.EDUCOURSE,A.EDUAREA,A.EDUCONT,A.EDUDUFRDATE,A.EDUDUTODATE,
       A.LRKIND,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I301'
           AND Z.CODENO = A.LRKIND
       ) Nlrkind,          
       A.LRFRDATE,A.LRTODATE,A.LVFRDATE,A.LVTODATE,
       A.LSEKIND,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I310'
           AND Z.CODENO = A.LSEKIND
       ) Nlsekind,         
       A.LSEFRDATE,A.LSETODATE,A.LSEPLACE,A.LSESAYU,
       A.LSECONT,
       A.HUGUBUN,
      (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I320'
           AND Z.CODENO = A.HUGUBUN
       ) Nhugubun,        
       A.HUFRDATE,A.HUTODATE,A.RETDATE,
       A.RETGUBUN,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I310'
           AND Z.CODENO = A.RETGUBUN
       ) Nretgubun,         
       A.RETSAYU1,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I141'
           AND Z.CODENO = A.RETSAYU1
       ) Nretsayu1,          
       A.RETSAYU2,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I142'
           AND Z.CODENO = A.RETSAYU2
       ) Nretsayu2,           
       A.RETCONT,       
       -- tab 5 계약직
       A.OBSKIND,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I012'
           AND Z.CODENO = A.OBSKIND
       ) Nobskind,                 
       A.OBSGR,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I011'
           AND Z.CODENO = A.OBSGR
       ) Nobsgr,               
       A.OBSSTATE,
       A.BOHUNGUBUN,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I015'
           AND Z.CODENO = A.BOHUNGUBUN
       ) Nbohungubun,         
       A.BOHUNNM,A.BOHUNREL,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I211'
           AND Z.CODENO = A.BOHUNREL
       ) Nbohunrel,       
       A.BOHUNNO,A.BOHUNBRAN,A.BOHUNYN,        
       A.SCGUBUN,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I016'
           AND Z.CODENO = A.SCGUBUN
       ) Nscgubun,              
       A.SCENTDATE,A.SCPREDATE,A.SCENDDATE,A.SCTERMYN,A.SCEXYY,A.SCEXMM,A.SCEXDD,A.SCEXCAUSE,A.OTDUFRDATE,A.OTDUTODATE,  
       A.TCONTR,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I901'
           AND Z.CODENO = A.TCONTR
       ) Ntcontr,        
       A.TCONTRAMT,A.TTYPE,
       A.TJOBDUTY,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I702'
           AND Z.CODENO = A.TJOBDUTY
       ) Ptjobduty,        
       A.TDUTYCLASS,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I702'
           AND Z.CODENO = A.TDUTYCLASS
       ) Ntdutyclass,
       A.TCOND,
       A.TCOMPANY,
       (SELECT Z.codename
          FROM pyccode Z                                   
         WHERE Z.CODEID = 'I902'
           AND Z.CODENO = A.TCOMPANY
       ) Ntcompany,   
       -- tab 6
       A.BIRTHGUBUN, A.BIRTHDAY,
       -- A.NPEOPLE, A.OLD_PAYCL, A.WEDDINGDATE,A.WRITETIME,A.WRITEEMP,A.HANADUYY,A.HANADUMM,A.HANADUDD,                     
       C.LICKIND, C.LICGR, C.LICGETDATE,  
       D.LICKIND, D.LICGR, D.LICGETDATE, D.LICALFIELD, D.LICALDATE, D.LICBIGO        
  FROM PIMPMAS A,
       (Select EMPNO, EXAMDATE, LANGTYPE, EXAMTYPE, LANGNAME, EXAMPLACE from
          (
           Select EMPNO, EXAMDATE,
	         (Select Groupcode  From Pyccode Where Codeid='I611' And Codeno=M.Examname) LANGTYPE, 
	         (Select Groupcode2 From Pyccode Where Codeid='I611' And Codeno=M.Examname) EXAMTYPE,
	          LANGNAME,EXAMPLACE,
	          DENSE_RANK() OVER (PARTITION BY empno  ORDER BY EXAMDATE DESC) seq
             From Pihfore M
           )	   
        where seq = 1) B,
	   (Select EMPNO, LICKIND, LICGR, LICNO, LICGETDATE, PUBLISH from
          (
           Select EMPNO, LICKIND, LICGR, LICNO, LICGETDATE, PUBLISH,licrank,
	              (DENSE_RANK() OVER (PARTITION BY empno  ORDER BY licrank, Lickind, LICGETDATE desc, LICALDATE desc)) seq
             From pimlice M
	        order by licrank
		   )	 	 
       where seq = 1)  C,
  	  (Select EMPNO, LICKIND, LICGR, LICGETDATE, LICUPDDATE, LICALDATE, LICALFIELD, LICBIGO, LICDIDATE from
	       (
	        Select EMPNO, LICKIND, LICGR, LICGETDATE, LICUPDDATE, LICALDATE, LICALFIELD, LICBIGO, LICDIDATE, 
	              (DENSE_RANK() OVER (PARTITION BY empno  ORDER BY licrank, Lickind, LICGETDATE desc, LICALDATE desc)) seq 
              From pimlice M
	         where licalyn = 'Y'
	         order by licrank
		   ) 	   	 
      where seq = 1)  D
WHERE A.EMPNO = B.EMPNO(+)
  AND A.EMPNO = C.EMPNO(+)
  AND A.EMPNO = D.EMPNO(+)
  AND A.EMPNO = pEMPNO;

END PRO_SCH01_PIA1010A;


